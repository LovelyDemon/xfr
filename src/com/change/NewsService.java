package com.change;

import java.util.List;
import java.util.Map;

public interface NewsService {	
	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listNews(String nename , int start , int end);
		//获取总的记录数
	public List<Map<String, Object>> listpl(String neid , int start , int end);
	//获取评论记录数
	public List<Map<String, Object>> listpl_ht(String nename, int start , int end);
	public int getItemCount(String nename);
	public int getplCount(String neid);
	public int getplItemCount(String nename);
	//批处理删除产品
	public boolean delNews(String[] ids);
	public boolean delpl(String[] ids);
	//查询单个产品
	public String addpl(String neid,String nename,String neplnr,String uname);
	//添加评论
	public Map<String, Object> viewNews(String neid);
	
	public Map<String, Object> viewpl(String neid);

	public Map<String, Object> viewpl_ht(String neid);
}