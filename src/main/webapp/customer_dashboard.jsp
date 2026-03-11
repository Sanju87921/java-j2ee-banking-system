<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.bankapp.dto.Customer" %>

<%
    Customer c = (Customer) session.getAttribute("customer");
    if (c == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #001221);
        color: white;
        min-height: 100vh;
    }

    /* Header */
    .header {
        background: linear-gradient(135deg, #0066ff, #004b99);
        padding: 22px;
        text-align: center;
        font-size: 22px;
        font-weight: 600;
        box-shadow: 0 4px 20px rgba(0,0,0,0.4);
    }

    /* Navigation bar */
    .nav {
        display: flex;
        justify-content: center;
        gap: 25px;
        background: rgba(255,255,255,0.05);
        padding: 14px 0;
        backdrop-filter: blur(10px);
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    .nav a {
        color: #4db8ff;
        font-weight: 500;
        text-decoration: none;
        padding: 10px 18px;
        border-radius: 8px;
        transition: 0.3s;
        font-size: 15px;
    }

    .nav a:hover {
        background: rgba(77,184,255,0.2);
        color: white;
        transform: translateY(-2px);
    }

    /* Main content */
    .main {
        text-align: center;
        margin-top: 80px;
        color: #cfe8ff;
    }

    .main h3 {
        font-size: 22px;
        font-weight: 400;
        opacity: 0.9;
    }
</style>

</head>
<body>

<div class="header">
    Welcome, <%= c.getF_NAME() %>!
</div>

<div class="nav">
    <a href="ViewAccountServlet">View Accounts</a>
    <a href="create_account.jsp">Create Account</a>
    <a href="fund_transfer.jsp">Fund Transfer</a>
    <a href="ViewAccountServlet?showHistory=1">Transaction History</a>
    <a href="update_profile.jsp">Update Profile</a>
    <a href="CustomerLogoutServlet">Logout</a>
</div>

<div class="main">
    <h3>Manage your accounts and transactions easily in TrustEdge Bank.</h3>
</div>

</body>
</html>
