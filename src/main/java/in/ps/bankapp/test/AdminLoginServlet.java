package in.ps.bankapp.test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import in.ps.bankapp.connection.Connector;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validation
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Email or password cannot be empty!");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        try (Connection con = Connector.getCon()) {

            // IMPORTANT: your admin is stored in customer table
            String query = "SELECT * FROM customer WHERE MAIL = ? AND PASSWORD = ? AND C_ID = 1 AND STATUS = 'ACTIVE'";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email.trim());
            ps.setInt(2, Integer.parseInt(password.trim()));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("adminName", rs.getString("F_NAME"));
                session.setAttribute("adminEmail", rs.getString("MAIL"));
                session.setAttribute("adminId", rs.getInt("C_ID"));

                System.out.println("✔ Admin Login Successful: " + email);
                response.sendRedirect("admin_dashboard.jsp");

            } else {
                // Invalid credentials
                request.setAttribute("message", "Invalid admin email or password!");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Server Error: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
