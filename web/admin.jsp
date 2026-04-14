<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<h2>Admin Reports - Orders & Inquiries</h2>

<h3>Order Requests</h3>
<table>
    <tr><th>ID</th><th>Product ID</th><th>Quantity</th><th>Status</th><th>Details</th></tr>
    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.id}</td>
            <td>${order.productId}</td>
            <td>${order.quantity}</td>
            <td>${order.status}</td>
            <td>${order.requestDetails}</td>
        </tr>
    </c:forEach>
</table>

<h3>Inquiries</h3>
<table>
    <tr><th>Name</th><th>Subject</th><th>Message</th><th>Date</th></tr>
    <c:forEach var="inq" items="${inquiries}">
        <tr>
            <td>${inq.name}</td>
            <td>${inq.subject}</td>
            <td>${inq.message}</td>
            <td>${inq.inquiryDate}</td>
        </tr>
    </c:forEach>
</table>

<%@ include file="footer.jsp" %>