package com.change;

import com.util.JdbcUtils;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

//import javax.mail.Session;

public class NewsDao implements NewsService {

	private JdbcUtils jdbcUtils;
	public NewsDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}


	
	@Override
	public List<Map<String, Object>> listNews(String nename ,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();	
			System.out.print("nename:"+nename);
			String sql = "select * from news where 1=1 and nename like ? order by neid desc limit ? ,?";	
			if(nename.equals("")){
				sql = "select * from news order by neid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+nename+"%");
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

	@Override
	public List<Map<String, Object>> listpl_ht(String nename ,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from nepl where 1=1 and nename like ? order by neplid desc limit ? ,?";	
			if(nename.equals("")){
				sql = "select * from nepl order by neplid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+nename+"%");
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
	
	@Override
	public List<Map<String, Object>> listpl(String neid,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();	
			System.out.print("kkk"+neid);
			String sql = "select * from nepl where 1=1 and neid='"+neid+"' limit ? ,?";
				params.add(start);
				params.add(end);
				
				
			list = jdbcUtils.findMoreResult(sql, params);			
			
		} 
		
		
		
		
		
		
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			
			
			jdbcUtils.releaseConn();
			
		}
		
		
		return list;
	}

	
	//查询总记录数
	@Override
	public int getItemCount(String nename) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from news where 1=1 and nename like ?";	
			if(nename.equals("")){
				sql = "select count(*) totalCount from news";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+nename+"%");
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
	public int getplItemCount(String nename) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from nepl where 1=1 and nename like ?";	
			if(nename.equals("")){
				sql = "select count(*) totalCount from nepl";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+nename+"%");
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

	
	public int getplCount(String neplid) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		System.out.println(neplid);
		
		try {
			
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from nepl where 1=1 and neid='"+neplid+"'";	
			if(neplid.equals("")){
				sql = "select count(*) totalCount from nepl where 1=1 ";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+neplid+"%");
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
	public boolean delNews(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				String[] sql2 = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from news where neid = '"+ids[i]+"'";
					System.out.println(sql[i]);
				}
				for(int j = 0 ; j< ids.length; j++){
					sql2[j] = "delete from nepl where neid = '"+ids[j]+"'";
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
	public boolean delpl(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from nepl where neplid = '"+ids[i]+"'";
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
	public String addpl(String neid,String nename,String neplnr,String userName) {
		System.out.println(" ola!");
		String returnValue = "a";
		
		 Connection conne = null;
		 Statement stmtt = null;
		 ResultSet rss = null;
		 Statement stmtt2 = null;
		 ResultSet rss2 = null;

		 int plid=1;
		try{
		 conne = jdbcUtils.getConnection();;
		 stmtt = conne.createStatement();
		 stmtt2 = conne.createStatement();

		 rss = stmtt.executeQuery("SELECT * FROM user");
		 while(rss.next()){
			 System.out.println(" hi!");
		 String utypeInDB=rss.getString("utype");
		 String userNameInDB = rss.getString("uname");
		 int rid=rss.getInt("id");
		 System.out.print(userNameInDB);
		 System.out.print(userName);
		 if(userNameInDB.equals(userName)){
			 
			 System.out.print("!!!!!");
			 Date now = new Date(); 
			 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
			 rss2 = stmtt2.executeQuery("SELECT * FROM nepl");
				while(rss2.next()){
					 System.out.println(" hi!");
				 plid=rss2.getInt("neplid");
				}
			++plid;
			 String hehe = dateFormat.format( now ); 
			 System.out.println(hehe); 
			 if(neplnr!="")
			 {
			int result=stmtt2.executeUpdate("insert into nepl values ("+plid+",'"+neid+"','"+nename+"','"+userName+"','"+neplnr+"','"+hehe+"')");	
			 returnValue = "b";
			 return returnValue;
			 }
			 else
			 {
				 returnValue = "c";
				 return returnValue; 
			 }
		 }
		 }
		 }catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally{
				// 关闭数据库连接
				jdbcUtils.releaseConn();
			}	
			
		return returnValue;
		}
	
	@Override
	public Map<String, Object> viewNews(String neid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(neid);
			String sql = "select * from news where neid = ?";
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

	@Override
	public Map<String, Object> viewpl_ht(String neplid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(neplid);
			String sql = "select * from nepl where neplid = ?";
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
	
	
	@Override
	public Map<String, Object> viewpl(String neid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(neid);
			String sql = "select * from nepl where neid = ?";
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
	

}