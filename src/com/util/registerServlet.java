package com.util; 
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class registerServlet implements javax.servlet.Servlet{ 
	 public void doPost(HttpServletRequest request,HttpServletResponse response)
	 throws ServletException,IOException{
		// response.sendRedirect("index.jsp");
		 request.setCharacterEncoding("UTF-8");
		 String ruName = request.getParameter("runame");//取得用户名
		 String rupass = request.getParameter("rupass");//取得密码
		 String ruphone = request.getParameter("ruphone");//取得电话
		 request.setCharacterEncoding("UTF-8");
		 String rumail = request.getParameter("rumail");//取得邮箱
	
		 DBUtil db = new DBUtil();//构建数据库对象
		 boolean ifhas = db.ifhas(ruName,rupass,ruphone,rumail);
		 if(ifhas){//判断用户是否已经存在
			 request.getSession().setAttribute("ruName",ruName);
			 request.getSession().setAttribute("rupass",rupass);
			 request.getSession().setAttribute("ruphone",ruphone);
			 request.getSession().setAttribute("rumail",rumail);
			 
			 
			 String script = "<script> alert('注册成功！');location.href='login.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 else{
			 
			 String script = "<script> alert('用户名已被占用，请重新输入!');location.href='register.jsp'</script>";
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