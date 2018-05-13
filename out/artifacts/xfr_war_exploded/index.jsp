<%@ page language="java" import="com.change.CompanionService" pageEncoding="UTF-8" %>
<%@page import="com.change.CompanionServiceImpl" %>
<%@page import="com.util.DBUtil" %>
<%@page import="my.jianjie" %>
<%@page import="my.news_add" %>
<%@ page import="my.scenic_add" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>Home</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--menu-->
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <!--//menu-->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Real Home Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!-- slide -->
    <script src="js/responsiveslides.min.js"></script>
    <script>
        $(function () {
            $("#slider").responsiveSlides({
                auto: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
    </script>
</head>
<body>
<!--header-->


<div class="header">
    <div class="container">
        <!--logo-->
        <div class="logo">
            <h1><a href="index.jsp">小飞人</a></h1>
        </div>
        <!--//logo-->
        <div class="top-nav">
            <ul class="right-icons">

                <%
                    if (request.getSession().getAttribute("userName") == null) {
                %>
                <li><a href="login.jsp"><i class="glyphicon glyphicon-user"> </i>
                    登录</a></li>
                <li><a href="register.jsp"><i class="glyphicon glyphicon-user"> </i>注册</a></li>
                <%
                } else {
                    String a = (String) request.getSession().getAttribute("userName");
                    DBUtil db = new DBUtil();
                    boolean ifadmin = db.ifadmin(a);
                    if (ifadmin) {
                %>
                <li><a href="admin/uadmin_main.jsp"><i class="glyphicon glyphicon-user"> </i>去后台</a></li>
                <%} else {%>
                <li><a href="admin/UmsgAction?action_flag=hf_search&pageNum=1"><i class="glyphicon glyphicon-user"> </i>去后台</a>
                </li>
                <%} %>
                <li><a href="logout.jsp"><i class="glyphicon glyphicon-user"> </i>注销</a></li>
                <%} %>

            </ul>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//-->

<div class=" header-right">
    <div class=" banner">
        <div class="slider">
            <div class="callbacks_container">
                <ul class="rslides" id="slider">
                    <li>
                        <div class="banner1">
                            <div class="caption">
                                <h3><span>欢迎来到</span>小飞人旅游</h3>
                                <p>为您提供全方面的旅游体验</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner2">
                            <div class="caption">
                                <h3><span>欢迎来到</span>小飞人旅游</h3>
                                <p>为您提供全方面的旅游体验</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="banner3">
                            <div class="caption">
                                <h3><span>欢迎来到</span>小飞人旅游</h3>
                                <p>为您提供全方面的旅游体验</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<jsp:include page="navigationBar.jsp"/>
<!--//-->

<!--//header-bottom-->


<!--//header-->
<!--introduce-->
<%
    jianjie a = new jianjie();
    DBUtil db = new DBUtil();//构建数据库对象
    db.tiqujie(a);
    String jie = a.getJieshao();
    String wen = a.getWenhua();
%>


<!--news-->
<div class="container">
    <div class="content-events">
        <%
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            CompanionService companionService = new CompanionServiceImpl();
            List<Map<String, Object>> list = companionService.getListByPage(null, 0, 3);
        %>
        <h3> 热门组队</h3>
        <div class="news">
            <%
                if(list!=null && !list.isEmpty()){
                    for(Map<String,Object> map :list){
            %>
            <div class="col-md-4 new-more">
                <div class="event">
                    <h4><%out.print(sdf.format(map.get("start_date"))); %></h4>
                    <h4><%out.print(sdf.format(map.get("end_date"))); %></h4>
                    <h6><a href="CompanionAction?action_flag=front_view&id=<%=map.get("id") %>"><%out.print(map.get("title")); %></a></h6>
                </div>
                <a class="hvr-sweep-to-right more" href="CompanionAction?action_flag=front_view&id=<%=map.get("id") %>">详细</a>
            </div>
            <%
                    }
                }
            %>
            <div class="clearfix"></div>
        </div>

        <div class="news">
            <%
                list = companionService.getListByPage(null, 3, 3);
                if(list!=null && !list.isEmpty()){
                    for(Map<String,Object> map :list){
            %>
            <div class="col-md-4 new-more">
                <div class="event">
                    <h4><%out.print(sdf.format(map.get("start_date"))); %></h4>
                    <h4><%out.print(sdf.format(map.get("end_date"))); %></h4>
                    <h6><a href="CompanionAction?action_flag=front_view&id=<%=map.get("id") %>"><%out.print(map.get("title")); %></a></h6>
                </div>
                <a class="hvr-sweep-to-right more" href="CompanionAction?action_flag=front_view&id=<%=map.get("id") %>">详细</a>
            </div>
            <%
                    }
                }
            %>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="content">
    <div class="project">
        <div class="container">
            <div class="service-top">
                <h3>热门景点</h3>
                <p>各地热门景点汇总</p>
            </div>
            <div class="services-grid">
                <div class="col-md-6 service-top1">
                    <div class=" ser-grid">
                        <a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-leaf"> </a>
                    </div>
                    <div class="ser-top">
                        <%
                            scenic_add s1 = new scenic_add();
                            DBUtil dbbb1 = new DBUtil();//构建数据库对象
                            String ss1 = "1";
                            dbbb1.tiquscenic(s1, ss1);
                            String scname1 = s1.getscname();//取得新闻标题
                            String sctj1 = s1.getsctj();//取得新闻摘要

                        %>
                        <h4><a href="ScenicfAction?action_flag=view&scid=1"><%out.print(scname1); %></a></h4>
                        <p>推荐理由:<%out.print(sctj1); %></p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-6 service-top1">
                    <div class=" ser-grid">
                        <a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-leaf"> </a>
                    </div>
                    <div class="ser-top">
                        <%
                            scenic_add s2 = new scenic_add();
                            DBUtil dbbb2 = new DBUtil();//构建数据库对象
                            String ss2 = "2";
                            dbbb1.tiquscenic(s2, ss2);
                            String scname2 = s2.getscname();//取得新闻标题
                            String sctj2 = s2.getsctj();//取得新闻摘要

                        %>
                        <h4><a href="ScenicfAction?action_flag=view&scid=2"><%out.print(scname2); %></a></h4>
                        <p>推荐理由:<%out.print(sctj2); %></p></div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
            <div class="services-grid">
                <div class="col-md-6 service-top1">
                    <div class=" ser-grid">
                        <a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-leaf"> </a>
                    </div>
                    <div class="ser-top">
                        <%
                            scenic_add s3 = new scenic_add();
                            DBUtil dbbb3 = new DBUtil();//构建数据库对象
                            String ss3 = "3";
                            dbbb1.tiquscenic(s3, ss3);
                            String scname3 = s3.getscname();//取得新闻标题
                            String sctj3 = s3.getsctj();//取得新闻摘要
                        %>
                        <h4><a href="ScenicfAction?action_flag=view&scid=3"><%out.print(scname3); %></a></h4>
                        <p>推荐理由:<%out.print(sctj3); %></p></div>
                    <div class="clearfix"></div>
                </div>
                <div class="col-md-6 service-top1">
                    <div class=" ser-grid">
                        <a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-leaf"> </a>
                    </div>
                    <div class="ser-top">

                        <%
                            scenic_add s4 = new scenic_add();
                            DBUtil dbbb4 = new DBUtil();//构建数据库对象
                            String ss4 = "4";
                            dbbb1.tiquscenic(s4, ss4);
                            String scname4 = s4.getscname();//取得新闻标题
                            String sctj4 = s4.getsctj();//取得新闻摘要

                        %>
                        <h4><a href="ScenicfAction?action_flag=view&scid=4"><%out.print(scname4); %></a></h4>
                        <p>推荐理由:<%out.print(sctj4); %></p></div>
                    <div class="clearfix"></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!--//services-->
    <!--features--><!--//features-->
    <!--phone--><!--//phone-->
    <!--project--->
    <!--//project-->
    <!--test--><!--//test-->
    <!--partners-->
    <div class="content-bottom1">
        <h3>友情链接</h3>
        <div class="container">
            <ul>
                <li><a href="https://www.qunar.com/"><img class="img-responsive" src="images/lg1.png" alt=""></a></li>
                <li><a href="http://www.tuniu.com/"><img class="img-responsive" src="images/lg.png" alt=""></a></li>
                <li><a href="http://www.mafengwo.cn/"><img class="img-responsive" src="images/lg2.png" alt=""></a></li>
                <li><a href="http://www.elong.com/"><img class="img-responsive" src="images/lg3.png" alt=""></a></li>
                <li><a href="http://www.ctrip.com/"><img class="img-responsive" src="images/lg4.png" alt=""></a></li>
                <div class="clearfix"></div>
            </ul>
            <ul>
                <li><a href="#"><img class="img-responsive" src="images/lg5.png" alt=""></a></li>
                <li><a href="#"><img class="img-responsive" src="images/lg6.png" alt=""></a></li>
                <li><a href="#"><img class="img-responsive" src="images/lg7.png" alt=""></a></li>
                <li><a href="#"><img class="img-responsive" src="images/lg8.png" alt=""></a></li>
                <li><a href="#"><img class="img-responsive" src="images/lg9.png" alt=""></a></li>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
    <!--//partners-->
</div>
<!--footer-->
<div class="footer">

    <div class="footer-bottom">
        <div class="container">
            <div class="col-md-4 footer-logo">
                <h2><a href="index.html">小飞人</a></h2>
            </div>
            <div class="col-md-8 footer-class">
                <p></p>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!--//footer-->
</body>
</html>