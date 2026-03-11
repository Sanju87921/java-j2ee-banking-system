<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Ensure customer is logged in
    if (session.getAttribute("customer") == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fund Transfer | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .transfer-box {
        background: rgba(255, 255, 255, 0.06);
        width: 450px;
        padding: 35px;
        border-radius: 18px;
        box-shadow: 0 8px 30px rgba(0,0,0,0.5);
        backdrop-filter: blur(10px);
        animation: fadeIn 0.8s ease;
        border: 1px solid rgba(255,255,255,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 8px;
        font-weight: 600;
        color: #4db8ff;
        font-size: 26px;
    }

    p.subtitle {
        text-align: center;
        margin-bottom: 25px;
        color: #d1d1d1;
        font-size: 14px;
    }

    label {
        font-size: 15px;
        margin-bottom: 6px;
        display: block;
        color: #c7e7ff;
    }

    input, select {
        width: 100%;
        padding: 12px;
        margin-bottom: 18px;
        border-radius: 10px;
        border: none;
        outline: none;
        font-size: 15px;
        background: rgba(255,255,255,0.15);
        color: white;
    }

    input::placeholder {
        color: #bcd4e6;
    }

    button {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 10px;
        background: #1e90ff;
        color: white;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #4db8ff;
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
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

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>

<body>

<div class="transfer-box">

    <h2>💸 Fund Transfer</h2>
    <p class="subtitle">Send money securely within TrustEdge Bank</p>

    <form action="FundTransferServlet" method="post">

        <!-- Sender Account -->
        <label>Select Your Account</label>
        <select name="sender_acc" required>
            <%
                in.ps.bankapp.dto.Customer c = 
                    (in.ps.bankapp.dto.Customer) session.getAttribute("customer");

                in.ps.bankapp.dao.AccountDAOImpl dao = new in.ps.bankapp.dao.AccountDAOImpl();
                java.util.ArrayList<in.ps.bankapp.dto.Account> accList = 
                    dao.getaccountByCustomerId(c.getC_ID());

                for (in.ps.bankapp.dto.Account a : accList) {
            %>
                <option value="<%= a.getACC_NO() %>">
                    <%= a.getACC_TYPE() %> - <%= a.getACC_NO() %> (₹<%= a.getBALANCE() %>)
                </option>
            <% } %>
        </select>

        <!-- Receiver Account -->
        <label>Receiver Account Number</label>
        <input type="text" name="receiver_acc" placeholder="Enter account number" required>

        <!-- Amount -->
        <label>Amount (₹)</label>
        <input type="number" name="amount" step="0.01" min="1" placeholder="Enter amount" required>

        <button type="submit">Transfer Money</button>
    </form>

    <div class="back">
        <a href="customer_dashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>
