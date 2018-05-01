package com.util;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class demo {
	
	private String url="jdbc:mysql://localhost:3306/zhly";
	private String user="root";
	
	private String password="root";
	/**
	 * jdbc连接数据库
	 * 
	 * @throws SQLException
	 **/
	@Test
	public void test3() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection(url,user,password);
		System.out.println(conn);
	}	
}
	