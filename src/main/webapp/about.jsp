<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About | SecureTrust Bank</title>

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
    width: 70%;
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

p {
    font-size: 16px;
    color: #d7e4f3;
    line-height: 1.6;
    margin-bottom: 15px;
}

.back-btn {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #4db8ff;
    text-decoration: none;
    font-size: 15px;
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
    <h1>About SecureTrust Bank</h1>

    <p>
        Founded in 1985, SecureTrust Bank has been serving customers with 
        innovation and integrity for over three decades. We started as a small 
        community bank and evolved into a trusted financial institution.
    </p>

    <p>
        Our mission is simple — to provide secure, accessible, and modern 
        digital banking solutions that help customers meet their financial goals.
        We focus on transparency, trust, and customer-first service.
    </p>

    <p>
        With over 200+ branches and a rapidly growing digital ecosystem, 
        SecureTrust Bank continues to expand while maintaining the personal 
        touch that our customers value.
    </p>

    <a href="index.jsp" class="back-btn">← Back to Home</a>
</div>

</body>
</html>
