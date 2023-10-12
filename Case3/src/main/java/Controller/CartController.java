package Controller;

import Model.Cart;
import Model.ProductImportDetail;
import service.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "cartController", urlPatterns = "/cart")
public class CartController extends HttpServlet {
    private ProductImportService productImportService;
    private CartService cartService;
    private OrderService orderService;
    private ExpressService expressService;

    @Override
    public void init() throws ServletException {
        productImportService = new ProductImportService();
        cartService = new CartService();
        orderService = new OrderService();
        expressService = new ExpressService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (Objects.equals(action, "delete")) {
            try {
                delete(req,resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        try {
            showList(req,resp);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void checkOut(HttpServletRequest req, HttpServletResponse resp) throws SQLException, ServletException, IOException {
        if (req.getCharacterEncoding() == null) {
            req.setCharacterEncoding("UTF-8");
        }
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        var carts = cartService.findCartByIdUser(idUser);
        var express = expressService.findAll();
        if(carts != null){
            for(var cart : carts){
                ProductImportDetail pid = productImportService.getQuantityByIdProduct(cart.getProduct().getId());
                if(cart.getQuantity() > pid.getQuantity() && pid.getQuantity() > 0){
                    resp.sendRedirect("/cart?idUser=" + idUser + "&message=" + pid.getProduct().getName() + " are not enough quantity");
                return;
                }else if(pid.getQuantity() == 0){
                    resp.sendRedirect("/cart?idUser=" + idUser + "&message=" + pid.getProduct().getName() + " are sold out");
                return;
                }
            }
            req.setAttribute("express", express);
            req.setAttribute("carts", carts);
            req.setAttribute("user", req.getSession().getAttribute("user"));
            req.getRequestDispatcher("home/checkOut.jsp").forward(req,resp);
        }else {
            resp.sendRedirect("/cart?idUser=" + idUser + "&message=Cart is empty");
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException, SQLException {
        int idProduct = Integer.parseInt(req.getParameter("idProduct"));
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        cartService.delete(idProduct, idUser);

        showList(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        List<Cart> carts = cartService.findCartByIdUser(idUser);
        req.setAttribute("carts", carts);
        req.setAttribute("productImportDetails",productImportService.getQuantityForCartByIdUser(idUser));
        req.setAttribute("user", req.getSession().getAttribute("user"));
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("home/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (Objects.equals(action, "order")) {
            order(req, resp);
            return;
        }
        if (Objects.equals(action, "checkOut")) {
            try {
                checkOut(req, resp);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void order(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        orderService.create(req);
        cartService.delete(req);
        resp.sendRedirect("/homes?message=Order Successfully");
    }
}
