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

public class CompanionServiceImpl implements CompanionService {

	private JdbcUtils jdbcUtils;
	public CompanionServiceImpl() {
		jdbcUtils = new JdbcUtils();
	}

	@Override
	public List<Map<String, Object>> getListByPage(String title, int start , int end) {
		List<Map<String, Object>> list = new ArrayList<>();
		List<Object> params  = new ArrayList<>();
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from companion where 1=1 and title like ? limit ? ,?";
			if (title == null || title.equals("")) {
				sql = "select * from companion limit ? ,?";
				params.add(start);
				params.add(end);

			} else {
				params.add("%" + title + "%");
				params.add(start);
				params.add(end);
			}
			list = jdbcUtils.findMoreResult(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			jdbcUtils.releaseConn();
		}
		return list;
	}

	@Override
	public List<Map<String, Object>> listpl_ht(String prname ,int start ,int end) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from prpl where 1=1 and prname order by prplid desc like ? limit ? ,?";	
			if(prname.equals("")){
				sql = "select * from prpl limit order by prplid desc ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+prname+"%");
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
	public List<Map<String, Object>> listpl(String prid,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
				
		try {
			jdbcUtils.getConnection();	
			System.out.print("kkk"+prid);
			String sql = "select * from prpl where 1=1 and prid='"+prid+"' limit ? ,?";
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
	
	public int getplCount(String prplid) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		System.out.println(prplid);
		
		try {
			
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from prpl where 1=1 and neid='"+prplid+"'";	
			if(prplid.equals("")){
				sql = "select count(*) totalCount from prpl where 1=1 ";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+prplid+"%");
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

	/**
	 * 查询总记录数
	 *
	 * @param title 标题
	 * @return 记录数
	 */
	@Override
	public int getCount(String title) {
		int count = 0;
		Map<String, Object> map;
		List<Object> params = null;
		try {
			jdbcUtils.getConnection();
			String sql = "select count(1) totalCount from companion where 1=1 and title like ?";
			if (title.equals("")) {
				sql = "select count(1) totalCount from companion";

			} else {
				params = new ArrayList<>();
				params.add("%" + title + "%");
			}
			map = jdbcUtils.findSimpleResult(sql, params);
			count = Integer.parseInt(map.get("totalCount").toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		return count;
	}
	
	
	@Override
	public int getplItemCount(String prname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from prpl where 1=1 and prname like ?";	
			if(prname.equals("")){
				sql = "select count(*) totalCount from prpl";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+prname+"%");
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
	public String addpl(String prid,String prname,String prplnr,String userName) {
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
			 rss2 = stmtt2.executeQuery("SELECT * FROM prpl");
				while(rss2.next()){
					 System.out.println(" hi!");
				 plid=rss2.getInt("prplid");
				}
			++plid;
			 String hehe = dateFormat.format( now ); 
			 System.out.println(hehe); 
			if(prplnr!= "")
			{
			int result=stmtt2.executeUpdate("insert into prpl values ("+plid+",'"+prid+"','"+prname+"','"+userName+"','"+prplnr+"','"+hehe+"')");	
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
	public boolean deleteBatch(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from companion where id = '"+ids[i]+"'";
				}
				flag = jdbcUtils.deleteByBatch(sql);	
			}
		} catch (Exception e) {
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
					sql[i] = "delete from prpl where prplid = '"+ids[i]+"'";
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
	public Map<String, Object> getDetail(String id) {
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<>();
			params.add(id);
			String sql = "select * from companion where id = ?";
			map = jdbcUtils.findSimpleResult(sql, params);
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		return map;
	}

	@Override
	public Map<String, Object> viewpl_ht(String prplid) {
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(prplid);
			String sql = "select * from prpl where prplid = ?";
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
	public Boolean signUp(Long companionId, Long userId) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (companionId != null && userId != null) {
				jdbcUtils.getConnection();
				List<Object> params = new ArrayList<Object>();
				params.add(companionId);
				params.add(userId);
				String sql = "INSERT INTO user_companion(companion_id,user_id) VALUES(?,?)";
				flag = jdbcUtils.updateByPreparedStatement(sql, params);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		return flag;
	}

	@Override
	public Boolean isSignUp(Long companionId, Long userId) {
		boolean flag = false;
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			if (companionId != null && userId != null) {
				jdbcUtils.getConnection();
				List<Object> params = new ArrayList<Object>();
				params.add(companionId);
				params.add(userId);
				String sql = "SELECT * FROM user_companion WHERE companion_id = ? AND user_id = ?";
				map = jdbcUtils.findSimpleResult(sql, params);
				if (map != null && !map.isEmpty()) {
					flag = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			// 关闭数据库连接
			jdbcUtils.releaseConn();
		}
		return flag;
	}

	@Override
	public Map<String, Object> viewpl(String prid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(prid);
			String sql = "select * from prpl where prid = ?";
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