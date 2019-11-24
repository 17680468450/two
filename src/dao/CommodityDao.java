package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.Commodity;
import pojo.STopOne;
import pojo.STopThree;
import util.DButil;

public class CommodityDao {
   private static ResultSet rs;
   
   public static Commodity checkone(int s_id){
	   String sql = "select * from commodity where s_id=?";
	   return queryone(sql, s_id);
   }
   
   //查找所有商品
   public static List<Commodity> checkall(){
	   String sql = "select * from commodity";
	   return querylist(sql);
   }
   
   //修改商品库存
   public static boolean updreper(int repertory,int s_id){
	   String sql = "update commodity set s_repertory=? where s_id=?";
	   return DButil.update(sql, repertory,s_id);
   }
   
   //分页查询
   public static List<Commodity> checkNumber(int page_now,int number){
	   String sql = "select * from commodity limit ?,?";
	   return querylist(sql, (page_now-1)*number ,number);
   }
   
   //根据分类搜索
   public static List<Commodity> checksort(int s_three_id){
	   String sql = "select * from commodity where s_three_id=?";
	   return querylist(sql, s_three_id);
   }
   
   //根据品牌搜索
   public static List<Commodity> checkbrand(String brand){
	   String sql = "select * from commodity where s_brand=?";
	   return querylist(sql, brand);
   }
   
   //搜索框查询
   public static List<Commodity> checklike(String input){
	   String sql = "select * from commodity where s_name like ? or s_brand like ?";
	   return querylist(sql, "%"+input+"%","%"+input+"%");
   }
   
   //商品品牌
   public static List checkByBrand(){
	   String sql = "select s_brand from commodity group by s_brand";
	   List arr = new ArrayList();
	   try {
		rs = DButil.query(sql);
		while (rs.next()) {
			String brand = rs.getString("s_brand");
			arr.add(brand);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		DButil.close();
	}
	   return arr;
   }
   
   public static Commodity queryone(String sql,Object... args){
	   Commodity shop = null;
	   try {
		rs = DButil.query(sql, args);
		if(rs.next()){
			shop = new Commodity(rs);
			STopThree sThree = STopThreeDao.checkBythreeId(rs.getInt("s_three_id"));
			shop.setsThree(sThree);
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
			Commodity shop = new Commodity(rs);
			STopThree sThree = STopThreeDao.checkBythreeId(rs.getInt("s_three_id"));
			shop.setsThree(sThree);
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
