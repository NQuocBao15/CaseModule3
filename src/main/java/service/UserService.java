package service;

import DAO.UserDAO;
import Model.User;
import Utils.PasswordEncryptionUtil;
import service.dto.Page;

public class UserService {
    private UserDAO userDAO;
    public UserService(){
        userDAO = new UserDAO();
    }
    public Page<User> findAll(int page, String search){
        return userDAO.findAll(page,search);
    }

    public void create(User user) {
        user.setPassword(PasswordEncryptionUtil.encryptPassword(user.getPassword()));
        userDAO.create(user);
    }
}
