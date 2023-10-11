package DAO;

import Model.Order;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BillDAO extends  DatabaseConnection{
    public int createBill(Order order){
        String CREATE = "INSERT INTO `bills` (`customer_id`, `create_at`, `name_receiver`, `phone_receiver`, `express_name`, `code`, `total`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?);";
        String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM bills";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE);
            preparedStatement.setInt(1,order.getUser().getId());
            preparedStatement.setDate(2,order.getCreateAt());
            preparedStatement.setString(3,order.getNameReceiver());
            preparedStatement.setString(4,order.getPhoneReceiver());
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
}
