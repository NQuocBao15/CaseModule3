package Controller;

import Model.EGender;
import Model.Role;
import Model.User;
import service.RoleService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
            case "edit" -> showUpdate(req,resp);
            case "delete" -> delete(req,resp);
            case "profile" -> showProfile(req, resp);
        }
    }
    private void showProfile(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("user", userService.findById(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("genders", EGender.values());
        req.getRequestDispatcher("user/profile.jsp").forward(req, resp);
    }
    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        userService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/user?message=Deleted Successfully");
    }

    private void showUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("userUpdate", userService.findById(Integer.parseInt(req.getParameter("id"))));
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("genders", EGender.values());
        req.getRequestDispatcher("user/edit.jsp").forward(req,resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("roles", roleService.findAll());
        req.setAttribute("genders", EGender.values());
        req.setAttribute("message", req.getParameter("messsage"));
        req.getRequestDispatcher("user/create.jsp").forward(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            case "edit" -> edit(req,resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        userService.update(Integer.parseInt(req.getParameter("id")),getUserByRequest(req));
        resp.sendRedirect("/user?message=Updated Successfully");
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        userService.create(getUserByRequest(req));
        resp.sendRedirect("/user?message=Created Successfully");
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
        Role role = new Role(Integer.parseInt(req.getParameter("role")));

        return new  User(name,phone,username,password,address, Date.valueOf(dob),gender,role);

    }

    @Override
    public void init() throws ServletException {
        userService = new UserService();
        roleService = new RoleService();
    }
}
