package DAO;

import Model.Cart;
import Model.Product;
import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DatabaseConnection {
    private final String FIND_CART_BY_ID_USER = "select * from carts c join users u on c.customer_id = u.id where c.customer_id = ?";

    public List<Cart> findCartByIdUser(int id) throws SQLException {
        var carts = new ArrayList<Cart>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_CART_BY_ID_USER)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                carts.add(getCartByResultSet(resultSet));
            }
            return carts;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void create() {

    }

    private Cart getCartByResultSet(ResultSet rs) throws SQLException {
        var cart = new Cart();
        cart.setId(rs.getInt("id"));
        cart.setProduct(new Product(rs.getInt("product_id")));
        cart.setUser(new User(rs.getInt("customer_id")));
        cart.setQuantity(rs.getInt("quantity"));
        cart.setPrice(rs.getBigDecimal("price"));
        return cart;
    }
}
