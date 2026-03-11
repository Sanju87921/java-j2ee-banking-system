package in.ps.bankapp.test;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import in.ps.bankapp.dao.CustomerDAOImpl;
import in.ps.bankapp.dto.Customer;

@WebServlet("/ViewCustomerServlet")   // MUST MATCH THE URL EXACTLY
public class ViewCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int cid = Integer.parseInt(request.getParameter("cid"));

            CustomerDAOImpl dao = new CustomerDAOImpl();
            Customer c = dao.getCustomer(cid);

            if (c == null) {
                request.setAttribute("message", "Customer Not Found!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                return;
            }

            request.setAttribute("customer", c);
            request.getRequestDispatcher("view_customer.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
