<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="top.jsp" />
<body>

<!--contact-->
<div class="login-right">
	<div class="container">
		<h3>登录</h3>
		<div class="login-top">
				<ul class="login-icons">
					<li><a href="#" ><i class="twitter"> </i><span>管理员登录</span></a></li>
					<li><a href="#" class="twit"><i class="twitter"></i><span>游客登录</span></a></li>
					
					<div class="clearfix"> </div>
				</ul>
				<div class="form-info">
					<form action="login" method=post>
						<input type="text" class="text" placeholder="用户名" name="uname">
						
						<input type="password" class="text" placeholder="密码" name="upass">
						 <label class="hvr-sweep-to-right">
				           	<input type="submit" value="登录">
				           </label>
					</form>
				</div>
			<div class="create">
				<h4>没有账号?</h4>
				<a class="hvr-sweep-to-right" href="register.jsp">注册</a>
				<div class="clearfix"> </div>
			</div>
	</div>
</div>
</div>
<!--//contact-->
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>