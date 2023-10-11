package Controller;

import Model.EStatus;
import Model.Product;
import com.fasterxml.jackson.databind.ObjectMapper;
import service.ExpressService;
import service.OrderService;
import service.ProductService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "orderController", urlPatterns = "/order")
public class OrderController extends HttpServlet {
    private ProductService productService;
    private OrderService orderService;
    private UserService userService;
    private ExpressService expressService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action== null){
            action = "";
        }
        switch (action){
            default -> showList(req,resp);
            case "detail" -> showEdit(req, resp);
            case "edit" -> showEdit(req,resp);
            case "delete" -> delete(req,resp);
        }
    }


    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        orderService.delete(req);
        resp.sendRedirect("/order?message=Deleted Successfuly");
    }

    private void showEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idUserParameter = req.getParameter("idUser");
        int idUser;
        if(idUserParameter != null && !idUserParameter.isEmpty()){
            try{
                idUser = Integer.parseInt(idUserParameter);
                req.setAttribute("order", orderService.findById(Integer.parseInt(req.getParameter("idOrder")),Integer.parseInt(req.getParameter("idUser"))));
            }catch (NumberFormatException e){
                System.out.println(e.getMessage());
            }
        }else {
            req.setAttribute("order", orderService.findById(Integer.parseInt(req.getParameter("id"))));
        }

        req.setAttribute("status", EStatus.values());
        req.getRequestDispatcher("order/edit.jsp").forward(req,resp);

    }


    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if(pageString == null){
            pageString = "1";
        }
        String idUserParameter = req.getParameter("idUser");
        int idUser;

        if (idUserParameter != null && !idUserParameter.isEmpty()) {
            try {
                idUser = Integer.parseInt(idUserParameter);
                req.setAttribute("page", orderService.findAll(Integer.parseInt(pageString), req.getParameter("search"), idUser));
            } catch (NumberFormatException e) {
                System.out.println(e.getMessage());
            }
        } else {
            req.setAttribute("page", orderService.findAll(Integer.parseInt(pageString), req.getParameter("search")));
        }

        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher("order/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action== null){
            action = "";
        }
        switch (action){
            case "edit" -> edit(req,resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        orderService.update(req);
        resp.sendRedirect("/order?message=Upadted Successfully");
    }

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
        orderService = new OrderService();
        userService = new UserService();
        expressService = new ExpressService();
    }
}
