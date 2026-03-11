package in.ps.bankapp.dto;

public class Account {
	private int ACC_ID;
	private long ACC_NO;
	private int C_ID;
	private String ACC_TYPE;
	private double BALANCE;
	private String date;
	private String STATUS;
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public int getACC_ID() {
		return ACC_ID;
	}
	public void setACC_ID(int aCC_ID) {
		ACC_ID = aCC_ID;
	}
	public long getACC_NO() {
		return ACC_NO;
	}
	public void setACC_NO(long aCC_NO) {
		ACC_NO = aCC_NO;
	}
	public int getC_ID() {
		return C_ID;
	}
	public void setC_ID(int c_ID) {
		C_ID = c_ID;
	}
	public String getACC_TYPE() {
		return ACC_TYPE;
	}
	public void setACC_TYPE(String aCC_TYPE) {
		ACC_TYPE = aCC_TYPE;
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
