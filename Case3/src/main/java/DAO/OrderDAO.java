package DAO;

import Model.*;
import service.dto.OrderListResponse;
import service.dto.Page;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DatabaseConnection {
    public Page<OrderListResponse> findAll(int page, String search) {
        var result = new Page<OrderListResponse>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<OrderListResponse>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";
        var SELECT_ALL = "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status " +
                "FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ? OR o.status LIKE ?" +
                "LIMIT ? OFFSET ?";
        var SELECT_COUNT = "SELECT count(1) cnt FROM (" +
                "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ? OR o.status LIKE ?) T";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setString(3, search);
            preparedStatement.setInt(4, TOTAL_ELEMENT);
            preparedStatement.setInt(5, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(new OrderListResponse(rs.getInt("id"), rs.getDate("create_at"),
                        rs.getString("name"), rs.getString("products"),
                        rs.getBigDecimal("total"), rs.getString("status")));
            }
            result.setContent(content);


            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            preparedStatementCount.setString(3, search);
            System.out.println(preparedStatementCount);

            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") / TOTAL_ELEMENT));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    public Page<OrderListResponse> findAll(int page, String search, int idUser) {
        var result = new Page<OrderListResponse>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<OrderListResponse>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";
        var SELECT_ALL = "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status " +
                "FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "WHERE u.id = ? " +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ? OR o.status LIKE ?" +
                "LIMIT ? OFFSET ?";
        var SELECT_COUNT = "SELECT count(1) cnt FROM (" +
                "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "WHERE u.id = ?" +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ? OR o.status LIKE ?) T";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setInt(1,idUser);
            preparedStatement.setString(2, search);
            preparedStatement.setString(3, search);
            preparedStatement.setString(4, search);
            preparedStatement.setInt(5, TOTAL_ELEMENT);
            preparedStatement.setInt(6, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(new OrderListResponse(rs.getInt("id"), rs.getDate("create_at"),
                        rs.getString("name"), rs.getString("products"),
                        rs.getBigDecimal("total"), rs.getString("status")));
            }
            result.setContent(content);


            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setInt(1, idUser);
            preparedStatementCount.setString(2, search);
            preparedStatementCount.setString(2, search);
            preparedStatementCount.setString(3, search);
            System.out.println(preparedStatementCount);

            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") / TOTAL_ELEMENT));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public Order findById(int id) {
        String SELECT_BY_ID = "SELECT o.*, ot.id ot_id, ot.product_id p_id, ot.price, ot.quantity, u.name as customer_name, e.name express_name, p.name product_name " +
                "FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN users u ON o.customer_id = u.id " +
                "JOIN express e ON o.express_id = e.id " +
                "JOIN products p ON p.id = ot.product_id " +
                "WHERE o.id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            Order order = new Order();
            List<OrderItem> orderItems = new ArrayList<>();

            while (rs.next()) {
                order.setId(rs.getInt("id"));
                order.setUser(new User(rs.getInt("customer_id"), rs.getString("customer_name")));
                order.setCreateAt(rs.getDate("create_at"));
                order.setNameReceiver(rs.getString("name_receiver"));
                order.setAddressReceiver(rs.getString("address_receiver"));
                order.setPhoneReceiver(rs.getString("phone_receiver"));
                order.setExpress(new Express(rs.getInt("express_id"), rs.getString("express_name")));
                order.setCode(rs.getString("code"));
                order.setTotal(rs.getBigDecimal("total"));
                order.setStatus(EStatus.valueOf(rs.getString("status")));
                var orderItem = new OrderItem();
                orderItem.setId(rs.getInt("ot_id"));
                orderItem.setProduct(new Product(rs.getInt("p_id"), rs.getString("product_name")));
                orderItem.setPrice(rs.getBigDecimal("price"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItems.add(orderItem);
            }
            order.setOrderItems(orderItems);
            return order;
        } catch (SQLException e) {
            System.out.println("hello" + e.getMessage());
        }
        return null;
    }
    public Order findById(int idOrder, int idUser) {
        String SELECT_BY_ID = "SELECT o.*, ot.id ot_id, ot.product_id p_id, ot.price, ot.quantity, u.name as customer_name, e.name express_name, p.name product_name " +
                "FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN users u ON o.customer_id = u.id " +
                "JOIN express e ON o.express_id = e.id " +
                "JOIN products p ON p.id = ot.product_id " +
                "WHERE o.id = ? AND u.id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, idOrder);
            preparedStatement.setInt(2, idUser);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            Order order = new Order();
            List<OrderItem> orderItems = new ArrayList<>();

            while (rs.next()) {
                order.setId(rs.getInt("id"));
                order.setUser(new User(rs.getInt("customer_id"), rs.getString("customer_name")));
                order.setCreateAt(rs.getDate("create_at"));
                order.setNameReceiver(rs.getString("name_receiver"));
                order.setAddressReceiver(rs.getString("address_receiver"));
                order.setPhoneReceiver(rs.getString("phone_receiver"));
                order.setExpress(new Express(rs.getInt("express_id"), rs.getString("express_name")));
                order.setCode(rs.getString("code"));
                order.setTotal(rs.getBigDecimal("total"));
                order.setStatus(EStatus.valueOf(rs.getString("status")));
                var orderItem = new OrderItem();
                orderItem.setId(rs.getInt("ot_id"));
                orderItem.setProduct(new Product(rs.getInt("p_id"), rs.getString("product_name")));
                orderItem.setPrice(rs.getBigDecimal("price"));
                orderItem.setQuantity(rs.getInt("quantity"));
                orderItems.add(orderItem);
            }
            order.setOrderItems(orderItems);
            return order;
        } catch (SQLException e) {
            System.out.println("hello" + e.getMessage());
        }
        return null;
    }

    public void update(int id, String status) {
        String UPDATE_BY_ID = "UPDATE `candycake`.`orders` " +
                "SET `status` = ? WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteOrder(int idOrder) {
        String DELETE_ORDER = "DELETE FROM `candycake`.`orders` " +
                "WHERE (`id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER);
            preparedStatement.setInt(1, idOrder);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteOrderItem(int idOrder) {
        String DELETE_ORDER_ITEM = "DELETE FROM `candycake`.`order_items` " +
                "WHERE (`order_id` = ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ORDER_ITEM);
            preparedStatement.setInt(1, idOrder);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public int createOrder(Order order) {
        String INSERT_ORDER = "INSERT INTO `orders` (`customer_id`, `express_id`, `name_receiver`, `create_at`, `total`, `address_receiver`, `phone_receiver`, `code`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM orders";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER);
            preparedStatement.setInt(1, order.getUser().getId());
            preparedStatement.setInt(2, order.getExpress().getId());
            preparedStatement.setString(3, order.getNameReceiver());
            preparedStatement.setDate(4, order.getCreateAt());
            preparedStatement.setBigDecimal(5, order.getTotal());
            preparedStatement.setString(6, order.getAddressReceiver());
            preparedStatement.setString(7, order.getPhoneReceiver());
            preparedStatement.setString(8, order.getCode());
            preparedStatement.executeUpdate();

            PreparedStatement statenmentId = connection.prepareStatement(SELECT_MAX_ID);
            var rs = statenmentId.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public void createOrderItems(int idOrder, Integer productId, Integer quantity, BigDecimal price) {
        String INSERT_ORDER_ITEM = "INSERT INTO `order_items` (`order_id`, `product_id`, `quantity`, `price`) VALUES (?, ?, ?, ?);";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_ITEM)) {
            preparedStatement.setInt(1, idOrder);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setBigDecimal(4, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
