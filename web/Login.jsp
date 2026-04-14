
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page session="true" %>

<%-- Set page title --%>
<% request.setAttribute("pageTitle", "Login"); %>

<%-- Get data from request attributes --%>
<%
    String error = (String) request.getAttribute("error");
    String username = (String) request.getAttribute("username");
    String redirect = request.getParameter("redirect");
%>

<%-- Include header --%>
<jsp:include page="includes/header.jsp" />

<section class="auth-section">
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <div class="auth-icon">🔐</div>
                <h1>Welcome Back</h1>
                <p>Sign in to your account to continue</p>
            </div>
            
            <%-- Error Message --%>
            <% if (error != null) { %>
                <div class="alert alert-error">
                    <%= error %>
                </div>
            <% } %>
            
            <%-- Login Form --%>
            <form action="${pageContext.request.contextPath}/user" method="post" class="auth-form">
                <input type="hidden" name="action" value="authenticate">
                
                <% if (redirect != null) { %>
                    <input type="hidden" name="redirect" value="<%= redirect %>">
                <% } %>
                
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" 
                           value="<%= username != null ? username : "" %>"
                           placeholder="Enter your username" required autofocus>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Enter your password" required>
                </div>
                
                <div class="form-options">
                    <label class="checkbox-label">
                        <input type="checkbox" name="remember">
                        Remember me
                    </label>
                    <a href="#" class="forgot-link">Forgot password?</a>
                </div>
                
                <button type="submit" class="btn btn-primary btn-block btn-large">
                    Sign In
                </button>
            </form>
            
            <div class="auth-footer">
                <p>Don't have an account? 
                    <a href="${pageContext.request.contextPath}/user?action=register">
                        Create one now
                    </a>
                </p>
            </div>
            
            <%-- Demo Credentials --%>
            <div class="demo-credentials">
                <h4>Demo Accounts</h4>
                <p><strong>Admin:</strong> username: admin, password: admin123</p>
                <p><strong>Customer:</strong> username: john, password: password</p>
            </div>
        </div>
    </div>
</section>

<%-- Include footer --%>
<jsp:include page="includes/footer.jsp" />