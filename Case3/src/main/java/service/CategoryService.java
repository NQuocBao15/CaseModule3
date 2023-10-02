package service;

import DAO.CategoryDao;
import Model.Category;

import java.util.List;

public class CategoryService {
    private static CategoryDao categoryDao;


    public CategoryService() {
        categoryDao = new CategoryDao();
    }

    public List<Category> getCategories() {
        return categoryDao.findAll();
    }

    public Category getCategory(int id) {
        return categoryDao.findById(id);
    }
}
