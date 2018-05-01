<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp" />
<%@page import="com.util.DBUtil"%>
<%@page import="my.jianjie"%>
<body>

<jsp:include page="navigationBar.jsp"/>

<div class="about">	
<% 
									jianjie a=new jianjie();
									DBUtil db = new DBUtil();//构建数据库对象
         							db.tiqujie(a); 
         							String jie =a.getJieshao();//取得用户名
	 								String wen = a.getWenhua();//取得密码
         							System.out.print(a.jieshao);
         							System.out.print(wen);
         							%>
	<div class="about-head"><h3>新叶简介</h3>
				<div class="about-in">
					<a href="#"><img src="images/at.jpg" alt="image" class="img-responsive ">	</a>			
					<h6><a href="#">新叶简介</a></h6>
					<p><%out.print(jie); %></p>
				</div>
		
	</div>
	<!---->
	<div class="about-middle">
		<div class="container">		
			<div class="col-md-8 about-mid">
				<h4>新叶文化</h4>
				<h6>这里有多种多样的民俗文化</a> </h6>
				<p ><%out.print(wen); %></p>
			</div>
			
			<div class="clearfix"> </div>
		</div>
	</div>
	<!---->


	<!----><!---->

</div>
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>