package dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import pojo.User; 
import util.DButil;

public class UserDao {
	//��¼
	public static User checkLogin(String user,String password){
		String sql = "SELECT * FROM user WHERE (u_nickname=? and u_pwd=?) or (u_email = ? and u_pwd=?) or (u_phone=? and u_pwd=?)";
		return checkUser(sql,user,password,user,password,user,password);
	}
	
	//ͨ��id���û���Ϣ
	public static User checkById(int id){
		String sql = "SELECT * FROM user WHERE u_id=?";
		return checkUser(sql, id);
	}
	//������
	public static List<User> checkAll(){
		String sql = "SELECT * FROM user";
		return check(sql);
	}
	
	//����ע��
	public static boolean addEmail(String email,String pwd,String nickname){
		String sql = "insert into user(u_email,u_pwd,u_nickname) values(?,?,?)";
		return DButil.update(sql, email,pwd,email);
		
	}
	//�ֻ�ע��
		public static boolean addPhone(String phone,String pwd,String nickname){
			String sql = "insert into user(u_phone,u_pwd,u_nickname) values(?,?,?)";
			return DButil.update(sql, phone,pwd,nickname);
		}
		
//		�޸��û�����
		public static boolean updatePwd(User user) {
			String sql = "update user set u_pwd=? where u_id=?";
			return DButil.update(sql, user.getU_pwd(),user.getU_id());
		}
//		�޸��û���Ϣ
		public static boolean updateUser(User user) {
			String sql = "update user set u_nickname=?,u_name=?,u_sex=?,u_birth=?,u_phone=?,u_email=?,u_url=? where u_id=?";
			return DButil.update(sql,user.getU_nickname(),user.getU_name(),user.getU_sex(),user.getU_birth(),user.getU_phone(),user.getU_email(),user.getU_url(),user.getU_id());
		}
		
		
	// ��Ѱ�û��Ƿ����
		public static User checkOne(int u_id){
			String sql = "select * from user where u_id = ? ";
			return checkUser(sql,u_id);
			
		}
	
	private static User checkUser(String sql,Object...asge){
		User user = null;
		try {
			ResultSet rs = DButil.query(sql, asge);
			if (rs.next()) {
				user = new User(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DButil.close();
		}
		return user;
	}
	
	private static List<User> check(String sql,Object...asge){
		List<User> arr = new ArrayList<>();
		try {
			ResultSet rs = DButil.query(sql, asge);
			while(rs.next()){
				User user = new User(rs);
				arr.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			DButil.close();
		}
		return arr;
	}
}
