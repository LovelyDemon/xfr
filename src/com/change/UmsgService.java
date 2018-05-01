package com.change;

import java.util.List;
import java.util.Map;

public interface UmsgService {	
	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> list_hf(String uname, int start , int end);
	//获取总的记录数
	public List<Map<String, Object>> list_prpl(String prname ,String uname, int start , int end);
	//获取评论记录数
	public List<Map<String, Object>> list_repl(String rename ,String uname, int start , int end);
	public List<Map<String, Object>> list_nepl(String nename ,String uname, int start , int end);
	public List<Map<String, Object>> list_fav(String rename ,String uname, int start , int end);

	public int gethfCount(String uname);
	public int getreplCount(String uname);
	public int getneplCount(String uname);
	public int getprplCount(String uname);
	public int getfavCount(String uname);
	//批处理删除产品
	public boolean del_repl(String[] ids);
	public boolean del_nepl(String[] ids);
	public boolean del_prpl(String[] ids);
	public boolean del_fav(String[] ids);
	//查询单个产品
	
	//添加评论
	public Map<String, Object> view_prpl(String prplid);
	public Map<String, Object> view_nepl(String neplid);
	public Map<String, Object> view_repl(String replid);
	public Map<String, Object> view_huifu(String huiid);
}