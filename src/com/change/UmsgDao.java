package com.change;

import com.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UmsgDao implements UmsgService {

	private JdbcUtils jdbcUtils;
	public UmsgDao() {
		// TODO Auto-generated constructor stub
		jdbcUtils = new JdbcUtils();
	}



	

	@Override
	public List<Map<String, Object>> list_repl(String rename ,String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from repl where 1=1 and uname='"+uname+"' and rename like ? order by replid desc limit ? ,? ";
			if(rename.equals("")){
				sql = "select * from repl where uname='"+uname+"' order by replid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+rename+"%");
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
	public List<Map<String, Object>> list_fav(String rename ,String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from favourite where 1=1 and uname='"+uname+"' and `rename` like ? order by favid desc limit ? ,? ";
			if(rename.equals("")){
				sql = "select * from favourite where uname='"+uname+"' order by favid desc limit ? ,?";
				params.add(start);
				params.add(end);
				
			}else{				
				params.add("%"+rename+"%");
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
	public List<Map<String, Object>> list_prpl(String prname ,String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from prpl where 1=1 and uname='"+uname+"' and prname like ? order by prplid desc limit ? ,? ";	
			if(prname.equals("")){
				sql = "select * from prpl where uname='"+uname+"' order by prplid desc limit ? ,?  ";
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
	public List<Map<String, Object>> list_nepl(String nename ,String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();			
			String sql = "select * from nepl where 1=1 and uname='"+uname+"' and nename like ? order by neplid desc limit ? ,? ";	
			if(nename.equals("")){
				sql = "select * from nepl where uname='"+uname+"' order by neplid desc limit ? ,?";
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
	public List<Map<String, Object>> list_hf(String uname,int start ,int end) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		List<Object> params  = new ArrayList<Object>();		
		try {
			jdbcUtils.getConnection();	
			
			String sql = "select * from huifu where uname='"+uname+"'  order by huiid desc limit ? ,?";
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
	public int getprplCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql="select count(*) totalCount1 from prpl where  uname like ?";	
			if(uname.equals("")){
				sql = "select count(*) totalCount1 from prpl";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+uname+"%");
			}
		map = jdbcUtils.findSimpleResult(sql, params);
		count = Integer.parseInt(map.get("totalCount1").toString());
			
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
	public int getneplCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql="select count(*) totalCount2 from nepl where  uname like ?";		
			if(uname.equals("")){
				sql = "select count(*) totalCount2 from nepl";
				
			}else{
				params = new ArrayList<Object>();
				params.add("%"+uname+"%");
			}
		map = jdbcUtils.findSimpleResult(sql, params);
		count = Integer.parseInt(map.get("totalCount2").toString());
			
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
	public int getreplCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql="select count(*) totalCount from repl where  uname like ?";		
			if(uname.equals("")){
				sql = "select count(*) totalCount from repl";
				
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
	public int getfavCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql="select count(*) totalCount from favourite where  uname like ?";		
			if(uname.equals("")){
				sql = "select count(*) totalCount from favourite";
				
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
	public int gethfCount(String uname) {
		// TODO Auto-generated method stub
		int count = 0;
		System.out.println("llllllllllllllllll:"+uname);
		Map<String, Object> map = null;
		List<Object> params = null;		
		try {
			jdbcUtils.getConnection();			
			String sql="select count(*) totalCount from huifu where uname like ?";	
			if(uname.equals("")){
				sql = "select count(*) totalCount from huifu";
				
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
	public boolean del_nepl(String[] ids) {
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
	public boolean del_repl(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from repl where replid = '"+ids[i]+"'";
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
	public boolean del_fav(String[] ids) {
		boolean flag = false;
		try {
			jdbcUtils.getConnection();
			if (ids!=null) {
				String[] sql = new String[ids.length];
				for(int i = 0 ; i< ids.length; i++){
					sql[i] = "delete from favourite where favid = '"+ids[i]+"'";
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
	public boolean del_prpl(String[] ids) {
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
	public Map<String, Object> view_repl(String replid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(replid);
			String sql = "select * from repl where replid = ?";
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
	public Map<String, Object> view_nepl(String neplid) {
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
	public Map<String, Object> view_prpl(String prplid) {
		// TODO Auto-generated method stub
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
	public Map<String, Object> view_huifu(String huiid) {
		// TODO Auto-generated method stub
		Map<String, Object> map = null;
		try {
			jdbcUtils.getConnection();
			List<Object> params = new ArrayList<Object>();
			params.add(huiid);
			String sql = "select * from huifu where huiid = ?";
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