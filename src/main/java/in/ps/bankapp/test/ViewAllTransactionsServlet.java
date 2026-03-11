package in.ps.bankapp.test;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.bankapp.dao.TransactionDAOImpl;
import in.ps.bankapp.dto.Transaction;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ViewAllTransactionServlet")
public class ViewAllTransactionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            TransactionDAOImpl dao = new TransactionDAOImpl();
            ArrayList<Transaction> list = dao.getArrayList();   // <-- this uses your DAO correctly

            req.setAttribute("transactions", list);
            req.getRequestDispatcher("view_all_transactions.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Unable to load transactions!");
            req.getRequestDispatcher("error.jsp").forward(req, resp);
        }
    }
}
