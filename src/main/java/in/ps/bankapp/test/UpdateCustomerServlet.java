package in.ps.bankapp.test;

import java.io.IOException;

import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int cid = Integer.parseInt(request.getParameter("cid"));

            CustomerDAOImpl dao = new CustomerDAOImpl();
            Customer c = dao.getCustomer(cid); // Fetch existing record

            if (c == null) {
                request.setAttribute("message", "Customer not found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Update fields
            c.setF_NAME(request.getParameter("fname"));
            c.setL_NAME(request.getParameter("lname"));
            c.setPHONE(Long.parseLong(request.getParameter("phone")));
            c.setMAIL(request.getParameter("mail"));
            c.setPIN(Integer.parseInt(request.getParameter("pin")));
            c.setSTATUS(request.getParameter("status").toUpperCase()); // ACTIVE/INACTIVE/PENDING

            boolean result = dao.updateCustomer(c);

            if (result) {
                request.setAttribute("message", "Customer profile updated successfully!");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Profile update failed!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
