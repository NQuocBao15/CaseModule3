package service;

import DAO.UserDAO;
import Model.User;

import Utils.PasswordEncryptionUtil;
import service.dto.Page;

import java.util.List;

public class UserService {
    private UserDAO userDAO;
    public UserService(){
        userDAO = new UserDAO();
    }
    public Page<User> findAll(int page, String search){
        return userDAO.findAll(page,search);
    }
    public List<User> findAll(){
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
}
