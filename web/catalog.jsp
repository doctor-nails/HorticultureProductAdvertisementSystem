<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<h2>Product Catalog</h2>

<div style="display:flex; flex-wrap:wrap; justify-content:center; gap:25px;">
    <c:forEach var="product" items="${products}">
        <div class="product-card">
            <img src="${product.imageUrl}" alt="${product.name}">
            <h3>${product.name}</h3>
            <p><strong>Category:</strong> ${product.category}</p>
            <p><strong>Price:</strong> KES ${product.price}</p>
            <a href="product?id=${product.id}" class="btn">View Details</a>
        </div>
    </c:forEach>
</div>

<%@ include file="footer.jsp" %>