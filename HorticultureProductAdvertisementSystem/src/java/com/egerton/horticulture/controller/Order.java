package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.OrderDAO;
import com.egerton.horticulture.data.ProductDAO;
import com.egerton.horticulture.model.OrderRequest;
import com.egerton.horticulture.model.Product;
import com.egerton.horticulture.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    // Show the order form for a specific product
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Must be logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login");
            return;
        }

        String idParam = request.getParameter("productId");
        if (idParam == null) {
            response.sendRedirect("catalog");
            return;
        }

        int productId = Integer.parseInt(idParam);
        ProductDAO productDAO = new ProductDAO();
        Product product = productDAO.getProductById(productId);

        request.setAttribute("product", product);
        request.getRequestDispatcher("/orderForm.jsp").forward(request, response);
    }

    // Handle order form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");

        int productId      = Integer.parseInt(request.getParameter("productId"));
        int quantity       = Integer.parseInt(request.getParameter("quantity"));
        String deliveryAddress = request.getParameter("deliveryAddress").trim();
        String notes       = request.getParameter("notes");

        OrderRequest order = new OrderRequest();
        order.setUserId(user.getUserId());
        order.setProductId(productId);
        order.setQuantity(quantity);
        order.setDeliveryAddress(deliveryAddress);
        order.setNotes(notes);
        order.setStatus("Pending");

        OrderDAO orderDAO = new OrderDAO();
        boolean placed = orderDAO.placeOrder(order);

        if (placed) {
            request.setAttribute("order", order);
            request.getRequestDispatcher("/orderConfirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Order could not be placed. Try again.");
            request.getRequestDispatcher("/orderForm.jsp").forward(request, response);
        }
    }
}