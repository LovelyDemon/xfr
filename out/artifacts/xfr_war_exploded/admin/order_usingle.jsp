<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("orderMap");
%>
<%@page import="com.change.OrderAction"%>
<jsp:include page="index_user.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>酒店订单管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function view(){
		var th = document.form1;
		th.action="<%=path%>/OrderAction?action_flag=vieww&lxid="+<%=map.get("ordid") %>;
		th.submit();		
	}
	
	function agree(){
		var th = document.form1;
		th.action="<%=path%>/OrderAction?action_flag=agree&ordid="+<%=map.get("ordid") %>;
		th.submit();		
	}
	function refuse(){
		var th = document.form1;
		th.action="<%=path%>/OrderAction?action_flag=refuse&ordid="+<%=map.get("ordid") %>;
		th.submit();		
	}
	
	</script>
	

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>酒店订单详情</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" form name="form1" action="" method=post>
						
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="honame" name="honame"value=<%=map.get("honame") %> readonly><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>预订房型</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordkind" name="ordkind"value=<%=map.get("ordkind") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>申请日期</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordtime" name="ordtime"value=<%=map.get("ordtime") %> readonly><br></div>
								</div>

	
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>订单状态</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordjd" name="ordjd"value=<%=map.get("ordjd") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>预订人姓名</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="uname" name="uname" value=<%=map.get("uname") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>预订人联系方式</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordphone" name="ordphone" value=<%=map.get("ordphone") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>入住日期</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="orddate" name="orddate" value=<%=map.get("orddate") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>入住天数</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordlong" name="ordlong" value=<%=map.get("ordlong") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>用户备注</b></label>
									<div class="col-sm-8"><textarea name="ordbz" id="ordbz" cols="50" rows="4" class="form-control1" style="height: 84px; width: 684px; " readonly><%=map.get("ordbz") %></textarea></div><br/>
								</div>	
								
								
									
							
								
                                   
                                  <div class="panel-footer">
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                 <div class="form-group" style="height: 99px; ">
                               
   								 <button type="button" onclick="javascript:history.go(-1)">返回</button>
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