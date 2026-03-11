<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, in.ps.bankapp.dto.Transaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction History | TrustEdge Bank</title>

<style>
body {
    margin: 0;
    font-family: Poppins, sans-serif;
    background: linear-gradient(135deg, #0a1a2f, #0f2740, #14395c);
    color: white;
}

.container {
    width: 85%;
    margin: 40px auto;
    background: rgba(255,255,255,0.08);
    padding: 30px;
    border-radius: 16px;
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 22px rgba(0,0,0,0.4);
}

h2 {
    text-align: center;
    color: #4db8ff;
    margin-bottom: 20px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

th {
    background: #1e90ff;
    padding: 12px;
    color: white;
    font-size: 15px;
}

td {
    padding: 10px;
    text-align: center;
    color: #e6f2ff;
}

tr:nth-child(even) {
    background: rgba(255,255,255,0.06);
}

tr:hover {
    background: rgba(255,255,255,0.18);
    transition: 0.25s;
}

.debit {
    color: #ff5252;
    font-weight: bold;
}

.credit {
    color: #00e676;
    font-weight: bold;
}

.no-data {
    color: #ccc;
    padding: 15px;
    text-align: center;
}
</style>

</head>
<body>

<div class="container">

    <h2>📜 Transaction History</h2>

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
            ArrayList<Transaction> transactions =
                (ArrayList<Transaction>) request.getAttribute("transactions");

            if (transactions != null && !transactions.isEmpty()) {
                for (Transaction t : transactions) {

                    boolean isDebit = t.getTRANSACTION_TYPE().equalsIgnoreCase("DEBIT");
        %>

        <tr>
            <td><%= t.getID() %></td>
            <td><%= t.getTRANSACTION_ID() %></td>
            <td><%= t.getSENDER_ACC() %></td>
            <td><%= t.getRECIEVER_ACC() %></td>

            <td class="<%= isDebit ? "debit" : "credit" %>">
                ₹<%= t.getAMOUNT() %>
            </td>

            <td><%= t.getTRANSACTION_TYPE() %></td>
            <td>₹<%= t.getBALANCE() %></td>
            <td><%= t.getDate() %></td>
        </tr>

        <% 
                }
            } else { 
        %>

        <tr>
            <td colspan="8" class="no-data">No transactions found.</td>
        </tr>

        <% } %>

    </table>
</div>

</body>
</html>
