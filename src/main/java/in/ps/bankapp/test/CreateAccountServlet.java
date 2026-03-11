package in.ps.bankapp.test;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dto.Account;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            int cid = Integer.parseInt(req.getParameter("cid"));   // Customer ID
            String type = req.getParameter("acc_type");
            double balance = Double.parseDouble(req.getParameter("balance"));

            AccountDAOImpl dao = new AccountDAOImpl();

            // ⭐ GET AUTO-GENERATED ACCOUNT NUMBER
            long generatedAccNo = dao.generateAccountNumber();

            // Fill Account Object
            Account acc = new Account();
            acc.setACC_NO(generatedAccNo);
            acc.setC_ID(cid);
            acc.setACC_TYPE(type);
            acc.setBALANCE(balance);
            acc.setSTATUS("PENDING"); // Must be approved by admin

            boolean result = dao.insertAccount(acc);

            if (result) {
                req.setAttribute("message",
                     "Account Created Successfully! Your Account No: " + generatedAccNo
                );
                req.getRequestDispatcher("success.jsp").forward(req, res);
            } else {
                req.setAttribute("message", "Failed to create account.");
                req.getRequestDispatcher("error.jsp").forward(req, res);
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Server Error: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
