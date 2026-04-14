
    </main><%-- End of main-content from header.jsp --%>
    
    <%-- Footer Section --%>
    <footer class="footer">
        <div class="footer-container">
            <%-- About Column --%>
            <div class="footer-section">
                <h4>About Us</h4>
                <p>The Horticultural Department at Egerton University produces 
                high-quality plants, seeds, and horticultural products for 
                farmers, gardeners, and landscaping professionals.</p>
            </div>
            
            <%-- Quick Links Column --%>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                    <li><a href="${pageContext.request.contextPath}/products?action=list">Products</a></li>
                    <li><a href="${pageContext.request.contextPath}/order?action=form">Place Order</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact">Contact Us</a></li>
                </ul>
            </div>
            
            <%-- Contact Info Column --%>
            <div class="footer-section">
                <h4>Contact Information</h4>
                <p>
                    <strong>Egerton University</strong><br>
                    Horticultural Department<br>
                    P.O. Box 536-20115<br>
                    Egerton, Kenya<br><br>
                    <strong>Phone:</strong> +254-51-2217891<br>
                    <strong>Email:</strong> horticulture@egerton.ac.ke
                </p>
            </div>
            
            <%-- Hours Column --%>
            <div class="footer-section">
                <h4>Business Hours</h4>
                <p>
                    Monday - Friday: 8:00 AM - 5:00 PM<br>
                    Saturday: 8:00 AM - 1:00 PM<br>
                    Sunday: Closed
                </p>
            </div>
        </div>
        
        <%-- Copyright Bar --%>
        <div class="footer-bottom">
            <p>&copy; <%= new java.util.Date().getYear() + 1900 %> 
            Egerton University Horticultural Department. All rights reserved.</p>
            <p>Developed as a Java Servlets & JSP Project</p>
        </div>
    </footer>
    
</body>
</html>