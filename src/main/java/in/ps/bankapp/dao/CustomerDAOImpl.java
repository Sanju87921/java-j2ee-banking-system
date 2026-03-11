package in.ps.bankapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import in.ps.bankapp.connection.Connector;
import in.ps.bankapp.dto.Customer;

public class CustomerDAOImpl implements CustomerDAO {

	private Connection con;
	
	 public CustomerDAOImpl() {
		this.con=Connector.getCon();
	}
	
	 @Override
	 public boolean inserCustomer(Customer c) {
	     String query = "INSERT INTO customer(F_NAME, L_NAME, PHONE, MAIL, PASSWORD, DATE, STATUS) VALUES(?,?,?,?,?,SYSDATE(),?)";
	     int i = 0;

	     try {
	         PreparedStatement ps = con.prepareStatement(query);
	         ps.setString(1, c.getF_NAME());
	         ps.setString(2, c.getL_NAME());
	         ps.setLong(3, c.getPHONE());
	         ps.setString(4, c.getMAIL());
	         ps.setInt(5, c.getPIN());
	         ps.setString(6, c.getSTATUS());
	         i = ps.executeUpdate();
	     } catch (SQLException e) {
	         e.printStackTrace();
	     }
	     return i > 0;
	 }


	@Override
	public boolean updateCustomer(Customer c) {
		// TODO Auto-generated method stub
		String query="update customer set F_NAME=?,L_NAME=?,PHONE=?,MAIL=?,PASSWORD=?,STATUS=? where C_ID=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1, c.getF_NAME());
			ps.setString(2,c.getL_NAME());
			ps.setLong(3,c.getPHONE());
			ps.setString(4,c.getMAIL());
			ps.setInt(5,c.getPIN());
			ps.setString(6,c.getSTATUS());
			ps.setInt(7,c.getC_ID());
			i=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}if(i>0) {
			return true;
		}else {
			
			return false;
		}
	}

	@Override
	public boolean deleteCustomer(int C_ID) {
		// TODO Auto-generated method stub
		String query ="delete from customer where C_ID=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setInt(1,C_ID);
			i=	ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}if(i>0) {
			return true;
		}else {
			return false;	
		}
		
	}

	@Override
	public Customer getCustomer(String mail, int pin) {
	    Customer c = null;
	    String query = "SELECT * FROM customer WHERE MAIL=? AND PASSWORD=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setString(1, mail);
	        ps.setInt(2, pin);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            c = new Customer();
	            c.setC_ID(rs.getInt("C_ID"));
	            c.setF_NAME(rs.getString("F_NAME"));
	            c.setL_NAME(rs.getString("L_NAME"));
	            c.setPHONE(rs.getLong("PHONE"));
	            c.setMAIL(rs.getString("MAIL"));
	            c.setPIN(rs.getInt("PASSWORD"));
	            c.setDATE(rs.getString("DATE"));
	            c.setSTATUS(rs.getString("STATUS"));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return c;
	}

	@Override
	public ArrayList<Customer> getCustomers() {
		ArrayList<Customer> List=new ArrayList<>();
		Customer c=null;
		String query="select * from Customer";
		
		try {
			PreparedStatement ps=con.prepareStatement(query);
			
			ResultSet rs =	ps.executeQuery();
			
		while(rs.next()) {
			c=new Customer();
			c.setC_ID(rs.getInt("C_ID"));	
			c.setF_NAME(rs.getString("F_NAME"));
			c.setL_NAME(rs.getString("L_NAME"));
			c.setPHONE(rs.getLong("phone"));
			c.setMAIL(rs.getString("mail"));
			c.setPIN(rs.getInt("password"));
			c.setDATE(rs.getString("DATE"));
			c.setSTATUS(rs.getString("STATUS"));
			List.add(c);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return List;
	}

	@Override
	public Customer getCustomer(String mail) {
		// TODO Auto-generated method stub
		String query="select * from Customer where mail=?";
		Customer c=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);;
			ResultSet rs =	ps.executeQuery();
			
		while(rs.next()) {
			c=new Customer();
			c.setC_ID(rs.getInt("C_ID"));	
			c.setF_NAME(rs.getString("F_NAME"));
			c.setL_NAME(rs.getString("L_NAME"));
			c.setPHONE(rs.getLong("phone"));
			c.setMAIL(rs.getString("mail"));
			c.setPIN(rs.getInt("password"));
			c.setDATE(rs.getString("DATE"));
			c.setSTATUS(rs.getString("STATUS"));
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
		
	}

	@Override
	public Customer getCustomer(int C_ID) {
		// TODO Auto-generated method stub
		String query="select * from Customer where C_ID=?";
		Customer c=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, C_ID);
			ResultSet rs =	ps.executeQuery();
			
		while(rs.next()) {
			c=new Customer();
			c.setC_ID(rs.getInt("C_ID"));	
			c.setF_NAME(rs.getString("F_NAME"));
			c.setL_NAME(rs.getString("L_NAME"));
			c.setPHONE(rs.getLong("phone"));
			c.setMAIL(rs.getString("mail"));
			c.setPIN(rs.getInt("password"));
			c.setDATE(rs.getString("DATE"));
			c.setSTATUS(rs.getString("STATUS"));
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return c;
	}
	public boolean isMailExists(String mail) {
	    String q = "SELECT MAIL FROM customer WHERE MAIL=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(q);
	        ps.setString(1, mail);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) { e.printStackTrace(); }
	    return false;
	}

	public boolean isPhoneExists(long phone) {
	    String q = "SELECT PHONE FROM customer WHERE PHONE=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(q);
	        ps.setLong(1, phone);
	        ResultSet rs = ps.executeQuery();
	        return rs.next();
	    } catch (Exception e) { e.printStackTrace(); }
	    return false;
	}


}
