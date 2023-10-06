package Controller;

import Model.User;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Objects;

@WebServlet(name = "adminController", urlPatterns = "/admin")
public class AdminController extends HttpServlet {
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "changePassword" -> showChangePassword(req, resp);
            default -> showAdmin(req, resp);
        }
    }

    private void showChangePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("user", userService.findById(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("message",req.getParameter("messsage"));
        req.getRequestDispatcher("/admin/changePassword.jsp").forward(req, resp);

    }

    private void showAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("admin/index.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "changePassword" -> changePassword(req, resp);
        }
    }

    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }

    private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (userService.checkChangePassword(req, resp)) {
            userService.changePassword(req,resp);
            resp.sendRedirect("/admin?message=Change Password Success&action=changePassword&id=" + req.getParameter("id"));
        } else {
            resp.sendRedirect("/admin?message=mật khẩu cũ sai&action=changePassword&id=" + req.getParameter("id"));
        }
    }

    public User getUserByRequest(HttpServletRequest req) throws UnsupportedEncodingException {
        if (req.getCharacterEncoding() == null) {
            req.setCharacterEncoding("UTF-8");
        }
        String password = req.getParameter("password");

        return new User(password);
    }
}
