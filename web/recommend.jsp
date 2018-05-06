<%@ page language="java" import="com.change.RecDao" pageEncoding="UTF-8" %>
<%@page import="com.change.RecService" %>
<%@page import="com.util.DBUtil" %>
<%@page import="com.util.DividePage" %>
<%@page import="my.scenic_add" %>
<%@page import="java.util.List" %>

<%@page import="java.util.Map" %>
<jsp:include page="top.jsp"/>
<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
//获取 session 中的 username;
    String username = (String) session.getAttribute("username");
//获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
    List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("listRec");
// 获取 分页对象
    DividePage dividePage = (DividePage) request.getAttribute("dividePage");
// 获取查询的关键词
    String recName = (String) request.getAttribute("recName");
    if (list == null) {
        //第一次进news_ main.jsp页面，默认加载所有的新闻
        RecService service = new RecDao();
        int totalRecord = service.getItemCount("");
        dividePage = new DividePage(5, totalRecord, 1);
        int start = dividePage.fromIndex();
        int end = dividePage.toIndex();
        list = service.listRec("", start, end);
    }

%>
<head>
    <base href="<%=basePath%>">
    <title>推荐管理</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript">
        function searchProduct() {
            var th = document.form2;
            th.action = "<%=path%>/RecfAction?action_flag=search";
            th.submit();
        }

        function first() {

            window.location.href = "<%=path%>/RecfAction?action_flag=search&pageNum=1";

        }

        function next() {

            window.location.href = "<%=path%>/RecfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";

        }

        function forward() {

            window.location.href = "<%=path%>/RecfAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";

        }

        function end() {

            window.location.href = "<%=path%>/RecfAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";

        }

        function changePage(currentPage) {

            window.location.href = "<%=path%>/RecfAction?action_flag=search&pageNum=" + currentPage;

        }

        function selectAll(flag) {

            var ids = document.getElementsByName("ids");
            for (var i = 0; i < ids.length; i++) {
                ids[i].checked = flag;
            }

        }

        function getSelectedCount() {

            var ids = document.getElementsByName("ids");
            var count = 0;
            for (var i = 0; i < ids.length; i++) {

                ids[i].checked == true ? count++ : 0;
            }
            return count;

        }

        function del() {

            if (getSelectedCount() == 0) {

                alert("至少选择一个删除项！");
                return;

            }
            var th = document.form1;
            th.action = "<%=path%>/RecfAction?action_flag=del";
            th.submit();

        }

        function getSelectedValue() {
            var ids = document.getElementsByName("ids");

            for (var i = 0; i < ids.length; i++) {

                if (ids[i].checked) {
                    return ids[i].value;
                }
            }

        }

        function view() {

            var th = document.form1;
            th.action = "<%=path%>/RecfAction?action_flag=view&reid=" + getSelectedValue();
            th.submit();

        }


    </script>

</head>
<body>

<jsp:include page="navigationBar.jsp"/>

<!--blog-->
<div class="blog">
    <div class="container">
        <h3>推荐路线</h3>
        <div class="col-md-9 blog-head">
            <form class="form-horizontal" form name="form1" action="" method="post">

                <%
                    if (list != null && !list.isEmpty()) {

                        for (Map<String, Object> map : list) {
                %>

                <div class="blog-top">
                    <img src="<%=path%>/upload/<%=map.get("repic") %>" class="img-responsive" alt=""
                         style="height: 222px; width: 612px; "/>
                    <h4><a href="RecfAction?action_flag=view&reid=<%=map.get("reid") %>"><%=map.get("rename") %>
                    </a></h4>
                    <h5>作者 :<%=map.get("reactor") %> | 发布时间 : <%=map.get("redate") %>
                    </h5>
                    <p><%=map.get("rezy") %>
                    </p>
                    <a class="hvr-sweep-to-right more"
                       href="RecfAction?action_flag=view&reid=<%=map.get("reid") %>">详细</a>
                    <div class="links">
                        <ul class="blog-links">
                            <li><a href="RecfAction?action_flag=like1&reid=<%=map.get("reid") %>"><i
                                    class="blog_circle"><%=map.get("relike") %>
                            </i><span>赞</span></a></li>
                            <li><a href="RecfAction?action_flag=fav1&reid=<%=map.get("reid") %>"><i
                                    class="glyphicon glyphicon-heart"> </i><span>收藏</span></a></li>
                        </ul>
                    </div>


                </div>
                <%
                    }


                } else {
                %>

                <tr align="center">

                    <td></td>

                </tr>
                <%

                    }
                %>
                </ul>

            </form>

        </div>


        <div class="col-md-3 blog-sidebar">
            <div class="single-box-right right-immediate">
                <h4><b>推荐景点</h4>
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
                        <a href="ScenicfAction?action_flag=view&scid=1"><img class="img-responsive" src="images/sl.jpg"
                                                                             alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><%out.print(scname1); %></p>
                        <a href="ScenicfAction?action_flag=view&scid=1" class="in-box">查看</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-box-img">
                    <div class="box-img">
                        <a href="ScenicfAction?action_flag=view&scid=2"><img class="img-responsive" src="images/sl1.jpg"
                                                                             alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><%out.print(scname2); %></p>
                        <a href="ScenicfAction?action_flag=view&scid=2" class="in-box">查看</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-box-img">
                    <div class="box-img">
                        <a href="ScenicfAction?action_flag=view&scid=3"><img class="img-responsive" src="images/sl2.jpg"
                                                                             alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><a href="single.html"><%out.print(scname3); %></a></p>
                        <a href="ScenicfAction?action_flag=view&scid=3" class="in-box">查看</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-box-img">
                    <div class="box-img">
                        <a href="ScenicfAction?action_flag=view&scid=4"><img class="img-responsive" src="images/sl3.jpg"
                                                                             alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><%out.print(scname4); %></p>
                        <a href="ScenicfAction?action_flag=view&scid=4" class="in-box">详细</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="single-box-img">
                    <div class="box-img">
                        <a href="ScenicfAction?action_flag=view&scid=5"><img class="img-responsive" src="images/sl4.jpg"
                                                                             alt=""></a>
                    </div>
                    <div class="box-text">
                        <p><%out.print(scname5); %></p>
                        <a href="ScenicfAction?action_flag=view&scid=5" class="in-box">查看</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <br>
        </div>
        <div class="clearfix"></div>
        <div class="container" style="height: 39px; ">

        </div>
        <center>
            <tr style=" text-align: center; width: 733px">
                <td colspan="4" align="center">
                    共<%=dividePage.getPageCount()  %>页
                    <a href="javascript:first();">首页</a>
                    <a href="javascript:forward();">上一页</a>
                    <a href="javascript:next();">下一页</a>
                    <a href="javascript:end();">尾页</a>
                    跳转到<select name="select" onchange="changePage(this.value)">

                    <%
                        int pageCount = dividePage.getPageCount();
                        if (pageCount > 0) {
                            for (int i = 1; i <= pageCount; i++) {%>

                    <option value="<%=i %>" <%= (i == dividePage.getCurrentPage() ? "selected" : "")%>><%=i %>
                    </option>

                    <%
                        }

                    } else {// 无记录
                    %>
                    <option value="1">1</option>
                    <%
                        }

                    %>

                </select>

                </td>
            </tr>
        </center>
    </div>

</div>


</div>
</div>
<!--//blog-->
<jsp:include page="bottom.jsp"/>

</body>
</html>