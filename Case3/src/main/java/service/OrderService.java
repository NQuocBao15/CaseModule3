package service;

import DAO.OrderDAO;
import Model.Order;
import service.dto.OrderListResponse;
import service.dto.Page;

import javax.servlet.http.HttpServletRequest;

public class OrderService {
    private OrderDAO orderDAO;
    public OrderService(){
        orderDAO = new OrderDAO();
    }
    public Page<OrderListResponse> findAll(int page, String search) {
        return orderDAO.findAll(page,search);
    }

    public Order findById(int id) {
        return orderDAO.findById(id);
    }

    public void update(HttpServletRequest req) {
        orderDAO.update(Integer.parseInt(req.getParameter("id")),req.getParameter("status"));
    }
}
