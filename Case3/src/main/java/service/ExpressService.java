package service;

import DAO.ExpressDAO;
import DAO.RoleDAO;
import Model.Express;
import Model.Role;
import service.dto.Page;

import java.util.List;

public class ExpressService {
    private final ExpressDAO expressDAO;
    public ExpressService(){
        expressDAO = new ExpressDAO();
    }
    public Page<Express> findAll(int page, String search){
        return expressDAO.findAll(page, search);
    }

    public void create(Express express) {

        expressDAO.create(express);
    }

    public Express findById(int id) {
        return expressDAO.findById(id);
    }

    public void update(int id, Express express) {
        expressDAO.update(id, express);
    }

    public void delete(int id) {
        expressDAO.delete(id);
    }
}
