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
	/**
	 * Constructor of the object.
	 */
	public ScenicfAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String action_flag = request.getParameter("action_flag");
		//if (action_flag.equals("add")) {
		//	addProduct(request,response);
		//}else
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
		// TODO Auto-generated method stub
		String scid = request.getParameter("scid");
		Map<String, Object> map = service.viewScenic(scid);
		request.setAttribute("scenicMap", map);
		try {
			request.getRequestDispatcher("/scenic_single.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}


	private void listScenic(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String scenicName = request.getParameter("scname");	
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (scenicName == null) {
			scenicName = "";
		}

		int totalRecord = service.getItemCount(scenicName); //获取总的记录数
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
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}

	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		service = new ScenicDao();
	}

}