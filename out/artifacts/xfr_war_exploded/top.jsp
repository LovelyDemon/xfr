<%@ page language="java" import="com.util.DBUtil" pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
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
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <!--logo-->
        <div class="logo">
            <%--<img src="images/顶部logo.png" alt="小飞人" href="index.jsp">--%>
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
<div class=" banner-buying">
    <div class=" container">
        <%--<h3><span>hel</span>lo</h3>--%>

        <div class="clearfix"></div>
        <!--initiate accordion-->
        <script type="text/javascript">
            $(function () {
                var menu_ul = $('.menu > li > ul'),
                    menu_a = $('.menu > li > a');
                menu_ul.hide();
                menu_a.click(function (e) {
                    e.preventDefault();
                    if (!$(this).hasClass('active')) {
                        menu_a.removeClass('active');
                        menu_ul.filter(':visible').slideUp('normal');
                        $(this).addClass('active').next().stop(true, true).slideDown('normal');
                    } else {
                        $(this).removeClass('active');
                        $(this).next().stop(true, true).slideUp('normal');
                    }
                });

            });
        </script>

    </div>
</div>
<!--//header-->

</body>
</html>