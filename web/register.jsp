
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>

<%-- Set page title --%>
<% request.setAttribute("pageTitle", "Register"); %>

<%-- Get data from request attributes --%>
<%
    List<String> errors = (List<String>) request.getAttribute("errors");
    String username = (String) request.getAttribute("username");
    String fullName = (String) request.getAttribute("fullName");
    String email = (String) request.getAttribute("email");
    String phone = (String) request.getAttribute("phone");
%>

<%-- Include header --%>
<jsp:include page="includes/header.jsp" />

<section class="auth-section">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <div class="auth-icon">📝</div>
                <h1>Create Account</h1>
                <p>Register to start ordering products</p>
            </div>
            
            <%-- Error Messages --%>
            <% if (errors != null && !errors.isEmpty()) { %>
                <div class="alert alert-error">
                    <strong>Please correct the following errors:</strong>
                    <ul>
                        <% for (String error : errors) { %>
                            <li><%= error %></li>
                        <% } %>
                    </ul>
                </div>
            <% } %>
            
            <%-- Registration Form --%>
            <form action="${pageContext.request.contextPath}/user" method="post" class="auth-form">
                <input type="hidden" name="action" value="create">
                
                <div class="form-group">
                    <label for="fullName">Full Name <span class="required">*</span></label>
                    <input type="text" id="fullName" name="fullName" 
                           value="<%= fullName != null ? fullName : "" %>"
                           placeholder="Enter your full name" required>
                </div>
                
                <div class="form-group">
                    <label for="username">Username <span class="required">*</span></label>
                    <input type="text" id="username" name="username" 
                           value="<%= username != null ? username : "" %>"
                           placeholder="Choose a username" required>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="password">Password <span class="required">*</span></label>
                        <input type="password" id="password" name="password" 
                               placeholder="Min 6 characters" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password <span class="required">*</span></label>
                        <input type="password" id="confirmPassword" name="confirmPassword" 
                               placeholder="Re-enter password" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address <span class="required">*</span></label>
                    <input type="email" id="email" name="email" 
                           value="<%= email != null ? email : "" %>"
                           placeholder="your@email.com" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" 
                           value="<%= phone != null ? phone : "" %>"
                           placeholder="+254 7XX XXX XXX">
                </div>
                
                <div class="form-options">
                    <label class="checkbox-label">
                        <input type="checkbox" name="agree" required>
                        I agree to the <a href="#">Terms of Service</a> and 
                        <a href="#">Privacy Policy</a>
                    </label>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block btn-large">
                    Create Account
                </button>
            </form>
            
            <div class="auth-footer">
                <p>Already have an account? 
                    <a href="${pageContext.request.contextPath}/user?action=login">
                        Sign in
                    </a>
                </p>
            </div>
        </div>
    </div>
</section>

<%-- Include footer --%>
<jsp:include page="includes/footer.jsp" />