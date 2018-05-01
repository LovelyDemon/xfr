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

public class RecAction extends HttpServlet {

	private RecService service;
	/**
	 * Constructor of the object.
	 */
	public RecAction() {
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
			listRec(request,response);
		}else if (action_flag.equals("del")) {
			System.out.print("dell!");
			
			delRec(request,response);
		}else if (action_flag.equals("view")) {
			viewRec(request,response);
		}
		else if (action_flag.equals("pl_search")) {
			listpl(request,response);
		}
		else if (action_flag.equals("pl_del")) {
			delpl(request,response);
		}
		else if (action_flag.equals("pl_view")) {
			viewpl_ht(request,response);
		}
		
		out.flush();
		out.close();
	}

	private void viewRec(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String reid = request.getParameter("reid");
		Map<String, Object> map = service.viewRec(reid);
		request.setAttribute("recMap", map);
		try {
			request.getRequestDispatcher("/admin/rec_change.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

	private void viewpl_ht(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String replid = request.getParameter("replid");
		Map<String, Object> map = service.viewpl_ht(replid);
		request.setAttribute("replMap", map);
		try {
			request.getRequestDispatcher("/admin/repl_view.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	/**批量删除产品
	 * @param request
	 * @param response
	 */
	private void delRec(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.delRec(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				
				request.getRequestDispatcher("/admin/rec_main.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}

	private void delpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.delpl(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='repl_manager.jsp'</script>";
         		  response.setContentType("text/html;charset=UTF-8"); 
         		  response.getWriter().println(script);
				//request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}
	
	private void listRec(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String recName = request.getParameter("rename");	
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (recName == null) {
			recName = "";
		}

		int totalRecord = service.getItemCount(recName); //获取总的记录数
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
			list = service.listRec(recName , start , end);
			request.setAttribute("listRec", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("recName",recName );
			request.getRequestDispatcher("/admin/rec_main.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}

	private void listpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String recName = request.getParameter("rename");	
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (recName == null) {
			recName = "";
		}

		int totalRecord = service.getplItemCount(recName) ; //获取总的评论数
		System.out.println("总评论数"+totalRecord);
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
			list = service.listpl_ht(recName , start , end);
			request.setAttribute("listpl", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("recName",recName );
			request.getRequestDispatcher("/admin/repl_manager.jsp").forward(request, response);
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
		service = new RecDao();
	}

}