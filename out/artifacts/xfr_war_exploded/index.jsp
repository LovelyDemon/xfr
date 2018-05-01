<%@ page language="java" import="com.util.DBUtil" pageEncoding="UTF-8" %>
<%@page import="my.jianjie" %>
<%@page import="my.news_add" %>
<%@page import="my.pro_add" %>
<%@page import="my.scenic_add" %>

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
                <li><a href="admin/jianjie.jsp"><i class="glyphicon glyphicon-user"> </i>去后台</a></li>
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
            news_add n1 = new news_add();
            DBUtil db1 = new DBUtil();//构建数据库对象
            int nn1 = 1;
            db.tiqunews(n1, nn1);
            String nesavetime1 = n1.getnesavetime();//取得时间
            nesavetime1 = nesavetime1.substring(0, 10);
            String nename1 = n1.getnename();//取得新闻标题
            String nezy1 = n1.getnezy();//取得新闻摘要
            int neid1 = n1.getneid();//取得新闻摘要
        %>
        <h3> 旅游新闻</h3>
        <div class="news">
            <div class="col-md-4 new-more">
                <div class="event">
                    <h4><%out.print(nesavetime1); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid1'"><%out.print(nename1); %></a></h6>
                </div>

                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=1">详细</a>
            </div>
            <div class="col-md-4 new-more">
                <div class="event">
                    <%
                        news_add n2 = new news_add();
                        DBUtil db2 = new DBUtil();//构建数据库对象
                        int nn2 = 2;
                        db.tiqunews(n2, nn2);
                        String nesavetime2 = n2.getnesavetime();//取得时间
                        nesavetime2 = nesavetime2.substring(0, 10);
                        String nename2 = n2.getnename();//取得新闻标题
                        String nezy2 = n2.getnezy();//取得新闻摘要
                        int neid2 = n2.getneid();//取得新闻摘要
                    %>
                    <h4><%out.print(nesavetime2); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid2'"><%out.print(nename2); %></a></h6>
                </div>
                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=2">详细</a>
            </div>
            <div class="col-md-4 new-more">
                <div class="event">
                    <%
                        news_add n3 = new news_add();
                        DBUtil db3 = new DBUtil();//构建数据库对象
                        int nn3 = 3;
                        db.tiqunews(n3, nn3);
                        String nesavetime3 = n3.getnesavetime();//取得时间
                        nesavetime3 = nesavetime3.substring(0, 10);
                        String nename3 = n3.getnename();//取得新闻标题
                        String nezy3 = n3.getnezy();//取得新闻摘要
                        int neid3 = n3.getneid();//取得新闻摘要
                    %>
                    <h4><%out.print(nesavetime3); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid3'"><%out.print(nename3); %></a></h6>
                </div>

                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=3">详细</a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="news">
            <div class="col-md-4 new-more">
                <div class="event">
                    <%
                        news_add n4 = new news_add();
                        DBUtil db4 = new DBUtil();//构建数据库对象
                        int nn4 = 4;
                        db.tiqunews(n4, nn4);
                        String nesavetime4 = n4.getnesavetime();//取得时间
                        nesavetime4 = nesavetime4.substring(0, 10);
                        String nename4 = n4.getnename();//取得新闻标题
                        String nezy4 = n4.getnezy();//取得新闻摘要
                        int neid4 = n4.getneid();//取得新闻摘要
                    %>
                    <h4><%out.print(nesavetime1); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid4'"><%out.print(nename4); %></a></h6>
                </div>

                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=4">详细</a>
            </div>
            <div class="col-md-4 new-more">
                <div class="event">
                    <%
                        news_add n5 = new news_add();
                        DBUtil db5 = new DBUtil();//构建数据库对象
                        int nn5 = 5;
                        db.tiqunews(n5, nn5);
                        String nesavetime5 = n5.getnesavetime();//取得时间
                        nesavetime5 = nesavetime5.substring(0, 10);
                        String nename5 = n5.getnename();//取得新闻标题
                        String nezy5 = n5.getnezy();//取得新闻摘要
                        int neid5 = n5.getneid();//取得新闻摘要
                    %>
                    <h4><%out.print(nesavetime5); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid5'"><%out.print(nename5); %></a></h6>
                </div>
                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=5">详细</a>
            </div>
            <div class="col-md-4 new-more">
                <div class="event">
                    <%
                        news_add n6 = new news_add();
                        DBUtil db6 = new DBUtil();//构建数据库对象
                        int nn6 = 6;
                        db.tiqunews(n6, nn6);
                        String nesavetime6 = n6.getnesavetime();//取得时间
                        nesavetime6 = nesavetime6.substring(0, 10);
                        String nename6 = n6.getnename();//取得新闻标题
                        String nezy6 = n6.getnezy();//取得新闻摘要
                        int neid6 = n1.getneid();//取得新闻摘要
                    %>
                    <h4><%out.print(nesavetime6); %></h4>
                    <h6><a href="NewsfAction?action_flag=view&neid='neid6'"><%out.print(nename6); %></a></h6>
                </div>
                <a class="hvr-sweep-to-right more" href="NewsfAction?action_flag=view&neid=6">详细</a>
            </div>
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
                        <%--<a href="#" class="hi-icon hi-icon-archive glyphicon glyphicon-leaf"> </a>--%>
                        <img src="images/2.jpg" width="80" height="80" alt="">
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
    <div class="services">
        <div class="container">
            <div class="service-top">
                <h3>酒店</h3>

            </div>

            <div class="project-top">
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <img src="images/1-1.jpg" class="img-responsive zoom-img" alt=""/>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> </span>
                                </div>
                                <div class="col-md4">
                                    <strong>逍遥品悟耕读缘</strong>

                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <a href=HotelfAction?action_flag=view&hoid=1 class="hvr-sweep-to-right more">详细</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <img src="images/2-1.jpg" class="img-responsive zoom-img" alt=""/>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> </span>
                                </div>
                                <div class="col-md4">
                                    <strong>生态绿色永旋农庄</strong>

                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <a href="HotelfAction?action_flag=view&hoid=2" class="hvr-sweep-to-right more">详细</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top"><img src="images/3-2.jpg" class="img-responsive zoom-img" alt=""/>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> </span>
                                </div>
                                <div class="col-md4">
                                    <strong>新叶古居农家</strong>

                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <a href="HotelfAction?action_flag=view&hoid=3" class="hvr-sweep-to-right more">详细</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 project-grid">
                    <div class="project-grid-top">
                        <img src="images/4-1.jpg" class="img-responsive zoom-img" alt=""/>
                        <div class="col-md1">
                            <div class="col-md2">
                                <div class="col-md3">
                                    <span class="star"> </span>
                                </div>
                                <div class="col-md4">
                                    <strong>新叶明香园</strong>
                                    <small></small>
                                </div>
                                <div class="clearfix"></div>
                            </div>

                            <a href="HotelfAction?action_flag=view&hoid=4" class="hvr-sweep-to-right more">详细</a>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
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