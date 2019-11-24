package pojo;

import java.sql.ResultSet;

public class STopThree {
    private int s_three_id;
    private int s_two_id;
    private String s_three_name;
    
    public STopThree(ResultSet rs){
    	try {
    		s_three_id = rs.getInt("s_three_id");
    		s_two_id = rs.getInt("s_two_id");
    		s_three_name = rs.getString("s_three_name");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	public STopThree() {
		super();
	}
	public int getS_three_id() {
		return s_three_id;
	}
	public void setS_three_id(int s_three_id) {
		this.s_three_id = s_three_id;
	}
	public int getS_two_id() {
		return s_two_id;
	}
	public void setS_two_id(int s_two_id) {
		this.s_two_id = s_two_id;
	}
	public String getS_three_name() {
		return s_three_name;
	}
	public void setS_three_name(String s_three_name) {
		this.s_three_name = s_three_name;
	}
    
}
