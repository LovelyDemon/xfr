package com.change;

import java.util.List;
import java.util.Map;

public interface CompanionService {
	/**
	 * 分页获取列表
	 *
	 * @param title 标题
	 * @param start 起始行
	 * @param end   结束行
	 * @return 列表
	 */
	List<Map<String, Object>> getListByPage(String title, int start, int end);

	List<Map<String, Object>> listpl(String prid , int start , int end);
	List<Map<String, Object>> listpl_ht(String proname , int start , int end);
	//获取评论记录数

	/**
	 * 获取总的记录数
	 *
	 * @param title 标题
	 * @return 记录数
	 */
	int getCount(String title);
	int getplCount(String prid);
	int getplItemCount(String prname);

	/**
	 * 批量删除
	 *
	 * @param ids id列表
	 * @return 成功与否
	 */
	boolean deleteBatch(String[] ids);
	boolean delpl(String[] ids);
	//查询单个产品
	String addpl(String prid,String prname,String prplnr,String uname);
	//添加评论

	/**
	 * 获取详情
	 *
	 * @param id ID
	 * @return Map
	 */
	Map<String, Object> getDetail(String id);
	Map<String, Object> viewpl(String prid);
	Map<String, Object> viewpl_ht(String prid);
}