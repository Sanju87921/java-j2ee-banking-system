<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>SecureTrust Bank | Home</title>

<style>

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #091423, #0c2744);
    color: white;
}

/* ---------------- NAVBAR ---------------- */
.navbar {
    width: 98%;
    padding: 18px 25px;
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(6px);
    border-bottom: 1px solid rgba(255,255,255,0.15);
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
    top: 0;
    left:0;
    z-index: 1000;
}

.logo {
    font-size: 22px;
    font-weight: 600;
    color: #4db8ff;
}

.nav-links {
    display: flex;
    align-items: center;
    gap: 25px;
}

.nav-links a {
    color: #d7e4f3;
    text-decoration: none;
    font-size: 16px;
}

.btn {
    padding: 8px 18px;
    background: #1e90ff;
    border-radius: 10px;
    border: none;
    cursor: pointer;
    color: white;
    font-weight: 500;
}

.menu-icon {
    display: none;
    font-size: 28px;
    cursor: pointer;
    color: #4db8ff;
}

/* ---------------- MOBILE MENU ---------------- */
.mobile-menu {
    display: none;
    flex-direction: column;
    position: fixed;
    top: 70px;
    right: 20px;
    background: rgba(255,255,255,0.1);
    backdrop-filter: blur(10px);
    padding: 20px;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.2);
}

.mobile-menu a, .mobile-menu button {
    margin: 10px 0;
    text-align: left;
}

/* ---------------- HERO SECTION ---------------- */
.hero {
    text-align: center;
    padding: 160px 30px 120px 30px;
}

.hero h1 {
    font-size: 38px;
    margin-bottom: 15px;
}

.hero p {
    color: #d0e7ff;
    margin-bottom: 30px;
}

.btn-main {
    padding: 12px 22px;
    background: #1e90ff;
    border-radius: 10px;
    border: none;
    color: white;
    cursor: pointer;
    font-size: 17px;
}

.btn-outline {
    padding: 12px 22px;
    background: transparent;
    border: 2px solid #1e90ff;
    border-radius: 10px;
    color: #1e90ff;
    cursor: pointer;
    font-size: 17px;
    margin-left: 10px;
}

/* ---------------- SERVICE CARDS ---------------- */
.services {
    width: 90%;
    margin: auto;
    padding-bottom: 80px;
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 25px;
}

.card {
    flex: 1 1 300px;
    max-width: 320px;
    text-align: center;
    padding: 25px;
    background: rgba(255,255,255,0.08);
    border-radius: 16px;
    border: 1px solid rgba(255,255,255,0.15);
    backdrop-filter: blur(10px);
    transition: 0.3s;
}

.card:hover { transform: scale(1.05); }

.card img {
    height: 65px;
    margin-bottom: 12px;
}

.card h3 {
    margin-bottom: 8px;
    color: #4db8ff;
}

/* ---------------- RESPONSIVE ---------------- */
@media(max-width: 900px) {
    .nav-links { display: none; }
    .menu-icon { display: block; }
}

@media(max-width: 500px) {
    .hero h1 { font-size: 28px; }
}

</style>
</head>
<body>

<!-- ===================== NAVBAR ===================== -->
<div class="navbar">

    <div class="logo">🏦 SecureTrust Bank</div>

    <div class="nav-links" id="desktopMenu">
        <a href="index.jsp">Home</a>
        <a href="about.jsp">About</a>
        <a href="services.jsp">Services</a>
        <a href="contact.jsp">Contact</a>
        <button class="btn" onclick="location.href='customer_login.jsp'">Login</button>
        <button class="btn" style="background:#4db8ff" onclick="location.href='customer_register.jsp'">Register</button>
    </div>

    <div class="menu-icon" onclick="toggleMenu()">☰</div>

</div>

<!-- MOBILE MENU -->
<div class="mobile-menu" id="mobileMenu">
    <a href="index.jsp">Home</a>
    <a href="about.jsp">About</a>
    <a href="services.jsp">Services</a>
    <a href="contact.jsp">Contact</a>

    <button class="btn" onclick="location.href='customer_login.jsp'">Login</button>
    <button class="btn" style="background:#4db8ff" onclick="location.href='customer_register.jsp'">Register</button>
</div>

<!-- ===================== HERO SECTION ===================== -->
<section class="hero">
    <h1>Your Trusted Financial Partner</h1>
    <p>Secure, modern & innovative banking trusted by thousands.</p>

    <button class="btn-main" onclick="location.href='customer_register.jsp'">Open an Account</button>
    <button class="btn-outline" onclick="location.href='services.jsp'">Our Services</button>
</section>

<!-- ===================== SERVICES SECTION ===================== -->
<div class="services">

    <div class="card">
        <img src="icons/personal.png">
        <h3>Personal Banking</h3>
        <p>Savings, Loans, FD, Debit Cards & more.</p>
    </div>

    <div class="card">
        <img src="icons/business.png">
        <h3>Business Banking</h3>
        <p>Corporate Accounts & Merchant Solutions.</p>
    </div>

    <div class="card">
        <img src="icons/digital.jpg">
        <h3>Digital Banking</h3>
        <p>Bank anywhere with our mobile app.</p>
    </div>

</div>

<!-- ===================== JS ===================== -->
<script>
function toggleMenu() {
    let menu = document.getElementById("mobileMenu");
    menu.style.display = (menu.style.display === "flex") ? "none" : "flex";
}
</script>

</body>
</html>
