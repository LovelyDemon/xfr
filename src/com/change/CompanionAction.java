package com.change;

import com.util.DividePage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

public class CompanionAction extends HttpServlet {

	private CompanionService service;

	public CompanionAction() {
		super();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String actionFlag = request.getParameter("action_flag");
		if ("search".equals(actionFlag)) {
			search(request,response);
		} else if ("front_search".equals(actionFlag)) {
			frontSearch(request,response);
		} else if ("delete".equals(actionFlag)) {
			deleteBatch(request,response);
		} else if ("view".equals(actionFlag)) {
			getDetail(request,response);
		} else if (actionFlag.equals("pl_search")) {
			listpl(request,response);
		} else if (actionFlag.equals("pl_del")) {
			delpl(request,response);
		} else if (actionFlag.equals("pl_view")) {
			viewpl_ht(request,response);
		}
		out.flush();
		out.close();
	}

	private void getDetail(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Map<String, Object> map = service.getDetail(id);
		request.setAttribute("detailMap", map);
		try {
			request.getRequestDispatcher("/admin/companion_detail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}
	
	private void viewpl_ht(HttpServletRequest request,
			HttpServletResponse response) {
		String prplid = request.getParameter("prplid");
		Map<String, Object> map = service.viewpl_ht(prplid);
		request.setAttribute("prplMap", map);
		try {
			request.getRequestDispatcher("/admin/sppl_view.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}

	/**
	 * 批量删除
	 *
	 * @param request
	 * @param response
	 */
	private void deleteBatch(HttpServletRequest request, HttpServletResponse response) {
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		boolean flag = service.deleteBatch(ids);
		if (flag) {
			try {
				request.getRequestDispatcher("/admin/getCompanion.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void delpl(HttpServletRequest request,
			HttpServletResponse response) {
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		boolean flag = service.delpl(ids);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='sppl_manager.jsp'</script>";
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println(script);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}		
	}
	
	private void search(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String pageNum = request.getParameter("pageNum");
		if (title == null) {
			title = "";
		}
		//获取总的记录数
		int totalRecord = service.getCount(title);
		int currentPage = 1;
		//默认第一页开始
		DividePage dividePage = new DividePage(5, totalRecord);
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();
		
		List<Map<String, Object>> list;
		try {
			list = service.getListByPage(title , start , end);
			request.setAttribute("getListByPage", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("title",title );
			request.getRequestDispatcher("/admin/getCompanion.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 前台搜索列表
	 *
	 * @param request  请求参数
	 * @param response 响应参数
	 */
	private void frontSearch(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String pageNum = request.getParameter("pageNum");
		if (title == null) {
			title = "";
		}
		//获取总的记录数
		int totalRecord = service.getCount(title);
		int currentPage = 1;
		//默认第一页开始
		DividePage dividePage = new DividePage(8, totalRecord);
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
			dividePage.setCurrentPage(currentPage);
		}

		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();

		List<Map<String, Object>> list;
		try {
			list = service.getListByPage(title, start, end);
			request.setAttribute("getListByPage", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("title", title);
			request.getRequestDispatcher("/companion_list.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void listpl(HttpServletRequest request,
			HttpServletResponse response) {
		String productName = request.getParameter("prname");	
		String pageNum = request.getParameter("pageNum");
		if (productName == null) {
			productName = "";
		}

		int totalRecord = service.getplItemCount(productName) ; //获取总的评论数
		int currentPage = 1;
		DividePage dividePage = new DividePage(5, totalRecord);//默认第一页开始
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();
		
		List<Map<String, Object>> list = null;
		try {
			list = service.listpl_ht(productName , start , end);
			request.setAttribute("listpl", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("productName",productName );
			request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}

	@Override
	public void init() throws ServletException {
		// Put your code here
		service = new CompanionServiceImpl();
	}

}