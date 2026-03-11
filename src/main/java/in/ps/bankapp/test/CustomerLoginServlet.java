package in.ps.bankapp.test;

import java.io.IOException;

import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Customer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String mail = request.getParameter("mail");
            String pinStr = request.getParameter("pin");

            // Basic validation
            if (mail == null || pinStr == null || mail.trim().isEmpty() || pinStr.trim().isEmpty()) {
                request.setAttribute("message", "Email or PIN cannot be empty!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            int pin = Integer.parseInt(pinStr.trim());

            CustomerDAOImpl dao = new CustomerDAOImpl();
            Customer c = dao.getCustomer(mail, pin);

            if (c == null) {
                request.setAttribute("message", "Invalid email or password!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Status Check
            if (!c.getSTATUS().equalsIgnoreCase("ACTIVE")) {
                request.setAttribute("message", "Your account is not active. Contact admin!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Login success
            HttpSession session = request.getSession();
            session.setAttribute("customer", c);

            // Admin check (your project rule)
            if (c.getC_ID() == 1) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("customer_dashboard.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
