package com.change;

import com.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class LxglDao implements LxglService {

	private JdbcUtils jdbcUtils;
	public LxglDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}


	
	@Override
	public List<Map<String, Object>> listLxgl(String uname ,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();	
			System.out.print("uname:"+uname);
			String sql = "select * from lxwm where 1=1 and uname like ? order by lxid desc limit ? ,?";	
			if(uname.equals("")){
				sql = "select * from lxwm order by lxid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+uname+"%");
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
	public int getItemCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql = "select count(*) totalCount from lxwm where 1=1 and uname like ?";	
			if(uname.equals("")){
				sql = "select count(*) totalCount from lxwm";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+uname+"%");
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
	public boolean delLxgl(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				String[] sql2 = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from lxwm where lxid = '"+ids[i]+"'";
					System.out.println(sql[i]);
				}
				for(int j = 0 ; j< ids.length; j++){
					sql2[j] = "delete from huifu where lxid = '"+ids[j]+"'";
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
	public Map<String, Object> viewLxgl(String lxid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(lxid);
			String sql = "select * from lxwm where lxid = ?";
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