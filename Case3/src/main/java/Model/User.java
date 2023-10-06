package Model;

import java.sql.Date;

public class User {
    private int id;
    private String name;
    private String phone;
    private String username;
    private String password;
    private String address;
    private Date dob;
    private EGender gender;
    private Role role;
    public User() {
    }
    public User(String name, String phone, String username, String password, String address, Date dob, EGender gender) {
        this.name = name;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
    }

    public User(String name, String phone, String username, String password, String address, Date dob, EGender gender, Role role) {
        this.name = name;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.address = address;
        this.dob = dob;
        this.gender = gender;
        this.role = role;
    }

    public User(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public User(int id) {
        this.id = id;
    }


    public User(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public EGender getGender() {
        return gender;
    }

    public void setGender(EGender gender) {
        this.gender = gender;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
