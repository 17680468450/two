package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.STopOne;
import util.DButil;

public class STopOneDao {
	private static ResultSet rs = null;
	
	public static List<STopOne> checkall(){
		String sql = "select * from s_top_one";
		return querylist(sql);
	}
	
	public static STopOne queryone(String sql,Object... args){
		   STopOne shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new STopOne(rs);
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
				STopOne shop = new STopOne(rs);
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
