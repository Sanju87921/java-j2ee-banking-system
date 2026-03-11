package in.ps.bankapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.bankapp.connection.Connector;
import in.ps.bankapp.dto.Account;

public class AccountDAOImpl implements accountDAO {

    private Connection con;

    public AccountDAOImpl() {
        this.con = Connector.getCon();
    }

    @Override
    public boolean insertAccount(Account a) {
        String query = "INSERT INTO account(ACC_NO, C_ID, ACC_TYPE, BALANCE, DATE, STATUS) VALUES(?,?,?,?,SYSDATE(),?)";
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, a.getACC_NO());
            ps.setInt(2, a.getC_ID());
            ps.setString(3, a.getACC_TYPE());
            ps.setDouble(4, a.getBALANCE());
            ps.setString(5, a.getSTATUS());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i > 0;
    }

    @Override
    public boolean updateAccount(Account a) {
        String query = "UPDATE account SET ACC_NO=?, C_ID=?, ACC_TYPE=?, BALANCE=?, STATUS=? WHERE ACC_ID=?";
        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, a.getACC_NO());
            ps.setInt(2, a.getC_ID());
            ps.setString(3, a.getACC_TYPE());
            ps.setDouble(4, a.getBALANCE());
            ps.setString(5, a.getSTATUS());
            ps.setInt(6, a.getACC_ID());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i > 0;
    }

    @Override
    public boolean deleteAccount(int ACC_ID) {
        String query = "DELETE FROM account WHERE ACC_ID=?";
        int i = 0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ACC_ID);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return i > 0;
    }

    @Override
    public Account getaccount(int ACC_ID) {
        Account a = null;
        String query = "SELECT * FROM account WHERE ACC_ID=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, ACC_ID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Account();
                a.setACC_ID(rs.getInt("ACC_ID"));
                a.setACC_NO(rs.getLong("ACC_NO"));
                a.setC_ID(rs.getInt("C_ID"));
                a.setACC_TYPE(rs.getString("ACC_TYPE"));
                a.setBALANCE(rs.getDouble("BALANCE"));
                a.setDate(rs.getString("DATE"));
                a.setSTATUS(rs.getString("STATUS"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return a;
    }

    @Override
    public ArrayList<Account> getaccountByCustomerId(int C_ID) {
        ArrayList<Account> list = new ArrayList<>();
        String query = "SELECT * FROM account WHERE C_ID=?";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, C_ID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setACC_ID(rs.getInt("ACC_ID"));
                a.setACC_NO(rs.getLong("ACC_NO"));
                a.setC_ID(rs.getInt("C_ID"));
                a.setACC_TYPE(rs.getString("ACC_TYPE"));
                a.setBALANCE(rs.getDouble("BALANCE"));
                a.setDate(rs.getString("DATE"));
                a.setSTATUS(rs.getString("STATUS"));
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public ArrayList<Account> getaccounts() {
        ArrayList<Account> List = new ArrayList<>();
        String query = "SELECT * FROM account";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account a = new Account();
                a.setACC_ID(rs.getInt("ACC_ID"));
                a.setACC_NO(rs.getLong("ACC_NO"));
                a.setC_ID(rs.getInt("C_ID"));
                a.setACC_TYPE(rs.getString("ACC_TYPE"));
                a.setBALANCE(rs.getDouble("BALANCE"));
                a.setDate(rs.getString("DATE"));
                a.setSTATUS(rs.getString("STATUS"));
                List.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return List;
    }

    @Override
    public Account getAccountByAccNo(long ACC_NO) {
        Account a = null;
        String query = "SELECT * FROM account WHERE ACC_NO=?";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setLong(1, ACC_NO);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                a = new Account();
                a.setACC_ID(rs.getInt("ACC_ID"));
                a.setACC_NO(rs.getLong("ACC_NO"));
                a.setC_ID(rs.getInt("C_ID"));
                a.setACC_TYPE(rs.getString("ACC_TYPE"));
                a.setBALANCE(rs.getDouble("BALANCE"));
                a.setDate(rs.getString("DATE"));
                a.setSTATUS(rs.getString("STATUS"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return a;
    }

    // ------------------------------------------------------------
    // 🚀 NEW METHOD — AUTO GENERATE ACCOUNT NUMBER
    // ------------------------------------------------------------
    public long generateAccountNumber() {
        long base = 1074202500000000L; // BankCode + Year + SequenceStart

        String query = "SELECT MAX(ACC_NO) AS maxAcc FROM account";

        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                long maxAcc = rs.getLong("maxAcc");
                if (maxAcc == 0) {
                    return base + 1;
                } else {
                    return maxAcc + 1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return base + 1;
    }
}
