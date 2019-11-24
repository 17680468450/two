package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.STopOne;
import pojo.STopThree;
import util.DButil;

public class STopThreeDao {
private static ResultSet rs = null;

    public static List<STopThree> checkall(){
    	String sql = "select * from s_top_three";
    	return querylist(sql);
    }
    
    public static List<STopThree> checkById(int s_two_id){
    	String sql = "select * from s_top_three where s_two_id=?";
    	return querylist(sql,s_two_id);
    }
    
    public static STopThree checkBythreeId(int s_three_id){
    	String sql = "select * from s_top_three where s_three_id=?";
    	return queryone(sql,s_three_id);
    }
	
	public static STopThree queryone(String sql,Object... args){
		STopThree shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new STopThree(rs);
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
				STopThree shop = new STopThree(rs);
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
