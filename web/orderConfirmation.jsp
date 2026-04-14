
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="com.horticultural.beans.OrderRequest" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%-- Get order from session --%>
<%
    OrderRequest order = (OrderRequest) request.getAttribute("order");
    SimpleDateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy 'at' HH:mm");
%>

<%-- Set page title --%>
<% request.setAttribute("pageTitle", "Order Confirmation"); %>

<%-- Include header --%>
<jsp:include page="includes/header.jsp" />

<% if (order != null) { %>
    <section class="confirmation-section">
        <div class="confirmation-card">
            <%-- Success Icon --%>
            <div class="success-icon">✓</div>
            
            <h1>Order Submitted Successfully!</h1>
            <p class="confirmation-message">
                Thank you for your order. We have received your request and will 
                contact you shortly to confirm the details.
            </p>
            
            <%-- Order Details --%>
            <div class="order-summary">
                <h2>Order Summary</h2>
                
                <div class="order-detail-row">
                    <span class="label">Order Number:</span>
                    <span class="value order-number">#<%= order.getOrderId() %></span>
                </div>
                
                <div class="order-detail-row">
                    <span class="label">Order Date:</span>
                    <span class="value"><%= dateFormat.format(order.getOrderDate()) %></span>
                </div>
                
                <div class="order-detail-row">
                    <span class="label">Customer Name:</span>
                    <span class="value"><%= order.getCustomerName() %></span>
                </div>
                
                <div class="order-detail-row">
                    <span class="label">Email:</span>
                    <span class="value"><%= order.getEmail() %></span>
                </div>
                
                <div class="order-detail-row">
                    <span class="label">Phone:</span>
                    <span class="value"><%= order.getPhone() %></span>
                </div>
                
                <% if (order.getProductName() != null && !order.getProductName().isEmpty()) { %>
                    <div class="order-detail-row">
                        <span class="label">Product:</span>
                        <span class="value"><%= order.getProductName() %></span>
                    </div>
                <% } %>
                
                <div class="order-detail-row">
                    <span class="label">Quantity:</span>
                    <span class="value"><%= order.getQuantity() %></span>
                </div>
                
                <div class="order-detail-row">
                    <span class="label">Delivery Address:</span>
                    <span class="value"><%= order.getDeliveryAddress() %></span>
                </div>
                
                <% if (order.getAdditionalNotes() != null && !order.getAdditionalNotes().isEmpty()) { %>
                    <div class="order-detail-row">
                        <span class="label">Notes:</span>
                        <span class="value"><%= order.getAdditionalNotes() %></span>
                    </div>
                <% } %>
                
                <div class="order-detail-row status-row">
                    <span class="label">Status:</span>
                    <span class="value status-pending"><%= order.getStatus() %></span>
                </div>
            </div>
            
            <%-- Next Steps --%>
            <div class="next-steps">
                <h3>What happens next?</h3>
                <ol>
                    <li>Our team will review your order request</li>
                    <li>We will contact you within 24-48 hours</li>
                    <li>Order confirmation and payment arrangements</li>
                    <li>Pickup or delivery of your products</li>
                </ol>
            </div>
            
            <%-- Action Buttons --%>
            <div class="confirmation-actions">
                <a href="${pageContext.request.contextPath}/products?action=list" 
                   class="btn btn-primary">Continue Shopping</a>
                <a href="${pageContext.request.contextPath}/index.jsp" 
                   class="btn btn-secondary">Back to Home</a>
            </div>
        </div>
    </section>
<% } else { %>
    <%-- No Order Found --%>
    <section class="not-found">
        <div class="not-found-content">
            <div class="not-found-icon">📭</div>
            <h1>No Order Found</h1>
            <p>We couldn't find your order information.</p>
            <a href="${pageContext.request.contextPath}/order?action=form" 
               class="btn btn-primary">Place an Order</a>
        </div>
    </section>
<% } %>

<%-- Include footer --%>
<jsp:include page="includes/footer.jsp" />