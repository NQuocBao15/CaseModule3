package DAO;

import Model.Cart;
import Model.Product;
import Model.User;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDAO extends DatabaseConnection {
    private final String FIND_CART_BY_2_ID = "select * from carts where product_id = ? AND customer_id = ?;";
    private final String FIND_CART_BY_ID_USER = "select c.*,p.name as product_name,p.img, u.name as customer_name from carts c " +
            "join users u on c.customer_id = u.id " +
            "join products p on c.product_id = p.id " +
            "where c.customer_id = ?";
    private final String CREATE_CART = "INSERT INTO `carts` (`product_id`, `customer_id`, `quantity`, `price`) VALUES (?, ?, ?, ?);";
    private final String DELETE_CART = "DELETE FROM `carts` WHERE (`product_id` = ? and `customer_id` = ?);";
    private final String UPDATE_CART = "UPDATE carts " +
            "SET quantity = (SELECT total_quantity FROM (" +
            "    SELECT SUM(c.quantity + ?) AS total_quantity " +
            "    FROM carts c " +
            "    WHERE product_id = ? AND customer_id = ?" +
            ") AS subquery)" +
            "WHERE product_id = ? AND customer_id = ?;";
    private final String UPDATE_CART_QUANTITY = "UPDATE `carts` SET `quantity` = ? WHERE (`customer_id` = ? and `product_id` = ?);";

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

    public Cart findCartByBothId(int idProduct, int idUser) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_CART_BY_2_ID)) {
            preparedStatement.setInt(1, idProduct);
            preparedStatement.setInt(2, idUser);
            System.out.println(preparedStatement);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                var cart = new Cart();
                cart.setId(resultSet.getInt("id"));
                cart.setProduct(new Product(resultSet.getInt("product_id")));
                cart.setUser(new User(resultSet.getInt("customer_id")));
                cart.setQuantity(resultSet.getInt("quantity"));
                cart.setPrice(resultSet.getBigDecimal("price"));
                return cart;

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void create(int idProduct, int idUser, int quantity, BigDecimal price) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE_CART)) {
            preparedStatement.setInt(1, idProduct);
            preparedStatement.setInt(2, idUser);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setBigDecimal(4, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void update(int idProduct, int idUser, int quantity) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, idProduct);
            preparedStatement.setInt(3, idUser);
            preparedStatement.setInt(4, idProduct);
            preparedStatement.setInt(5, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateQuantity(int idProduct, int idUser, int quantity) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART_QUANTITY)) {
            preparedStatement.setInt(1, quantity);
            preparedStatement.setInt(2, idProduct);
            preparedStatement.setInt(3, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int idProduct, int idUser) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART)) {
            preparedStatement.setInt(1, idProduct);
            preparedStatement.setInt(2, idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public void delete(int idUser){
        String DELETE_BY_IDUSER = "DELETE FROM `carts` WHERE (`customer_id` = ?);";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BY_IDUSER);
            preparedStatement.setInt(1,idUser);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    private Cart getCartByResultSet(ResultSet rs) throws SQLException {
        var cart = new Cart();
        cart.setId(rs.getInt("id"));
        cart.setProduct(new Product(rs.getInt("product_id"),rs.getString("product_name"),rs.getString("img")));
        cart.setUser(new User(rs.getInt("customer_id"),rs.getString("customer_name")));
        cart.setQuantity(rs.getInt("quantity"));
        cart.setPrice(rs.getBigDecimal("price"));
        return cart;
    }
}
