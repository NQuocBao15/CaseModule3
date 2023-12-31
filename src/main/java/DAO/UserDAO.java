package DAO;

import Model.EGender;
import Model.Role;
import Model.User;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO extends DatabaseConnection{
    public Page<User> findAll(int page, String search){
        var result = new Page<User>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<User>();

        if(search == null){
            search = "";
        }
        search = "%" + search.trim().toLowerCase() + "%";

        var SELECT_ALL = "SELECT u.*, r.name role_name " +
                "FROM users u " +
                "JOIN roles r ON u.role_id = r.id " +
                "WHERE LOWER(u.name) LIKE ? OR u.phone LIKE ? OR LOWER(u.username) LIKE ? " +
                "OR LOWER(u.address) LIKE ? OR LOWER(u.dob) LIKE ? OR LOWER(u.gender) LIKE ? OR LOWER(r.name) LIKE ? " +
                "GROUP BY u.id " +
                "LIMIT ? OFFSET ?";

        var SELECT_COUNT = "SELECT COUNT(1) cnt " +
                "FROM users u " +
                "JOIN roles r ON r.role_id = r.id " +
                "WHERE LOWER(u.name) LIKE ? OR u.phone LIKE ? OR LOWER(u.username) LIKE ? " +
                "OR LOWER(u.address) LIKE ? OR LOWER(u.dob) LIKE ? OR LOWER(u.gender) LIKE ? OR LOWER(r.name) LIKE ? " +
                "GROUP BY u.id ";

        try {
            Connection connection = getConnection();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            preparedStatement.setString(1,search);
            preparedStatement.setString(2,search);
            preparedStatement.setString(3,search);
            preparedStatement.setString(4,search);
            preparedStatement.setString(5,search);
            preparedStatement.setString(6,search);
            preparedStatement.setString(7,search);
            preparedStatement.setInt(8,TOTAL_ELEMENT);
            preparedStatement.setInt(9,(page-1)*TOTAL_ELEMENT);
            System.out.println(preparedStatement);

            var rs = preparedStatement.executeQuery();
            while (rs.next()){
                content.add(getUserByResultSet(rs));
            }

            result.setContent(content);

            PreparedStatement preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1,search);
            preparedStatementCount.setString(2,search);
            preparedStatementCount.setString(3,search);
            preparedStatementCount.setString(4,search);
            preparedStatementCount.setString(5,search);
            preparedStatementCount.setString(6,search);
            preparedStatementCount.setString(7,search);
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
    public void create(User user){
        String CREATE_USER = "INSERT INTO `demojdbc`.`users` (`name`, `phone`, `username`, `password`, `address`, `dob`, `gender`, `role_id`) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CREATE_USER);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2,user.getPhone());
            preparedStatement.setString(3,user.getUsername());
            preparedStatement.setString(4,user.getPassword());
            preparedStatement.setString(5,user.getAddress());
            preparedStatement.setDate(6,user.getDob());
            preparedStatement.setString(7,user.getGender().toString());
            preparedStatement.setInt(8, user.getRole().getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    private User getUserByResultSet(ResultSet rs) throws SQLException {
        var user = new User();
        user.setId(rs.getInt("id"));
        user.setName(rs.getString("name"));
        user.setPhone(rs.getString("phone"));
        user.setUsername(rs.getString("userName"));
        user.setAddress(rs.getString("email"));
        user.setDob(rs.getDate("dob"));
        user.setGender(EGender.valueOf(rs.getString("gender")));
        user.setRole(new Role(rs.getInt("role_id")));

        return user;
    }
}
