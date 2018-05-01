<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath()+"/"+"admin";
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("hotelMap");
%>
<%@page import="com.change.HotelAction"%>
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
  	       <h3><b>酒店信息</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="" method=post>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="honame" name="honame"value=<%=map.get("honame") %> readonly><br></div>
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店位置</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="holocal" name="holocal" value=<%=map.get("holocal") %>><br></div>
								</div>
								
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>酒店介绍</b></label>
									<div class="col-sm-8"><textarea name="hojs" id="nezy" cols="50" rows="4" class="form-control1" style="height: 125px; width: 683px; "><%=map.get("hojs") %></textarea></div><br/>
								</div>	
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>标间数量</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="biaonum" name="biaonum" value=<%=map.get("biaonum") %>><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>标间价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="biaojg" name="biaojg" value=<%=map.get("biaojg") %>><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>大床房数量</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="danum" name="danum" value=<%=map.get("danum") %>><br></div>
								</div>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>大床房价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="dajg" name="dajg" value=<%=map.get("dajg") %>><br></div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>预订次数</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="ordernum" name="ordernum" value=<%=map.get("ordernum") %>><br></div>
								</div>
								
									
								
                                
                                  <div class="panel-footer">
		                           <div class="row">
                                 <div class="col-sm-8 col-sm-offset-2">
                                 
                                 <div class="form-group" style="height: 99px; ">
                                <tr>
  				<td align="center">
  					<button type="button" onclick="javascript:location.href='hotel_main.jsp'">确定</button>
  					<button type="button" onclick="javascript:history.go(-1)">返回</button>
  				</td>
  			</tr>
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