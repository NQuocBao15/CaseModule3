package Model;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class Bill {
    private int id;
    private User user;
    private Date createAt;
    private String nameReceiver;
    private String phoneReceiver;
    private String addressReceiver;
    private String expressName;
    private String code;
    private BigDecimal Total;
    private List<BillDetail> billDetails;

    public Bill(User user, Date createAt, String nameReceiver, String phoneReceiver, String addressReceiver, String expressName, String code, BigDecimal total) {
        this.user = user;
        this.createAt = createAt;
        this.nameReceiver = nameReceiver;
        this.phoneReceiver = phoneReceiver;
        this.addressReceiver = addressReceiver;
        this.expressName = expressName;
        this.code = code;
        Total = total;
    }

    public Bill() {
    }

    public String getAddressReceiver() {
        return addressReceiver;
    }

    public void setAddressReceiver(String addressReceiver) {
        this.addressReceiver = addressReceiver;
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

    public String getPhoneReceiver() {
        return phoneReceiver;
    }

    public void setPhoneReceiver(String phoneReceiver) {
        this.phoneReceiver = phoneReceiver;
    }

    public String getExpressName() {
        return expressName;
    }

    public void setExpressName(String expressName) {
        this.expressName = expressName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public BigDecimal getTotal() {
        return Total;
    }

    public void setTotal(BigDecimal total) {
        Total = total;
    }

    public List<BillDetail> getBillDetails() {
        return billDetails;
    }

    public void setBillDetails(List<BillDetail> billDetails) {
        this.billDetails = billDetails;
    }
}
