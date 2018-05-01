<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.UmsgAction"%>
<%@page import="com.change.UmsgDao"%>
<%@page import="com.change.UmsgService"%>
<%@page import="com.util.DividePage"%>
<jsp:include page="index_user.jsp" />

<%
String path = request.getContextPath()+"/"+"admin";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//获取 session 中的 username;
String username = (String)session.getAttribute("userName");
String prname = (String)session.getAttribute("prname");

//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("listprl");

// 获取 分页对象
DividePage dividePage1 = (DividePage) request.getAttribute("dividePage1");

// 获取查询的关键词

if(list==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	UmsgService service = new UmsgDao();
	int totalRecord1 = service.getprplCount(username);
	dividePage1 = new DividePage(5,totalRecord1,1);
	int start = dividePage1.fromIndex();
	int end = dividePage1.toIndex();
	list = service.list_prpl("", username,start, end);
	
}

	
%>
  <head>
    <base href="<%=basePath%>">    
    <title>新闻管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function searcprpl(){
		var th = document.form2;
		th.action="<%=path%>/UmsgAction?action_flag=prpl_search";
		th.submit();
	}
	
	function first1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=prpl_search&pageNum1=1";
		
	}
	function next1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=prpl_search&pageNum1=<%=dividePage1.getCurrentPage()+1%>";		
	
	}
	function forward1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=prpl_search&pageNum1=<%=dividePage1.getCurrentPage()-1%>";
		
	}
	function end1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=prpl_search&pageNum1=<%=dividePage1.getPageCount() %>";
			
	}
	
	function changePage1(currentPage){
	
		window.location.href = "<%=path%>/UmsgAction?action_flag=prpl_search&pageNum1="+currentPage;
	
	}
	 
	function selectAll1(flag){
		
		var ids = document.getElementsByName("ids");
		for(var i = 0 ; i < ids.length ; i++){
			ids[i].checked = flag;
		}
	
	}
	
	function getSelectedCount1(){
	
		var ids = document.getElementsByName("ids");
		var count = 0;
		for(var i = 0 ; i < ids.length ; i++)
		{
						
			ids[i].checked==true?count++:0;					
		}
		return count;
	
	}
	
	function del1(){

		if(getSelectedCount1()==0){
			
			alert("至少选择一个删除项！");
			return;
		
		}
		var th = document.form1;
		th.action="<%=path%>/UmsgAction?action_flag=del_prpl";
		th.submit();		
		
	}
	
	function getSelectedValue1(){
		var ids = document.getElementsByName("ids");
		
		for(var i = 0 ; i < ids.length ; i++)
		{
						
			if(ids[i].checked){
				return ids[i].value;
			}				
		}
		
	}
	
	function view1(){
	
		if(getSelectedCount()<1){
			
			alert("至少选择一个查看项！");
			return;
		
		}else if(getSelectedCount()>1){
			alert("只能选择一个查看项！");
			return;
		}
		
		var th = document.form1;
		th.action="<%=path%>/UmsgAction?action_flag=view_prpl&prplid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>商品评论</b></h3>
  	         <form class="form-horizontal"  name = "form2" action="" method="post">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>特产名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" name="prname" value="<%= prname!=null?prname:"" %>"/>
									<button type="button" onclick="searcprpl()">查找</button></div>
								</div>
								</form>
								<form class="form-horizontal" form name="form1" action="" method="post">
								<div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						
						<div class="bs-example4" data-example-id="contextual-table">
    <table class="table">
      <thead>
        <tr>
	<td width=10%></td>
		  <th style="width: 20%;text-align:center;">商品名称</th>
          <th style="width: 50%;text-align:center;">评论内容</th>
          <th style="width: 20%;text-align:center;">评论时间</th>
          
        </tr>
      </thead>
	<tbody>
        <tr class="active">
         <%
   			if(list!=null && !list.isEmpty()){
   		
   				for(Map<String,Object> map1 :list){%>
   			
   				<tr align="center">
   				<td width=10%><input type="checkbox" name="ids" value="<%=map1.get("prplid") %>"/></td>
   				<td width=20%><%=map1.get("prname") %></td>
   				<td width=50%><%=map1.get("prplnr") %></td>
   				<td width=20%><%=map1.get("prpltime") %></td>
   				
   				
   				<%}
   			
   			
   			}else{%>

<tr align="center">
   				
   				<td width=10%></td>
   				<td width=20%></td>
   				<td width=50%></td>
   				<td width=20%></td>
   			
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
   			<button type="button" onclick="javascript:del1();">删除</button>
   		
   		</td>
   	</tr>

   	
   	<tr style=" text-align: center; width: 733px" >
   		<td colspan="4" align="center">
   			共<%=dividePage1.getPageCount()  %>页    
   			<a href="javascript:first1();">首页</a>   
   			<a href="javascript:forward1();">上一页</a> 
   			<a href="javascript:next1();">下一页</a> 
   			<a href="javascript:end1();">尾页</a> 
   			跳转到<select name="select" onchange="changePage(this.value)">
   			
   			<%
   			int pageCount = dividePage1.getPageCount();
   			if(pageCount>0){
   			for(int i = 1 ; i<=pageCount;i++){%>
   			
   			<option value="<%=i %>" <%= (i==dividePage1.getCurrentPage()?"selected":"")%>>  <%=i %>
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