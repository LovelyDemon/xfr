package com.change;

import java.util.List;
import java.util.Map;

public interface OrderService {	
	public boolean addorder(List<Object> params);

	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listorder(String honame , String utype,String uname,int start , int end);
	//获取总的记录数
	public int getItemCount(String honame);
	//批处理删除产品
	public boolean delorder(String[] ids);
	//
	public boolean agreeorder(String ordid,String honame);
	public boolean refuseorder(String ordid,String honame);
	//查询单个产品
	public Map<String, Object> vieworder(String ordid);
	public int getnum();
}