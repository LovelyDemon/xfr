<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("newsMap");
%>
<%@page import="com.change.NewsAction"%>
<jsp:include page="index_admin.jsp" />
<head>
    <base href="<%=basePath%>">
    
    <title>查看新闻</title>
    
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
  	       <h3><b>删改新闻</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="" method=post enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>新闻标题</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="nename" name="nename"value=<%=map.get("nename") %> readonly><br></div>
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>作者</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="neactor" name="neactor" value=<%=map.get("neactor") %>><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>编辑时间</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="nest" name="nest" value=<%=map.get("nesavetime") %> readonly><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>新闻摘要</b></label>
									<div class="col-sm-8"><textarea name="nezy" id="nezy" cols="50" rows="4" class="form-control1" style="height: 125px; width: 683px; "><%=map.get("nezy") %></textarea></div><br/>
								</div>	
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>新闻内容</b></label>
									<div class="col-sm-8"><textarea name="nenr" id="nenr" cols="50" rows="4" class="form-control1" style="height: 178px; width: 683px; "><%=map.get("nenr") %></textarea></div>
								</div>	
								<br>
								<div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label"><b>插图</b></label>
								 &nbsp&nbsp
								 <input type="file" id="exampleInputFile" style="width: 503px; "><br>
                                 </div>
                                
                                  <div class="panel-footer">
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <button type="submit" class="btn btn-primary">提交</button>&nbsp&nbsp<button type="reset" class="btn btn-default">重置</button>
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