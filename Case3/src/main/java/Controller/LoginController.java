package Controller;

import Model.EGender;
import Model.User;
import service.RoleService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;

@WebServlet(name = "loginController", urlPatterns = "/auth")
public class LoginController extends HttpServlet {
    private UserService userService;

    private RoleService roleService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register" -> showRegister(req, resp);
            case "logout" -> logout(req, resp);
            default -> showLogin(req, resp);

        }
    }

    private void showLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message", req.getParameter("message"));
        req.getRequestDispatcher("/auth/login.jsp").forward(req, resp);
    }

    private void showRegister(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("genders", EGender.values());
        req.setAttribute("message", req.getParameter("messsage"));
        req.getRequestDispatcher("auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register" -> register(req, resp);
            case "logout" -> logout(req, resp);
            default -> login(req, resp);

        }
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession httpSession = req.getSession();
        httpSession.invalidate();
        resp.sendRedirect("/auth?message=logout");
    }

    private void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (!userService.login(req, resp)) {
            resp.sendRedirect("/auth?message=Invalid username or password");
        }
    }

    private void register(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        userService.register(getUserByRequest(req));
        resp.sendRedirect("/auth?message=Register Success");
    }

    private User getUserByRequest(HttpServletRequest req) throws UnsupportedEncodingException {
        if (req.getCharacterEncoding() == null) {
            req.setCharacterEncoding("UTF-8");
        }
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String dob = req.getParameter("dob");
        EGender gender = EGender.valueOf(req.getParameter("gender"));
        return new User(name, phone, username, password, address, Date.valueOf(dob), gender);
    }

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        roleService = new RoleService();
    }
}
