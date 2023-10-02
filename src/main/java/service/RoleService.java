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
    public Page<Role> getRoles(int page, String search){
        return roleDAO.findAll(page,search);
    }
    public List<Role> findAll(){
        return roleDAO.findAll();
    }
    public void create(Role role){
        roleDAO.create(role);
    }
    public void update(Role role, int id){
        role.setId(id);
        roleDAO.update(role);
    }
    public void delete(int id){
        roleDAO.delete(id);
    }
    public Role findById(int id){
        return roleDAO.findById(id);
    }

}
