package pojo;

import java.sql.ResultSet;

public class Shopcart {
    private int id;
    private int u_id;
    private Commodity commodity;
    private int sc_number;
	private int sc_price;
	
	public Shopcart(ResultSet rs){
		try {
			id = rs.getInt("id");
			u_id = rs.getInt("u_id");
			sc_number = rs.getInt("sc_number");
			sc_price = rs.getInt("sc_price");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Shopcart() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
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
