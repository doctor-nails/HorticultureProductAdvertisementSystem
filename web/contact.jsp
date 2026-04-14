<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Contact / Inquiry</h2>
<p>Anyone can submit an inquiry to the Horticultural Department (no login required).</p>

<form action="contact" method="post">
    <label>Your Name</label>
    <input type="text" name="name" required>

    <label>Email Address</label>
    <input type="email" name="email" required>

    <label>Subject</label>
    <input type="text" name="subject" required>

    <label>Your Message / Inquiry</label>
    <textarea name="message" rows="7" required></textarea>

    <button type="submit" class="btn">Send Inquiry</button>
</form>

<%@ include file="footer.jsp" %>