package Controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import service.ProductImportService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "productImportController", urlPatterns = "/product-import")
public class ProductImportController extends HttpServlet {
    private ProductService productService;

    private ProductImportService productImportService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action="";
        }
        if (action.equals("delete")) {
            delete(req, resp);
            return;
        }
        if(action.equals("edit")){
            showEdit(req, resp);
            return;
        }
        if (action.equals("create")) {
            showCreate(req, resp);
            return;
        }
        showList(req,resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        var products = productService.findAll();
        req.setAttribute("products", products);
        req.setAttribute("productsJSON", new ObjectMapper().writeValueAsString(products));
        req.getRequestDispatcher("product-import/create.jsp").forward(req, resp);
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        productImportService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/product-import?message=Deleted");
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        req.setAttribute("productImport", productImportService
                .findById(Integer.parseInt(req.getParameter("id"))));
        var products = productService.findAll();
        req.setAttribute("products", products);
        req.setAttribute("productsJSON", new ObjectMapper().writeValueAsString(products));
        req.getRequestDispatcher("product-import/edit.jsp").forward(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", productImportService.findAll(Integer.parseInt(pageString), req.getParameter("search")));
//        req.setAttribute("productImports", productImportService.findAll());
        req.setAttribute("search", req.getParameter("search"));
        req.setAttribute("message",req.getParameter("message"));
        req.getRequestDispatcher("product-import/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String action = req.getParameter("action");
        if("edit".equals(action)){
            edit(req, resp);
            return;
        }
        if("create".equals(action)){
            create(req, resp);
            return;
        }
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        productImportService.create(req);
        resp.sendRedirect("/product-import?message=Created Successfully");
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        productImportService.update(req);
        resp.sendRedirect("/product-import?message=Updated Successfully");
    }

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        productImportService = new ProductImportService();
    }
}
