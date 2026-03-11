<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Safely read message
    String rawMsg = (String) request.getAttribute("message");
    if (rawMsg == null || rawMsg.trim().isEmpty()) {
        rawMsg = "Something went wrong! Please try again.";
    }

    // Escape quotes for JavaScript safety
    String safeMsg = rawMsg.replace("\"", "\\\"").replace("\'", "\\\'");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error | TrustEdge Bank</title>

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #ff512f, #dd2476);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.container {
    background: white;
    padding: 40px;
    width: 400px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    text-align: center;
}
h2 { color: #ff512f; }
p { color: #555; font-size: 16px; }
</style>

<script>
window.onload = function() {

    // Safe message
    const message = "<%= safeMsg %>";

    alert("⚠️ " + message);

    let redirectUrl = "index.jsp";

    // --- CUSTOMER RELATED ERRORS ---
    if (message.toLowerCase().includes("login")) {
        redirectUrl = "customer_login.jsp";
    }
    else if (message.toLowerCase().includes("pin") || 
             message.toLowerCase().includes("password")) {
        redirectUrl = "customer_login.jsp";
    }
    else if (message.toLowerCase().includes("register")) {
        redirectUrl = "customer_register.jsp";
    }
    else if (message.toLowerCase().includes("account")) {
        redirectUrl = "customer_dashboard.jsp";
    }
    else if (message.toLowerCase().includes("balance")) {
        redirectUrl = "fund_transfer.jsp";
    }

    // --- ADMIN ERRORS ---
    if (message.toLowerCase().includes("admin")) {
        redirectUrl = "admin_login.jsp";
    }

    setTimeout(function() {
        window.location.href = redirectUrl;
    }, 1500);
};
</script>

</head>
<body>

<div class="container">
    <h2>⚠️ Oops! Something Went Wrong</h2>
    <p><%= rawMsg %></p>
</div>

</body>
</html>
