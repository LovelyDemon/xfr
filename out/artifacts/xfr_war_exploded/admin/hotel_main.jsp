<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.HotelAction"%>
<%@page import="com.change.HotelDao"%>
<%@page import="com.change.HotelService"%>
<%@page import="com.util.DividePage"%>
<jsp:include page="index_admin.jsp" />

<%
String path = request.getContextPath()+"/"+"admin";

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
	dividePage = new DividePage(5,totalRecord,1);
	int start = dividePage.fromIndex();
	int end = dividePage.toIndex();
	list = service.listhotel("", start, end);
}
	
%>
  <head>
    <base href="<%=basePath%>">    
    <title>酒店管理</title>
    
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
		th.action="<%=path%>/HotelAction?action_flag=search";
		th.submit();
	}
	
	function first(){
		
		window.location.href = "<%=path%>/HotelAction?action_flag=search&pageNum=1";
		
	}
	function next(){
		
		window.location.href = "<%=path%>/HotelAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";		
	
	}
	function forward(){
		
		window.location.href = "<%=path%>/HotelAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";
		
	}
	function end(){
		
		window.location.href = "<%=path%>/HotelAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";
			
	}
	
	function changePage(currentPage){
	
		window.location.href = "<%=path%>/HotelAction?action_flag=search&pageNum="+currentPage;
	
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
		th.action="<%=path%>/HotelAction?action_flag=del";
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
	
		if(getSelectedCount()<1){
			
			alert("至少选择一个查看项！");
			return;
		
		}else if(getSelectedCount()>1){
			alert("只能选择一个查看项！");
			return;
		}
		
		var th = document.form1;
		th.action="<%=path%>/HotelAction?action_flag=view&hoid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>酒店列表</b></h3>
  	         <form class="form-horizontal"  name = "form2" action="" method="post">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" name="honame" value="<%= hotelName!=null?hotelName:"" %>"/>
									<button type="button" onclick="searchhotel()">查找</button></div>
								</div>
								</form>
								<form class="form-horizontal" form name="form1" action="" method="post">
								<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						
						<div class="bs-example4" data-example-id="contextual-table">
    <table class="table">
      <thead>
        <tr>
	<td width=10% ></td>
		  <th style="width: 10%;text-align:center;">酒店编号</th>
          <th style="width: 35%;text-align:center;">酒店名称</th>
          <th style="width: 35%;text-align:center;">酒店位置</th>
          <th style=text-align:center;>预订次数</th>
        </tr>
      </thead>
	<tbody>
        <tr class="active">
         <%
   			if(list!=null && !list.isEmpty()){
   			
   				for(Map<String,Object> map :list){%>
   			
   				<tr align="center">
   				<td width=10%><input type="checkbox" name="ids" value="<%=map.get("hoid") %>"/></td>
   				<td width=10%><%=map.get("hoid") %></td>
   				<td width=35%><%=map.get("honame") %></td>
   				<td width=35%><%=map.get("holocal") %></td>
   				<td><%=map.get("ordernum") %></td>
   				
   				<%}
   			
   			
   			}else{%>
   			
   			<tr align="center">
   				<td width=10%><input type="checkbox" name="" /></td>
   				<td width=10%></td>
   				<td width=35%></td>
   				<td width=35%></td>
   				<td></td>
   			
   			</tr><%
   			
   			}   			
   			 %>
      
        
      </tbody>
    </table>
    </form>
    </td>
   	
   	</tr>
   	
   	<tr>
   		<td>
   			<button type="button" onclick="javascript:del();">删除</button>
   			<button type="button" onclick="javascript:view();" >查看</button>
   		
   		</td>
   	</tr>
   	
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
   	</tr>
 </div>
						
						
								
								
								
								
								
								
								
                                  <div class="panel-footer">
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                 
                                <div class="col-sm-8 col-sm-offset-2" style="height: 93px; ">
                                 </div>
		</div>
	 </div>  
                                
								
	    </div>
        </div>
       </div>
        </div>
         </div>
       

</body>
</html>