package DAO;

import Model.*;
import service.dto.BillListResponse;
import service.dto.OrderListResponse;
import service.dto.Page;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BillDAO extends  DatabaseConnection{
    public int createBill(Order order){
        String CREATE = "INSERT INTO `bills` (`customer_id`, `create_at`, `name_receiver`, `phone_receiver`, `address_receiver`, `express_name`, `code`, `total`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
        String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM bills";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setInt(1,order.getUser().getId());
            preparedStatement.setDate(2,order.getCreateAt());
            preparedStatement.setString(3,order.getNameReceiver());
            preparedStatement.setString(4,order.getPhoneReceiver());
            preparedStatement.setString(5,order.getAddressReceiver());
            preparedStatement.setString(5,order.getExpress().getName());
            preparedStatement.setString(6,order.getCode());
            preparedStatement.setBigDecimal(7,order.getTotal());
            preparedStatement.executeUpdate();

            PreparedStatement statementId = connection.prepareStatement(SELECT_MAX_ID);
            var rs = statementId.executeQuery();
            if(rs.next()){
                return rs.getInt("max_id");
            }
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public void createBillDetail(int idBill, String productName, Integer quantity, BigDecimal price) {
            String CREATE_BILL_DETAIL = "INSERT INTO `bill_details` (`bill_id`, `product_name`, `quantity`, `price`) " +
                    "VALUES (?, ?, ?, ?);";
            try{
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(CREATE_BILL_DETAIL);
                preparedStatement.setInt(1,idBill);
                preparedStatement.setString(2,productName);
                preparedStatement.setInt(3,quantity);
                preparedStatement.setBigDecimal(4,price);
                preparedStatement.executeUpdate();
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }
    }

    public Page<BillListResponse> findAll(int page, String search) {
        var result = new Page<BillListResponse>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<BillListResponse>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";
        var SELECT_ALL = "select b.id, b.create_at, b.name_receiver, b.phone_receiver, b.express_name, b.code, b.total, GROUP_CONCAT(bd.product_name) as products, u.name as customer_name " +
                "FROM bills b " +
                "JOIN bill_details bd ON b.id = bd.bill_id " +
                "JOIN users u ON b.customer_id = u.id " +
                "GROUP BY b.id, b.create_at " +
                "HAVING LOWER(customer_name) LIKE ? OR GROUP_CONCAT(bd.product_name) LIKE ? " +
                "LIMIT ? OFFSET ?";
        var SELECT_COUNT = "Select count(1) cnt FROM " +
                "(select b.id, b.create_at, b.name_receiver, b.phone_receiver, b.express_name, b.code, b.total, GROUP_CONCAT(bd.product_name) as products, u.name as customer_name " +
                "FROM bills b " +
                "JOIN bill_details bd ON b.id = bd.bill_id " +
                "JOIN users u ON b.customer_id = u.id " +
                "GROUP BY b.id, b.create_at " +
                "HAVING LOWER(customer_name) LIKE ? OR GROUP_CONCAT(bd.product_name) LIKE ?) T";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3, TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(new BillListResponse(rs.getInt("id"), rs.getDate("create_at"),
                        rs.getString("customer_name"), rs.getString("products"),
                        rs.getBigDecimal("total")));
            }
            result.setContent(content);


            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
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
    public Bill findById(int id) {
        String SELECT_BY_ID = "select b.id, b.create_at, b.name_receiver, b.phone_receiver, b.address_receiver, b.express_name, b.code, b.total, " +
                "u.name as customer_name, u.id as customer_id, bd.id as bill_detail_id, bd.product_name, bd.price, bd.quantity " +
                "FROM bills b " +
                "JOIN bill_details bd " +
                "JOIN users u ON b.customer_id = u.id " +
                "WHERE b.id = ?";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            Bill bill = new Bill();
            List<BillDetail> billDetails = new ArrayList<>();

            while (rs.next()) {
                bill.setId(rs.getInt("id"));
                bill.setUser(new User(rs.getInt("customer_id"),rs.getString("customer_name")));
                bill.setCreateAt(rs.getDate("create_at"));
                bill.setNameReceiver(rs.getString("name_receiver"));
                bill.setAddressReceiver(rs.getString("address_receiver"));
                bill.setPhoneReceiver(rs.getString("phone_receiver"));
                bill.setExpressName(rs.getString("express_name"));
                bill.setCode(rs.getString("code"));
                bill.setTotal(rs.getBigDecimal("total"));
                var billDetail = new BillDetail();
                billDetail.setId(rs.getInt("bill_detail_id"));
                billDetail.setProduct(new Product(rs.getString("product_name")));
                billDetail.setPrice(rs.getBigDecimal("price"));
                billDetail.setQuantity(rs.getInt("quantity"));
                billDetails.add(billDetail);
            }
            bill.setBillDetails(billDetails);
            return bill;
        } catch (SQLException e) {
            System.out.println("hello" + e.getMessage());
        }
        return null;
    }
}
