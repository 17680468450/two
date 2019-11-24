package pojo;

import java.sql.ResultSet;

public class Address {
	private int a_id;
	private int u_id;
	private int a_status;
	private String a_phone;
	private String a_consigneename;
	private String a_consigneeaddress;
	
	public Address() {
	}
	public Address(ResultSet rs){
		try {
			this.a_id = rs.getInt("a_id");
			this.u_id = rs.getInt("u_id");
			this.a_status = rs.getInt("a_status");
			this.a_phone = rs.getString("a_phone");
			this.a_consigneename = rs.getString("a_consigneename");
			this.a_consigneeaddress = rs.getString("a_consigneeaddress");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int a_id) {
		this.a_id = a_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public int getA_status() {
		return a_status;
	}
	public void setA_status(int a_status) {
		this.a_status = a_status;
	}
	public String getA_consigneename() {
		return a_consigneename;
	}
	public void setA_consigneename(String a_consigneename) {
		this.a_consigneename = a_consigneename;
	}
	public String getA_consigneeaddress() {
		return a_consigneeaddress;
	}
	public void setA_consigneeaddress(String a_consigneeaddress) {
		this.a_consigneeaddress = a_consigneeaddress;
	}
	public String getA_phone() {
		return a_phone;
	}
	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}
	
}
