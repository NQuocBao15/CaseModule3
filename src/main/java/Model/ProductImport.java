package Model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class ProductImport {
    private int id;
    private String code;
    private Date dateImport;
    private BigDecimal total;
    private List<ProductImportDetail> productImportDetails;

    public ProductImport(int id, String code, Date dateImport, BigDecimal total) {
        this.id = id;
        this.code = code;
        this.dateImport = dateImport;
        this.total = total;
    }

    public ProductImport() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDateImport() {
        return dateImport;
    }

    public void setDateImport(Date dateImport) {
        this.dateImport = dateImport;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public List<ProductImportDetail> getProductImportDetails() {
        return productImportDetails;
    }

    public void setProductImportDetails(List<ProductImportDetail> productImportDetails) {
        this.productImportDetails = productImportDetails;
    }
}
