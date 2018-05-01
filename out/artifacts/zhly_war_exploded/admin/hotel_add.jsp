<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("hotelMap");
%>
<jsp:include page="index_admin.jsp" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

<script type="text/javascript">
function dosubmit(){
	var th = document.form1;
	th.action="<%=path%>/HotelAction?action_flag=add";
	th.submit();

}

</script>
  </head>
  
  <body>

<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>添加酒店</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" id="form1" name="form1" action="" method=post enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="honame" name="honame" required><br></div>
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店位置</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="holocal" name="holocal" required><br></div>
								</div>
								
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店介绍</b></label>
									<div class="col-sm-8"><textarea name="hojs" id="hojs" cols="50" rows="4" class="form-control1" style="height: 125px; width: 683px; " required></textarea></div><br/>
								</div>	
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>标准间数目</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="biaonum" name="biaonum" required><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>大床房数目</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="danum" name="danum" required><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>标准间价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="biaojg" name="biaojg" required><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>大床房价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="dajg" name="dajg" required><br></div>
								</div>
									
								
								<div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片1</b></label>
								 &nbsp&nbsp
								 <input type="file" id="hopic1"  name="hopic1" style="width: 503px; " required><br>
                                 </div>
                                 
                                <div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label" ><b>图片2</b></label>
								 &nbsp&nbsp
								 <input type="file" id="hopic2"  name="hopic2" style="width: 503px; " required><br>
                                 </div>
                                 
                                 <div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label" ><b>图片3</b></label>
								 &nbsp&nbsp
								 <input type="file" id="hopic3"  name="hopic3" style="width: 503px; " required><br>
                                 </div>
                                 <div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片4</b></label>
								 &nbsp&nbsp
								 <input type="file" id="hopic4"  name="hopic4" style="width: 503px; " required><br>
                                 </div>
                               
                                 
                                  <div class="panel-footer">
                                   <tr>
				<td colspan="4" align="center">
					<button type="button" onclick="javascript:dosubmit();">确定</button>
					<button type="button" onclick="javascript:location.href='javascript:history.go(-1)'">返回</button>
				
				</td>
			</tr>
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                
                                <div class="col-sm-8 col-sm-offset-2" style="height: 93px; ">
                                 </div>
                                 </form>
                                
		</div>
	 </div>  
                                
								
	    </div>
        </div>
       </div>   
   

</body>
</html>





