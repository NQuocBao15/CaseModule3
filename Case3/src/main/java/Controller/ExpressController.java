package Controller;

import Model.Express;
import service.ExpressService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "expressController", urlPatterns = "/express")
public class ExpressController extends HttpServlet {
    private ExpressService expressService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            default -> showList(req,resp);
            case "create" -> showCreate(req,resp);
            case "edit" -> showUpdate(req,resp);
            case "delete" -> delete(req,resp);
        }
    }

    private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        expressService.delete(Integer.parseInt(req.getParameter("id")));
        resp.sendRedirect("/express?message=Deleted Successfully");
    }

    private void showUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("express", expressService.findById(Integer.parseInt(req.getParameter("id"))));
        req.getRequestDispatcher("express/edit.jsp").forward(req,resp);
    }

    private void showCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("message",req.getParameter("message"));
        req.getRequestDispatcher("express/create.jsp").forward(req,resp);
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pageString = req.getParameter("page");
        if (pageString == null) {
            pageString = "1";
        }
        req.setAttribute("page", expressService.findAll(Integer.parseInt(pageString),req.getParameter("search")));
        req.setAttribute("message", req.getParameter("message"));
        req.setAttribute("search", req.getParameter("search"));
        req.getRequestDispatcher("express/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create" -> create(req,resp);
            case "edit" -> edit(req,resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        expressService.update(Integer.parseInt(req.getParameter("id")),getExpressByRequest(req));
        resp.sendRedirect("/express?message=Upadted Successfuly");
    }

    private void create(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (req.getCharacterEncoding() == null) {
            req.setCharacterEncoding("UTF-8");
        }
        expressService.create(getExpressByRequest(req));
        resp.sendRedirect("/express?message=Created Successfully");
    }

    private Express getExpressByRequest(HttpServletRequest req) {
        String name = req.getParameter("name");
        return  new Express(name);

    }

    @Override
    public void init() throws ServletException {
        expressService = new ExpressService();
    }
}
