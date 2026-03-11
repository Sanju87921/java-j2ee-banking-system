package in.ps.bankapp.dto;

public class Transaction {
	private int ID;
	private long TRANSACTION_ID;
	private long SENDER_ACC ;
	private long RECIEVER_ACC;
	private double AMOUNT;
	private String TRANSACTION_TYPE;
	private double BALANCE;
	private String date;
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public long getTRANSACTION_ID() {
		return TRANSACTION_ID;
	}
	public void setTRANSACTION_ID(long tRANSACTION_ID) {
		TRANSACTION_ID = tRANSACTION_ID;
	}
	public long getSENDER_ACC() {
		return SENDER_ACC;
	}
	public void setSENDER_ACC(long sENDER_ACC) {
		SENDER_ACC = sENDER_ACC;
	}
	public long getRECIEVER_ACC() {
		return RECIEVER_ACC;
	}
	public void setRECIEVER_ACC(long rECIEVER_ACC) {
		RECIEVER_ACC = rECIEVER_ACC;
	}
	public double getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(double aMOUNT) {
		AMOUNT = aMOUNT;
	}
	public String getTRANSACTION_TYPE() {
		return TRANSACTION_TYPE;
	}
	public void setTRANSACTION_TYPE(String tRANSACTION_TYPE) {
		TRANSACTION_TYPE = tRANSACTION_TYPE;
	}
	public double getBALANCE() {
		return BALANCE;
	}
	public void setBALANCE(double bALANCE) {
		BALANCE = bALANCE;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
	
}
