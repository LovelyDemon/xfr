<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.ProductfAction"%>
<%@page import="com.change.CompanionServiceImpl"%>
<%@page import="com.change.CompanionService"%>
<%@page import="com.util.DividePage"%>
<jsp:include page="top.jsp" />

<%
String path = request.getContextPath();

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//获取 session 中的 username;
String username = (String)session.getAttribute("username");
//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("getListByPage");
// 获取 分页对象
DividePage dividePage = (DividePage) request.getAttribute("dividePage");
// 获取查询的关键词
String productName = (String) request.getAttribute("ProductName");
if(list==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	CompanionService service = new CompanionServiceImpl();
	int totalRecord = service.getCount("");
	dividePage = new DividePage(20,totalRecord,1);
	int start = dividePage.fromIndex();
	int end = dividePage.toIndex();
	list = service.getListByPage("", start, end);
}
	
%>
 <head>
    <base href="<%=basePath%>">    
    <title>景点</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function searchProduct(){
		var th = document.form2;
		th.action="<%=path%>/ProductfAction?action_flag=search";
		th.submit();
	}
	
	function first(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=search&pageNum=1";
		
	}
	function next(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";		
	
	}
	function forward(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";
		
	}
	function end(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";
			
	}
	
	function changePage(currentPage){
	
		window.location.href = "<%=path%>/ProductfAction?action_flag=search&pageNum="+currentPage;
	
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
		th.action="<%=path%>/ScenicAction?action_flag=del";
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
		th.action="<%=path%>/CompanionAction?action_flag=view&proid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>

<jsp:include page="navigationBar.jsp"/>

<!--Dealers-->
<div class="dealers">
<div class="container">
	<h3>当地特产</h3>
	<br><form class="form-horizontal"  name = "form2" action="" method="post" >
		
								<div class="form-group"  style="height: 108px; text-align:center'">
									<br><br><b>产品名称</b>
									<input type="text" class="form-control1" name="prname" value="<%= productName!=null?productName:"" %>"/>
									<button type="button" class="hvr-sweep-to-right more"  onclick="searchProduct()">查找</button>
								</div>
								
								</form>
	<form class="form-horizontal" form name="form1" action="" method="post">
		<ul class="career-start">
		<div class="dealer-top">
		<%
   			if(list!=null && !list.isEmpty()){
   			int i=0;
   				for(Map<String,Object> map :list){
   				
   				%>
   				
				<div class="col-md-3 top-deal-top">
					<div class=" top-deal">
						<a href="ProductfAction?action_flag=view&prid=<%=map.get("prid") %>" class="mask"><img src="<%=path%>/upload/<%=map.get("prpic") %>" class="img-responsive zoom-img" alt="" style="height: 200px; width: 300px; "></a>
						<div class="deal-bottom">
							<div class="top-deal1">
								<h5><a href="ProductAction?action_flag=view&prid=<%=map.get("prid") %>"><%=map.get("prname") %></a></h5>
								
								<p>产品价格: <%=map.get("prprice") %> 元</p>
								<%i++; %>
							</div>
							<div class="top-deal2">
								<a href="ProductfAction?action_flag=view&prid=<%=map.get("prid") %>" class="hvr-sweep-to-right more">详细</a>
							</div>
						<div class="clearfix"> </div>
						</div>
					</div>
				</div>
   				<%if(i%4==0)
   				{%>
   				<div class="col-sm-8 col-sm-offset-2" style="height: 30px; ">
                                 
                                
                                <div class="col-sm-8 col-sm-offset-2" style="height: 30px; ">
                                 </div>
		</div>
   				<% }
   				 %>
   				
   				
   				
   				<%}
   			
   			
   			}else{%>
   			
   			<tr align="center">
   				
   				<td></td>
   			
   			</tr><%
   			
   			}   			
   			 %>
		 	</ul>
		 	<div class="clearfix"> </div>
	
</form>
<div class="clearfix"> </div>
<div class="c9ontainer" style="height: 39px; ">
	
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
   			 <%}			
   			
   			%>
   					
   			</select>
   		
   		</td>
   	</tr></center> </div>	

</div>	
	
	
	
	
	

</div>
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>