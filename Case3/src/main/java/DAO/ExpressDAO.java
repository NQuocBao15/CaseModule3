package DAO;

import Model.Express;
import Model.User;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ExpressDAO extends DatabaseConnection{
    public Page<Express> findAll(int page, String search){
        var result = new Page<Express>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<Express>();

        if(search == null){
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";

        var SELECT_ALL = "SELECT e.* " +
                "FROM express e " +
                "WHERE e.name LIKE ? " +
                "LIMIT ? OFFSET ?";

        var SELECT_COUNT = "SELECT COUNT(1) cnt " +
                "FROM express e " +
                "WHERE e.name LIKE ? ";

        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1,search);
            preparedStatement.setInt(2,TOTAL_ELEMENT);
            preparedStatement.setInt(3,(page-1)*TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()){
                content.add(getExpressByResultSet(rs));
            }

            result.setContent(content);

            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1,search);
            System.out.println(preparedStatementCount);

            var rsCount = preparedStatementCount.executeQuery();
            if(rsCount.next()){
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt")/TOTAL_ELEMENT));
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    private Express getExpressByResultSet(ResultSet rs) throws SQLException {
        Express express = new Express();
        express.setId(rs.getInt("id"));
        express.setName(rs.getString("name"));
        return express;
    }

    public void create(Express express) {
        String INSERT_EXPRESS = "INSERT INTO `candycake`.`express` (`name`) " +
                "VALUES (?)";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EXPRESS);
            preparedStatement.setString(1,express.getName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Express findById(int id) {
        String SELECT_BY_ID = "SELECT * FROM express e " +
                "WHERE e.id = ?";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            var rs = preparedStatement.executeQuery();
            if(rs.next()){
                return getExpressByResultSet(rs);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    public void update(int id, Express express) {
        String UPDATE = "UPDATE `candycake`.`express` " +
                "SET `name` = ? WHERE (`id` = ?)";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1,express.getName());
            preparedStatement.setInt(2,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int id) {
        String DELETE = "DELETE FROM `candycake`.`express` " +
                "WHERE (`id` = ?)";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
