<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="my.personal"%>
<%@page import="com.util.DBUtil"%>
<jsp:include page="index_user.jsp" />
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3>个人信息管理</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form" >
						<form class="form-horizontal" action="personal" method=post>
						<%
									personal a=new personal();
									DBUtil db = new DBUtil();//构建数据库对象
									String name = (String)request.getSession().getAttribute("userName");
									String type = (String)request.getSession().getAttribute("uType");
									System.out.print("session name");
									System.out.print(name);
									
         							db.tipersonal(a,name,type); 
         							String mingzi =a.getcuname();//取得用户名
	 								String mima = a.getcupass();//取得密码
	 								String shouji = a.getcuphone();//取得密码
	 								String youxiang = a.getcumail();//取得密码
	 								System.out.print(mingzi);
         							System.out.print("yeyeyey");
         							%>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>姓名</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="cuname" name="cuname" value=<%out.print(mingzi); %>></div>
								</div>
								<br>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>密码</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="cupass" name="cupass" value=<%out.print(mima); %>></div>
								</div>
								<br>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>手机</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="cuphone" name="cuphone" value=<%out.print(shouji); %>></div>
								</div>
								<br>


								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>邮箱</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="cumail" name="cumail" value=<%out.print(youxiang); %>></div>
								</div>
								
								 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <button type="submit" class="btn btn-primary">修改</button>&nbsp&nbsp<button type="reset" class="btn btn-default">重置</button>
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