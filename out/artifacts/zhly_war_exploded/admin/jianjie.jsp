<%@ page language="java" import="java.util.*"  pageEncoding="UTF-8"%>
<%@page import="com.util.DBUtil"%>
<%@page import="my.jianjie"%>
<jsp:include page="index_admin.jsp" />

<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3><b>当地简介管理</b></h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						<form class="form-horizontal" action="jianjie" method=post>
						<% 
									jianjie a=new jianjie();
									DBUtil db = new DBUtil();//构建数据库对象
         							db.tiqujie(a); 
         							String jie =a.getJieshao();//取得用户名
	 								String wen = a.getWenhua();//取得密码
         							System.out.print(a.jieshao);
         							System.out.print(wen);
         							%>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>XX介绍</b></label>
									
									<div class="col-sm-8"><textarea name="jieshao"  id="jieshao" cols="50" rows="4" class="form-control1" style="height: 182px; width: 662px; "><%out.print(jie); %>
									</textarea><br></div>
									
								</div>
								
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>XX文化介绍</b></label>
									<div class="col-sm-8"><textarea name="wenhua" id="wenhua" cols="50" rows="4" class="form-control1" style="height: 178px; width: 665px; "><%out.print(wen); %> </textarea></div>
									
								</div>
								
								<div class="form-group">
								<br>
								 <label for="focusedinput" class="col-sm-2 control-label"><b>介绍图片</b></label>
								 &nbsp&nbsp
								 <input type="file" id="filename" name="filename" style="width: 503px; "><br>
                                 </div>
                                  
                                  
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-primary" >提交</button>&nbsp&nbsp<button type="reset" class="btn btn-default">重置</button>
                              
                              
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