<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>注销</title>
 </head>
 <body> 

  <%
   session.invalidate(); // 注销 session 
   response.setHeader("refresh", "2; URL = login.jsp");  // 定时跳转
  %>

 </body>
</html>