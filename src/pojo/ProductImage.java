package pojo;

import java.sql.ResultSet;

public class ProductImage {
    private int p_id;
    private int s_id;
    private String p_url1;
    private String p_url2;
    private String p_url3;
    
    public ProductImage(ResultSet rs){
    	try {
			p_id = rs.getInt("p_id");
			s_id = rs.getInt("s_id");
			p_url1 = rs.getString("p_url1");
			p_url2 = rs.getString("p_url2");
			p_url3 = rs.getString("p_url3");
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
	public ProductImage() {
		super();
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public String getP_url1() {
		return p_url1;
	}
	public void setP_url1(String p_url1) {
		this.p_url1 = p_url1;
	}
	public String getP_url2() {
		return p_url2;
	}
	public void setP_url2(String p_url2) {
		this.p_url2 = p_url2;
	}
	public String getP_url3() {
		return p_url3;
	}
	public void setP_url3(String p_url3) {
		this.p_url3 = p_url3;
	}
    
}
