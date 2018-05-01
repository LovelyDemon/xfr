<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="index_admin.jsp" />
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>添加产品</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="pro_add" method=post enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prname" name="prname"></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品价格</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="prprice" name="prprice"></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>产品介绍</b></label>
									<div class="col-sm-8"><textarea name="prjs" id="prjs" cols="50" rows="4" class="form-control1" style="height: 125px; width: 683px; "></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
								<br>
								 <label for="focusedinput" class="col-sm-2 control-label"><b>图片</b></label>
								 &nbsp&nbsp
								 <span style="white-space:pre">  </span><input type="file" id="prpic" name="prpic" style="width: 503px; " required><span style="white-space:pre"> </span><br>
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