package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.InquiryDAO;
import com.egerton.horticulture.data.OrderDAO;
import com.egerton.horticulture.data.ProductDAO;
import com.egerton.horticulture.data.UserDAO;
import com.egerton.horticulture.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
   @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
            response.sendRedirect("login");
            return;
        }
        OrderDAO   orderDAO   = new OrderDAO();
        UserDAO    userDAO    = new UserDAO();
        ProductDAO productDAO = new ProductDAO();
        InquiryDAO inquiryDAO = new InquiryDAO();

        List<OrderRequest> allOrders   = orderDAO.getAllOrders();
        List<User>         allUsers    = userDAO.getAllUsers();
        List<Product>      allProducts = productDAO.getAllProducts();
        List<Inquiry>      allInquiries = inquiryDAO.getAllInquiries();

        request.setAttribute("allOrders",    allOrders);
        request.setAttribute("allUsers",     allUsers);
        request.setAttribute("allProducts",  allProducts);
        request.setAttribute("allInquiries", allInquiries);
        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}