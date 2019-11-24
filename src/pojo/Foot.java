package pojo;

import java.sql.ResultSet;

public class Foot {
   private int id;
	private int u_id;
	private Commodity commodity;

	public Foot(ResultSet rs) {
		try {
			id = rs.getInt("id");
			u_id = rs.getInt("u_id");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Foot() {
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

}
