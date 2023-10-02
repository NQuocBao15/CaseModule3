package DAO;

import Model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao extends DatabaseConnection{
    public List<Category> findAll() {
        var result = new ArrayList<Category>();
        try {
            Connection connection = getConnection();
            String SELECT_ALL = "SELECT * FROM `categories`";
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(new Category(rs.getInt("id"), rs.getString("name")));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public Category findById(int id) {
        try {
            Connection connection = getConnection();
            String SELECT_BY_ID = "SELECT * FROM `categories` WHERE `id` = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt("id"), rs.getString("name"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
