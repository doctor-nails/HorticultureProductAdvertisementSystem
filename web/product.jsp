<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="product" scope="request" class="com.egerton.horticulture.model.Product" />

<h2>${product.name}</h2>
<img src="${product.imageUrl}" alt="${product.name}" style="max-width:500px; border-radius:12px; margin:20px 0;">

<p><strong>Category:</strong> ${product.category}</p>
<p><strong>Price:</strong> KES ${product.price}</p>
<p>${product.description}</p>

<hr>
<h3>Submit Order Request</h3>
<p><strong>Note:</strong> You must be logged in to submit an order request.</p>

<a href="orderForm.jsp?id=${product.id}" class="btn">Place Order Request</a>
<a href="catalog" class="btn" style="background:#555;">← Back to Catalog</a>

<%@ include file="footer.jsp" %>