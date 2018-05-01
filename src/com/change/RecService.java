package com.change;

import java.util.List;
import java.util.Map;

public interface RecService {	
	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listRec(String rename , int start , int end);
	//获取总的记录数
	public List<Map<String, Object>> listpl(String reid , int start , int end);
	//获取评论记录数
	public List<Map<String, Object>> listpl_ht(String rename , int start , int end);
	public int getItemCount(String rename);
	public int getplCount(String reid);
	public int getplItemCount(String rename);
	//批处理删除产品
	public boolean delRec(String[] ids);
	public boolean delpl(String[] ids);

	//查询单个产品
	public String addpl(String reid,String rename,String replnr,String uname);
	public void like(String reid);
	public String fav(String reid,String rename,String userName);
	//添加评论
	public Map<String, Object> viewRec(String reid);
	public Map<String, Object> viewpl(String reid);
	public Map<String, Object> viewpl_ht(String reid);
}