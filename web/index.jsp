
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%-- Set page title for header --%>
<% request.setAttribute("pageTitle", "Home"); %>

<%-- Include header --%>
<jsp:include page="header.jsp" />
<!-- Hero Section with Text on Image + Animation -->
<section class="hero" style="
    background: linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)), 
                url('images/field.jpg') center/cover no-repeat;
    height: 85vh;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: white;
    position: relative;
    overflow: hidden;
">

    <div class="hero-content" style="max-width: 900px; padding: 20px; z-index: 2;">
        
        <!-- Moving / Animated Title -->
        <h1 style="
            font-size: 3.2em; 
            margin-bottom: 20px;
            animation: fadeInDown 1.2s ease forwards;
            text-shadow: 0 4px 15px rgba(0,0,0,0.6);
        ">
            Welcome to Egerton University<br>
            <span style="color: #a5d6a7;">Horticultural Department</span>
        </h1>

        <!-- Moving Subtitle -->
        <p style="
            font-size: 1.35em; 
            margin-bottom: 40px;
            animation: fadeInUp 1.5s ease forwards;
            text-shadow: 0 3px 10px rgba(0,0,0,0.7);
        ">
            Discover high-quality ornamental plants, vegetable seedlings, 
            fruit plants, and landscaping materials grown with expertise.
        </p>

        <!-- Buttons with hover animation -->
        <div style="animation: fadeInUp 1.8s ease forwards;">
            <a href="catalog" class="btn" 
               style="font-size: 1.25em; padding: 16px 40px; margin: 12px; background: #4caf50;">
                Browse Products
            </a>
            <a href="contact.jsp" class="btn" 
               style="font-size: 1.25em; padding: 16px 40px; margin: 12px; background: #ff9800;">
                Make an Inquiry
            </a>
        </div>
    </div>

    <!-- Optional subtle overlay effect -->
    <div style="position: absolute; bottom: 30px; left: 50%; transform: translateX(-50%); animation: bounce 2s infinite;">
        <i class="fas fa-chevron-down" style="font-size: 2.5em; opacity: 0.8;"></i>
    </div>
</section>

<!-- Quick Features -->
<section style="padding: 60px 20px; background: #f9fff9;">
    <h2 style="text-align: center; margin-bottom: 40px; color: #1b5e20;">Why Choose Us?</h2>
    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 25px; max-width: 1200px; margin: 0 auto;">
        <div style="background: white; padding: 25px; border-radius: 12px; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.08);">
            <div style="font-size: 3em; margin-bottom: 15px;">🌱</div>
            <h3>Premium Quality</h3>
            <p>Expertly grown seedlings with high survival rate</p>
        </div>
        <div style="background: white; padding: 25px; border-radius: 12px; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.08);">
            <div style="font-size: 3em; margin-bottom: 15px;">🎓</div>
            <h3>University Backed</h3>
            <p>Research-based and scientifically proven varieties</p>
        </div>
        <div style="background: white; padding: 25px; border-radius: 12px; text-align: center; box-shadow: 0 5px 15px rgba(0,0,0,0.08);">
            <div style="font-size: 3em; margin-bottom: 15px;">🚚</div>
            <h3>Easy Ordering</h3>
            <p>Submit request online and get quick response</p>
        </div>
    </div>
</section>

<%-- Hero Section --%>
<section class="hero">
    <div class="hero-content">
        <h1>Welcome to Egerton University<br>Horticultural Department</h1>
        <p class="hero-text">
            Discover our wide range of quality horticultural products including 
            ornamental plants, vegetable seedlings, fruit plants, and landscaping materials.
        </p>
        <div class="hero-buttons">
            <a href="${pageContext.request.contextPath}/products?action=list" 
               class="btn btn-primary">Browse Products</a>
            <a href="${pageContext.request.contextPath}/order?action=form" 
               class="btn btn-secondary">Place Order</a>
        </div>
    </div>
    <div class="hero-image">
        <img src="${pageContext.request.contextPath}/images/field.jpg" 
             alt="Beautiful garden with horticultural products">
    </div>
</section>

<%-- Features Section --%>
<section class="features">
    <h2>Why Choose Our Products?</h2>
    <div class="feature-grid">
        <div class="feature-card">
            <div class="feature-icon">🌱</div>
            <h3>Quality Seedlings</h3>
            <p>All our seedlings are carefully nurtured in optimal conditions 
            to ensure healthy growth and high survival rates.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🎓</div>
            <h3>Expert Knowledge</h3>
            <p>Backed by Egerton University's research and expertise in 
            horticultural science and sustainable agriculture.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">💰</div>
            <h3>Affordable Prices</h3>
            <p>Competitive pricing on all products with special discounts 
            for bulk orders and educational institutions.</p>
        </div>
        <div class="feature-card">
            <div class="feature-icon">🚚</div>
            <h3>Easy Ordering</h3>
            <p>Simple online ordering system. Submit your request and 
            we'll contact you for pickup or delivery arrangements.</p>
        </div>
    </div>
</section>

<%-- Product Categories Section --%>
<section class="categories">
    <h2>Our Product Categories</h2>
    <div class="category-grid">
        <a href="${pageContext.request.contextPath}/products?action=category&cat=Ornamental" 
           class="category-card">
            <div class="category-image">
                <img src="${pageContext.request.contextPath}/images/cat-ornamental.jpg" 
                     alt="Ornamental Plants">
            </div>
            <h3>Ornamental Plants</h3>
            <p>Beautiful flowers and decorative plants for your garden</p>
        </a>
        
        <a href="${pageContext.request.contextPath}/products?action=category&cat=Vegetables" 
           class="category-card">
            <div class="category-image">
                <img src="${pageContext.request.contextPath}/images/cat-vegetables.jpg" 
                     alt="Vegetable Seedlings">
            </div>
            <h3>Vegetables</h3>
            <p>High-quality vegetable seedlings for your farm</p>
        </a>
        
        <a href="${pageContext.request.contextPath}/products?action=category&cat=Fruits" 
           class="category-card">
            <div class="category-image">
                <img src="${pageContext.request.contextPath}/images/cat-fruits.jpg" 
                     alt="Fruit Plants">
            </div>
            <h3>Fruits</h3>
            <p>Fruit seedlings and plants for orchards</p>
        </a>
        
        <a href="${pageContext.request.contextPath}/products?action=category&cat=Tree%20Seedlings" 
           class="category-card">
            <div class="category-image">
                <img src="${pageContext.request.contextPath}/images/cat-trees.jpg" 
                     alt="Tree Seedlings">
            </div>
            <h3>Tree Seedlings</h3>
            <p>Timber and shade trees for afforestation</p>
        </a>
        
        <a href="${pageContext.request.contextPath}/products?action=category&cat=Landscaping" 
           class="category-card">
            <div class="category-image">
                <img src="${pageContext.request.contextPath}/images/cat-landscaping.jpg" 
                     alt="Landscaping">
            </div>
            <h3>Landscaping</h3>
            <p>Plants and materials for landscape design</p>
        </a>
    </div>
</section>

<%-- Call to Action Section --%>
<section class="cta-section">
    <div class="cta-content">
        <h2>Ready to Order?</h2>
        <p>Browse our complete catalog and place your order request today. 
        Our team will get back to you within 24 hours.</p>
        <a href="${pageContext.request.contextPath}/products?action=list" 
           class="btn btn-large btn-primary">View All Products</a>
    </div>
</section>

<%-- Include footer --%>
<jsp:include page="footer.jsp" />