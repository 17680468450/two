package pojo;

import java.sql.ResultSet;

public class OrderAbout {
	private int o_id;
	private String o_bh;
	private Commodity commodity;
	private int sc_number;
	private int sc_price;

	public OrderAbout(ResultSet rs) {
		try {
			o_id = rs.getInt("o_id");
			o_bh = rs.getString("o_bh");
			sc_number = rs.getInt("sc_number");
			sc_price = rs.getInt("sc_price");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public OrderAbout(String o_bh, Commodity commodity, int sc_number, int sc_price) {
		super();
		this.o_bh = o_bh;
		this.commodity = commodity;
		this.sc_number = sc_number;
		this.sc_price = sc_price;
	}




	public OrderAbout() {
		super();
	}

	public int getO_id() {
		return o_id;
	}

	public void setO_id(int o_id) {
		this.o_id = o_id;
	}

	public String getO_bh() {
		return o_bh;
	}

	public void setO_bh(String o_bh) {
		this.o_bh = o_bh;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}

	public int getSc_number() {
		return sc_number;
	}




	public void setSc_number(int sc_number) {
		this.sc_number = sc_number;
	}




	public int getSc_price() {
		return sc_price;
	}




	public void setSc_price(int sc_price) {
		this.sc_price = sc_price;
	}


   
}
