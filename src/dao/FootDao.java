package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.Commodity;
import pojo.Foot;
import pojo.STopThree;
import util.DButil;

public class FootDao {
	private static ResultSet rs;
	
	//添加
	public static boolean add(Foot foot){
		String sql = "insert into foot values(null,?,?)";
		return DButil.update(sql, foot.getU_id(),foot.getCommodity().getS_id());
	}
	
	//查单条
	public static Foot checkByS_id(int s_id,int u_id){
		String sql = "select * from foot where s_id=? and u_id=?";
		return queryone(sql, s_id,u_id);
	}
	
	//查多条
		public static List<Foot> checkall(int u_id){
			String sql = "select * from foot where u_id=?";
			return querylist(sql, u_id);
		}
	
	 public static Foot queryone(String sql,Object... args){
		 Foot shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new Foot(rs);
				Commodity commodity = CommodityDao.checkone(rs.getInt("s_id"));
				shop.setCommodity(commodity);
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
				Foot shop = new Foot(rs);
				Commodity commodity = CommodityDao.checkone(rs.getInt("s_id"));
				shop.setCommodity(commodity);
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
