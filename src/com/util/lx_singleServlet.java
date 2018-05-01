package com.util; 
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class lx_singleServlet implements javax.servlet.Servlet{ 
	 public void doPost(HttpServletRequest request,HttpServletResponse response)
	 throws ServletException,IOException{
		// response.sendRedirect("index.jsp");
		 request.setCharacterEncoding("UTF-8");
		 String lxName = request.getParameter("lxname");//取得用户名
		 request.setCharacterEncoding("UTF-8");
		 String lxsub = request.getParameter("lxsub");//取得密码
		 request.setCharacterEncoding("UTF-8");
		 String lxid = request.getParameter("lxid");//取得留言id
			 request.getSession().setAttribute("lxName",lxName);
			 request.getSession().setAttribute("lxsub",lxsub);
			 request.getSession().setAttribute("lxid",lxid);
			 response.sendRedirect("lx_hf.jsp");
	
		
		 
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