package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private final String JDBC_URL = "jdbc:mysql://localhost:3306/candycake2"; // sửa chữ bài tập thành database của mình;
    private final String JDBC_USERNAME = "root";
    //                            password của mình
    private final String JDBC_PASSWORD = "Nqb.151104";


    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
