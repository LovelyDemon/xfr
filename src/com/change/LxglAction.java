package com.change;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;



import com.util.DividePage;
import com.util.UUIDTools;

public class LxglAction extends HttpServlet {

	private LxglService service;
	/**
	 * Constructor of the object.
	 */
	public LxglAction() {
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
		System.out.print("dell!");
		System.out.print(action_flag);
		if (action_flag.equals("search")) {
			listLxgl(request,response);
		}else if (action_flag.equals("del")) {
			System.out.print("dell!");
			
			delLxgl(request,response);
		}else if (action_flag.equals("view")) {
			viewLxgl(request,response);
		}
		
		
		
		out.flush();
		out.close();
	}

	private void viewLxgl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String lxid = request.getParameter("lxid");
		System.out.print(lxid);

		Map<String, Object> map = service.viewLxgl(lxid);
		request.setAttribute("lxglMap", map);
		try {
			request.getRequestDispatcher("/admin/lx_single.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	


	/**批量删除产品
	 * @param request
	 * @param response
	 */
	private void delLxgl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.delLxgl(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				
				request.getRequestDispatcher("/admin/lxgl.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}

	private void listLxgl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String userName = request.getParameter("uname");	
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (userName == null) {
			userName = "";
		}

		int totalRecord = service.getItemCount(userName); //获取总的记录数
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
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.listLxgl(userName , start , end);
			request.setAttribute("listNews", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("userName",userName );
			request.getRequestDispatcher("/admin/lxgl.jsp").forward(request, response);
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
		service = new LxglDao();
	}

}