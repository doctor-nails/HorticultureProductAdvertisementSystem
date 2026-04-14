<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>Order Request Form</h2>

<form action="order" method="post">
    <input type="hidden" name="productId" value="${param.id}">
    
    <label>Quantity</label>
    <input type="number" name="quantity" value="1" min="1" required>

    <label>Additional Details / Special Request</label>
    <textarea name="details" rows="6" placeholder="E.g., preferred delivery date, quantity in trays, etc."></textarea>

    <button type="submit" class="btn">Submit Order Request</button>
</form>

<%@ include file="footer.jsp" %>