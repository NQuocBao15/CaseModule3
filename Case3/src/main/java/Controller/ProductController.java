package Controller;

import Model.Category;
import Model.OrderItem;
import Model.Product;
import service.CategoryService;
import service.ProductImportService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)  // 50MB
@WebServlet(name = "productController", value = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService;
    private CategoryService categoryService;
    private ProductImportService productImportService;
//    private


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create" -> showProductCreate(req, resp);
            case "edit" -> showProductEdit(req, resp);
            case "search" -> showSearch(req, resp);
//            case "restore" -> showRestore(req, resp);
            case "delete" -> delete(req, resp);
            default -> showListProduct(req, resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        productService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/product?message=Deleted successfully");
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showTable(req,  resp);
    }

    private void showProductEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("product", productService.findById(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("categories", categoryService.getCategories());
        req.getRequestDispatcher("product/create.jsp").forward(req, resp);
    }

    private void showProductCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("product", new Product());
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("categories", categoryService.getCategories());
        req.getRequestDispatcher("product/create.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create" -> createProduct(req, resp);
            case "edit" -> editProduct(req, resp);
            case "search" -> showSearch(req, resp);
//            case "restore" -> restore(req, resp);
        }
    }

    private void showSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("products"
                , productService.performSearch(req.getParameter("search"))
        );
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("product/index.jsp").forward(req, resp);
    }

//    private void restore(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        productService.restore(req.getParameterValues("selectedProducts"));
//
//        resp.sendRedirect("/product?message=Restored&action=restore");
//    }

    private void editProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        productService.update(getProductByRequest(req), Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/product?message=Updated");
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");
        String img = req.getParameter("img");
        String idCategory = req.getParameter("category");
        Category category = new Category(Integer.parseInt(idCategory));
        Product product = new Product(name, category, description, price,img);
        String pathServerImage = getServletContext().getRealPath("/") + "img";
        String pathProjectImage  = "D:\\Java\\CaseMD3\\Case3\\src\\main\\webapp\\img";

        String dbImageUrl = null;

        for (Part part : req.getParts()) {
            String fileName = extractFileName(part);

            if(!fileName.isEmpty()){
                fileName = new File(fileName).getName();

                if(part.getContentType().equals("image/jpeg")){
                    part.write(pathProjectImage + File.separator + fileName);
                    dbImageUrl = File.separator + fileName;
                    dbImageUrl = dbImageUrl.replace("\\","/");
                    part.write(pathServerImage + File.separator + fileName);
                }
            }
        }
        if (dbImageUrl == null) {
            req.setAttribute("errorImage", "File ảnh không được để trống!");
        } else {
            product.setImg(dbImageUrl);
        }
        productService.create(product);
        resp.sendRedirect("/product?message=Created Successfully");
    }

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        categoryService = new CategoryService();
    }

    private void showTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", productService.getProducts(Integer.parseInt(pageString), req.getParameter("search")));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher("product/index.jsp").forward(req, resp);
    }

    private Product getProductByRequest(HttpServletRequest req) {
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String description = req.getParameter("description");
        String img = req.getParameter("img");
        String idCategory = req.getParameter("category");
        Category category = new Category(Integer.parseInt(idCategory));
        return new Product(name, category, description, price,img);
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] items = contentDisposition.split(";");
        for (String item : items) {
            if (item.trim().startsWith("filename")) {
                return item.substring(item.indexOf("=") + 2, item.length() - 1);
            }
        }
        return "";
    }
}
