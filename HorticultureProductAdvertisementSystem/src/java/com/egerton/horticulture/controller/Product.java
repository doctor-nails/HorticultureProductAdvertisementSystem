package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.ProductDAO;
import com.egerton.horticulture.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("catalog");
            return;
        }

        try {
            int productId = Integer.parseInt(idParam);
            ProductDAO productDAO = new ProductDAO();
            Product product = productDAO.getProductById(productId);

            if (product == null) {
                request.setAttribute("errorMessage", "Product not found.");
                request.getRequestDispatcher("/catalog.jsp").forward(request, response);
                return;
            }

            request.setAttribute("product", product);
            request.getRequestDispatcher("/product.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("catalog");
        }
    }
}