package Controller;

import Model.Category;
import Model.Product;
import service.CategoryService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50)  // 50MB
@WebServlet(name = "productController", value = "/product")
public class ProductController extends HttpServlet {
    private ProductService productService;
    private CategoryService categoryService;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create" -> showProductCreate(req, resp);
            case "edit" -> showProductEdit(req, resp);
            case "searchImport" -> showSearchImport(req, resp);
//            case "restore" -> showRestore(req, resp);
            case "delete" -> delete(req, resp);
            default -> showListProduct(req, resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        productService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/product?message=Deleted");
    }

//    private void showRestore(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        showTable(req, true, resp);
//    }


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
            case "searchImport" -> showSearchImport(req, resp);
//            case "restore" -> restore(req, resp);
        }
    }

    private void showSearchImport(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        productService.create(getProductByRequest(req));
        resp.sendRedirect("/product?message=Created");
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
}
