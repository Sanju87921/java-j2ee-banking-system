package in.ps.bankapp.test;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.bankapp.dao.AccountDAOImpl;
import in.ps.bankapp.dto.Account;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ManageAccountServlet")
public class ManageAccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AccountDAOImpl dao = new AccountDAOImpl();
        ArrayList<Account> accounts = dao.getaccounts();

        request.setAttribute("accounts", accounts);

        // To show success or error messages
        String msg = request.getParameter("msg");
        request.setAttribute("message", msg);

        request.getRequestDispatcher("manage_accounts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        AccountDAOImpl dao = new AccountDAOImpl();

        try {

            // DELETE
            if ("delete".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(request.getParameter("id"));
                boolean result = dao.deleteAccount(id);

                if (result) {
                    response.sendRedirect("ManageAccountServlet?msg=Account+Deleted+Successfully");
                } else {
                    response.sendRedirect("ManageAccountServlet?msg=Failed+to+Delete+Account");
                }
            }

            // APPROVE
            else if ("approve".equalsIgnoreCase(action)) {

                int id = Integer.parseInt(request.getParameter("id"));
                Account acc = dao.getaccount(id);

                if (acc != null) {

                    acc.setSTATUS("ACTIVE");
                    dao.updateAccount(acc);

                    response.sendRedirect("ManageAccountServlet?msg=Account+Approved+Successfully");

                } else {
                    response.sendRedirect("ManageAccountServlet?msg=Account+Not+Found");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ManageAccountServlet?msg=Server+Error");
        }
    }
}
