package Controller;

import Model.Product;
import Model.ProductImportDetail;
import service.CategoryService;
import service.ProductImportService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

@WebServlet(name = "HomeServlet", urlPatterns = "/homes")
public class HomeController extends HttpServlet {
    private final String PAGE = "home";
    private ProductService productService;
    private ProductImportService productImportService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        productImportService = new ProductImportService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (Objects.equals(action, "checkCart")) {
            shoppingCart(req, resp);
            return;
        }
        if (Objects.equals(action, "detail")) {
            productDetail(req, resp);
            return;
        }
        showList(req, resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", productService.getProducts(Integer.parseInt(pageString), req.getParameter("search")));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher(PAGE + "/index.jsp").forward(req, resp);
    }

    private void shoppingCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher(PAGE + "/cart.jsp").forward(req, resp);
    }

    private void productDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        ProductImportDetail productImportDetail = productImportService.getQuantityByIdProduct(id);
        req.setAttribute("productImportDetail", productImportDetail);
        req.setAttribute("product", product);
        req.getRequestDispatcher(PAGE + "/productDetail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}