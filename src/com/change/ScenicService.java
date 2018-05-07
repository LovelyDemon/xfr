package com.change;

import java.util.List;
import java.util.Map;

public interface ScenicService {	
	//列出产品,为了分页，加上参数 start,end
	List<Map<String, Object>> listScenic(String scname , int start , int end);

	/**
	 * 获取总的记录数
	 *
	 * @param scname 名称
	 * @return 数据库记录总数
	 */
	int getCount(String scname);

	//批处理删除产品
	boolean delScenic(String[] ids);
	//查询单个产品
	Map<String, Object> viewScenic(String neid);
}