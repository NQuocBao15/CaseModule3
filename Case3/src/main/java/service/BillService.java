package service;

import DAO.BillDAO;
import Model.Bill;
import service.dto.BillListResponse;
import service.dto.OrderListResponse;
import service.dto.Page;

public class BillService {
    private BillDAO billDAO;
    public BillService(){
        billDAO = new BillDAO();
    }
    public Page<BillListResponse> findAll(int page, String search) {
        return billDAO.findAll(page,search);
    }

    public Bill findById(int idBill, int idUser) {
        return billDAO.findById(idBill,idUser);
    }
}
