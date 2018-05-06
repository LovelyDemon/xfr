package com.util; 
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//import javax.jms.Session;

public class contactServlet implements javax.servlet.Servlet{ 
	 public void doPost(HttpServletRequest request,HttpServletResponse response)
	 throws ServletException,IOException{
		// response.sendRedirect("index.jsp");
		 request.setCharacterEncoding("UTF-8");
		 String lxmail = request.getParameter("lxmail");//取得邮箱
		 String lxsub = request.getParameter("lxsub");//取得主题
		 request.setCharacterEncoding("UTF-8");
		 String lxnr = request.getParameter("lxnr");//取得内容
		 String a = (String)request.getSession().getAttribute("userName");
		   DBUtil db = new DBUtil();
		   String ifuser = db.ifuser(a,lxmail,lxsub,lxnr);
		 if(ifuser=="b"){//判断用户是否已经存在

			 String script = "<script> alert('留言成功！');location.href='contact.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 if(ifuser=="c"){//判断用户是否已经存在

			 String script = "<script> alert('留言失败！请输入完整信息！');location.href='contact.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
	
		// response.sendRedirect("index.jsp");
		 }
		 else{
			 
			 String script = "<script> alert('留言失败!登陆后方可联系我们！');location.href='login.jsp'</script>";
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