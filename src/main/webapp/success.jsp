<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Operation Successful | TrustEdge Bank</title>
<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #56ab2f, #a8e063);
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
h2 {
    color: #56ab2f;
}
p {
    color: #444;
    font-size: 16px;
}
</style>

<script>
    window.onload = function() {

        // FIXED: safely load JSP message into JS
        const message = `<%= (request.getAttribute("message") != null)
                            ? request.getAttribute("message")
                            : "Operation Successful!" 
                        %>`;

        // Popup
        alert(message);

        // Default redirect
        let redirectUrl = "customer_dashboard.jsp";

        if (message.toLowerCase().includes("register")) {
            redirectUrl = "customer_login.jsp";
        } 
        else if (message.toLowerCase().includes("admin")) {
            redirectUrl = "admin_dashboard.jsp";
        } 
        else if (message.toLowerCase().includes("logout")) {
            redirectUrl = "index.jsp";
        } 
        else if (message.toLowerCase().includes("account")) {
            redirectUrl = "customer_dashboard.jsp";
        }

        // Auto redirect after 1.5 seconds
        setTimeout(function() {
            window.location.href = redirectUrl;
        }, 1500);
    };
</script>
</head>

<body>
<div class="container">
    <h2>✅ Operation Successful</h2>
    <p>
        <%= (request.getAttribute("message") != null)
            ? request.getAttribute("message")
            : "Your operation has been successfully completed." 
        %>
    </p>
</div>
</body>
</html>
