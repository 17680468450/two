package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.STopOne;
import pojo.STopTwo;
import util.DButil;

public class STopTwoDao {
private static ResultSet rs = null;

	
    public static List<STopTwo> checkall(){
    	String sql = "select * from s_top_two";
    	return querylist(sql);
    }
    
    public static List<STopTwo> checkById(int s_one_id){
    	String sql = "select * from s_top_two where s_one_id=?";
    	return querylist(sql,s_one_id);
    }
	
	public static STopTwo queryone(String sql,Object... args){
		STopTwo shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new STopTwo(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close();
		}
		   return shop;
	   }
	   
	   public static List querylist(String sql,Object... args){
		   List arr = new ArrayList();
		   try {
			rs = DButil.query(sql,args);
			while (rs.next()) {
				STopTwo shop = new STopTwo(rs);
				arr.add(shop);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DButil.close();
		}
		   return arr;
	   }
}
