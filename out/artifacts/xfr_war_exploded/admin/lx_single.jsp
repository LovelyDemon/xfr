<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("lxglMap");
%>
<%@page import="com.change.LxglAction"%>
<jsp:include page="index_admin.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>留言</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function vieww(){
	
		
		var th = document.form1;
		th.action="<%=path%>/LxglAction?action_flag=vieww&lxid="+<%=map.get("lxid") %>;
		th.submit();		
	
	}
	
	
	</script>
	

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>留言详情</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="lx_single" method=post>
						
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>留言编号</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="lxid" name="lxid"value=<%=map.get("lxid") %> readonly><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>用户名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="lxname" name="lxname"value=<%=map.get("uname") %> readonly><br></div>
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>用户邮箱</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="umail" name="umail" value=<%=map.get("umail") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>留言时间</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="lxsj" name="lxsj" value=<%=map.get("lxsj") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>状态</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="lxhf" name="lxhf" value=<%=map.get("lxhf") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>留言主题</b></label>
									<div class="col-sm-8"><textarea name="lxsub" id="lxsub" cols="50" rows="4" class="form-control1" style="height: 84px; width: 684px; " readonly><%=map.get("lxsub") %></textarea></div><br/>
								</div>	
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>留言内容</b></label>
									<div class="col-sm-8"><textarea name="lxnr" id="lxnr" cols="50" rows="4" class="form-control1" style="height: 178px; width: 683px; " readonly><%=map.get("lxnr") %></textarea></div>
								</div>	
								<br>
								
                                   
                                  <div class="panel-footer">
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
               <button type="submit" class="btn btn-primary">回复</button>&nbsp&nbsp<button class="btn btn-primary"><a href="lxgl.jsp">确定</a></button>
                               
                               </div>
                                <div class="col-sm-8 col-sm-offset-2" style="height: 93px; ">
                                 </div>
                                 </form>
                               
                                  
		</div>
	 </div>  
                                
								
	    </div>
        </div>
       </div>
        </div>
         </div>
       

</body>
</html>