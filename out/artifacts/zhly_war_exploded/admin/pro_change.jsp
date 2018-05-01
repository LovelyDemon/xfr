<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("productMap");
%>
<%@page import="com.change.ProductAction"%>
<jsp:include page="index_admin.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>查看产品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>产品详情</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="pro_add" method=post enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prname" name="prname" value=<%=map.get("prname") %> readonly></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prprice" name="prprice" value=<%=map.get("prprice") %>></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品介绍</b></label>
									<div class="col-sm-8"><textarea name="prjs" id="prjs" value=cols="50" rows="4" class="form-control1" style="height: 125px; width: 683px; "><%=map.get("prjs") %></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
								<br>
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片</b></label>
								 &nbsp&nbsp
								 <input type="file" id="prpic" name="prpic" style="width: 503px; "><br>
                                 </div>
                                 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <button type="submit"  class="btn btn-primary" >提交</button>&nbsp&nbsp<button type="reset" class="btn btn-default">重置</button>
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