package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.OrderAbout;
import pojo.OrderTotal;
import pojo.Shopcart;
import util.DButil;

public class OrderTotalDao {
	private static ResultSet rs;
	
	//添加
	public static boolean add(OrderTotal orderTotal){
		String sql = "insert into ordertotal value(null,?,?,?,?,?,null,null,null)";
		return DButil.update(sql, orderTotal.getU_id(),orderTotal.getO_bh(),orderTotal.getT_price(),orderTotal.getT_time(),0);
	}
	
	//付款后订单修改
	public static boolean updpay(OrderTotal oTotal){
		String sql = "update ordertotal set t_state=1,a_consigneename=?,a_consigneeaddress=?,a_phone=? where o_bh=?";
		return DButil.update(sql,oTotal.getA_consigneename(),oTotal.getA_consigneeaddress(),oTotal.getA_phone(),oTotal.getO_bh());
	}
	
	//根据用户id查询
	public static List<OrderTotal> checkall(int u_id){
		String sql = "select * from ordertotal where u_id=?";
		return querylist(sql, u_id);
	}
	
	public static OrderTotal checkone(String o_bh){
		String sql = "select * from ordertotal where o_bh=?";
		return queryone(sql, o_bh);
	}
	
	
	public static OrderTotal queryone(String sql,Object... args){
		OrderTotal shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new OrderTotal(rs);
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
				OrderTotal shop = new OrderTotal(rs);
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
