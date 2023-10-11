package Model;

import java.math.BigDecimal;

public class BillDetail {
    private int id;
    private Bill bill;
    private Product product;
    private int quantity;
    private BigDecimal price;

    public BillDetail(Bill bill, Product product, int quantity, BigDecimal price) {
        this.bill = bill;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public BillDetail() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}
