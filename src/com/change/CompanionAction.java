package com.change;

import com.util.DBUtil;
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

	private UadminService userService;

	public CompanionAction() {
		super();
		service = new CompanionServiceImpl();
		userService = new UadminDao();
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
			search(request, response);
		} else if ("front_search".equals(actionFlag)) {
			frontSearch(request, response);
		} else if ("delete".equals(actionFlag)) {
			deleteBatch(request, response);
		} else if ("front_view".equals(actionFlag)) {
			getFrontDetail(request, response);
		} else if ("view".equals(actionFlag)) {
			getDetail(request, response);
		} else if ("sign_up".equals(actionFlag)) {
			signUp(request, response);
		} else {
			publish(request, response);
		}
		out.flush();
		out.close();
	}

	private void publish(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			String title = request.getParameter("title");
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String location = request.getParameter("location");
			String limitNumStr = request.getParameter("limitNum");
			Integer limitNum = null;
			if (null != limitNumStr && !"".equals(limitNumStr)) {
				limitNum = Integer.parseInt(limitNumStr);
			}
			String phone = request.getParameter("phone");
			String detail = request.getParameter("detail");

			DBUtil db = new DBUtil();
			boolean success = db.addCompanion(title, startDate, endDate, location, limitNum, phone, detail);
			if (success) {
				String script = "<script> alert('添加成功');location.href='companion_list.jsp'</script>";
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println(script);
			} else {
				String script = "<script> alert('添加失败');location.href='companion_publish.jsp'</script>";
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println(script);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void getFrontDetail(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Map<String, Object> map = service.getDetail(id);
		request.setAttribute("detailMap", map);
		try {
			request.getRequestDispatcher("/companion_detail.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
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

	/**
	 * 组队报名
	 *
	 * @param request  请求参数
	 * @param response 响应参数
	 */
	private void signUp(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("userName");
		Long userId = Long.valueOf(userService.getUserIdByName(userName));
		Long companionId = Long.valueOf(request.getParameter("id"));
		try {
			Boolean signUp = service.signUp(companionId, userId);
			if (signUp) {
				String script = "<script> alert('报名成功！');location.href='CompanionAction?action_flag=front_view&id=" + companionId + "'</script>";
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println(script);
			} else {
				String script = "<script> alert('报名有误，请重新尝试!');location.href='CompanionAction?action_flag=front_view&id=" + companionId + "'</script>";
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println(script);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 是否已报名
	 *
	 * @param request  请求参数
	 * @param response 响应参数
	 */
	public Boolean isSignUp(HttpServletRequest request, HttpServletResponse response) {
		Boolean signUp = false;
		String userName = (String) request.getSession().getAttribute("userName");
		Long userId = Long.valueOf(userService.getUserIdByName(userName));
		Long companionId = Long.valueOf(request.getParameter("id"));
		try {
			signUp = service.isSignUp(companionId, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return signUp;
	}

	@Override
	public void init() throws ServletException {
		service = new CompanionServiceImpl();
		userService = new UadminDao();
	}

}