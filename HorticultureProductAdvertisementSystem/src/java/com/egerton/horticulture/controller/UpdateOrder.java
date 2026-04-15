package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/updateOrder")
public class UpdateOrderServlet extends HttpServlet {

    // Admin updates an order's status (POST only)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Admin-only guard
        HttpSession session = request.getSession(false);
        if (session == null || !"admin".equalsIgnoreCase((String) session.getAttribute("userRole"))) {
            response.sendRedirect("login");
            return;
        }

        String idParam = request.getParameter("orderId");
        String newStatus = request.getParameter("status");

        if (idParam == null || newStatus == null || newStatus.isEmpty()) {
            response.sendRedirect("admin");
            return;
        }

        int orderId = Integer.parseInt(idParam);
        OrderDAO orderDAO = new OrderDAO();
        orderDAO.updateOrderStatus(orderId, newStatus);

        // Back to admin dashboard
        response.sendRedirect("admin");
    }
}