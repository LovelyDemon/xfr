package com.change;

import java.util.List;
import java.util.Map;

public interface ScenicService {	
	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listScenic(String scname , int start , int end);
	//获取总的记录数
	public int getItemCount(String scname);
	//批处理删除产品
	public boolean delScenic(String[] ids);
	//查询单个产品
	public Map<String, Object> viewScenic(String neid);
}