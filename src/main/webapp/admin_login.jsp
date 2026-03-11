<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login | PS Bank</title>

<style>

/* UNIVERSAL THEME COLORS */
:root {
    --primary-blue: #007bff;
    --hover-blue: #1a8cff;
    --dark-bg: #0a1a2a;
    --glass-bg: rgba(255,255,255,0.06);
    --card-border: rgba(255,255,255,0.1);
}

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: var(--dark-bg);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    color: #fff;
}

.login-box {
    width: 380px;
    padding: 40px 35px;
    background: var(--glass-bg);
    border-radius: 16px;
    border: 1px solid var(--card-border);
    backdrop-filter: blur(12px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
    animation: fadeIn 0.6s ease-out;
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: #ffffff;
    font-weight: 600;
}

input {
    width: 100%;
    padding: 12px;
    margin: 12px 0;
    border-radius: 10px;
    border: none;
    background: rgba(255,255,255,0.12);
    color: #fff;
    font-size: 15px;
}

input::placeholder {
    color: #cfd4d8;
}

button {
    width: 100%;
    padding: 12px;
    background: var(--primary-blue);
    color: white;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 500;
    transition: 0.3s;
}

button:hover {
    background: var(--hover-blue);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(26, 140, 255, 0.4);
}

.error {
    color: #ff4b4b;
    text-align: center;
    margin-bottom: 12px;
    font-weight: 600;
}

a {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: var(--primary-blue);
    text-decoration: none;
    font-size: 14px;
}

a:hover { 
    color: var(--hover-blue);
    text-decoration: underline; 
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(25px); }
    to   { opacity: 1; transform: translateY(0); }
}

</style>

</head>
<body>

<div class="login-box">
    <h2>Admin Login</h2>

    <!-- Error message -->
    <%
        String msg = (String) request.getAttribute("message");
        if (msg != null) {
    %>
        <div class="error"><%= msg %></div>
    <% } %>

    <form action="AdminLoginServlet" method="post">
        <input type="email" name="email" placeholder="Enter Email" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
    </form>

    <a href="index.jsp">← Back to Home</a>
</div>

</body>
</html>
