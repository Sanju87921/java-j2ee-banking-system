<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.bankapp.dto.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Customer</title>

<style>
body {
    background: #0f172a;
    font-family: 'Poppins', sans-serif;
    display: flex;
    justify-content: center;
    padding-top: 60px;
}

.card {
    width: 420px;
    background: #1e293b;
    padding: 25px;
    border-radius: 12px;
    color: white;
    box-shadow: 0 0 15px rgba(0,0,0,0.4);
}

h2 {
    text-align: center;
    margin-bottom: 10px;
    color: #38bdf8;
}

.label {
    font-size: 14px;
    margin-top: 10px;
    color: #94a3b8;
}

.value {
    font-size: 17px;
    font-weight: 500;
    margin-bottom: 10px;
}

.back-btn {
    margin-top: 15px;
    width: 100%;
    padding: 10px;
    border: none;
    background: #38bdf8;
    color: black;
    border-radius: 8px;
    font-size: 16px;
    cursor: pointer;
}

.back-btn:hover {
    background: #0ea5e9;
}
</style>
</head>
<body>

<%
Customer c = (Customer) request.getAttribute("customer");
%>

<div class="card">
    <h2>Customer Details</h2>

    <div class="label">Name</div>
    <div class="value"><%= c.getF_NAME() %> <%= c.getL_NAME() %></div>

    <div class="label">Email</div>
    <div class="value"><%= c.getMAIL() %></div>

    <div class="label">Phone</div>
    <div class="value"><%= c.getPHONE() %></div>

    <div class="label">Status</div>
    <div class="value"><%= c.getSTATUS() %></div>

    <button class="back-btn" onclick="location.href='ManageCustomerServlet'">← Back</button>
</div>

</body>
</html>
