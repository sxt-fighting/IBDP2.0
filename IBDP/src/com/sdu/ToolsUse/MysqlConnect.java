package com.sdu.ToolsUse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MysqlConnect {
	
	//用户从页面选择指定mysql数据库数据展示
	private static Connection conn;
	public static Connection getConn(String ip,String port,String dbname,String uname,String upwd){
		if(conn==null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String  url = "jdbc:mysql://"+ip+":"+port+"/"+dbname+"?"
		             + "user="+uname+"&password="+upwd+"&useUnicode=true&characterEncoding=UTF8";
		 	    conn = DriverManager.getConnection(url);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		return conn;
	}
	//选择由项目产生的数据（已存放在test数据库中的）
//	private static Connection myconn;
	public static Connection getMyConn(){
		Connection myconn=null;
		if(myconn==null){
			try {
				Class.forName("com.mysql.jdbc.Driver");
				String  url = "jdbc:mysql://localhost:3306/test?"
		             + "user=root&password=123456&useUnicode=true&characterEncoding=UTF8";
				myconn = DriverManager.getConnection(url);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}
		return myconn;
	}
	
	/*
	 * 由数据id获取数据存储的位置Path
	 * */
	public static String getpath(String rowid) throws SQLException {
		
		Connection con = getMyConn();
		ResultSet rs=null;  
        PreparedStatement prepar=con.prepareStatement("select d_localpath as dlpath from datafile where d_id='"+rowid+"'");  
        rs=prepar.executeQuery();  
        String path="";
        while(rs.next()) {  	
        	path=rs.getString("dlpath");
       }
		return path;
	}

	
	
}
