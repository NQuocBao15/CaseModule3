package DAO;

import Model.*;
import service.dto.OrderListResponse;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DatabaseConnection{
    public Page<OrderListResponse> findAll(int page, String search) {
        var result = new Page<OrderListResponse>();
        final int TOTAL_ELEMENT = 2;
        result.setCurrentPage(page);
        var content = new ArrayList<OrderListResponse>();
        if(search == null){
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";
        var SELECT_ALL = "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status " +
                "FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ? " +
                "LIMIT ? OFFSET ?";
        var SELECT_COUNT = "SELECT count(1) cnt FROM (" +
                "SELECT o.id, o.create_at, u.name, GROUP_CONCAT(p.name) as products, o.total, o.status FROM orders o " +
                "JOIN order_items ot ON o.id = ot.order_id " +
                "JOIN products p ON ot.product_id = p.id " +
                "JOIN users u ON o.customer_id = u.id " +
                "GROUP BY o.id, o.create_at " +
                "HAVING LOWER(u.name) LIKE ? OR LOWER(GROUP_CONCAT(p.name)) LIKE ?) T";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1,search);
            preparedStatement.setString(2,search);
            preparedStatement.setInt(3,TOTAL_ELEMENT);
            preparedStatement.setInt(4,(page-1)*TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()){
                content.add(new OrderListResponse(rs.getInt("id"),rs.getDate("create_at"),
                        rs.getString("name"), rs.getString("products"),
                        rs.getBigDecimal("total"), rs.getString("status")));
            }
            result.setContent(content);


            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1,search);
            preparedStatementCount.setString(2,search);
            System.out.println(preparedStatementCount);

            var rsCount = preparedStatementCount.executeQuery();
            if(rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt")/TOTAL_ELEMENT ));
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
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            Order order =new Order();
            List<OrderItem> orderItems = new ArrayList<>();

            while (rs.next()){
                order.setId(rs.getInt("id"));
                order.setUser(new User(rs.getInt("customer_id"),rs.getString("customer_name")));
                order.setCreateAt(rs.getDate("create_at"));
                order.setNameReceiver(rs.getString("name_receiver"));
                order.setAddressReceiver(rs.getString("address_receiver"));
                order.setPhoneReceiver(rs.getString("phone_receiver"));
                order.setExpress(new Express(rs.getInt("express_id"),rs.getString("express_name")));
                order.setCode(rs.getString("code"));
                order.setTotal(rs.getBigDecimal("total"));
                order.setStatus(EStatus.valueOf(rs.getString("status")));
                var orderItem = new OrderItem();
                orderItem.setId(rs.getInt("ot_id"));
                orderItem.setProduct(new Product(rs.getInt("p_id"),rs.getString("product_name")));
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
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BY_ID);
            preparedStatement.setString(1,status);
            preparedStatement.setInt(2,id);
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
