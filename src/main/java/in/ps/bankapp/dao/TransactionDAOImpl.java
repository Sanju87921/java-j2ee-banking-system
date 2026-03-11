package in.ps.bankapp.dao;

import java.sql.*;
import java.util.ArrayList;

import in.ps.bankapp.connection.Connector;
import in.ps.bankapp.dto.Transaction;

public class TransactionDAOImpl implements TransactionDAO {

    private Connection con;

    public TransactionDAOImpl() {
        this.con = Connector.getCon();
    }

    // -------------------------------------------------------------
    // 1. INSERT TRANSACTION
    // -------------------------------------------------------------
    @Override
    public boolean insertTransaction(Transaction t) {
        String query =
            "INSERT INTO transaction (TRANSACTION_ID, SENDER_ACC, RECIEVER_ACC, AMOUNT, TRANSACTION_TYPE, BALANCE, DATE) " +
            "VALUES (?,?,?,?,?,?,SYSDATE())";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, t.getTRANSACTION_ID());
            ps.setLong(2, t.getSENDER_ACC());
            ps.setLong(3, t.getRECIEVER_ACC());
            ps.setDouble(4, t.getAMOUNT());
            ps.setString(5, t.getTRANSACTION_TYPE());
            ps.setDouble(6, t.getBALANCE());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // -------------------------------------------------------------
    // 2. UPDATE TRANSACTION
    // -------------------------------------------------------------
    @Override
    public boolean updateTransaction(Transaction t) {

        String query =
            "UPDATE transaction SET TRANSACTION_ID=?, SENDER_ACC=?, RECIEVER_ACC=?, AMOUNT=?, " +
            "TRANSACTION_TYPE=?, BALANCE=?, DATE=SYSDATE() WHERE ID=?";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, t.getTRANSACTION_ID());
            ps.setLong(2, t.getSENDER_ACC());
            ps.setLong(3, t.getRECIEVER_ACC());
            ps.setDouble(4, t.getAMOUNT());
            ps.setString(5, t.getTRANSACTION_TYPE());
            ps.setDouble(6, t.getBALANCE());
            ps.setInt(7, t.getID());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // -------------------------------------------------------------
    // 3. DELETE TRANSACTION
    // -------------------------------------------------------------
    @Override
    public boolean deleteTransaction(int ID) {

        String query = "DELETE FROM transaction WHERE ID=?";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, ID);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // -------------------------------------------------------------
    // 4. GET SINGLE TRANSACTION
    // -------------------------------------------------------------
    @Override
    public Transaction getTransaction(int ID) {

        String query = "SELECT * FROM transaction WHERE ID=?";
        Transaction t = null;

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, ID);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                t = fillTransaction(rs);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return t;
    }

    // -------------------------------------------------------------
    // 5. GET USER TRANSACTIONS (SENDER OR RECEIVER)
    // -------------------------------------------------------------
    @Override
    public ArrayList<Transaction> getArrayListByCustomerAccno(long acc_no) {

        ArrayList<Transaction> list = new ArrayList<>();

        String query =
            "SELECT * FROM transaction WHERE SENDER_ACC=? OR RECIEVER_ACC=? ORDER BY DATE DESC";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setLong(1, acc_no);
            ps.setLong(2, acc_no);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(fillTransaction(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------------------------------------------------
    // 6. GET ALL TRANSACTIONS (ADMIN)
    // -------------------------------------------------------------
    @Override
    public ArrayList<Transaction> getArrayList() {

        ArrayList<Transaction> list = new ArrayList<>();

        String query = "SELECT * FROM transaction ORDER BY DATE DESC";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(fillTransaction(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------------------------------------------------
    // 7. FILTER BY ACCOUNT NUMBER
    // -------------------------------------------------------------
    public ArrayList<Transaction> getTransactionsByAccount(long accNo) {

        ArrayList<Transaction> list = new ArrayList<>();

        String sql = "SELECT * FROM transaction " +
                     "WHERE SENDER_ACC = ? OR RECIEVER_ACC = ? " +
                     "ORDER BY DATE DESC";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setLong(1, accNo);
            ps.setLong(2, accNo);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction t = new Transaction();
                t.setID(rs.getInt("ID"));
                t.setTRANSACTION_ID(rs.getLong("TRANSACTION_ID"));
                t.setSENDER_ACC(rs.getLong("SENDER_ACC"));
                t.setRECIEVER_ACC(rs.getLong("RECIEVER_ACC"));
                t.setAMOUNT(rs.getDouble("AMOUNT"));
                t.setTRANSACTION_TYPE(rs.getString("TRANSACTION_TYPE"));
                t.setBALANCE(rs.getDouble("BALANCE"));
                t.setDate(rs.getString("DATE"));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    // -------------------------------------------------------------
    // 8. FILTER BY TYPE (DEBIT/CREDIT/TRANSFER)
    // -------------------------------------------------------------
    public ArrayList<Transaction> getTransactionsByType(String type) {

        ArrayList<Transaction> list = new ArrayList<>();

        String query =
            "SELECT * FROM transaction WHERE TRANSACTION_TYPE=? ORDER BY DATE DESC";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, type);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(fillTransaction(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------------------------------------------------
    // 9. FILTER BY DATE RANGE
    // -------------------------------------------------------------
    public ArrayList<Transaction> getTransactionsByDate(String from, String to) {

        ArrayList<Transaction> list = new ArrayList<>();

        String query =
            "SELECT * FROM transaction WHERE DATE BETWEEN ? AND ? ORDER BY DATE DESC";

        try (PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(fillTransaction(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------------------------------------------------
    // HELPER METHOD – fills DTO object
    // -------------------------------------------------------------
    private Transaction fillTransaction(ResultSet rs) throws SQLException {

        Transaction t = new Transaction();

        t.setID(rs.getInt("ID"));
        t.setTRANSACTION_ID(rs.getLong("TRANSACTION_ID"));
        t.setSENDER_ACC(rs.getLong("SENDER_ACC"));
        t.setRECIEVER_ACC(rs.getLong("RECIEVER_ACC"));
        t.setAMOUNT(rs.getDouble("AMOUNT"));
        t.setTRANSACTION_TYPE(rs.getString("TRANSACTION_TYPE"));
        t.setBALANCE(rs.getDouble("BALANCE"));
        t.setDate(rs.getString("DATE"));

        return t;
    }
}
