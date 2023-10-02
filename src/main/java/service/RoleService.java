package service;

import DAO.RoleDAO;
import Model.Role;
import service.dto.Page;

import java.util.List;

public class RoleService {
    private final RoleDAO roleDAO;
    public RoleService(){
        roleDAO = new RoleDAO();
    }
    public List<Role> findAll(){
        return roleDAO.findAll();
    }
}
