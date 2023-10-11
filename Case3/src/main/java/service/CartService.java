package service;

import DAO.CartDAO;
import Model.Cart;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.List;

public class CartService {
    private CartDAO cartDAO = new CartDAO();
    public void create(int idProduct, int idUser, int quantity, BigDecimal price) {
        cartDAO.create(idProduct,idUser,quantity,price);
    }

    public List<Cart> findCartByIdUser(int id) throws SQLException {
        return cartDAO.findCartByIdUser(id);
    }

    public Cart findCartByBothId(int idProduct, int idUser) throws SQLException {
        return cartDAO.findCartByBothId(idProduct,idUser);
    }

    public void update(int idProduct, int idUser, int quantity) {
        cartDAO.update(idProduct,idUser,quantity);
    }

    public void updateQuantity(int idProduct, int idUser, int quantity) {
        cartDAO.updateQuantity(idProduct,idUser,quantity);
    }

    public void delete(int idProduct, int idUser) {
        cartDAO.delete(idProduct,idUser);
    }
    public void delete(HttpServletRequest req){
        int idUser = Integer.parseInt(req.getParameter("idUser"));
        cartDAO.delete(idUser);
    }
}
