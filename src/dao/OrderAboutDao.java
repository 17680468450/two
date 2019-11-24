package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.Commodity;
import pojo.OrderAbout;
import pojo.STopOne;
import pojo.Shopcart;
import util.DButil;

public class OrderAboutDao {
	private static ResultSet rs;
	
	//����
	public static boolean add(OrderAbout orderAbout){
		String sql = "insert into orderabout value(null,?,?,?,?)";
		return DButil.update(sql, orderAbout.getO_bh(),orderAbout.getCommodity().getS_id(),orderAbout.getSc_number(),orderAbout.getSc_price());
	}
	
	//���ݶ�����Ų�ѯ����
	public static List<OrderAbout> checkByO_bh(String o_bh){
		String sql = "select * from orderabout where o_bh=?";
		return querylist(sql, o_bh);
	}
	
	
	public static OrderAbout queryone(String sql,Object... args){
		OrderAbout shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new OrderAbout(rs);
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
				OrderAbout shop = new OrderAbout(rs);
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
