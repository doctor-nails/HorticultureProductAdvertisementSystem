package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.ProductDAO;
import com.egerton.horticulture.model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/catalog")
public class CatalogServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String category = request.getParameter("category");
        ProductDAO productDAO = new ProductDAO();
        List<Product> products;

        if (category != null && !category.isEmpty()) {
            products = productDAO.getProductsByCategory(category);
            request.setAttribute("selectedCategory", category);
        } else {
            products = productDAO.getAllProducts();
        }

        request.setAttribute("products", products);
        request.getRequestDispatcher("/catalog.jsp").forward(request, response);
     
    }
}