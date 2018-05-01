package com.util; 
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class lx_hfServlet implements javax.servlet.Servlet{ 
	 public void doPost(HttpServletRequest request,HttpServletResponse response)
	 throws ServletException,IOException{
		// response.sendRedirect("index.jsp");
		 request.setCharacterEncoding("UTF-8");
		 String lxname = request.getParameter("lxname");//取得用户名
		 request.setCharacterEncoding("UTF-8");
		 String sub = request.getParameter("sub");//取得回复主题
		 request.setCharacterEncoding("UTF-8");
		 String huinr = request.getParameter("huinr");//取得回复内容
		 String id = (String)request.getSession().getAttribute("lxid");
	
		 DBUtil db = new DBUtil();//构建数据库对象
		 boolean ifhuifu = db.huifu(lxname,sub,huinr,id);
		 if(ifhuifu){//判断用户是否已经存在
			 
			 String script = "<script> alert('回复成功！');location.href='lxgl.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 else{
			 
			 String script = "<script> alert('回复失败!请检查回复内容不得为空!');location.href='lxgl.jsp'</script>";
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