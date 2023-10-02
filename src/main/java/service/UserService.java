package service;

import DAO.UserDAO;
import Model.User;

public class UserService {
    private UserDAO userDAO;
    public UserService(){
        userDAO = new UserDAO();
    }
    public void create(User user){
        userDAO.create(user);
    }
}
