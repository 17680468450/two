package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pojo.Address;
import util.DButil;


public class AddressDao {
//	��
	public static Boolean update1(Address address) {
		String sql = "update address set a_status=? where a_id=? ";
		return DButil.update(sql,address.getA_status(), address.getA_id());
	}
	//ɾ��
	public static boolean del(int a_id){
		String sql = "delete from address where A_id=?";
		return DButil.update(sql, a_id);
	}
	
//��ѯ�к�
	public static int name(int u_id) {
		int i = 0;
		try {
			String sql = "select count(*) from address where u_id=? GROUP BY u_id";
			ResultSet rs = DButil.query(sql, u_id);
			if(rs.next()){
				i = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DButil.close();
		}
		return i;
	}
	//��ѯĬ�ϵ�ַ
	public static Address checkdef(int u_id) {
		Address address = null;
		try {
			String sql = "select * from address where a_status=1 and u_id=?";
			ResultSet rs = DButil.query(sql,u_id);
			if(rs.next()){
				address = new Address(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DButil.close();
		}
		return address;
	}
//	��ѯ������ַ
	public static Address queryAll(int a_id) {
		Address address = null;
		try {
			String sql = "select * from address where a_id=?";
			ResultSet rs = DButil.query(sql, a_id);
			if(rs.next()){
				address = new Address(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DButil.close();
		}
		return address;
	}
//	��ѯ���е�ַ
	public static List<Address> queryList(int u_id) {
		List<Address>arr = new ArrayList<>();
		try {
			String sql = "select * from address where u_id=?";
			ResultSet rs = DButil.query(sql, u_id);
			while (rs.next()) {
				Address address = new Address(rs);
				arr.add(address);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DButil.close();
		}
		return arr;
		
	}
//	���
	public static boolean add(Address address) {
		String sql = "insert into address(a_id,u_id,a_phone,a_consigneename,a_consigneeaddress) values(null,?,?,?,?)";
		return DButil.update(sql, address.getU_id(),address.getA_phone(),address.getA_consigneename(),address.getA_consigneeaddress());
	}
	
	//��ӵ�һ��
	public static boolean addfirst(Address address) {
		String sql = "insert into address values(null,?,?,?,?,?)";
		return DButil.update(sql, address.getU_id(),1,address.getA_phone(),address.getA_consigneename(),address.getA_consigneeaddress());
	}

}
