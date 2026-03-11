package in.ps.bankapp.test;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dto.Account;
import in.ps.bankapp.dto.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ViewAccountServlet")
public class ViewAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // If session expired or not logged in
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("customer_login.jsp");
            return;
        }

        // Logged-in customer
        Customer customer = (Customer) session.getAttribute("customer");

        // Fetch accounts belonging to this customer
        AccountDAOImpl dao = new AccountDAOImpl();
        ArrayList<Account> accounts = dao.getaccountByCustomerId(customer.getC_ID());

        // Set to JSP
        request.setAttribute("accounts", accounts);

        // Load UI page
        request.getRequestDispatcher("view_account.jsp").forward(request, response);
    }
}
