package com.util; 
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class orderServlet implements javax.servlet.Servlet{ 
	 public void doPost(HttpServletRequest request,HttpServletResponse response)
	 throws ServletException,IOException{
		// response.sendRedirect("index.jsp");
		 request.setCharacterEncoding("UTF-8");
		 String honame = request.getParameter("ordname");//取得密码
		 request.setCharacterEncoding("UTF-8");
		 String ordkind = request.getParameter("ordkind");//取得电话
		 request.setCharacterEncoding("UTF-8");
		 String ordphone = request.getParameter("ordphone");//取得邮箱
		 request.setCharacterEncoding("UTF-8");
		 String orddate = request.getParameter("orddate");//取得邮箱
		 request.setCharacterEncoding("UTF-8");
		 String ordlong = request.getParameter("ordlong");//取得邮箱
		 request.setCharacterEncoding("UTF-8");
		 String ordbz = request.getParameter("ordbz");//取得邮箱
		 String orduname = (String)request.getSession().getAttribute("userName");
		 String hoid = (String)request.getSession().getAttribute("hoid");
		   DBUtil db = new DBUtil();
		   
		   String adorder=db.adorder(hoid,honame,ordkind,ordphone,orddate,ordlong,ordbz,orduname);
		 if(adorder=="b"){//判断用户是否已经存在

			 String script = "<script> alert('预订请求发送成功！我们将于24小时内受理您的预定请求，请于后台查看预订是否成功！');location.href='hotel.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 if(adorder=="c"){//判断用户是否已经存在

			 String script = "<script> alert('留言失败！预订信息均不得为空！');location.href='hotel.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 else{
			 
			 String script = "<script> alert('留言失败!登陆后预订酒店！');location.href='login.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);

		 }
		 }
	 public void destroy() { 
	 }

	 public ServletConfig getServletConfig() {
	  return null;
	 }

	 public String getServletInfo() {
	  return null;
	 }

	 public void init(ServletConfig arg0) throws ServletException {  
	 }

	 public void service(ServletRequest request, ServletResponse response)
	   throws ServletException, IOException {
	  HttpServletRequest rq = (HttpServletRequest)request;
	  HttpServletResponse rs = (HttpServletResponse) response;
	  doPost(rq,rs);

	 }
}