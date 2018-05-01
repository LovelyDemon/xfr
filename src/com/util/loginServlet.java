package com.util;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class loginServlet implements javax.servlet.Servlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("uname");//取得用户名
		String password = request.getParameter("upass");
		String utypeInDB = null;
		DBUtil db = new DBUtil();//构建数据库对象
		String a = db.loginSuccess(userName, password, utypeInDB);
		if (a != null) {//根据登陆情况，跳转页面
			//request.getSession().setAttribute("userName",userName);
			System.out.println("logservlet");
			System.out.println(a);
			response.sendRedirect("index.jsp");
			request.getSession().setAttribute("userName", userName);
			request.getSession().setAttribute("uType", a);

			// response.sendRedirect("index.jsp");
		} else {

			String script = "<script> alert('用户名或密码错误，请重新登陆');location.href='login.jsp'</script>";
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

