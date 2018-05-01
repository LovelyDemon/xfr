package com.change;

import com.util.JdbcUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import javax.mail.Session;

public class HotelDao implements HotelService {
	 boolean bInited = false;
	 //加载驱动
	 public void initJDBC() throws ClassNotFoundException {
	 //加载MYSQL JDBC驱动程序
	 Class.forName("com.mysql.jdbc.Driver");
	 bInited = true;
	 System.out.println("Success loading Mysql Driver!");
	 }
	 
	 public Connection getConnection() throws ClassNotFoundException,
	 SQLException{
	 if(!bInited){
	 initJDBC();
	 }
	 //连接URL为 jdbc:mysql//服务器地址/数据库名
	 //后面的2个参数分别是登陆用户名和密码
	 Connection conn = DriverManager.getConnection(
	 "jdbc:mysql://localhost:3306/zhly","root","root");
	 return conn;
	 }

	private JdbcUtils jdbcUtils;
	public HotelDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}

	@Override
	public boolean addhotel(List<Object> params) {
		
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			String sql = "insert into hotel(hoid,honame,holocal,hojs,biaonum,biaojg,danum,dajg,hopic1,hopic2,hopic3,hopic4,ordernum) values(?,?,?,?,?,?,?,?,?,?,?,?,'0')";
			flag = jdbcUtils.updateByPreparedStatement(sql, params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			
			// 关闭数据库连接
			jdbcUtils.releaseConn();
			
		}
		
		
		return flag;
	}
	
	

	@Override
	public List<Map<String, Object>> listhotel(String honame ,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from hotel where 1=1 and honame like ? limit ? ,?";	
			if(honame.equals("")){
				sql = "select * from hotel limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+honame+"%");
				params.add(start);
				params.add(end);
			}		
					
			list = jdbcUtils.findMoreResult(sql, params);			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			
			
			jdbcUtils.releaseConn();
			
		}
		
		
		return list;
	}

	//查询总记录数
	@Override
	public int getItemCount(String honame) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from hotel where 1=1 and honame like ?";	
			if(honame.equals("")){
				sql = "select count(*) totalCount from hotel";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+honame+"%");
			}
		map = jdbcUtils.findSimpleResult(sql, params);
		count = Integer.parseInt(map.get("totalCount").toString());
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		
		
		return count;
	}

	@Override
	public boolean delhotel(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				String[] sql2 = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from hotel where hoid = '"+ids[i]+"'";
					System.out.println(sql[i]);
				}
				for(int j = 0 ; j< ids.length; j++){
					sql2[j] = "delete from hotelord where hoid = '"+ids[j]+"'";
					System.out.println(sql2[j]);
				}
				jdbcUtils.deleteByBatch(sql2);
				flag = jdbcUtils.deleteByBatch(sql);
				
			}
					
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}	
		
		return flag;
	}

	@Override
	public Map<String, Object> viewhotel(String hoid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(hoid);
			String sql = "select * from hotel where hoid = ?";
			map = jdbcUtils.findSimpleResult(sql, params);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		
		
		return map;
	}
	
	public int getnum(){  //添加新闻

		System.out.println(" haha!");

		 Connection conne = null;
		 Statement stmtt = null;
		 ResultSet rss = null;
		 
		 int hid=1;
		try{
		 conne = getConnection();
		 stmtt = conne.createStatement();
		 System.out.println(" heihei!");
		 rss = stmtt.executeQuery("SELECT * FROM hotel");
		 while(rss.next()){
			 System.out.println(" hi!");
		 hid=rss.getInt("hoid");
		 
		 }
	     ++hid;

		 }
		catch (ClassNotFoundException e) {
		 e.printStackTrace();
		 }catch (SQLException e) {
		 e.printStackTrace();
		 }
		return hid;

		 }

	

}