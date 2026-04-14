<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Horticultural Department - Egerton University</title>
    <link rel="stylesheet" href="Styles.css">
    
    <!-- Font Awesome for icons (optional but nice) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    

</head>
<body>
    <header>
        <h1>Horticultural Products Advertisement &amp; Request System</h1>
        <nav>
            <a href="home" class="nav-link">🏠 Home</a>
            <a href="catalog" class="nav-link">📦 Product Catalog</a>
            <a href="contact.jsp" class="nav-link">✉️ Contact / Inquiry</a>
            
            <% if (session.getAttribute("user") != null) { %>
                <a href="admin" class="nav-link">📊 Admin Reports</a>
                <a href="logout" class="nav-link">🚪 Logout</a>
            <% } else { %>
                <a href="login.jsp" class="nav-link">🔑 Login / Register</a>
            <% } %>
        </nav>
    </header>
        <div class="container">