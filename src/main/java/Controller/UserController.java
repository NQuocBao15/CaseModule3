package Controller;

import Model.EGender;
import Model.Role;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.RoleService;
import service.UserService;

import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "userController", urlPatterns = "/user")
public class UserController extends HttpServlet {
    private UserService userService;
    private RoleService roleService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            default -> showList(req,resp);
            case "create" -> showCreate(req,resp);
        }
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("genders", EGender.values());
        req.getRequestDispatcher("user/create.jsp").forward(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        showTable(req,resp);
    }

    private void showTable(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", userService.findAll(Integer.parseInt(pageString),req.getParameter("search")));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher("user/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create" -> create(req,resp);
        }
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) {
        userService.create(getUserByRequest(req));
    }

    private User getUserByRequest(HttpServletRequest req) {
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String address = req.getParameter("address");
        String dob = req.getParameter("dob");
        EGender gender = EGender.valueOf(req.getParameter("gender"));
        Role role = new Role(Integer.parseInt(req.getParameter("role")));

        return new  User(name,phone,username,password,address, Date.valueOf(dob),gender,role);

    }

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        roleService = new RoleService();
    }
}
