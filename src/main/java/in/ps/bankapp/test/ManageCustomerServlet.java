package in.ps.bankapp.test;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageCustomerServlet")
public class ManageCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CustomerDAOImpl dao = new CustomerDAOImpl();
        ArrayList<Customer> customers = dao.getCustomers(); // Correct DAO method

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("manage_customers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        CustomerDAOImpl dao = new CustomerDAOImpl();

        if ("delete".equalsIgnoreCase(action)) {

            int cid = Integer.parseInt(request.getParameter("cid"));
            boolean result = dao.deleteCustomer(cid);

            if (result) {
                request.setAttribute("message", "Customer deleted successfully!");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Failed to delete customer!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        }

        else if ("update".equalsIgnoreCase(action)) {

            int cid = Integer.parseInt(request.getParameter("cid"));
            String status = request.getParameter("status").toUpperCase(); // ACTIVE / INACTIVE / PENDING

            // Fetch actual customer first
            Customer c = dao.getCustomer(cid);

            if (c == null) {
                request.setAttribute("message", "Customer not found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            // Update only status, keep other fields same
            c.setSTATUS(status);

            boolean result = dao.updateCustomer(c);

            if (result) {
                request.setAttribute("message", "Customer status updated successfully!");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "Customer update failed!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        }
    }
}
