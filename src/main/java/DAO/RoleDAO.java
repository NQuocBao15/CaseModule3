package DAO;

import Model.Role;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleDAO extends DatabaseConnection{
    public List<Role> findAll(){
        List<Role> result = new ArrayList<>();
        var SELECT_ALL = "SELECT * " +
                "FROM roles r ";
        try {
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            while (rs.next()){
                result.add(getRoleByResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
    private Role getRoleByResultSet(ResultSet rs) throws SQLException {
        var role = new Role();
        role.setId(rs.getInt("id"));
        role.setName(rs.getString("name"));
        return role;
    }
}
