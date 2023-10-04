package DAO;

import Model.Product;
import Model.ProductImport;
import Model.ProductImportDetail;
import service.dto.Page;
import service.dto.ProductImportListResponse;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductImportDAO extends DatabaseConnection {
    public int create(ProductImport productImport) {
        String CREATE = "INSERT INTO `product_imports` (`code`, `date_import`, `total`) " +
                "VALUES (?, ?, ?)";
        String SELECT_MAX_ID = "SELECT MAX(id) as max_id FROM product_imports";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, productImport.getCode());
            preparedStatement.setDate(2, productImport.getDateImport());
            preparedStatement.setBigDecimal(3, productImport.getTotal());
            preparedStatement.executeUpdate();
            PreparedStatement statementId = connection.prepareStatement(SELECT_MAX_ID);
            var rs = statementId.executeQuery();
            if (rs.next()) {
                return rs.getInt("max_id");
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return -1;
    }

    public void createImportDetail(int productImportId, int productId, int quantity, BigDecimal price) {

        String CREATE = "INSERT INTO `product_import_details` (`product_import_id`,`product_id`,`quantity`, `price`) VALUES (?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setInt(1, productImportId);
            preparedStatement.setInt(2, productId);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setBigDecimal(4, price);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public Page<ProductImportListResponse> findAll(int page, String search) {
        var result = new Page<ProductImportListResponse>();
        final int TOTAL_ELEMENT = 5;
        result.setCurrentPage(page);
        var content = new ArrayList<ProductImportListResponse>();
        if(search == null){
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        String SELECT_ALL = "SELECT pi.id, pi.code, pi.date_import, GROUP_CONCAT(p.name) products, pi.total FROM " +
                "product_imports pi " +
                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
                "LEFT JOIN products p on p.id = pid.product_id " +
                "WHERE lower(pi.code) like ? or lower(p.name) like ? " +
                "GROUP BY pi.id " +
                "LIMIT ? OFFSET ?";
        String SELECT_COUNT =  "select count(*) cnt from (SELECT pi.id, pi.code, pi.date_import, GROUP_CONCAT(p.name) products, pi.total FROM " +
                "product_imports pi " +
                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
                "LEFT JOIN products p on p.id = pid.product_id " +
                "WHERE lower(pi.code) like ? or lower(p.name) like ? " +
                "GROUP BY pi.id) t";
//        String SELECT_COUNT = "select count(1) cnt from product_imports pi " +
//                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
//                "LEFT JOIN products p on p.id = pid.product_id " +
//                "WHERE lower(pi.code) like ? or lower(p.name) like ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1,search);
            preparedStatement.setString(2,search);
            preparedStatement.setInt(3,TOTAL_ELEMENT);
            preparedStatement.setInt(4,(page-1)*TOTAL_ELEMENT);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                content.add(new ProductImportListResponse(
                        rs.getInt("id"),
                        rs.getString("code"),
                        rs.getDate("date_import"),
                        rs.getString("products"),
                        rs.getBigDecimal("total")
                ));
            }
            result.setContent(content);
            var preparedStatementCount = connection.prepareStatement(SELECT_COUNT);
            preparedStatementCount.setString(1,search);
            preparedStatementCount.setString(2,search);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") /TOTAL_ELEMENT));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ProductImport findById(int id) {
        String FIND_BY_ID = "SELECT pi.*, pid.id pid_id, pid.product_id p_id, pid.amount, pid.quantity  FROM product_imports as pi " +
                "JOIN product_import_details pid on pid.product_import_id = pi.id WHERE pi.id = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID)) {
            System.out.println(preparedStatement);
            preparedStatement.setInt(1, id);
            var rs = preparedStatement.executeQuery();
            ProductImport productImport = new ProductImport();
            var productImportDetails = new ArrayList<ProductImportDetail>();
            while (rs.next()) {
                productImport.setCode(rs.getString("code"));
                productImport.setId(rs.getInt("id"));
                productImport.setDateImport(rs.getDate("import_date"));
                productImport.setTotal(rs.getBigDecimal("total_amount"));
                var productImportDetail = new ProductImportDetail();
                productImportDetail.setId(rs.getInt("pid_id"));
                productImportDetail.setProduct(new Product(rs.getInt("p_id")));
                productImportDetail.setPrice(rs.getBigDecimal("amount"));
                productImportDetail.setQuantity(rs.getInt("quantity"));
                productImportDetails.add(productImportDetail);

            }
            productImport.setProductImportDetails(productImportDetails);
            return productImport;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
    public void deleteImportDetail(int productImportId) {

        String DELETE_IMPORT_DETAIL = "DELETE FROM `c0623g1`.`product_import_details` WHERE (`product_import_id` = ?);";
        String DELETE_IMPORT = "DELETE FROM `product_imports` where (id = ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatementDeleteImportDetail = connection.prepareStatement(DELETE_IMPORT_DETAIL)) {
            preparedStatementDeleteImportDetail.setInt(1, productImportId);
            preparedStatementDeleteImportDetail.executeUpdate();

            var preparedStatementDeleteImport = connection.prepareStatement(DELETE_IMPORT);
            preparedStatementDeleteImport.setInt(1,productImportId);
            preparedStatementDeleteImport.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void updateProductImport(ProductImport productImport){
        String CREATE = "UPDATE `c0623g1`.`product_imports` SET `code` = ?, `import_date` = ?, `total_amount` = ? WHERE (`id` = ?);";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, productImport.getCode());
            preparedStatement.setDate(2, productImport.getDateImport());
            preparedStatement.setBigDecimal(3, productImport.getTotal());
            preparedStatement.setInt(4, productImport.getId());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}
