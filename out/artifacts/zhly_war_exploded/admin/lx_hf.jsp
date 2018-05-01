<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="my.personal"%>
<%@page import="com.util.DBUtil"%>
<jsp:include page="index_admin.jsp" />
<body>
<script src="js/bootstrap.min.js"></script>
 <div id="page-wrapper">
        <div class="graphs">
         <div class="xs">
  	       <h3>留言回复</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form" >
						<form class="form-horizontal" action="lx_hf" method=post>
						<%
									
									String name = (String)request.getSession().getAttribute("lxName");
									String sub = (String)request.getSession().getAttribute("lxsub");
									System.out.print("session name");
									System.out.print(name);
									System.out.print("yeyeyey");
         							%>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>用户姓名</b></label>
									<div class="col-sm-8"><input type="text" class="form-control1" id="lxname" name="lxname" value=<%out.print(name); %>></div>
								</div>
								<br>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>留言主题</b></label>
									<div class="col-sm-8"><textarea name="sub" id="sub" cols="50" rows="4" class="form-control1" style="height: 84px; width: 684px; " readonly><%out.print(sub); %></textarea></div><br/>
								</div>
								<br>
								
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label"><b>回复内容</b></label>
									<div class="col-sm-8"><textarea name="huinr" id="huinr" cols="50" rows="4" class="form-control1" style="height: 139px; width: 684px; " ></textarea></div><br/>
								</div>
								<br>


								
								
								 <div class="form-group" style="height: 99px; ">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <button type="submit" class="btn btn-primary">提交</button>&nbsp&nbsp<button class="btn btn-primary"><a href="lx_single.jsp">返回</a></button>
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