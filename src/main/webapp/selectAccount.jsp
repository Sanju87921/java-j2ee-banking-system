<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Account Type | TrustEdge Bank</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #0a1a2a, #0d3358);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
    }

    .wrapper {
        width: 450px;
        padding: 35px;
        border-radius: 18px;
        background: rgba(255, 255, 255, 0.06);
        box-shadow: 0 8px 30px rgba(0,0,0,0.5);
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255,255,255,0.1);
        animation: fadeIn 0.8s ease-out;
    }

    .form-header {
        text-align: center;
        margin-bottom: 25px;
    }

    .bank-icon {
        font-size: 45px;
        margin-bottom: 8px;
    }

    h2 {
        font-size: 26px;
        margin: 0;
        font-weight: 600;
        color: #4db8ff;
    }

    p {
        margin: 5px 0;
        font-size: 15px;
        color: #cfe8ff;
    }

    .subtitle {
        font-size: 13px;
        color: #aacce6;
    }

    .input-box label {
        display: block;
        margin-bottom: 6px;
        color: #d5eaff;
        font-size: 14px;
    }

    .input-box input,
    .input-box select {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 10px;
        margin-bottom: 18px;
        background: rgba(255, 255, 255, 0.15);
        color: white;
        font-size: 15px;
        outline: none;
    }

    .input-box input::placeholder {
        color: #bcd4e6;
    }

    .account-grid {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 12px;
        margin-top: 15px;
        margin-bottom: 25px;
    }

    .account-option {
        text-align: center;
        padding: 15px;
        background: rgba(255,255,255,0.10);
        border-radius: 12px;
        border: 1px solid rgba(255,255,255,0.15);
        cursor: pointer;
        transition: 0.3s;
    }

    .account-option:hover {
        transform: scale(1.05);
        background: rgba(255,255,255,0.17);
        box-shadow: 0 4px 12px rgba(77,184,255,0.3);
    }

    .account-option img {
        width: 45px;
        margin-bottom: 8px;
    }

    .btn-row {
        display: flex;
        gap: 10px;
    }

    .btn-primary {
        flex: 1;
        padding: 12px;
        border: none;
        border-radius: 10px;
        background: #1e90ff;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn-primary:hover {
        background: #4db8ff;
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
    }

    .btn-outline {
        flex: 1;
        padding: 12px;
        border-radius: 10px;
        font-size: 16px;
        background: transparent;
        border: 1px solid #4db8ff;
        color: #4db8ff;
        cursor: pointer;
        transition: 0.3s;
    }

    .btn-outline:hover {
        background: #4db8ff;
        color: #00325c;
        transform: scale(1.05);
        box-shadow: 0 4px 15px rgba(77,184,255,0.4);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>

</head>
<body>

    <div class="wrapper">
        <div class="form-header">
            <div class="bank-icon">🏦</div>
            <h2>TrustEdge Bank</h2>
            <p>Select Your Account Type</p>
            <span class="subtitle">Choose the account that best fits your financial needs</span>
        </div>

        <form action="checkAccount" method="post">

            <div class="input-box">
                <label>Email Address</label>
                <input type="email" name="email" placeholder="Enter your email address" required>
            </div>

            <div class="input-box">
                <label>Account Type</label>
                <select name="accountType" required>
                    <option value="">Select Account Type</option>
                    <option value="Savings">Savings</option>
                    <option value="Current">Current</option>
                    <option value="Fixed Deposit">Fixed Deposit</option>
                    <option value="Loan">Loan</option>
                </select>
            </div>

            <div class="account-grid">
                <div class="account-option">
                    <img src="icons/savings.png" alt="Savings">
                    <span>Savings</span>
                </div>
                <div class="account-option">
                    <img src="icons/current.png" alt="Current">
                    <span>Current</span>
                </div>
                <div class="account-option">
                    <img src="icons/fixed.png" alt="Fixed Deposit">
                    <span>Fixed Deposit</span>
                </div>
                <div class="account-option">
                    <img src="icons/loan.png" alt="Loan">
                    <span>Loan</span>
                </div>
            </div>

            <div class="btn-row">
                <button type="submit" class="btn-primary">Check Account</button>
                <button type="button" class="btn-outline" onclick="window.location.href='index.jsp'">Back to Home</button>
            </div>

        </form>
    </div>

</body>
</html>
