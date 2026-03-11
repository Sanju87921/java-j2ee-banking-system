package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Account;

public interface accountDAO {
	
	public boolean insertAccount(Account a);
	//INSERT INTO ACCOUNT VALUES(0,?,?,?,?,SYSDATE());
	public boolean updateAccount(Account a);
	//UPDATE ACCOUNT SET ACC_TYPE=?,BALANCE=? WHERE CID=?;
	public boolean deleteAccount(int ACC_ID);
	//DELETE FROM ACCOUNT WHERE ACC_ID=?;
	public Account getaccount(int ACC_ID);
	//SELECT * FROM ACCOUNT WHERE ACC_ID=?;
	public ArrayList<Account> getaccountByCustomerId(int C_ID);
	//SELECT * FROM ACCOUNT WHERE CID = ?;
	public ArrayList<Account> getaccounts();
	//SELECT * FROM ACCOUNT WHERE CID=?;
	public Account getAccountByAccNo(long ACC_NO);
	// SELECT * FROM account WHERE ACC_NO=?;

}
