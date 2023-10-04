package service.dto;

import java.math.BigDecimal;
import java.sql.Date;

public class OrderListResponse {
    private int idOrder;
    private Date createAt;
    private String customerName;
    private String products;
    private BigDecimal total;
    private String status;

    public OrderListResponse(int idOrder, Date createAt, String customerName, String products, BigDecimal total, String status) {
        this.idOrder = idOrder;
        this.createAt = createAt;
        this.customerName = customerName;
        this.products = products;
        this.total = total;
        this.status = status;
    }

    public OrderListResponse() {
    }


    public int getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(int idOrder) {
        this.idOrder = idOrder;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
