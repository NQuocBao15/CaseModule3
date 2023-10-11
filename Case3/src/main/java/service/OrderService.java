package service;

import DAO.BillDAO;
import DAO.OrderDAO;
import DAO.ProductDao;
import Model.Express;
import Model.Order;
import Model.Product;
import Model.User;
import service.dto.OrderListResponse;
import service.dto.Page;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class OrderService {
    private OrderDAO orderDAO;
    private ExpressService expressService;
    private BillDAO billDAO;
    private ProductDao productDao;
    private String getCode() {
        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        int length = 10;
        StringBuilder sb = new StringBuilder();

        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            char randomChar = characters.charAt(index);
            sb.append(randomChar);
        }
        return sb.toString();
    }
    public OrderService(){
        orderDAO = new OrderDAO();
        expressService = new ExpressService();
        billDAO = new BillDAO();
        productDao = new ProductDao();
    }
    public Page<OrderListResponse> findAll(int page, String search) {
        return orderDAO.findAll(page,search);
    }
    public Page<OrderListResponse> findAll(int page, String search, int idUser){
        return orderDAO.findAll(page,search,idUser);
    }

    public Order findById(int id) {
        return orderDAO.findById(id);
    }

    public void update(HttpServletRequest req) {
        orderDAO.update(Integer.parseInt(req.getParameter("id")),req.getParameter("status"));
        LocalDate date = LocalDate.now();
    }

    public void delete(HttpServletRequest req) {
        int idOrder = Integer.parseInt(req.getParameter("id"));
        orderDAO.deleteOrderItem(idOrder);
        orderDAO.deleteOrder(idOrder);

    }

    public void create(HttpServletRequest req) {
        int customerId = Integer.parseInt(req.getParameter("customerId"));
        String customerName = req.getParameter("customerName");
        var user = new User(customerId,customerName);

        String nameReceiver = req.getParameter("nameReceiver");
        String addressReceiver = req.getParameter("addressReceiver");
        String phoneReceiver = req.getParameter("phoneReceiver");
        int expressId = Integer.parseInt(req.getParameter("express"));
        Express express = expressService.findById(expressId);

        List<Integer> productIds = Arrays.stream(req.getParameterValues("productIds")).map(Integer::parseInt).toList();
        List<String> productName = new ArrayList<>();
        List<BigDecimal> prices = new ArrayList<>();
        for(int i = 0; i< productIds.size();i++){
            Product product = productDao.findById(productIds.get(i));
            productName.add(product.getName());
            prices.add(product.getPrice());
        }
//        List<String> productName = Arrays.stream(req.getParameterValues("productName")).map(String::new).toList();
        List<Integer> quantity = Arrays.stream(req.getParameterValues("quantity")).map(Integer::parseInt).toList();
//        List<BigDecimal> price = Arrays.stream(req.getParameterValues("price")).map(BigDecimal::new).toList();
        BigDecimal total = new BigDecimal(req.getParameter("total"));
        Date createAt = new Date(System.currentTimeMillis());
        String code = getCode();

        Order order = new Order(user,createAt,nameReceiver,addressReceiver,phoneReceiver,express,code,total);
        order.setId(orderDAO.createOrder(order));
        int idBill = billDAO.createBill(order);

        for(int i = 0; i < quantity.size();i++){
            orderDAO.createOrderItems(order.getId(),productIds.get(i),quantity.get(i),prices.get(i));
            billDAO.createBillDetail(idBill,productName.get(i),quantity.get(i),prices.get(i));
        }

    }
}
