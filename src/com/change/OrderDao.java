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

public class OrderDao implements OrderService {
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
	public OrderDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}

	@Override
	public boolean addorder(List<Object> params) {
		
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
	public List<Map<String, Object>> listorder(String honame ,String utype,String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			 System.out.println("listorder测试1");
			 System.out.println(utype);
			jdbcUtils.getConnection();	
			if(utype.equals("admin") ){	
				 System.out.println("listorder测试2");
			String sql = "select * from hotelord where 1=1 and honame like ? order by ordid desc limit ? ,?";	
			if(honame.equals("")){
				sql = "select * from hotelord order by ordid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+honame+"%");
				params.add(start);
				params.add(end);
			}
			list = jdbcUtils.findMoreResult(sql, params);	
			}	
			
			else{
				System.out.println("listorder测试3");
				System.out.println(uname);
				String sql = "select * from hotelord where 1=1 and uname='"+uname+"' and honame like ? order by ordid desc limit ? ,? ";
				if(honame.equals("")){
					sql = "select * from hotelord where uname='"+uname+"' order by ordid desc limit ? ,?";
					params.add(start);
					params.add(end);
					
				}else{				
					params.add("%"+honame+"%");
					params.add(start);
					params.add(end);
				}
				list = jdbcUtils.findMoreResult(sql, params);	
				
			}
			
					
			
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
			System.out.println(honame);
			
			try {
				
				jdbcUtils.getConnection();			
				String sql = "select count(*) totalCount from hotelord where 1=1 and honame='"+honame+"'";	
				if(honame.equals("")){
					sql = "select count(*) totalCount from hotelord where 1=1 ";
					
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
	public boolean delorder(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from hotelord where ordid = '"+ids[i]+"'";
					System.out.println(sql[i]);
				}
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
	public boolean agreeorder(String ordid,String honame) {
		System.out.println(" haha!");
		boolean a=false;
		 Connection conne = null;
		 Statement stmtt = null;
		 ResultSet rss = null;
		 Connection conne2 = null;
		 Statement stmtt2 = null;
		 ResultSet rss2 = null;
		try{
		
			conne = getConnection();		
		 stmtt = conne.createStatement();
		 rss = stmtt.executeQuery("SELECT * FROM hotelord");
		 int result=stmtt.executeUpdate("UPDATE hotelord SET ordjd='预订成功' where ordid="+ordid+"");
		 conne2 = getConnection();		
		 stmtt2 = conne2.createStatement();
		 rss2 = stmtt2.executeQuery("SELECT * FROM hotel");
		 int result2=stmtt.executeUpdate("UPDATE hotel SET ordernum=ordernum+1 where honame='"+honame+"'");
		 a=true;
		 return a;
		 
		
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
		}
	
	@Override
	public boolean refuseorder(String ordid,String honame) {
		System.out.println(" haha!");
		boolean a=false;
		 Connection conne = null;
		 Statement stmtt = null;
		 ResultSet rss = null;
		
		try{
		
			conne = getConnection();		
		 stmtt = conne.createStatement();
		 rss = stmtt.executeQuery("SELECT * FROM hotelord");
		 int result=stmtt.executeUpdate("UPDATE hotelord SET ordjd='预订失败' where ordid="+ordid+"");		
		
		 a=true;
		 return a;
		
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return a;
		}
	

	@Override
	public Map<String, Object> vieworder(String ordid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(ordid);
			String sql = "select * from hotelord where ordid = ?";
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