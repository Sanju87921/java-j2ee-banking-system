<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.bankapp.dto.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile | TrustEdge Bank</title>
<style>
body {
    font-family: Poppins, sans-serif;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.box {
    background: white;
    padding: 40px;
    border-radius: 10px;
    width: 400px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}
h2 { text-align: center; color: #0072ff; }
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 8px;
    border: 1px solid #ccc;
}
button {
    width: 100%;
    padding: 10px;
    background: #0072ff;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}
button:hover { background: #0056b3; }
</style>
</head>
<body>

<%
    Customer c = (Customer) session.getAttribute("customer");
    if (c == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }
%>

<div class="box">
    <h2>Update Profile</h2>

    <form action="UpdateCustomerServlet" method="post">

        <!-- Hidden Customer ID -->
        <input type="hidden" name="cid" value="<%= c.getC_ID() %>">

        <input type="text" name="fname" value="<%= c.getF_NAME() %>" placeholder="First Name" required>
        <input type="text" name="lname" value="<%= c.getL_NAME() %>" placeholder="Last Name" required>
        <input type="number" name="phone" value="<%= c.getPHONE() %>" placeholder="Phone Number" required>
        <input type="email" name="mail" value="<%= c.getMAIL() %>" placeholder="Email" required>
        <input type="password" name="pin" value="<%= c.getPIN() %>" placeholder="PIN" required>

        <!-- Keep status same (Active / Pending / Inactive) -->
        <input type="hidden" name="status" value="<%= c.getSTATUS() %>">

        <button type="submit">Update</button>
    </form>
</div>

</body>
</html>
