package in.ps.bankapp.test;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dao.TransactionDAOImpl;
import in.ps.bankapp.dto.Account;
import in.ps.bankapp.dto.Transaction;
import in.ps.bankapp.dto.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/FundTransferServlet")
public class FundTransferServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("customer") == null) {
            req.setAttribute("message", "Please login first!");
            req.getRequestDispatcher("customer_login.jsp").forward(req, res);
            return;
        }

        Customer customer = (Customer) session.getAttribute("customer");

        try {

            long senderAccNo = Long.parseLong(req.getParameter("sender_acc"));
            long receiverAccNo = Long.parseLong(req.getParameter("receiver_acc"));
            double amount = Double.parseDouble(req.getParameter("amount"));

            AccountDAOImpl accDao = new AccountDAOImpl();
            TransactionDAOImpl tranDao = new TransactionDAOImpl();

            Account sender = null, receiver = null;

            // Fetch accounts
            for (Account a : accDao.getaccounts()) {
                if (a.getACC_NO() == senderAccNo) sender = a;
                if (a.getACC_NO() == receiverAccNo) receiver = a;
            }

            // Validations
            if (sender == null || receiver == null) {
                req.setAttribute("message", "Invalid account numbers!");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            // Security Check
            if (sender.getC_ID() != customer.getC_ID()) {
                req.setAttribute("message", "Unauthorized: Not your account!");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            if (!sender.getSTATUS().equalsIgnoreCase("ACTIVE") ||
                !receiver.getSTATUS().equalsIgnoreCase("ACTIVE")) {

                req.setAttribute("message", "Both accounts must be ACTIVE!");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            // Balance Check
            if (sender.getBALANCE() < amount) {
                req.setAttribute("message", "Insufficient balance!");
                req.getRequestDispatcher("error.jsp").forward(req, res);
                return;
            }

            // Deduct & add
            sender.setBALANCE(sender.getBALANCE() - amount);
            receiver.setBALANCE(receiver.getBALANCE() + amount);

            accDao.updateAccount(sender);
            accDao.updateAccount(receiver);

            // Transaction entry
            Transaction t = new Transaction();
            t.setTRANSACTION_ID(System.currentTimeMillis());
            t.setSENDER_ACC(senderAccNo);
            t.setRECIEVER_ACC(receiverAccNo);
            t.setAMOUNT(amount);
            t.setTRANSACTION_TYPE("TRANSFER");
            t.setBALANCE(sender.getBALANCE());

            tranDao.insertTransaction(t);

            req.setAttribute("message", "₹" + amount + " transferred successfully!");
            req.getRequestDispatcher("success.jsp").forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Server error: " + e.getMessage());
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
