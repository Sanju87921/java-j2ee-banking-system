<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, in.ps.bankapp.dto.Customer" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Customers | Admin</title>

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
        border-radius: 16px;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.12);
        box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        animation: fadeIn 0.7s;
    }

    h2 {
        text-align: center;
        color: #4db8ff;
        margin-bottom: 25px;
        font-size: 26px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        color: white;
    }

    th {
        background: #1e90ff;
        padding: 14px;
        font-size: 15px;
    }

    td {
        padding: 14px;
        background: rgba(255,255,255,0.05);
        border-bottom: 1px solid rgba(255,255,255,0.15);
        text-align: center;
    }

    .btn {
        padding: 6px 12px;
        border-radius: 8px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        margin: 3px;
    }

    .delete { background: #ff4d4d; }
    .activate { background: #1e90ff; }
    .view { background: #4db8ff; }

    .btn:hover { opacity: 0.85; }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>

</head>

<body>
<div class="card">
    <h2>Manage Customers</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Mail</th>
            <th>Phone</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>

        <%
            ArrayList<Customer> list = (ArrayList<Customer>) request.getAttribute("customers");
            if (list != null) {
                for (Customer c : list) {
        %>

        <tr>
            <td><%= c.getC_ID() %></td>
            <td><%= c.getF_NAME() %> <%= c.getL_NAME() %></td>
            <td><%= c.getMAIL() %></td>
            <td><%= c.getPHONE() %></td>
            <td><%= c.getSTATUS() %></td>

            <td>
                <form action="ManageCustomerServlet" method="post" style="display:inline;">
                    <input type="hidden" name="cid" value="<%= c.getC_ID() %>">
                    <input type="hidden" name="action" value="delete">
                    <button class="btn delete">Delete</button>
                </form>

                <form action="ManageCustomerServlet" method="post" style="display:inline;">
                    <input type="hidden" name="cid" value="<%= c.getC_ID() %>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="status" value="ACTIVE">
                    <button class="btn activate">Activate</button>
                </form>

                <a href="ViewCustomerServlet?cid=<%= c.getC_ID() %>">
                    <button class="btn view">View</button>
                </a>
            </td>
        </tr>

        <% } } %>
    </table>
</div>
</body>
</html>
