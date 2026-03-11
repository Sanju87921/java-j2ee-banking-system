package in.ps.bankapp.dao;

import java.util.ArrayList;

import in.ps.bankapp.dto.Transaction;

public interface TransactionDAO {
	
	public boolean insertTransaction(Transaction t);
//	insert intp values (0,?,?,?,?,?,sysdate())
	public boolean updateTransaction(Transaction t);
	//update transaction set transcation_ID=?,sender_acc=?,recvier_acc=?,amount=?,Transaction _type=?,balance=?
	public boolean deleteTransaction(int ID);
	//delete from transaction  where ID=?
	public Transaction getTransaction(int ID);
	//select * from transaction where C_ID=?
	public ArrayList<Transaction> getArrayListByCustomerAccno(long acc_no);
	//select * from transaction where ACC_NO=?;
	public ArrayList<Transaction> getArrayList();
	//select * from transaction;
	
	
}
