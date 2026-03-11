<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, in.ps.bankapp.dto.Transaction" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Transactions | Admin</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        color: white;
        padding: 40px;
    }

    .card {
        width: 95%;
        margin: auto;
        padding: 35px;
        background: rgba(255,255,255,0.08);
        border-radius: 16px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.12);
        box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    }

    h2 {
        text-align: center;
        color: #4db8ff;
        margin-bottom: 25px;
        font-size: 26px;
    }

    .filters input, .filters select, .filters button {
        padding: 10px;
        margin: 5px;
        border-radius: 8px;
        border: none;
        outline: none;
    }

    .filters button {
        background: #4db8ff;
        cursor: pointer;
        color: white;
    }

    .filters button:hover { opacity: 0.85; }

    table {
        width: 100%;
        border-collapse: collapse;
        color: white;
        margin-top: 20px;
    }

    th {
        background: #1e90ff;
        padding: 12px;
    }

    td {
        padding: 12px;
        background: rgba(255,255,255,0.05);
        border-bottom: 1px solid rgba(255,255,255,0.15);
        text-align: center;
    }
</style>
</head>

<body>
<div class="card">
    <h2>All Transactions</h2>

    <div class="filters">
        <form method="get" action="ViewAllTransactionsServlet">

            <input type="text" name="acc" placeholder="Account No">

            <select name="type">
                <option value="">Select Type</option>
                <option value="DEBIT">DEBIT</option>
                <option value="CREDIT">CREDIT</option>
                <option value="TRANSFER">TRANSFER</option>
            </select>

            From: <input type="date" name="from">
            To:   <input type="date" name="to">

            <button type="submit">Apply</button>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Transaction ID</th>
            <th>Sender Account</th>
            <th>Receiver Account</th>
            <th>Amount (₹)</th>
            <th>Type</th>
            <th>Balance (₹)</th>
            <th>Date</th>
        </tr>

        <%
            ArrayList<Transaction> list =
                (ArrayList<Transaction>) request.getAttribute("transactions");

            if (list != null && !list.isEmpty()) {
                for (Transaction t : list) {
        %>

        <tr>
            <td><%= t.getID() %></td>
            <td><%= t.getTRANSACTION_ID() %></td>
            <td><%= t.getSENDER_ACC() %></td>
            <td><%= t.getRECIEVER_ACC() %></td>
            <td>₹<%= t.getAMOUNT() %></td>
            <td><%= t.getTRANSACTION_TYPE() %></td>
            <td>₹<%= t.getBALANCE() %></td>
            <td><%= t.getDate() %></td>
        </tr>

        <% } } else { %>

        <tr><td colspan="8">No transactions available.</td></tr>

        <% } %>
    </table>
</div>

</body>
</html>
