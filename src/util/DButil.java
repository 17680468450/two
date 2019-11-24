package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DButil {
   private final static String Driver = "com.mysql.jdbc.Driver";
   private final static String url = "jdbc:mysql://localhost:3306/shopweb?characterEncoding=utf-8";
   private final static String user = "root";
   private final static String pwd = "";
   
   private static Connection conn = null;
   private static PreparedStatement ps = null;
   private static ResultSet rs =null;
   
   public static Connection getconn(){
	   try {
		Class.forName(Driver);
		conn = DriverManager.getConnection(url,user,pwd);
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return conn;
   }
   
   public static void close(){
	   try {
		if(rs != null) rs.close();
		if(ps != null) ps.close();
		if(conn != null) conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
   }
   
   public static ResultSet query(String sql,Object... args){
	   try {
		getconn();
		ps = conn.prepareStatement(sql);
		for(int i=0;i<args.length;i++){
			ps.setObject((i+1), args[i]);
		}
		rs = ps.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
	   return rs;
   }
   
   public static boolean update(String sql,Object... args){
	   try {
		getconn();
		ps = conn.prepareStatement(sql);
		for(int i=0;i<args.length;i++){
			ps.setObject((i+1), args[i]);
		}
		int count = ps.executeUpdate();
		if(count > 0) return true;
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	   return false;
   }
   
}
