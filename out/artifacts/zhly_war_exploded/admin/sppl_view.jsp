<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("prplMap");
%>
<%@page import="com.change.ProductAction"%>
<jsp:include page="index_admin.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>商品评论详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">

	

	
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
		var th = document.form1;
		th.action="<%=path%>/ProductAction?action_flag=pl_del";
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
		th.action="<%=path%>/ProductAction?action_flag=view&prid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>商品评论详情</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal"  name = "form2" action="" method="post">
						<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>评论编号</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ids" name="ids" value=<%=map.get("prplid") %> readonly></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>商品名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prname" name="prname" value=<%=map.get("prname") %> readonly></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>用户名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="uname" name="uname" value=<%=map.get("uname") %>></div>
								</div>
								
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label" ><b>评论时间</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prpltime" name="prpltime" value=<%=map.get("prpltime") %> readonly></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>评论内容</b></label>
									<div class="col-sm-8"><textarea name="prplnr" id="prplnr" cols="50" rows="4" class="form-control1" style="height: 172px; width: 684px; "><%=map.get("prplnr") %></textarea></div>
									
								</div>
	
								<br>
								
								
                                 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp<button type="button" onclick="javascript:del();">删除</button>&nbsp
              &nbsp&nbsp<button><a href="sppl_manager.jsp">返回</a></button>
                               </div>
                                 </form>
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