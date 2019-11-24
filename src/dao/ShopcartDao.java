package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.STopOne;
import pojo.Shopcart;
import util.DButil;

public class ShopcartDao {
	private static ResultSet rs;
	
	//������Ʒid��ѯ
	public static Shopcart checkByS_id(int s_id,int u_id){
		String sql = "select * from shopcart where s_id=? and u_id=?";
		return queryone(sql, s_id,u_id);
	}
	
	//���ݹ��ﳵid��ѯ
	public static Shopcart checkBySC_id(int sc_id){
		String sql = "select * from shopcart where id=?";
		return queryone(sql, sc_id);
	}
	
	//�޸�
	public static boolean upd(Shopcart shopcart){
		String sql = "update shopcart set sc_number=?,sc_price=? where id=? and u_id=?";
		return DButil.update(sql, shopcart.getSc_number(),shopcart.getSc_price(),shopcart.getId(),shopcart.getU_id());
	}
	
	//�����Ʒ
	public static boolean add(Shopcart shopcart){
		String sql = "insert into shopcart values(null,?,?,?,?)";
		return DButil.update(sql, shopcart.getU_id(),shopcart.getCommodity().getS_id(),shopcart.getSc_number(),shopcart.getSc_price());
	}
	
	//����idɾ��
	public static boolean del(int sc_id){
		String sql = "delete from shopcart where id=?";
		return DButil.update(sql, sc_id);
	}
	
	//������
	public static List<Shopcart> checkByU_id(int u_id){
		String sql = "select * from shopcart where u_id=?";
		return querylist(sql,u_id);
	}
	
	public static Shopcart queryone(String sql,Object... args){
		Shopcart shop = null;
		   try {
			rs = DButil.query(sql, args);
			if(rs.next()){
				shop = new Shopcart(rs);
				shop.setCommodity(CommodityDao.checkone(rs.getInt("s_id")));
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
				Shopcart shop = new Shopcart(rs);
				shop.setCommodity(CommodityDao.checkone(rs.getInt("s_id")));
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
