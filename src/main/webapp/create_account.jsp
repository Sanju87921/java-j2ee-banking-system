<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.bankapp.dto.Customer" %>
<%@ page import="in.ps.bankapp.dao.AccountDAOImpl" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account | TrustEdge Bank</title>

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

    .form-box {
        width: 420px;
        padding: 35px;
        background: rgba(255,255,255,0.08);
        border-radius: 16px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.15);
        box-shadow: 0 8px 30px rgba(0,0,0,0.5);
        animation: fadeIn 0.8s ease;
    }

    h2 {
        text-align: center;
        margin-bottom: 15px;
        color: #4db8ff;
        font-size: 26px;
        font-weight: 600;
    }

    label {
        font-size: 14px;
        color: #d0e7ff;
    }

    input, select {
        width: 100%;
        padding: 12px;
        margin-top: 6px;
        margin-bottom: 18px;
        border-radius: 10px;
        border: none;
        outline: none;
        background: rgba(255,255,255,0.15);
        color: white;
        font-size: 15px;
    }

    input[readonly] {
        background: rgba(255,255,255,0.25);
        cursor: not-allowed;
    }

    input::placeholder {
        color: #bcd4e6;
    }

    button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        font-size: 16px;
        cursor: pointer;
        font-weight: 500;
        background: linear-gradient(135deg, #1e90ff, #0066ff);
        color: white;
        transition: 0.3s;
    }

    button:hover {
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    .back {
        text-align: center;
        margin-top: 12px;
    }

    .back a {
        color: #4db8ff;
        text-decoration: none;
        font-size: 14px;
    }

    .back a:hover {
        text-decoration: underline;
    }
</style>
</head>

<body>

<%
    Customer c = (Customer) session.getAttribute("customer");
    if (c == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    // Generate account number
    AccountDAOImpl dao = new AccountDAOImpl();
    long autoAccNo = dao.generateAccountNumber();
%>

<div class="form-box">
    <h2>➕ Create New Account</h2>

    <form action="CreateAccountServlet" method="post">

        <!-- Customer ID -->
        <input type="hidden" name="cid" value="<%= c.getC_ID() %>">

        <!-- Hidden actual number sent to servlet -->
        <input type="hidden" name="acc_no" value="<%= autoAccNo %>">

        <!-- Display only (read-only) -->
        <label>Account Number</label>
        <input type="text" value="<%= autoAccNo %>" readonly>

        <!-- Account Type -->
        <label>Account Type</label>
        <select name="acc_type" required>
            <option value="">-- Select Account Type --</option>
            <option value="SAVING">Saving</option>
            <option value="CURRENT">Current</option>
            <option value="FD">Fixed Deposit</option>
            <option value="LOAN">Loan</option>
        </select>

        <!-- Initial Balance -->
        <label>Initial Balance (₹)</label>
        <input type="number" step="0.01" name="balance" placeholder="Enter Initial Amount" required>

        <button type="submit">Create Account</button>
    </form>

    <div class="back">
        <a href="customer_dashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>
