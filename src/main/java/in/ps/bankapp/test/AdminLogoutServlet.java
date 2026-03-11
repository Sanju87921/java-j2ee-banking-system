package in.ps.bankapp.test;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ❌ Do NOT create a session if not exists
        HttpSession session = request.getSession(false);

        if (session != null) {
            session.invalidate();
        }

        // Message to show on success.jsp
        request.setAttribute("message", "Admin logged out successfully!");

        // Forward to success page
        request.getRequestDispatcher("success.jsp").forward(request, response);
    }
}
