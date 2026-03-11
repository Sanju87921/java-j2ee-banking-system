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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/TransactionHistoryServlet")
public class TransactionHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Check session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("customer") == null) {
                request.setAttribute("message", "Please login first!");
                request.getRequestDispatcher("customer_login.jsp").forward(request, response);
                return;
            }

            Customer c = (Customer) session.getAttribute("customer");

            // Validate Account Number
            String accParam = request.getParameter("acc_no");
            if (accParam == null || accParam.trim().isEmpty()) {
                request.setAttribute("message", "Account number is required!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            long acc_no = Long.parseLong(accParam.trim());

            // Verify account belongs to logged-in customer
            AccountDAOImpl accountDao = new AccountDAOImpl();
            boolean belongsToCustomer = false;

            ArrayList<Account> customerAccounts = accountDao.getaccountByCustomerId(c.getC_ID());
            for (Account a : customerAccounts) {
                if (a.getACC_NO() == acc_no) {
                    belongsToCustomer = true;
                    break;
                }
            }

            if (!belongsToCustomer) {
                request.setAttribute("message", "Unauthorized action! This account does not belong to you.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Fetch transaction history using your method
            TransactionDAOImpl tdao = new TransactionDAOImpl();
            ArrayList<Transaction> list = tdao.getArrayListByCustomerAccno(acc_no);

            // Send to JSP
            request.setAttribute("transactions", list);
            request.getRequestDispatcher("transaction_history.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Unexpected Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
