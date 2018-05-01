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


public class OrderAction extends HttpServlet {
	

	private OrderService service;
	/**
	 * Constructor of the object.
	 */
	public OrderAction() {
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
		 if (action_flag.equals("search")) {
			listorder(request,response);
		}else if (action_flag.equals("del")) {
			delorder(request,response);
		}else if (action_flag.equals("view")) {
			vieworder(request,response);
		}else if (action_flag.equals("agree")) {
			agreeorder(request,response);
		}else if (action_flag.equals("refuse")) {
			refuseorder(request,response);
		}
		
		
		out.flush();
		out.close();
	}

	private void vieworder(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordid = request.getParameter("ordid");
		String uname = (String)request.getSession().getAttribute("userName");
		String utype = (String)request.getSession().getAttribute("uType");
		Map<String, Object> map = service.vieworder(ordid);
		request.setAttribute("orderMap", map);
		try {
			if(utype.equals("admin") ){
			request.getRequestDispatcher("/admin/order_single.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("/admin/order_usingle.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	private void agreeorder(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordid = request.getParameter("ordid");
		String honame = request.getParameter("honame");
		String uname = (String)request.getSession().getAttribute("userName");
		String utype = (String)request.getSession().getAttribute("uType");
		boolean flag = service.agreeorder(ordid,honame);
		
			try {
				if (flag) {
				String script = "<script> alert('已经通过用户预订申请！订单生效！');location.href='OrderAction?action_flag=view&ordid="+ordid+"'</script>";
				 response.setContentType("text/html;charset=UTF-8"); 
				 response.getWriter().println(script);
				}
				else
				{
					String script = "<script> alert('操作失败，请重试！');location.href='OrderAction?action_flag=view&ordid="+ordid+"'</script>";
					 response.setContentType("text/html;charset=UTF-8"); 
					 response.getWriter().println(script);
				}
				 } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	
	private void refuseorder(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String ordid = request.getParameter("ordid");
		String honame = request.getParameter("honame");
		String uname = (String)request.getSession().getAttribute("userName");
		String utype = (String)request.getSession().getAttribute("uType");
		boolean flag = service.refuseorder(ordid,honame);
		
			try {
				if (flag) {
				String script = "<script> alert('已经拒绝用户预订申请！');location.href='OrderAction?action_flag=view&ordid="+ordid+"'</script>";
				 response.setContentType("text/html;charset=UTF-8"); 
				 response.getWriter().println(script);
				}
				else
				{
					String script = "<script> alert('操作失败，请重试！');location.href='OrderAction?action_flag=view&ordid="+ordid+"'</script>";
					 response.setContentType("text/html;charset=UTF-8"); 
					 response.getWriter().println(script);
				}
				 } catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	

	/**批量删除产品
	 * @param request
	 * @param response
	 */
	private void delorder(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.delorder(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				request.getRequestDispatcher("/admin/order_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}

	private void listorder(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String uname = (String)request.getSession().getAttribute("userName");
		String utype = (String)request.getSession().getAttribute("uType");
		System.out.println(utype);
		String hotelName = request.getParameter("honame");	
		String pageNum = request.getParameter("pageNum");
		
		if (hotelName == null) {
			hotelName = "";
		}
		
		
		
		int totalRecord = service.getItemCount(hotelName); //获取总的记录数
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
			list = service.listorder(hotelName ,utype,uname,start ,end);
			request.setAttribute("listorder", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("hotelName",hotelName );
			if(utype.equals("admin") ){
				request.getRequestDispatcher("/admin/order_manager.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("/admin/order_umanager.jsp").forward(request, response);
				}
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
		service = new OrderDao();
	}

}