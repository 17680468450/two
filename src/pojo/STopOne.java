package pojo;

import java.sql.ResultSet;

public class STopOne {
	private int s_one_id;
	private String s_one_name;
	private String s_one_img;
	
    public STopOne(ResultSet rs){
    	try {
			s_one_id = rs.getInt("s_one_id");
			s_one_name = rs.getString("s_one_name");
			s_one_img = rs.getString("s_one_img");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

	public STopOne() {
		super();
	}

	public int getS_one_id() {
		return s_one_id;
	}

	public void setS_one_id(int s_one_id) {
		this.s_one_id = s_one_id;
	}

	public String getS_one_name() {
		return s_one_name;
	}

	public void setS_one_name(String s_one_name) {
		this.s_one_name = s_one_name;
	}

	public String getS_one_img() {
		return s_one_img;
	}

	public void setS_one_img(String s_one_img) {
		this.s_one_img = s_one_img;
	}

}
