package service.dto;

import java.math.BigDecimal;
import java.sql.Date;

public class BillListResponse {
    private int idBill;
    private Date createAt;
    private String customerName;
    private String products;
    private BigDecimal total;

    public BillListResponse(int idBill, Date createAt, String customerName, String products, BigDecimal total) {
        this.idBill = idBill;
        this.createAt = createAt;
        this.customerName = customerName;
        this.products = products;
        this.total = total;
    }

    public int getIdBill() {
        return idBill;
    }

    public void setIdBill(int idBill) {
        this.idBill = idBill;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProducts() {
        return products;
    }

    public void setProducts(String products) {
        this.products = products;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }
}
