package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Customer;

public interface CustomerDAO {
	//crud operations
	public boolean inserCustomer(Customer c);
	//insert into customer values(0,?,?,?,?,?,sysdate(),?)
	public boolean updateCustomer(Customer c);
	//update customer set F_NAME=?,L_NAME=?,MAIL=?,PASSWORD=?, where C_ID=?
	public boolean deleteCustomer(int C_ID);
	//DELETE FROM CUSTOMER WHERE CID=?;
	
	public Customer getCustomer(String mail,int pin);
	//SELECT * FROM CUSTOMER WHERE CID=?;
	public ArrayList<Customer> getCustomers();	
	//SELECT * FROM CUSTOMER;
	public Customer getCustomer (int C_ID);
	//select * from Customer where C_ID=?;
	public Customer getCustomer (String mail);
	//select * from Customer where mail=?;
}
