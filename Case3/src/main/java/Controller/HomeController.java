package Controller;

import Model.Cart;
import Model.Product;
import Model.ProductImportDetail;
import service.CartService;
import service.CategoryService;
import service.ProductImportService;
import service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "HomeServlet", urlPatterns = "/homes")
public class HomeController extends HttpServlet {
    private final String PAGE = "home";
    private ProductService productService;
    private ProductImportService productImportService;
    private CartService cartService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        productImportService = new ProductImportService();
        cartService = new CartService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (Objects.equals(action, "detail")) {
            productDetail(req, resp);
            return;
        }
        if (Objects.equals(action, "update")) {
            update(req, resp);
            return;
        }
        showList(req, resp);
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        req.setAttribute("idProduct", idProduct);
        req.setAttribute("quantity", quantity);
        req.setAttribute("idUser", idUser);
        cartService.updateQuantity(idProduct,idUser,quantity);

        resp.sendRedirect("/homes?action=checkCart&idProduct=" + idProduct + "&idUser=" + idUser + "&quantity=" + quantity + "&message=Update Quantity Successfully");
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        req.setAttribute("idProduct", idProduct);
        req.setAttribute("quantity", quantity);
        req.setAttribute("idUser", idUser);
        var product = productService.findById(idProduct);
        if (cartService.findCartByBothId(idProduct, idUser) != null) {
            cartService.update(idProduct, idUser, quantity);
        } else if (cartService.findCartByBothId(idProduct, idUser) == null){
            cartService.create(idProduct, idUser, quantity, product.getPrice());
        }
        req.setAttribute("productQuantity", productImportService.getQuantityByIdProduct(idProduct));
        resp.sendRedirect("/homes?action=detail&id=" + idProduct + "&message=Add To Cart Successfully");
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
        String action = req.getParameter("action");
        if (Objects.equals(action, "addToCart")) {
            try {
                addToCart(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}