package Controller;

import Model.EStatus;
import service.BillService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "billController", urlPatterns = "/bill")
public class BillController extends HttpServlet {
    private BillService billService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            default -> showList(req,resp);
            case "detail" -> showDetail(req,resp);
        }
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("bill", billService.findById(Integer.parseInt(req.getParameter("idBill")),Integer.parseInt(req.getParameter("idUser"))));
        req.getRequestDispatcher("bill/detail.jsp").forward(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if(pageString == null){
            pageString = "1";
        }
        req.setAttribute("page", billService.findAll(Integer.parseInt(pageString),req.getParameter("search")));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher("bill/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    public void init() throws ServletException {
        billService = new BillService();
    }
}
