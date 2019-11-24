package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.Commodity;
import pojo.ProductImage;
import util.DButil;

public class ProductImageDao {
	private static ResultSet rs;
	
	//根据商品id查商品图片
	public static ProductImage checkByS_id(int id){
		String sql = "select * from productimage where s_id=?";
		return queryone(sql, id);
	}
	
	public static ProductImage queryone(String sql,Object... args){
		ProductImage shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new ProductImage(rs);
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
				ProductImage shop = new ProductImage(rs);
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
