<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #071524, #0c2239);
        color: white;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dashboard-box {
        width: 480px;
        padding: 40px;
        background: rgba(255,255,255,0.08);
        border-radius: 20px;
        backdrop-filter: blur(10px);
        box-shadow: 0 8px 30px rgba(0,0,0,0.4);
        text-align: center;
        animation: fadeIn 0.7s ease-out;
    }

    h2 {
        margin-top: 0;
        font-size: 30px;
        font-weight: 600;
    }

    p {
        color: #9fc5e8;
        margin-bottom: 30px;
    }

    /* NEW BUTTON DESIGN */
    .btn {
        width: 100%;
        padding: 14px;
        margin: 12px 0;
        border: none;
        border-radius: 50px; /* Rounded pill shape */
        font-size: 17px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.3s ease-in-out;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        letter-spacing: 0.5px;
    }

    .btn-blue {
        background: #007bff;
        color: white;
        box-shadow: 0 3px 12px rgba(0,123,255,0.35);
    }

    .btn-blue:hover {
        background: #2494ff;
        transform: translateY(-4px);
        box-shadow: 0 6px 20px rgba(36,148,255,0.45);
    }

    .btn-red {
        background: #d9534f;
        color: white;
        box-shadow: 0 3px 12px rgba(217,83,79,0.35);
    }

    .btn-red:hover {
        background: #ff6b67;
        transform: translateY(-4px);
        box-shadow: 0 6px 20px rgba(255,107,103,0.45);
    }

    .btn i {
        font-size: 18px;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to   { opacity: 1; transform: translateY(0); }
    }
</style>

</head>
<body>

<%
    String name = "";
    if (session.getAttribute("customer") != null) {
        in.ps.bankapp.dto.Customer c = (in.ps.bankapp.dto.Customer) session.getAttribute("customer");
        name = c.getF_NAME();
    }
%>

<div class="dashboard-box">
    <h2>Welcome, <%= name %></h2>
    <p>Admin Control Panel</p>

    <button class="btn btn-blue" onclick="location.href='ManageCustomerServlet'">
        👤 Manage Customers
    </button>

    <button class="btn btn-blue" onclick="location.href='ManageAccountServlet'">
        🏦 Manage Accounts
    </button>

    <button class="btn btn-blue"  onclick="location.href='ViewAllTransactionServlet'">
        📄 View All Transactions
    </button>

    <button class="btn btn-red" onclick="location.href='CustomerLogoutServlet'">
        🔒 Logout
    </button>
</div>

</body>
</html>
