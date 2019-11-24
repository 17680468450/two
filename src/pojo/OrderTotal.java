package pojo;

import java.sql.ResultSet;

public class OrderTotal {
    private int t_id;
    private int u_id;
    private String o_bh;
    private int t_price;
    private String t_time;
    private int t_state;
    private String a_consigneename;
    private String a_consigneeaddress;
    private String a_phone;
    
    public OrderTotal(ResultSet rs){
    	try {
			t_id = rs.getInt("t_id");
			u_id = rs.getInt("u_id");
			o_bh = rs.getString("o_bh");
			t_price = rs.getInt("t_price");
			t_time = rs.getString("t_time");
			t_state = rs.getInt("t_state");
			a_consigneename = rs.getString("a_consigneename");
			a_consigneeaddress = rs.getString("a_consigneeaddress");
			a_phone = rs.getString("a_phone");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	public OrderTotal(int u_id, String o_bh, int t_price, String t_time) {
		super();
		this.u_id = u_id;
		this.o_bh = o_bh;
		this.t_price = t_price;
		this.t_time = t_time;
	}



	public OrderTotal() {
		super();
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getO_bh() {
		return o_bh;
	}
	public void setO_bh(String o_bh) {
		this.o_bh = o_bh;
	}
	public int getT_price() {
		return t_price;
	}
	public void setT_price(int t_price) {
		this.t_price = t_price;
	}
	public String getT_time() {
		return t_time;
	}
	public void setT_time(String t_time) {
		this.t_time = t_time;
	}
	public int getT_state() {
		return t_state;
	}
	public void setT_state(int t_state) {
		this.t_state = t_state;
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
