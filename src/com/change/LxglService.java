package com.change;

import java.util.List;
import java.util.Map;

public interface LxglService {	
	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listLxgl(String uname , int start , int end);
	//获取总的记录数
	public int getItemCount(String uname);
	//批处理删除产品
	public boolean delLxgl(String[] ids);
	//查询单个产品
	public Map<String, Object> viewLxgl(String lxid);
}