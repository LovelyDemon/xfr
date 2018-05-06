<%@ page language="java" import="com.change.NewsDao" pageEncoding="UTF-8" %>
<%@page import="com.change.NewsService" %>
<%@page import="com.util.DBUtil" %>
<%@page import="com.util.DividePage" %>
<%@page import="my.scenic_add" %>
<%@page import="java.util.List" %>

<%@page import="java.util.Map" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Map<String, Object> map = (Map<String, Object>) request.getAttribute("newsMap");
    List<Map<String, Object>> list2 = (List<Map<String, Object>>) request.getAttribute("listpl");
// 获取 分页对象
    DividePage dividePage = (DividePage) request.getAttribute("dividePage");
// 获取查询的关键词
    String newsName = (String) request.getAttribute("newsName");
    String a = (String) request.getSession().getAttribute("neiiid");
    System.out.println("jojojoj" + a);
    if (list2 == null) {
        //第一次进news_ main.jsp页面，默认加载所有的新闻
        NewsService service = new NewsDao();
        int totalRecord = service.getplCount("");
        dividePage = new DividePage(10, totalRecord, 1);
        int start = dividePage.fromIndex();
        int end = dividePage.toIndex();
        System.out.println(a);
        list2 = service.listpl(a, start, end);
    }
%>
<jsp:include page="top.jsp"/>
<script type="text/javascript">
    function first() {

        window.location.href = "<%=path%>/NewsfAction?action_flag=list&neid=" + getSelectedValue() + "&pageNum=1";

    }

    function next() {

        window.location.href = "<%=path%>/NewsfAction?action_flag=list&neid=" + getSelectedValue() + "&pageNum=<%=dividePage.getCurrentPage()+1%>";

    }

    function forward() {

        window.location.href = "<%=path%>/NewsfAction?action_flag=list&neid=" + getSelectedValue() + "&pageNum=<%=dividePage.getCurrentPage()-1%>";

    }

    function end() {

        window.location.href = "<%=path%>/NewsfAction?action_flag=list&neid=" + getSelectedValue() + "&pageNum=<%=dividePage.getPageCount() %>";

    }

    function changePage(currentPage) {

        window.location.href = "<%=path%>/NewsfAction?action_flag=list&neid=" + getSelectedValue() + "&pageNum=" + currentPage;

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
        th.action = "<%=path%>/NewsAction?action_flag=del";
        th.submit();

    }

    function add() {

        var th = document.form1;
        th.action = "<%=path%>/NewsfAction?action_flag=add&neid=" + getSelectedValue();
        th.submit();

    }

    function getSelectedValue() {
        var ids = "<%=session.getAttribute("neiiid")%>";
        return ids;

    }

    function view() {

        if (getSelectedCount() < 1) {

            alert("至少选择一个查看项！");
            return;

        } else if (getSelectedCount() > 1) {
            alert("只能选择一个查看项！");
            return;
        }

        var th = document.form1;
        th.action = "<%=path%>/NewsAction?action_flag=view&neid=" + getSelectedValue();
        th.submit();

    }


</script>
<body>

<jsp:include page="navigationBar.jsp"/>

<!--blog-->
<div class="blog">
    <div class="container">
        <div class="col-md-9 blog-head">
            <div class="blog-top">
                <h4><%=map.get("nename")%><br></h4>
                <img src="<%=path%>/upload/<%=map.get("nepic") %>" class="img-responsive" alt=""
                     style="height: 300px; width: 684px; "/><br><br>

                <h5>编辑 : <%=map.get("neactor") %> | 发布时间 : <%=map.get("nesavetime") %>
                </h5>
                <p><%=map.get("nenr") %>
                </p>
                <div class="links">
                    <ul class="blog-links">
                    </ul>
                </div>
            </div>
            <!---->
            <div class="single-grid">
                <h5>评论</h5>


                <div class="media">


                    <ul class="career-start">
                        <%
                            if (list2 != null && !list2.isEmpty()) {
                                for (Map<String, Object> map2 : list2) {

                        %>
                        <div class="media">
                            <div class="media-left">

                                <img class="media-object" src="images/av.png" alt=""/>

                            </div>
                            <div class="media-body">
                                <h4 class="media-heading" style="width: 123px; "><%=map2.get("uname")%>
                                </h4>
                                <p><%=map2.get("neplnr")%>
                                </p>
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


                </div>
            </div>
            <!---->
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
            <div class="leave">
                <h5>发表评论</h5>
                <form form name="form1" action="" method="post">

                    <textarea placeholder="评论" name="neplnr" id="neplnr"></textarea>
                    <label class="hvr-sweep-to-right">
                        <input type="submit" value="提交" onclick="javascript:add();"></input>

                    </label>
                </form>
            </div>
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

    </div>
</div>
<!--//blog-->
<!--//footer-->
<jsp:include page="bottom.jsp"/>
<!--//footer-->
</body>
</html>