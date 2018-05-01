<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="index_admin.jsp" />
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>添加路线推荐</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="rec_add" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>文章名称</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="rename" name="rename" required></div>
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>作者</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="reactor" name="reactor" required></div>
								</div>
								<br>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>摘要</b></label>
									<div class="col-sm-8"><textarea name="rezy" id="rezy" cols="50" rows="4" class="form-control1" style="height: 172px; width: 684px; " required></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>内容</b></label>
									<div class="col-sm-8"><textarea name="renr" id="renr" cols="50" rows="4" class="form-control1" style="height: 330px; width: 683px; " required></textarea></div>
									
								</div>
								<br>
								<div class="form-group">
								
								 <label for="focusedinput" class="col-sm-2 control-label"><b>插图</b></label>
								 &nbsp&nbsp
								 <input type="file" id="repic" name="repic" style="width: 503px; " required><br>
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