package Model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class Order {
    private int id;
    private User user;
    private Date createAt;
    private String nameReceiver;
    private String addressReceiver;
    private String phoneReceiver;
    private Express express;
    private String code;
    private BigDecimal total;
    private EStatus status;
    private List<OrderItem> orderItems;

    public Order(User user, Date createAt, String nameReceiver, String addressReceiver, String phoneReceiver, Express express, String code, BigDecimal total, EStatus status) {
        this.user = user;
        this.createAt = createAt;
        this.nameReceiver = nameReceiver;
        this.addressReceiver = addressReceiver;
        this.phoneReceiver = phoneReceiver;
        this.express = express;
        this.code = code;
        this.total = total;
        this.status = status;
    }

    public Order(User user, Date createAt, String nameReceiver, String addressReceiver, String phoneReceiver, Express express, String code, BigDecimal total) {
        this.user = user;
        this.createAt = createAt;
        this.nameReceiver = nameReceiver;
        this.addressReceiver = addressReceiver;
        this.phoneReceiver = phoneReceiver;
        this.express = express;
        this.code = code;
        this.total = total;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getNameReceiver() {
        return nameReceiver;
    }

    public void setNameReceiver(String nameReceiver) {
        this.nameReceiver = nameReceiver;
    }

    public String getAddressReceiver() {
        return addressReceiver;
    }

    public void setAddressReceiver(String addressReceiver) {
        this.addressReceiver = addressReceiver;
    }

    public String getPhoneReceiver() {
        return phoneReceiver;
    }

    public void setPhoneReceiver(String phoneReceiver) {
        this.phoneReceiver = phoneReceiver;
    }

    public Express getExpress() {
        return express;
    }

    public void setExpress(Express express) {
        this.express = express;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public EStatus getStatus() {
        return status;
    }

    public void setStatus(EStatus status) {
        this.status = status;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }
}
