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
String nename = (String)session.getAttribute("nename");

//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
List<Map<String,Object>> list =(List<Map<String,Object>>) request.getAttribute("listnepl");

// 获取 分页对象

DividePage dividePage2 = (DividePage) request.getAttribute("dividePage2");
// 获取查询的关键词

if(list==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	UmsgService service = new UmsgDao();
	int totalRecord2 = service.getneplCount(username);
	dividePage2 = new DividePage(5,totalRecord2,1);
	int start = dividePage2.fromIndex();
	int end = dividePage2.toIndex();
	list = service.list_nepl("", username,start, end);
	
}

	
%>
  <head>
    <base href="<%=basePath%>">    
    <title>新闻评论</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function searchnepl(){
		var th = document.form2;
		th.action="<%=path%>/UmsgAction?action_flag=nepl_search";
		th.submit();
	}
	
	function first1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=nepl_search&pageNum2=1";
		
	}
	function next1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=nepl_search&pageNum2=<%=dividePage2.getCurrentPage()+1%>";		
	
	}
	function forward1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=nepl_search&pageNum2=<%=dividePage2.getCurrentPage()-1%>";
		
	}
	function end1(){
		
		window.location.href = "<%=path%>/UmsgAction?action_flag=nepl_search&pageNum2=<%=dividePage2.getPageCount() %>";
			
	}
	
	function changePage1(currentPage){
	
		window.location.href = "<%=path%>/UmsgAction?action_flag=nepl_search&pageNum2="+currentPage;
	
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
		th.action="<%=path%>/UmsgAction?action_flag=del_nepl";
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
		th.action="<%=path%>/UmsgAction?action_flag=view_nepl&neplid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>新闻评论</b></h3>
  	         <form class="form-horizontal"  name = "form2" action="" method="post">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>新闻标题</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" name="nename" value="<%= nename!=null?nename:"" %>"/>
									<button type="button" onclick="searchnepl()">查找</button></div>
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
		  <th style="width: 20%;text-align:center;">新闻标题</th>
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
   				<td width=10%><input type="checkbox" name="ids" value="<%=map1.get("neplid") %>"/></td>
   				<td width=20%><%=map1.get("nename") %></td>
   				<td width=50%><%=map1.get("neplnr") %></td>
   				<td width=20%><%=map1.get("nepltime") %></td>
   				
   				
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
   			共<%=dividePage2.getPageCount()  %>页    
   			<a href="javascript:first1();">首页</a>   
   			<a href="javascript:forward1();">上一页</a> 
   			<a href="javascript:next1();">下一页</a> 
   			<a href="javascript:end1();">尾页</a> 
   			跳转到<select name="select" onchange="changePage(this.value)">
   			
   			<%
   			int pageCount = dividePage2.getPageCount();
   			if(pageCount>0){
   			for(int i = 1 ; i<=pageCount;i++){%>
   			
   			<option value="<%=i %>" <%= (i==dividePage2.getCurrentPage()?"selected":"")%>>  <%=i %>
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