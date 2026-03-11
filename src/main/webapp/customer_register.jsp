<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Registration | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .register-box {
        width: 420px;
        padding: 35px;
        background: rgba(255, 255, 255, 0.08);
        border-radius: 18px;
        box-shadow: 0 8px 28px rgba(0,0,0,0.45);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.12);
        animation: fadeIn 0.8s ease-out;
    }

    h2 {
        text-align: center;
        margin-bottom: 15px;
        color: #4db8ff;
        font-size: 26px;
        font-weight: 600;
    }

    label {
        display: block;
        margin-top: 12px;
        font-size: 15px;
        color: #cfe8ff;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-top: 5px;
        border-radius: 10px;
        border: none;
        outline: none;
        background: rgba(255, 255, 255, 0.15);
        color: white;
        font-size: 15px;
    }

    input::placeholder {
        color: #bdd4e6;
    }

    .btn {
        width: 100%;
        margin-top: 22px;
        background: #1e90ff;
        padding: 12px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        font-weight: 500;
        color: white;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn:hover {
        background: #4db8ff;
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
    }

    .footer-link {
        text-align: center;
        margin-top: 15px;
        color: #d8eaff;
    }

    .footer-link a {
        color: #4db8ff;
        text-decoration: none;
        font-weight: 500;
    }

    .footer-link a:hover {
        text-decoration: underline;
    }

    .message {
        background: rgba(255, 0, 0, 0.15);
        padding: 8px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 10px;
        color: #ff6b6b;
        font-weight: bold;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

</head>
<body>

<%
    if (session.getAttribute("customer") != null) {
        response.sendRedirect("customer_dashboard.jsp");
        return;
    }

    String msg = (String) request.getAttribute("message");
%>

<div class="register-box">

    <h2>Customer Registration</h2>

    <% if (msg != null) { %>
        <div class="message"><%= msg %></div>
    <% } %>

    <form action="CustomerRegisterServlet" method="post">

        <label>First Name</label>
        <input type="text" name="fname" placeholder="Enter first name" required>

        <label>Last Name</label>
        <input type="text" name="lname" placeholder="Enter last name" required>

        <label>Phone Number</label>
        <input type="number" name="phone" placeholder="Enter phone number" required>

        <label>Email</label>
        <input type="email" name="mail" placeholder="Enter email" required>

        <label>PIN (4-digit)</label>
        <input type="password" name="pin" minlength="4" maxlength="4" placeholder="Enter 4-digit PIN" required>

        <button type="submit" class="btn">Register</button>
    </form>

    <div class="footer-link">
        Already have an account? <a href="customer_login.jsp">Login</a>
    </div>

</div>

</body>
</html>
