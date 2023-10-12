package DAO;

import Model.Product;
import Model.ProductImport;
import Model.ProductImportDetail;
import service.dto.Page;
import service.dto.ProductImportListResponse;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        if (search == null) {
            search = "";
        }
        search = "%" + search.toLowerCase() + "%";
        String SELECT_ALL = "SELECT pi.id, pi.code, pi.date_import, GROUP_CONCAT(p.name) products, pi.total FROM " +
                "product_imports pi " +
                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
                "LEFT JOIN products p on p.id = pid.product_id " +
                "GROUP BY pi.id  " +
                "HAVING lower(pi.code) like ? or GROUP_CONCAT(p.name) like ? " +
                "ORDER BY pi.id " +
                "LIMIT ? OFFSET ?";
        String SELECT_COUNT = "select count(*) cnt from (SELECT pi.id, pi.code, pi.date_import, GROUP_CONCAT(p.name) products, pi.total FROM " +
                "product_imports pi " +
                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
                "LEFT JOIN products p on p.id = pid.product_id " +
                "GROUP BY pi.id " +
                "HAVING lower(pi.code) like ? or GROUP_CONCAT(p.name) like ?) t";
//        String SELECT_COUNT = "select count(1) cnt from product_imports pi " +
//                "LEFT JOIN product_import_details pid on pi.id = pid.product_import_id " +
//                "LEFT JOIN products p on p.id = pid.product_id " +
//                "WHERE lower(pi.code) like ? or lower(p.name) like ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            System.out.println(preparedStatement);
            preparedStatement.setString(1, search);
            preparedStatement.setString(2, search);
            preparedStatement.setInt(3, TOTAL_ELEMENT);
            preparedStatement.setInt(4, (page - 1) * TOTAL_ELEMENT);
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
            preparedStatementCount.setString(1, search);
            preparedStatementCount.setString(2, search);
            var rsCount = preparedStatementCount.executeQuery();
            if (rsCount.next()) {
                result.setTotalPage((int) Math.ceil((double) rsCount.getInt("cnt") / TOTAL_ELEMENT));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ProductImport findById(int id) {
        String FIND_BY_ID = "SELECT pi.*, pid.id pid_id, pid.product_id p_id, pid.price, pid.quantity  FROM product_imports as pi " +
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
                productImport.setDateImport(rs.getDate("date_import"));
                productImport.setTotal(rs.getBigDecimal("total"));
                var productImportDetail = new ProductImportDetail();
                productImportDetail.setId(rs.getInt("pid_id"));
                productImportDetail.setProduct(new Product(rs.getInt("p_id")));
                productImportDetail.setPrice(rs.getBigDecimal("price"));
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

        String DELETE_IMPORT_DETAIL = "DELETE FROM `candycake`.`product_import_details` WHERE (`product_import_id` = ?);";
//        String DELETE_IMPORT = "DELETE FROM `product_imports` where (id = ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatementDeleteImportDetail = connection.prepareStatement(DELETE_IMPORT_DETAIL)) {
            preparedStatementDeleteImportDetail.setInt(1, productImportId);
            preparedStatementDeleteImportDetail.executeUpdate();

//            var preparedStatementDeleteImport = connection.prepareStatement(DELETE_IMPORT);
//            preparedStatementDeleteImport.setInt(1,productImportId);
//            preparedStatementDeleteImport.executeUpdate();


        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }


    public void updateProductImport(ProductImport productImport){
        String CREATE = "UPDATE `candycake`.`product_imports` SET `code` = ?, `date_import` = ?, `total` = ? WHERE (`id` = ?);";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(CREATE)) {
            preparedStatement.setString(1, productImport.getCode());
            preparedStatement.setDate(2, productImport.getDateImport());
            preparedStatement.setBigDecimal(3, productImport.getTotal());
            preparedStatement.setInt(4, productImport.getId());
            System.out.println(productImport);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public void deleteProductImport(int id) {
        String DELETE_PRODUCT_IMPORT = "DELETE FROM `candycake`.`product_imports` " +
                "WHERE (`id` = ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PRODUCT_IMPORT)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public List<ProductImportDetail> getQuantityForCartByIdUser(int id) {
        List<ProductImportDetail> result = new ArrayList<>();
        String GET_PRODUCT_QUANTITY_FOR_CART = "SELECT c.*, SUM(pid.quantity - pid.quantity_sold) AS quantity " +
                "FROM carts c " +
                "JOIN products p ON c.product_id = p.id " +
                "JOIN product_import_details pid ON pid.product_id = p.id " +
                "where c.customer_id = ? " +
                "group by c.id";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_QUANTITY_FOR_CART)) {
            preparedStatement.setInt(1,id);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.add(getProductImportDetailByResultSet2(rs));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public ProductImportDetail getQuantityByIdProduct(int id) {
        var result = new ProductImportDetail();
        result.setId(id);
        String GET_PRODUCT_QUANTITY = "SELECT p.*, (select sum(pid.quantity-pid.quantity_sold) from product_import_details pid " +
                "join products p on pid.product_id = p.id " +
                "where p.id = ? " +
                "group by p.id) as quantity FROM products p  " +
                "where p.id = ? ";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_PRODUCT_QUANTITY)) {
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, id);
            var rs = preparedStatement.executeQuery();
            while (rs.next()) {
                result.setQuantity(rs.getInt("quantity"));
                result.setProduct(new Product(rs.getString("name")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return result;
    }

    public List<ProductImportDetail> findAllProductImportDetail() {
        String FIND_ALL_PRODUCT_IMPORT_DETAIL = "SELECT product_id, sum(quantity) as quantity, sum(quantity_sold) as quantity_sold, p.name as product_name FROM product_import_details pid " +
                "join products p on pid.product_id = p.id " +
                "group by product_id";
        List<ProductImportDetail> productImportDetails = new ArrayList<>();
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_PRODUCT_IMPORT_DETAIL);
            var rs = preparedStatement.executeQuery();
            while (rs.next()){
               productImportDetails.add(getProductImportDetailByResultSet(rs));
            }
            return productImportDetails;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    private ProductImportDetail getProductImportDetailByResultSet(ResultSet rs) throws SQLException {
        ProductImportDetail productImportDetail = new ProductImportDetail();
        productImportDetail.setProduct(new Product(rs.getInt("id"),rs.getString("product_name")));
        productImportDetail.setQuantity(rs.getInt("quantity"));
        productImportDetail.setQuantitySold(rs.getInt("quantity_sold"));
        return  productImportDetail;
    }

    private ProductImportDetail getProductImportDetailByResultSet2(ResultSet rs) throws SQLException {
        ProductImportDetail productImportDetail = new ProductImportDetail();
        productImportDetail.setProduct(new Product(rs.getInt("product_id")));
        productImportDetail.setQuantity(rs.getInt("quantity"));
        return  productImportDetail;
    }

    public void setQuantitySold(Integer idProduct, Integer quantity) {
        String SET_QUANTITY_SOLD = "UPDATE `product_import_details` SET `quantity_sold` = ? " +
                "WHERE (product_id = ?);";
        try{
            Connection connection = getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SET_QUANTITY_SOLD);
            preparedStatement.setInt(1,quantity);
            preparedStatement.setInt(2,idProduct);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }
    }
}

