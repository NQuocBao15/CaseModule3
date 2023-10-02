package DAO;

import Model.Category;
import Model.Product;
import service.dto.Page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductDao extends DatabaseConnection {
    public Page<Product> findAll(int page, String search) {
        var result = new Page<Product>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<Product>();
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        var SELECT_ALL = " SELECT p.*, c.`name` category_name " +
                "FROM `products` p JOIN `categories` c on c.`id` = p.`category_id` " +
                " WHERE  (LOWER(p.`name`) LIKE ? OR LOWER(c.`name`) LIKE ?  ) " +
                " LIMIT ? OFFSET ?  ";
        var SELECT_COUNT = "SELECT COUNT(1) cnt FROM  `products` p " +
                " JOIN `categories` c on  c.id = p.`category_id` " +
                " WHERE  (LOWER(p.`name`) LIKE ? OR LOWER(c.`name`) LIKE ?  ) ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3, TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getProductByResultSet(rs));
            }
            result.setContent(content);
            var preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") / TOTAL_ELEMENT));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<Product> findAll() {
        var content = new ArrayList<Product>();
        var SELECT_ALL = " SELECT p.*, c.`name` category_name " +
                "FROM `products` p JOIN `categories` c on c.`id` = p.`category_id` ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            preparedStatement.setInt(1, 0);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(getProductByResultSet(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return content;
    }

    public void create(Product product) {
        String CREATE = "INSERT INTO `products` ( `name` , `category_id` , `price` ,`description` ,`img` )" +
                " VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCategory().getId());
            preparedStatement.setBigDecimal(3, product.getPrice());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setString(5, product.getImg());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void update(Product product) {
        String UPDATE = "UPDATE `products` " +
                " SET `name` = ?, `category_id` = ?, `price` = ?,`description` = ? ,`img` = ? " +
                " WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE)) {
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getCategory().getId());
            preparedStatement.setBigDecimal(3, product.getPrice());
            preparedStatement.setString(4, product.getDescription());
            preparedStatement.setString(5, product.getImg());
            preparedStatement.setInt(6, product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void delete(int id) {
        String DELETE = "DELETE FROM `products` " +
                " WHERE (`id` = ?) ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

//    public void restore(int id) {
//        String DELETE = "UPDATE `products` " +
//                " SET `deleted` = '0' " +
//                " WHERE (`id` = ?) ";
//        try (Connection connection = getConnection();
//             PreparedStatement preparedStatement = connection.prepareStatement(DELETE)) {
//            preparedStatement.setInt(1, id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException e) {
//            System.out.println(e.getMessage());
//        }
//    }


    public Product findById(int id) {
        var SELECT_BY_ID = "SELECT p.*, c.name category_name " +
                "FROM `products` p JOIN `categories` c on " +
                "c.`id` = p.`category_id` " +
                "WHERE p.`id` = ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID)) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            var rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getProductByResultSet(rs);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private Product getProductByResultSet(ResultSet rs) throws SQLException {
        var product = new Product();
        product.setId(rs.getInt("id"));
        product.setName(rs.getString("name"));
        product.setCategory(new Category(rs.getInt("category_id"), rs.getString("category_name")));
        product.setPrice(rs.getBigDecimal("price"));
        product.setDescription(rs.getString("description"));
        product.setImg(rs.getString("img"));
        return product;
    }

    public List<Product> searchProduct(String searchValue) {
        var result = new ArrayList<Product>();
        searchValue = "%" + searchValue + "%";
        String SELECT_SEARCH = "SELECT p.`id`,p.`name`,p.`price`,c.`name`,p.`price`,p.`description` " +
                " FROM `products` p " +
                " JOIN `categories` c ON p.`category_id`= c.`id` " +
                " HAVING lower(p.`name` ) like ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_SEARCH)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, searchValue);
            preparedStatement.setString(2, searchValue);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getString("img"),
                        rs.getString("description"),
                        new Category(rs.getInt("id"), rs.getString("name"))
                ));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }
}
