package com.egerton.horticulture.controller;

import com.egerton.horticulture.data.InquiryDAO;
import com.egerton.horticulture.model.Inquiry;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {

    // Show contact/inquiry form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }

    // Handle inquiry form submission
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name    = request.getParameter("name").trim();
        String email   = request.getParameter("email").trim();
        String subject = request.getParameter("subject").trim();
        String message = request.getParameter("message").trim();

        if (name.isEmpty() || email.isEmpty() || message.isEmpty()) {
            request.setAttribute("errorMessage", "Name, email, and message are required.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
            return;
        }

        Inquiry inquiry = new Inquiry();
        inquiry.setName(name);
        inquiry.setEmail(email);
        inquiry.setSubject(subject);
        inquiry.setMessage(message);

        InquiryDAO inquiryDAO = new InquiryDAO();
        boolean saved = inquiryDAO.saveInquiry(inquiry);

        if (saved) {
            request.setAttribute("inquiry", inquiry);
            request.getRequestDispatcher("/contactConfirmation.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Could not submit your inquiry. Please try again.");
            request.getRequestDispatcher("/contact.jsp").forward(request, response);
        }
    }
}