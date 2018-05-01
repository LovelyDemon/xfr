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
                            <a href="jianjie.jsp"><i class="fa fa-dashboard fa-fw nav_icon"></i>简介管理</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>新闻管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="news_add.jsp">增加新闻</a>
                                </li>
                                 <li>
                                    <a href="news_main.jsp">修改/删除新闻</a>
                                </li>
                            </ul>

                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>酒店管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="hotel_add.jsp">增加酒店</a>
                                </li>
                                 <li>
                                    <a href="hotel_main.jsp">修改/删除酒店</a>
                                </li>
                                <li>
                                    <a href="order_manager.jsp">酒店预订管理</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-laptop nav_icon"></i>景点管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="scenic_add.jsp">增加景点</a>
                                </li>
                                 <li>
                                    <a href="scenic_main.jsp">修改/删除景点</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="widgets.html"><i class="fa fa-flask nav_icon"></i>特产管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="pro_add.jsp">增加特产</a>
                                </li>
                                 <li>
                                    <a href="pro_main.jsp">修改/删除特产</a>
                                </li>
                            </ul>
                        </li>
                       
                         <li>
                            <a href="#"><i class="fa fa-check-square-o nav_icon"></i>推荐管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="rec_add.jsp">增加推荐</a>
                                </li>
                                <li>
                                    <a href="rec_main.jsp">修改/删除推荐</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                        <li>
                            <a href="#"><i class="fa fa-check-square-o nav_icon"></i>信息管理<span class="fa arrow"></span></a>
                           <ul class="nav nav-second-level">
                                <li>
                                    <a href="lxgl.jsp">留言管理</a>
                                </li>
                                <li>
                                    <a href="#">评论管理<span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                     <li>
                                    <a href="sppl_manager.jsp">商品评论管理</a>
                                </li>
                                    <li>
                                    <a href="nepl_manager.jsp">新闻评论管理</a>
                                </li>
                                    <li>
                                    <a href="repl_manager.jsp">推荐路线评论管理</a>
                                </li>
                                   </ul> 
                                </li>
                                
                            </ul>
                        </li>
                        <li>
                            <a href="uadmin_main.jsp"><i class="fa fa-sitemap nav_icon"></i>用户管理</a>
                           
                        </li>
                     <li>
                            <a href="personal.jsp"><i class="fa fa-sitemap nav_icon"></i>个人信息管理</a>
                           
                        </li>
                        
                       
                         
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		<div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >网页模板</a></div>
            
 
       </div>
<script src="js/bootstrap.min.js"></script>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
   
</body>
</html>
