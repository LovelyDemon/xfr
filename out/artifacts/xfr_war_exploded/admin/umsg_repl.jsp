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
String rename = (String)session.getAttribute("rename");

//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("listrepl");

// 获取 分页对象

DividePage dividePage3 = (DividePage) request.getAttribute("dividePage3");
// 获取查询的关键词

if(list==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	UmsgService service = new UmsgDao();
	int totalRecord3 = service.getreplCount(username);
	   dividePage3 = new DividePage(5,totalRecord3,1);
	int start = dividePage3.fromIndex();
	int end = dividePage3.toIndex();
	list = service.list_repl("", username,start, end);
	
}

	
%>
  <head>
    <base href="<%=basePath%>">    
    <title>推荐路线评论</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function searchrepl(){
		var th = document.form2;
		th.action="<%=path%>/UmsgAction?action_flag=repl_search";
		th.submit();
	}
	
	function first1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=repl_search&pageNum3=1";
		
	}
	function next1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=repl_search&pageNum3=<%=dividePage3.getCurrentPage()+1%>";		
	
	}
	function forward1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=repl_search&pageNum3=<%=dividePage3.getCurrentPage()-1%>";
		
	}
	function end1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=repl_search&pageNum3=<%=dividePage3.getPageCount() %>";
			
	}
	
	function changePage1(currentPage){
	
		window.location.href = "<%=path%>/UmsgAction?action_flag=repl_search&pageNum3="+currentPage;
	
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
		th.action="<%=path%>/UmsgAction?action_flag=del_repl";
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
		th.action="<%=path%>/UmsgAction?action_flag=view_repl&replid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>推荐路线评论</b></h3>
  	         <form class="form-horizontal"  name = "form2" action="" method="post">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>文章标题</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" name="rename" value="<%= rename!=null?rename:"" %>"/>
									<button type="button" onclick="searchrepl()">查找</button></div>
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
		  <th style="width: 20%;text-align:center;">文章标题</th>
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
   				<td width=10%><input type="checkbox" name="ids" value="<%=map1.get("replid") %>"/></td>
   				<td width=20%><%=map1.get("rename") %></td>
   				<td width=50%><%=map1.get("replnr") %></td>
   				<td width=20%><%=map1.get("repltime") %></td>
   				
   				
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
   			共<%=dividePage3.getPageCount()  %>页    
   			<a href="javascript:first1();">首页</a>   
   			<a href="javascript:forward1();">上一页</a> 
   			<a href="javascript:next1();">下一页</a> 
   			<a href="javascript:end1();">尾页</a> 
   			跳转到<select name="select" onchange="changePage(this.value)">
   			
   			<%
   			int pageCount = dividePage3.getPageCount();
   			if(pageCount>0){
   			for(int i = 1 ; i<=pageCount;i++){%>
   			
   			<option value="<%=i %>" <%= (i==dividePage3.getCurrentPage()?"selected":"")%>>  <%=i %>
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