<%@ page language="java" import="com.util.DBUtil" pageEncoding="UTF-8" %>
<%@page import="my.scenic_add" %>

<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.change.CompanionAction" %>
<jsp:include page="top.jsp"/>
<body>

<jsp:include page="navigationBar.jsp"/>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Map<String, Object> map = (Map<String, Object>) request.getAttribute("detailMap");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    CompanionAction companionAction = new CompanionAction();
    Boolean signUp = companionAction.isSignUp(request, response);
%>

<div class="container">
    <div class="future">
        <h3>结伴详情</h3>
        <div class="buy-single-single">
            <div class="col-md-9 single-box">
                <div class=" buying-top">
                    <div class="flexslider">
                        <ul class="slides">
                            <li data-thumb="<%=path%>/upload/<%=map.get("img_url") %>">
                                <img src="<%=path%>/upload/<%=map.get("img_url") %>" style="height: 400px;"/>
                            </li>
                            <li data-thumb="<%=path%>/upload/<%=map.get("img_url2") %>">
                                <img src="<%=path%>/upload/<%=map.get("img_url2") %>" style="height: 400px; "/>
                            </li>
                            <li data-thumb="<%=path%>/upload/<%=map.get("img_url3") %>">
                                <img src="<%=path%>/upload/<%=map.get("img_url3") %>" style="height: 400px;  "/>
                            </li>
                            <li data-thumb="<%=path%>/upload/<%=map.get("img_url4") %>">
                                <img src="<%=path%>/upload/<%=map.get("img_url4") %>" style="height: 400px;"/>
                            </li>
                        </ul>
                    </div>
                    <!-- FlexSlider -->
                    <script defer src="js/jquery.flexslider.js"></script>
                    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>

                    <script>
                        $(window).load(function () {
                            $('.flexslider').flexslider({
                                animation: "slide",
                                controlNav: "thumbnails"
                            });
                        });
                    </script>
                </div>
                <div class="buy-sin-single">
                    <div class="col-sm-5 middle-side immediate">
                        <h4><%=map.get("title") %></h4>
                        <h5>日期 : <%=sdf.format(map.get("start_date"))%> —— <%=sdf.format(map.get("end_date"))%></h5>
                        <h5>旅行地点 : <%=map.get("location") %></h5>
                        <h5>限制人数 : <%=map.get("limit_num") %></h5>
                        <h5>已报名人数 : <%=map.get("limit_num") %></h5>
                        <h5>联系方式 : <%=map.get("phone") %></h5>
                        </p>
                        <% if(signUp){ %>
                            <button type="button" disabled="true" class="btn btn-primary">已报名</button>
                        <% }else{ %>
                            <a href="CompanionAction?action_flag=sign_up&id=<%=map.get("id") %>"
                               class="hvr-sweep-to-right more">报名</a>
                        <% } %>
                        </p>
                    </div>
                    <div class="col-sm-7 buy-sin">
                        <h4>旅行详情</h4>
                        <p><%=map.get("detail") %>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>


            <div class="col-md-3">
                <div class="single-box-right right-immediate">
                    <h4><b>热门景点</b></h4>
                    <%
                        scenic_add s1 = new scenic_add();
                        scenic_add s2 = new scenic_add();
                        scenic_add s3 = new scenic_add();
                        scenic_add s4 = new scenic_add();
                        scenic_add s5 = new scenic_add();
                        DBUtil dbbb1 = new DBUtil();//构建数据库对象
                        String ss1 = "1";
                        dbbb1.tiquscenic(s1, ss1);
                        String scname1 = s1.getscname();//取得新闻标题
                        String sctj1 = s1.getsctj();//取得新闻摘要

                        String ss2 = "2";
                        dbbb1.tiquscenic(s2, ss2);
                        String scname2 = s2.getscname();//取得新闻标题
                        String sctj2 = s1.getsctj();//取得新闻摘要

                        String ss3 = "3";
                        dbbb1.tiquscenic(s3, ss3);
                        String scname3 = s3.getscname();//取得新闻标题
                        String sctj3 = s3.getsctj();//取得新闻摘要
                        String ss4 = "4";
                        dbbb1.tiquscenic(s4, ss4);
                        String scname4 = s4.getscname();//取得新闻标题
                        String sctj4 = s4.getsctj();//取得新闻摘要

                        String ss5 = "5";
                        dbbb1.tiquscenic(s5, ss5);
                        String scname5 = s5.getscname();//取得新闻标题
                        String sctj5 = s5.getsctj();//取得新闻摘要


                    %>
                    <div class="single-box-img ">
                        <div class="box-img">
                            <a href="ScenicfAction?action_flag=view&scid=1"><img class="img-responsive"
                                                                                 src="images/sl.jpg" alt=""></a>
                        </div>
                        <div class="box-text">
                            <p><%out.print(scname1); %></p>
                            <a href="ScenicfAction?action_flag=view&scid=1" class="in-box">查看</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="single-box-img">
                        <div class="box-img">
                            <a href="ScenicfAction?action_flag=view&scid=2"><img class="img-responsive"
                                                                                 src="images/sl1.jpg" alt=""></a>
                        </div>
                        <div class="box-text">
                            <p><%out.print(scname2); %></p>
                            <a href="ScenicfAction?action_flag=view&scid=2" class="in-box">查看</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="single-box-img">
                        <div class="box-img">
                            <a href="ScenicfAction?action_flag=view&scid=3"><img class="img-responsive"
                                                                                 src="images/sl2.jpg" alt=""></a>
                        </div>
                        <div class="box-text">
                            <p><a href="single.html"><%out.print(scname3); %></a></p>
                            <a href="ScenicfAction?action_flag=view&scid=3" class="in-box">查看</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="single-box-img">
                        <div class="box-img">
                            <a href="ScenicfAction?action_flag=view&scid=4"><img class="img-responsive"
                                                                                 src="images/sl3.jpg" alt=""></a>
                        </div>
                        <div class="box-text">
                            <p><%out.print(scname4); %></p>
                            <a href="ScenicfAction?action_flag=view&scid=4" class="in-box">查看</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="single-box-img">
                        <div class="box-img">
                            <a href="ScenicfAction?action_flag=view&scid=5"><img class="img-responsive"
                                                                                 src="images/sl4.jpg" alt=""></a>
                        </div>
                        <div class="box-text">
                            <p><%out.print(scname5); %></p>
                            <a href="ScenicfAction?action_flag=view&scid=5" class="in-box">查看</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!---->

<!--footer-->
<jsp:include page="bottom.jsp"/>
<!--//footer-->
</body>
</html>