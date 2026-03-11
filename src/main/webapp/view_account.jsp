<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, in.ps.bankapp.dto.Account" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Accounts | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        color: white;
        padding: 40px;
    }

    .container {
        width: 90%;
        margin: auto;
        padding: 35px;
        background: rgba(255, 255, 255, 0.08);
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.5);
        backdrop-filter: blur(10px);
        animation: fadeIn 0.7s ease;
        border: 1px solid rgba(255,255,255,0.12);
    }

    h2 {
        text-align: center;
        color: #4db8ff;
        margin-bottom: 20px;
        font-size: 26px;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px;
    }

    th {
        background: #1e90ff;
        padding: 14px;
        font-size: 15px;
        color: white;
        border-bottom: 2px solid #4db8ff;
    }

    td {
        padding: 12px;
        text-align: center;
        background: rgba(255,255,255,0.07);
        border-bottom: 1px solid rgba(255,255,255,0.15);
        font-size: 14px;
        color: #dbeaff;
    }

    tr:hover {
        background: rgba(255,255,255,0.15);
        transition: 0.3s;
    }

    .status-active {
        color: #00e676;
        font-weight: bold;
    }

    .status-pending {
        color: #ffea00;
        font-weight: bold;
    }

    .status-closed {
        color: #ff5252;
        font-weight: bold;
    }

    .back {
        margin-top: 20px;
        text-align: center;
    }

    .back a {
        color: #4db8ff;
        text-decoration: none;
        font-size: 15px;
    }

    .back a:hover {
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

</head>
<body>

<div class="container">
    <h2>💼 Your Accounts</h2>

    <table>
        <tr>
            <th>Account ID</th>
            <th>Account No</th>
            <th>Type</th>
            <th>Balance (₹)</th>
            <th>Status</th>
            <th>Date Created</th>
        </tr>

        <%
            ArrayList<Account> accounts = (ArrayList<Account>) request.getAttribute("accounts");

            if (accounts != null && !accounts.isEmpty()) {
                for (Account a : accounts) {
                    String statusClass = "status-" + a.getSTATUS().toLowerCase();
        %>

        <tr>
            <td><%= a.getACC_ID() %></td>
            <td><%= a.getACC_NO() %></td>
            <td><%= a.getACC_TYPE() %></td>
            <td>₹<%= a.getBALANCE() %></td>
            <td class="<%= statusClass %>"><%= a.getSTATUS() %></td>
            <td><%= a.getDate() %></td>
        </tr>

        <%
                }
            } else {
        %>

        <tr>
            <td colspan="6" style="padding: 15px; color:#ccc;">No accounts found.</td>
        </tr>

        <% } %>

    </table>

    <div class="back">
        <a href="customer_dashboard.jsp">← Back to Dashboard</a>
    </div>

</div>

</body>
</html>
