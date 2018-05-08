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

public class ScenicfAction extends HttpServlet {

	private ScenicService service;

	public ScenicfAction() {
		super();
	}

	@Override
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String action_flag = request.getParameter("action_flag");
		if (action_flag.equals("search")) {
			listScenic(request,response);
		}
		else if (action_flag.equals("view")) {
			viewScenic(request,response);
		}
		
		
		out.flush();
		out.close();
	}

	private void viewScenic(HttpServletRequest request,
			HttpServletResponse response) {
		String scid = request.getParameter("scid");
		Map<String, Object> map = service.viewScenic(scid);
		request.setAttribute("scenicMap", map);
		try {
			request.getRequestDispatcher("/scenic_single.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
	}


	private void listScenic(HttpServletRequest request, HttpServletResponse response) {
		String scenicName = request.getParameter("scname");	
		String pageNum = request.getParameter("pageNum");
		if (scenicName == null) {
			scenicName = "";
		}

		int totalRecord = service.getCount(scenicName); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(20, totalRecord);//默认第一页开始
		if (pageNum != null) {

			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.listScenic(scenicName , start , end);
			request.setAttribute("listScenic", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("scenicName",scenicName );
			request.getRequestDispatcher("/scenic.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
	}

	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
		service = new ScenicDao();
	}

}