package pojo;

import java.sql.ResultSet;

public class STopTwo {
    private int s_two_id;
    private int s_one_id;
    private String s_two_name;
    
    public STopTwo(ResultSet rs){
    	try {
    		s_two_id = rs.getInt("s_two_id");
    		s_one_id = rs.getInt("s_one_id");
    		s_two_name = rs.getString("s_two_name");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	public STopTwo() {
		super();
	}
	public int getS_two_id() {
		return s_two_id;
	}
	public void setS_two_id(int s_two_id) {
		this.s_two_id = s_two_id;
	}
	public int getS_one_id() {
		return s_one_id;
	}
	public void setS_one_id(int s_one_id) {
		this.s_one_id = s_one_id;
	}
	public String getS_two_name() {
		return s_two_name;
	}
	public void setS_two_name(String s_two_name) {
		this.s_two_name = s_two_name;
	}
    
}
