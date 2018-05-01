<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("scenicMap");
%>
<%@page import="com.change.ScenicAction"%>
<jsp:include page="index_admin.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>查看景点</title>
    
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
  	       <h3><b>景点详情</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="scenic_add" method=post enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>景点名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="scname" name="scname" value=<%=map.get("scname") %> readonly required></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>景点位置</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="sclocal" name="sclocal" value=<%=map.get("sclocal") %> required></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>门票价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="scprice" name="scprice" value=<%=map.get("scprice") %> required></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>景点介绍</b></label>
									<div class="col-sm-8"><textarea name="scjs" id="scjs" cols="50" rows="4" class="form-control1" style="height: 176px; width: 683px; " required><%=map.get("scjs") %></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>推荐理由</b></label>
									<div class="col-sm-8"><textarea name="sctj" id="sctj" cols="50" rows="4" class="form-control1" style="height: 138px; width: 683px; " required><%=map.get("sctj") %></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
								<br>
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片1</b></label>
								 &nbsp&nbsp
								 <input type="file" id="scpic1" name="scpic1" style="width: 503px; " required><br>
                                 </div>
                                 <br>
								<div class="form-group">
								<br>
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片2</b></label>
								 &nbsp&nbsp
								 <input type="file" id="scpic2" name="scpic2" style="width: 503px; " required><br>
                                 </div>
                                 <br>
								<div class="form-group">
							
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片3</b></label>
								 &nbsp&nbsp
								 <input type="file" id="scpic3" name="scpic3" style="width: 503px; " required><br>
                                 </div>
                                 <br>
								<div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片4</b></label>
								 &nbsp&nbsp
								 <input type="file" id="scpic4" name="scpic4" style="width: 503px; " required><br>
                                 </div>
                                 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <button type="submit" class="btn btn-primary">提交</button>&nbsp&nbsp<button type="reset" class="btn btn-default">重置</button>
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