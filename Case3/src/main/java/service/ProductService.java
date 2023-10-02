package service;

import DAO.ProductDao;
import Model.Product;
import service.dto.Page;

import java.util.List;

public class ProductService {
    private final ProductDao productDao;

    public ProductService() {
        productDao = new ProductDao();
    }


    public void create(Product product) {
        productDao.create(product);
    }

    public Page<Product> getProducts(int page, String search) {
        return productDao.findAll(page, search);
    }

    public List<Product> findAll() {
        return productDao.findAll();
    }
    public Product findById(int id) {
        return productDao.findById(id);
    }

    public void update(Product product, int id) {
        product.setId(id);
        productDao.update(product);
    }

//    public void restore(String[] stringIds){
//        String[] ids = stringIds[0].split(",");
//
//        for (var id : ids) {
//            productDao.restore(Integer.parseInt((id)));
//        }
//    }

    public void delete(int id) {
        productDao.delete(id);
    }

    public Object performSearch(String search) {
        return productDao.searchProduct(search);
    }
}
