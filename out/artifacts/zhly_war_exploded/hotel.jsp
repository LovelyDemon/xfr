<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.HotelfAction"%>
<%@page import="com.change.HotelDao"%>
<%@page import="com.change.HotelService"%>
<%@page import="com.util.DividePage"%>
<jsp:include page="top.jsp" />

<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//获取 session 中的 username;
String username = (String)session.getAttribute("username");
//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("listhotel");
// 获取 分页对象
DividePage dividePage = (DividePage) request.getAttribute("dividePage");
// 获取查询的关键词
String hotelName = (String) request.getAttribute("hotelName");
if(list==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	HotelService service = new HotelDao();
	int totalRecord = service.getItemCount("");
	dividePage = new DividePage(20,totalRecord,1);
	int start = dividePage.fromIndex();
	int end = dividePage.toIndex();
	list = service.listhotel("", start, end);
}
	
%>
 <head>
    <base href="<%=basePath%>">    
    <title>酒店</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function searchhotel(){
		var th = document.form2;
		th.action="<%=path%>/HotelfAction?action_flag=search";
		th.submit();
	}
	
	function first(){
		
		window.location.href = "<%=path%>/HotelfAction?action_flag=search&pageNum=1";
		
	}
	function next(){
		
		window.location.href = "<%=path%>/HotelfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";		
	
	}
	function forward(){
		
		window.location.href = "<%=path%>/HotelfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";
		
	}
	function end(){
		
		window.location.href = "<%=path%>/HotelfAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";
			
	}
	
	function changePage(currentPage){
	
		window.location.href = "<%=path%>/HotelfAction?action_flag=search&pageNum="+currentPage;
	
	}
	 
	function selectAll(flag){
		
		var ids = document.getElementsByName("ids");
		for(var i = 0 ; i < ids.length ; i++){
			ids[i].checked = flag;
		}
	
	}
	
	function getSelectedCount(){
	
		var ids = document.getElementsByName("ids");
		var count = 0;
		for(var i = 0 ; i < ids.length ; i++)
		{
						
			ids[i].checked==true?count++:0;					
		}
		return count;
	
	}
	
	function del(){
	
		if(getSelectedCount()==0){
			
			alert("至少选择一个删除项！");
			return;
		
		}
		var th = document.form1;
		th.action="<%=path%>/HotelfAction?action_flag=del";
		th.submit();		
		
	}
	
	function getSelectedValue(){
		var ids = document.getElementsByName("ids");
		
		for(var i = 0 ; i < ids.length ; i++)
		{
						
			if(ids[i].checked){
				return ids[i].value;
			}				
		}
		
	}
	
	function view(){
		
		var th = document.form1;
		th.action="<%=path%>/HotelfAction?action_flag=view&hoid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>

<body>

<jsp:include page="navigationBar.jsp"/>

<!--Dealers-->
<div class="career">
<div class="container">
	<h3>酒店信息</h3>
	<form class="form-horizontal"  name = "form2" action="" method="post" >
               <div class="blog-list">
	     	<h4 style="width: 1087px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp酒店名称&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp房间类型</h4></div>
			    <h4></h4><form style="height: 67px; ">
  
               <div class="   right-side">
               <br>
							 &nbsp&nbsp&nbsp<input type="text" class="form-control1" name="honame" value="<%= hotelName!=null?hotelName:"" %>"/>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<select class="in-drop" style="width: 239px; height: 30px">
					<option>大床房</option>
					<option>标准间</option>
					<option>其他</option>
				</select>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="button" class="hvr-sweep-to-right more"  onclick="searchhotel()">查找</button>     
						 </div>
			  </form>
              
			  </form>
	</div>

	<div class="container">
	
	<div class="buy-single">
		
		<div class="box-sin">
				<div class="buy-single">
		<div class="top-grid">
		<h3>酒店一览</h3></div>
		<div class="box-sin">
			<form class="form-horizontal" form name="form1" action="" method="post">
		<ul class="career-start">
		<div class="dealer-top">
		<%
   			if(list!=null && !list.isEmpty()){

   				for(Map<String,Object> map :list){
   				
   				%>
   				
				<div class="box-col">
				     <div class=" col-sm-7 left-side ">
						<img class="img-responsive" src="<%=path%>/upload/<%=map.get("hopic1") %>" alt="" style="height: 311px; width: 484px">
					</div>				
					<div class="  col-sm-5 middle-side">
					     <h4>酒店名称: <%=map.get("honame") %></h4>
					     <p>酒店位置: <span class="two"><%=map.get("holocal") %></span></p>
					     <p>大床房价格: <span class="two"><%=map.get("dajg") %></span></p>
					     <p>标间价格: <span class="two"><%=map.get("biaojg") %></span></p>
					     <p>热度:<span class="two"><%=map.get("ordernum") %></span></p>
										 
						<div class="   right-side">
							 <a href="HotelfAction?action_flag=view&hoid=<%=map.get("hoid") %>" class="hvr-sweep-to-right more" >详细</a>     
					  </div>
				  </div>
				 <div class="clearfix"> </div>
				</div>
				<% }
				}else{%>
   			
   			<tr align="center">
   				
   				<td></td>
   			
   			</tr><%
   			
   			}   			
   			 %>
		 	
		 	</ul>
		 	<div class="clearfix"> </div>
	
</form>
</div>





<div class="clearfix"> </div>
<div class="container" style="height: 39px; ">
	
		</div>
<center>
 	<tr style=" text-align: center; width: 733px" >
   		<td colspan="4" align="center">
   			共<%=dividePage.getPageCount()  %>页    
   			<a href="javascript:first();">首页</a>   
   			<a href="javascript:forward();">上一页</a> 
   			<a href="javascript:next();">下一页</a> 
   			<a href="javascript:end();">尾页</a> 
   			跳转到<select name="select" onchange="changePage(this.value)">
   			
   			<%
   			int pageCount = dividePage.getPageCount();
   			if(pageCount>0){
   			for(int i = 1 ; i<=pageCount;i++){%>
   			
   			<option value="<%=i %>" <%= (i==dividePage.getCurrentPage()?"selected":"")%>>  <%=i %>
   			</option>
   			
   			<%			
   			}
   			
   			}else{// 无记录
   				%>
   				<option value="1">1</option> 
   				  
   			 <%		}
   			
   			%>
   					
   			</select>
   		
   		</td>
   	</tr></center> </div>	

</div>	
	
	
	
	
	

</div>	
</div>
</div>
</div>
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>