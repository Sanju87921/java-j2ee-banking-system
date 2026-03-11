package in.ps.bankapp.test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SuccessServlet")
public class SuccessServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Check if message already exists (set by another servlet)
        Object msgAttr = request.getAttribute("message");
        String message = null;

        if (msgAttr != null) {
            message = msgAttr.toString();
        } else {
            // Otherwise check URL parameter
            message = request.getParameter("message");
        }

        // Default message
        if (message == null || message.trim().isEmpty()) {
            message = "Operation completed successfully!";
        }

        // Send message to JSP
        request.setAttribute("message", message);
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
