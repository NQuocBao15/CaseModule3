package Model;

import java.math.BigDecimal;

public class Cart {
    private int id;
    private Product product;
    private User user;
    private int quantity;
    private BigDecimal price;

    public Cart() {
    }

    public Cart(int id, Product product, User user, int quantity, BigDecimal price) {
        this.id = id;
        this.product = product;
        this.user = user;
        this.quantity = quantity;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
