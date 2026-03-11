package in.ps.bankapp.test;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Customer;

@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            long phone = Long.parseLong(request.getParameter("phone"));
            String mail = request.getParameter("mail");
            int pin = Integer.parseInt(request.getParameter("pin"));

            CustomerDAOImpl dao = new CustomerDAOImpl();

            // ❗ Check Duplicate Email
            if (dao.isMailExists(mail)) {
                request.setAttribute("message", "Email already registered! Try logging in.");
                request.getRequestDispatcher("customer_register.jsp").forward(request, response);
                return;
            }

            // ❗ Check Duplicate Phone
            if (dao.isPhoneExists(phone)) {
                request.setAttribute("message", "Phone number already registered!");
                request.getRequestDispatcher("customer_register.jsp").forward(request, response);
                return;
            }

            // ✔ Create customer object
            Customer c = new Customer();
            c.setF_NAME(fname);
            c.setL_NAME(lname);
            c.setPHONE(phone);
            c.setMAIL(mail);
            c.setPIN(pin);
            c.setSTATUS("PENDING");  // Customer must wait for ADMIN approval

            boolean result = dao.inserCustomer(c);

            if (result) {
                // SUCCESS → go to login page (NOT admin)
                request.setAttribute("message", "Registration successful! Please login after admin approval.");
                request.getRequestDispatcher("customer_login.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Registration failed! Please try again.");
                request.getRequestDispatcher("customer_register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server Error: " + e.getMessage());
            request.getRequestDispatcher("customer_register.jsp").forward(request, response);
        }
    }
}
