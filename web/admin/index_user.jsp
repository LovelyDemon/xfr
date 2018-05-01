<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Modern Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/lines.css" rel='stylesheet' type='text/css' />
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="js/jquery.min.js"></script>
<!----webfonts
<link href='http://fonts.useso.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
--->
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="js/d3.v3.js"></script>
<script src="js/rickshaw.js"></script>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.jsp">TRAVEL</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-nav navbar-right">
			<li><a  href="../index.jsp"><i class="glyphicon glyphicon-user"> </i>
				去前台</a></li>
			<li><a  href="../logout.jsp"><i class="glyphicon glyphicon-user"> </i>
				注销</a></li>
					</ul>
					
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>信息管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="UmsgAction?action_flag=hf_search&pageNum=1">我的回复</a>
                                </li>
                                 <li>
                                    <a href="#">我的评论<span class="fa arrow"></span></a>
                                    
                                    <ul class="nav nav-third-level">
                                <li>
                                    <a href="umsg_nepl.jsp">新闻评论</a>
                                </li>
                                 <li>
                                    <a href="umsg_pl.jsp">商品评论</a>
                                </li>
                                <li>
                                    <a href="umsg_repl.jsp">推荐评论</a>
                                </li>
                            </ul>
                                    
                                </li>
                               
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="upersonal.jsp"><i class="fa fa-laptop nav_icon"></i>个人信息管理</a>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="order_umanager.jsp"><i class="fa fa-indent nav_icon"></i>酒店预订信息</a>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="umsg_fav.jsp"><i class="fa fa-indent nav_icon"></i>我的收藏</a>
                            
                            <!-- /.nav-second-level -->
                        </li>
                        
                       
                         
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
            <script src="js/bootstrap.min.js"></script>
        
        <div class="graphs">
         
	    
        </div>
       </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
   
</body>
</html>
