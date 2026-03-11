<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, in.ps.bankapp.dto.Account" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Accounts | Admin</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        color: white;
        padding: 40px;
    }

    .card {
        width: 90%;
        margin: auto;
        padding: 35px;
        background: rgba(255,255,255,0.08);
        border-radius: 18px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.15);
        box-shadow: 0 8px 30px rgba(0,0,0,0.5);
        animation: fadeIn 0.8s ease;
    }

    h2 {
        text-align: center;
        color: #4db8ff;
        margin-bottom: 25px;
        font-size: 28px;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
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
        font-size: 14px;
        color: #e3f1ff;
        background: rgba(255,255,255,0.05);
        border-bottom: 1px solid rgba(255,255,255,0.15);
    }

    tr:hover {
        background: rgba(255,255,255,0.08);
        transition: 0.3s;
    }

    /* Buttons */
    .btn {
        padding: 7px 14px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        font-weight: 500;
        margin: 3px;
        transition: 0.3s;
        color: white;
    }

    .approve {
        background: linear-gradient(135deg, #1e90ff, #1773d1);
    }

    .approve:hover {
        background: linear-gradient(135deg, #4db8ff, #1e90ff);
        transform: scale(1.05);
    }

    .delete {
        background: linear-gradient(135deg, #ff4d4d, #cc0000);
    }

    .delete:hover {
        background: linear-gradient(135deg, #ff6b6b, #ff2e2e);
        transform: scale(1.05);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

</style>
</head>

<body>

<div class="card">
    <h2>Manage Accounts</h2>

    <table>
        <tr>
            <th>Account ID</th>
            <th>Account No</th>
            <th>Customer ID</th>
            <th>Type</th>
            <th>Balance (₹)</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            ArrayList<Account> list = (ArrayList<Account>) request.getAttribute("accounts");

            if (list != null && !list.isEmpty()) {
                for (Account a : list) {
        %>

        <tr>
            <td><%= a.getACC_ID() %></td>
            <td><%= a.getACC_NO() %></td>
            <td><%= a.getC_ID() %></td>
            <td><%= a.getACC_TYPE() %></td>
            <td>₹<%= a.getBALANCE() %></td>
            <td><%= a.getSTATUS() %></td>

            <td>

                <!-- APPROVE BUTTON -->
                <form action="ManageAccountServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="approve">
                    <input type="hidden" name="id" value="<%= a.getACC_ID() %>">
                    <button type="submit" class="btn approve">Approve</button>
                </form>

                <!-- DELETE BUTTON -->
                <form action="ManageAccountServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= a.getACC_ID() %>">
                    <button type="submit" class="btn delete">Delete</button>
                </form>

            </td>
        </tr>

        <% 
                }
            } else {
        %>

        <tr>
            <td colspan="7" style="padding:15px; color:#ccc;">No accounts found.</td>
        </tr>

        <% } %>

    </table>

</div>

</body>
</html>
