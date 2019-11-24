package pojo;

import java.sql.ResultSet;

public class Commodity {
    private int s_id;
    private String s_name;
    private int s_price;
    private int s_repertory;
    private int s_sales;
    private STopThree sThree;
    private String s_url;
    private String s_describe;
    private String s_brand;
    
    
    
	public Commodity(ResultSet rs) {
		try {
			this.s_id = rs.getInt("s_id");
			this.s_name = rs.getString("s_name");
			this.s_price = rs.getInt("s_price");
			this.s_repertory = rs.getInt("s_repertory");
			this.s_sales = rs.getInt("s_sales");
			this.s_url = rs.getString("s_url");
			this.s_describe = rs.getString("s_describe");
			this.s_brand = rs.getString("s_brand");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Commodity() {
		super();
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getS_repertory() {
		return s_repertory;
	}
	public void setS_repertory(int s_repertory) {
		this.s_repertory = s_repertory;
	}
	public int getS_sales() {
		return s_sales;
	}
	public void setS_sales(int s_sales) {
		this.s_sales = s_sales;
	}
	public STopThree getsThree() {
		return sThree;
	}
	public void setsThree(STopThree sThree) {
		this.sThree = sThree;
	}
	public String getS_url() {
		return s_url;
	}
	public void setS_url(String s_url) {
		this.s_url = s_url;
	}
	public String getS_describe() {
		return s_describe;
	}
	public void setS_describe(String s_describe) {
		this.s_describe = s_describe;
	}
	public String getS_brand() {
		return s_brand;
	}
	public void setS_brand(String s_brand) {
		this.s_brand = s_brand;
	}
    
}
