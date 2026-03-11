<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Login | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .login-box {
        width: 380px;
        background: rgba(255, 255, 255, 0.08);
        padding: 40px;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.45);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.12);
        animation: fadeIn 0.8s ease-out;
    }

    h2 {
        text-align: center;
        margin-bottom: 10px;
        color: #4db8ff;
        font-size: 26px;
        font-weight: 600;
    }

    input {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        border-radius: 10px;
        border: none;
        outline: none;
        background: rgba(255,255,255,0.15);
        color: white;
        font-size: 15px;
    }

    input::placeholder {
        color: #c9d9e8;
    }

    button {
        width: 100%;
        padding: 12px;
        margin-top: 10px;
        border: none;
        border-radius: 10px;
        background: #1e90ff;
        color: white;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #4db8ff;
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
    }

    .error {
        background: rgba(255, 0, 0, 0.15);
        padding: 8px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 10px;
        color: #ff6b6b;
        font-weight: bold;
    }

    .register-text {
        text-align: center;
        margin-top: 15px;
        color: #cfe8ff;
    }

    .register-text a {
        color: #4db8ff;
        text-decoration: none;
        font-weight: 500;
    }

    .register-text a:hover {
        text-decoration: underline;
    }

    /* Checkbox Row */
    .checkbox-row {
        display: flex;
        align-items: center;
        margin-top: 8px;
        gap: 8px;
        color: #d0e7ff;
        font-size: 14px;
    }

    .checkbox-row input {
        width: 18px;
        height: 18px;
        margin: 0;
        cursor: pointer;
        accent-color: #1e90ff;
        background: transparent !important;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

<script>
    function goToAdmin() {
        let chk = document.getElementById("adminCheck");
        if (chk.checked) {
            window.location.href = "admin_login.jsp";
        }
    }
</script>

</head>
<body>

<%
    if (session.getAttribute("customer") != null) {
        response.sendRedirect("customer_dashboard.jsp");
        return;
    }

    String msg = (String) request.getAttribute("message");
%>

<div class="login-box">

    <h2>Customer Login</h2>

    <% if (msg != null) { %>
        <div class="error"><%= msg %></div>
    <% } %>

    <form action="CustomerLoginServlet" method="post">

        <input type="email" name="mail" placeholder="Enter Email" required>

        <input type="password" name="pin" placeholder="Enter PIN" required>

        <!-- Admin Checkbox -->
        <div class="checkbox-row">
            <input type="checkbox" id="adminCheck" onclick="goToAdmin()">
            <label for="adminCheck">Are you an Admin?</label>
        </div>

        <button type="submit">Login</button>
    </form>

    <p class="register-text">
        Don't have an account? 
        <a href="customer_register.jsp">Register</a>
    </p>

</div>

</body>
</html>
