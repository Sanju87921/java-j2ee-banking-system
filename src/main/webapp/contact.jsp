<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact | SecureTrust Bank</title>

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
    margin-bottom: 25px;
    font-size: 32px;
}

.contact-box {
    display: flex;
    justify-content: space-between;
    gap: 30px;
}

.left, .right {
    width: 48%;
}

label {
    font-size: 14px;
    margin-bottom: 6px;
    display: block;
    color: #d0e7ff;
}

input, textarea {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: none;
    background: rgba(255,255,255,0.15);
    color: white;
    margin-bottom: 18px;
    font-size: 15px;
}

textarea { height: 120px; resize: none; }

button {
    width: 100%;
    padding: 12px;
    border-radius: 10px;
    border: none;
    font-size: 16px;
    cursor: pointer;
    background: #1e90ff;
    color: white;
    font-weight: 500;
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 15px rgba(77,184,255,0.4);
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
    <h1>Contact Us</h1>

    <div class="contact-box">

        <!-- LEFT INFO -->
        <div class="left">
            <p><b>Email:</b> support@securetrustbank.com</p>
            <p><b>Phone:</b> +1 800 732 8732</p>
            <p><b>Address:</b> 123 Finance Street, Metropolis, MP 12345</p>
        </div>

        <!-- RIGHT FORM -->
        <div class="right">
            <form>
                <label>Your Name</label>
                <input type="text" placeholder="Enter your name">

                <label>Your Email</label>
                <input type="email" placeholder="Enter your email">

                <label>Message</label>
                <textarea placeholder="Enter your message"></textarea>

                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>

    <a href="index.jsp" class="back-btn">← Back to Home</a>
</div>

</body>
</html>
