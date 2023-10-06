package service;

import DAO.UserDAO;
import Model.User;

import Utils.PasswordEncryptionUtil;
import service.dto.Page;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserService {
    private UserDAO userDAO;

    public UserService() {
        userDAO = new UserDAO();
    }

    public Page<User> findAll(int page, String search) {
        return userDAO.findAll(page, search);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public void create(User user) {
        user.setPassword(PasswordEncryptionUtil.encryptPassword(user.getPassword()));
        userDAO.create(user);
    }

    public User findById(int id) {
        return userDAO.findById(id);
    }

    public void update(int id, User user) {
        userDAO.update(id, user);
    }

    public void delete(int id) {
        userDAO.delete(id);
    }

    public boolean login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        var user = userDAO.findByUsername(username);
        if (user != null && PasswordEncryptionUtil.checkPassword(password, user.getPassword())) {
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("user", user);
            httpSession.setAttribute("loggedIn", true);
            if (user.getRole().getName().equals("admin")) {
                resp.sendRedirect("/admin?&message=Login Success");
            } else {
                resp.sendRedirect("/client?message=Login Success");
            }
            return true;
        }
        return false;
    }

    public void register(User user) {
        user.setPassword(PasswordEncryptionUtil.encryptPassword(user.getPassword()));
        userDAO.register(user);
    }

    public boolean checkChangePassword(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String passwordInput = req.getParameter("passwordOld");
        return PasswordEncryptionUtil.checkPassword(passwordInput, user.getPassword());
    }

    public void changePassword(HttpServletRequest req, HttpServletResponse resp) {
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        String passwordNew = PasswordEncryptionUtil.encryptPassword(req.getParameter("passwordNew"));
        userDAO.changePassword(user.getId(), passwordNew);
    }
}
