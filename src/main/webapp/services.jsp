<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Services | SecureTrust Bank</title>

<style>

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #0a1628, #0c2744);
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    color: white;
}

.container {
    width: 80%;
    padding: 40px;
    background: rgba(255,255,255,0.08);
    border-radius: 16px;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.15);
    box-shadow: 0 8px 30px rgba(0,0,0,0.5);
    animation: fadeIn 0.8s ease;
}

h1 {
    text-align: center;
    color: #4db8ff;
    margin-bottom: 20px;
    font-size: 32px;
}

.subtitle {
    text-align: center;
    color: #d0e7ff;
    margin-bottom: 35px;
    font-size: 16px;
}

.services {
    display: flex;
    justify-content: space-between;
    gap: 25px;
}

.card {
    width: 30%;
    padding: 25px;
    background: rgba(255,255,255,0.1);
    border-radius: 12px;
    backdrop-filter: blur(8px);
    border: 1px solid rgba(255,255,255,0.15);
    text-align: center;
    transition: 0.3s;
}

.card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0,0,0,0.4);
}

.card img {
    height: 70px;
    margin-bottom: 15px;
}

.card h3 {
    margin-bottom: 10px;
    color: #4db8ff;
}

.card p {
    color: #d7e4f3;
    font-size: 14px;
}

.back-btn {
    display: block;
    text-align: center;
    margin-top: 25px;
    color: #4db8ff;
    text-decoration: none;
}
.back-btn:hover { text-decoration: underline; }

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

</style>
</head>
<body>

<div class="container">

    <h1>Our Banking Services</h1>
    <p class="subtitle">Choose the service that fits your financial needs</p>

    <div class="services">

        <!-- PERSONAL BANKING -->
        <div class="card">
            <img src="icons/personal.png" alt="">
            <h3>Personal Banking</h3>
            <p>Manage your finances with savings, FD, loans, debit cards & secure accounts.</p>
        </div>

        <!-- BUSINESS BANKING -->
        <div class="card">
            <img src="icons/business.png" alt="">
            <h3>Business Banking</h3>
            <p>Grow your business with merchant tools, corporate accounts, & business loans.</p>
        </div>

        <!-- DIGITAL BANKING -->
        <div class="card">
            <img src="icons/digital.jpg" alt="">
            <h3>Digital Banking</h3>
            <p>Bank from anywhere with our mobile app, UPI, IMPS, NEFT & internet banking.</p>
        </div>

    </div>

    <a class="back-btn" href="index.jsp">← Back to Home</a>
</div>

</body>
</html>
