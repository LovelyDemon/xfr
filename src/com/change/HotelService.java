package com.change;

import java.util.List;
import java.util.Map;

public interface HotelService {	
	public boolean addhotel(List<Object> params);

	//列出产品,为了分页，加上参数 start,end
	public List<Map<String, Object>> listhotel(String honame , int start , int end);
	//获取总的记录数
	public int getItemCount(String honame);
	//批处理删除产品
	public boolean delhotel(String[] ids);
	//查询单个产品
	public Map<String, Object> viewhotel(String hoid);
	public int getnum();
}