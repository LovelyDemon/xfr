package com.change;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.util.DividePage;

public class ProductfAction extends HttpServlet {
	 boolean bInited = false;
	private CompanionService service;
	/**
	 * Constructor of the object.
	 */
	public ProductfAction() {
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
	
	public void initJDBC() throws ClassNotFoundException {
		 //加载MYSQL JDBC驱动程序
		 Class.forName("com.mysql.jdbc.Driver");
		 bInited = true;
		 System.out.println("Success loading Mysql Driver!");
		 }
		 
	public Connection getConnection() throws ClassNotFoundException,
		 SQLException{
		 if(!bInited){
		 initJDBC();
		 }
		 //连接URL为 jdbc:mysql//服务器地址/数据库名
		 //后面的2个参数分别是登陆用户名和密码
		 Connection conn = DriverManager.getConnection(
		 "jdbc:mysql://localhost:3306/zhly","root","root");
		 return conn;
		 }
	
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
			listProduct(request,response);
		}else if (action_flag.equals("view")) {
			viewProduct(request,response);
		}else if (action_flag.equals("list")) {
			listpl(request,response);
		}else if (action_flag.equals("add")) {
			addpl(request,response);
		}
		
		
		out.flush();
		out.close();
	}

	private void listpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("参数 plllll");
		String prid = request.getParameter("prid");	
		
	
		request.getSession().setAttribute("priiid",prid);
		Map<String, Object> map = service.getDetail(prid);
		request.setAttribute("productMap", map);
		
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (prid == null) {
			prid = "";
		}

		int totalRecord = service.getplCount(""); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(10, totalRecord);//默认第一页开始
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
			list = service.listpl(prid , start , end);
			request.setAttribute("listpl", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("prid",prid );
			request.getRequestDispatcher("/product_single.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}

	private void addpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String priid = request.getParameter("prid");
		String prplnr = request.getParameter("prplnr");
		System.out.println("aaa"+prplnr);
		String uname = (String)request.getSession().getAttribute("userName");
		System.out.println("flag:");
		
		
		String prname="";
		 Connection conne = null;
		 Statement stmtt = null;
		 ResultSet rss = null;
		
			try {
				conne = getConnection();
				 stmtt = conne.createStatement();
				 System.out.println(" jieshao!");
				 rss = stmtt.executeQuery("SELECT * FROM product where prid='"+priid+"'");
				 while(rss.next()){
					 prname=rss.getString("prname");		
					 System.out.println(" pinglun!"+prname);
					 }
				 
				 String flag = service.addpl(priid,prname,prplnr,uname);
				if (flag=="b") {
					String script = "<script> alert('发表评论成功！');location.href='ProductfAction?action_flag=view&prid="+priid+"'</script>";
					 response.setContentType("text/html;charset=UTF-8"); 
					 response.getWriter().println(script);}
				if (flag=="c") {
					String script = "<script> alert('发表评论失败，评论内容不得为空！');location.href='ProductfAction?action_flag=view&prid="+priid+"'</script>";
					 response.setContentType("text/html;charset=UTF-8"); 
					 response.getWriter().println(script);}
		
		else
		{String script = "<script> alert('发表评论失败，请先登录！ ');location.href='ProductfAction?action_flag=view&prid="+priid+"'</script>";
		 response.setContentType("text/html;charset=UTF-8"); 
		 response.getWriter().println(script);}}
		 catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	
	private void viewProduct(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String prid = request.getParameter("prid");
		request.getSession().setAttribute("priiid",prid);
		Map<String, Object> map = service.getDetail(prid);
		request.setAttribute("productMap", map);
		try {
			request.getRequestDispatcher("/product_single.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}


	private void listProduct(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String productName = request.getParameter("prname");	
		String pageNum = request.getParameter("pageNum");
		System.out.println("参数 pageNum :"+pageNum);
		if (productName == null) {
			productName = "";
		}

		int totalRecord = service.getCount(productName); //获取总的记录数
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
			list = service.getListByPage(productName , start , end);
			request.setAttribute("getListByPage", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("productName",productName );
			request.getRequestDispatcher("/product.jsp").forward(request, response);
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
		service = new CompanionServiceImpl();
	}

}