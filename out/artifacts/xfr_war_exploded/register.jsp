<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp" />
<body>

<!--contact-->
<div class="login-right">
	<div class="container">
		<h3>注册</h3>
		<div class="login-top">
				<ul class="login-icons">
					
					<div class="clearfix"> </div>
				</ul>
				<div class="form-info">
					<form action="register" method=post>
						<input type="text"   placeholder="用户名" name="runame" >
						<input type="password"  placeholder="登录密码 " name="rupass">
						<input type="text"   placeholder="手机号码" name="ruphone" >
						<input type="text"   placeholder="邮箱" name="rumail" >
						
						 <label class="hvr-sweep-to-right">
				           	<input type="submit" value="注册">
				           </label>
					</form>
					<p>已经有账号? <a href="login.jsp">直接登录</a></p>
				</div>
			
	</div>
</div>
</div>
<!--//contact-->
<!--//footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>