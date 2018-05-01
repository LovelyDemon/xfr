<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.HotelfAction"%>
<%@page import="com.change.HotelDao"%>
<%@page import="com.change.HotelService"%>
<%@page import="my.scenic_add"%>

<%@page import="com.util.DBUtil"%>
<jsp:include page="top.jsp" />
<body>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("hotelMap");
%>
<!---->

<jsp:include page="navigationBar.jsp"/>

<div class="container">
	<div class="future">
	    <h3>酒店详情</h3>
	<div class="buy-single-single">
	
			<div class="col-md-9 single-box">
				
       <div class=" buying-top">	
			<div class="flexslider">
  <ul class="slides" >
    <li data-thumb="<%=path%>/upload/<%=map.get("hopic1") %>" >
      <img src="<%=path%>/upload/<%=map.get("hopic1") %>" style="height: 400px;"/>
    </li>
    <li data-thumb="<%=path%>/upload/<%=map.get("hopic2") %>">
      <img src="<%=path%>/upload/<%=map.get("hopic2") %>" style="height: 400px; "/>
    </li>
    <li data-thumb="<%=path%>/upload/<%=map.get("hopic3") %>">
      <img src="<%=path%>/upload/<%=map.get("hopic3") %>" style="height: 400px;  "/>
    </li>
    <li data-thumb="<%=path%>/upload/<%=map.get("hopic4") %>">
      <img src="<%=path%>/upload/<%=map.get("hopic4") %>" style="height: 400px;"/>
    </li>
  </ul>
</div>
<!-- FlexSlider -->
  <script defer src="js/jquery.flexslider.js"></script>
<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
</div>
<div class="buy-sin-single">
			<div class="col-sm-5 middle-side immediate">
					     <h4>酒店名称: <%=map.get("honame") %></h4>
					     <p>酒店位置: <span class="two"><%=map.get("holocal") %></span></p>
					     <p>标间数量: <span class="two"><%=map.get("biaonum") %></span></p>
					     <p>标间价格: <span class="two"><%=map.get("biaojg") %></span></p>
					     <p>大床房数量:<span class="two"> <%=map.get("danum") %></span></p>
						 <p>大床房价格: <span class="two"><%=map.get("dajg") %></span></p>
						 <p>热度 :<span class="two"> <%=map.get("ordernum") %></span></p>				 
						<div class="   right-side">
							 <a href="<%=path%>/HotelfAction?action_flag=order&hoid=<%=map.get("hoid") %>" class="hvr-sweep-to-right more" >预订酒店</a>     
					 </div>
					</div>
					 <div class="col-sm-7 buy-sin">
					 	<h4>酒店介绍</h4>
					 	<p><%=map.get("hojs") %></p></div>
					 <div class="clearfix"> </div>
					</div>
					 
					
		</div>
	

			
		
		<div class="col-md-3">
			<div class="single-box-right right-immediate">
		     	<h4><b>推荐景点</b></h4>
		     	<% 
									scenic_add s1=new scenic_add();
									scenic_add s2=new scenic_add();
									scenic_add s3=new scenic_add();
									scenic_add s4=new scenic_add();
									scenic_add s5=new scenic_add();
									DBUtil dbbb1 = new DBUtil();//构建数据库对象
									String ss1="1";
         							dbbb1.tiquscenic(s1,ss1); 
	 								String scname1 = s1.getscname();//取得新闻标题
	 								String sctj1 = s1.getsctj();//取得新闻摘要
	 								
         							String ss2="2";
         							dbbb1.tiquscenic(s2,ss2); 
	 								String scname2 = s2.getscname();//取得新闻标题
	 								String sctj2 = s1.getsctj();//取得新闻摘要
	 								
	 								String ss3="3";
         							dbbb1.tiquscenic(s3,ss3); 
	 								String scname3= s3.getscname();//取得新闻标题
	 								String sctj3 = s3.getsctj();//取得新闻摘要
	 								
	 								String ss4="4";
         							dbbb1.tiquscenic(s4,ss4); 
	 								String scname4 = s4.getscname();//取得新闻标题
	 								String sctj4 = s4.getsctj();//取得新闻摘要
	 								
	 								String ss5="5";
         							dbbb1.tiquscenic(s5,ss5); 
	 								String scname5 = s5.getscname();//取得新闻标题
	 								String sctj5 = s5.getsctj();//取得新闻摘要
	 								
	 							
         							%>
				<div class="single-box-img ">
					<div class="box-img">
						<a href="ScenicfAction?action_flag=view&scid=1"><img class="img-responsive" src="images/sl.jpg" alt=""></a>
					</div>
					<div class="box-text">
						<p><%out.print(scname1); %></p>
						<a href="ScenicfAction?action_flag=view&scid=1" class="in-box">查看</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="single-box-img">
					<div class="box-img">
						<a href="ScenicfAction?action_flag=view&scid=2"><img class="img-responsive" src="images/sl1.jpg" alt=""></a>
					</div>
					<div class="box-text">
						<p><%out.print(scname2); %></p>
						<a href="ScenicfAction?action_flag=view&scid=2" class="in-box">查看</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="single-box-img">
					<div class="box-img">
						<a href="ScenicfAction?action_flag=view&scid=3"><img class="img-responsive" src="images/sl2.jpg" alt=""></a>
					</div>
					<div class="box-text">
						<p><a href="single.html"><%out.print(scname3); %></a></p>
						<a href="ScenicfAction?action_flag=view&scid=3" class="in-box">查看</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="single-box-img">
					<div class="box-img">
						<a href="ScenicfAction?action_flag=view&scid=4"><img class="img-responsive" src="images/sl3.jpg" alt=""></a>
					</div>
					<div class="box-text">
						<p><%out.print(scname4); %></p>
						<a href="ScenicfAction?action_flag=view&scid=4" class="in-box">详细</a>
					</div>
					<div class="clearfix"> </div>
				</div>
				<div class="single-box-img">
					<div class="box-img">
						<a href="ScenicfAction?action_flag=view&scid=5"><img class="img-responsive" src="images/sl4.jpg" alt=""></a>
					</div>
					<div class="box-text">
						<p><%out.print(scname5); %></p>
						<a href="ScenicfAction?action_flag=view&scid=5" class="in-box">查看</a>
					</div>
					<div class="clearfix"> </div>
				</div>
		 </div>
			
	  </div>
		<div class="clearfix"> </div>
		</div>
	</div>

<!---->

</div>
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>