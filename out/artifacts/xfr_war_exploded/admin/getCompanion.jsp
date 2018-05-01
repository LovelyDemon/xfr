<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.change.CompanionService"
         pageEncoding="UTF-8" %>
<%@page import="com.change.CompanionServiceImpl" %>
<%@page import="com.util.DividePage" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>
<jsp:include page="index_admin.jsp"/>

<%
    String path = request.getContextPath() + "/" + "admin";

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //获取 session 中的 username;
    String username = (String) session.getAttribute("username");
    //获取从 servlet ProductActiion 中 传递的参数(数据库查询的结果)
    List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("getListByPage");
    // 获取 分页对象
    DividePage dividePage = (DividePage) request.getAttribute("dividePage");
    // 获取查询的关键词
    String title = (String) request.getAttribute("title");
    if (list == null) {
        //第一次进 main.jsp页面，默认加载所有的产品
        CompanionService service = new CompanionServiceImpl();
        int totalRecord = service.getCount("");
        dividePage = new DividePage(5, totalRecord, 1);
        int start = dividePage.fromIndex();
        int end = dividePage.toIndex();
        list = service.getListByPage("", start, end);
    }

%>
<head>
    <base href="<%=basePath%>">
    <title>修改/删除结伴</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript">
        function search() {
            var th = document.form2;
            th.action = "<%=path%>/CompanionAction?action_flag=search";
            th.submit();
        }

        function first() {
            window.location.href = "<%=path%>/CompanionAction?action_flag=search&pageNum=1";
        }

        function next() {
            window.location.href = "<%=path%>/CompanionAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()+1%>";
        }

        function forward() {
            window.location.href = "<%=path%>/CompanionAction?action_flag=search&pageNum=<%=dividePage.getCurrentPage()-1%>";
        }

        function end() {
            window.location.href = "<%=path%>/CompanionAction?action_flag=search&pageNum=<%=dividePage.getPageCount() %>";
        }

        function changePage(currentPage) {
            window.location.href = "<%=path%>/CompanionAction?action_flag=search&pageNum=" + currentPage;
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
            th.action = "<%=path%>/CompanionAction?action_flag=delete";
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
            if (getSelectedCount() < 1) {

                alert("至少选择一个查看项！");
                return;

            } else if (getSelectedCount() > 1) {
                alert("只能选择一个查看项！");
                return;
            }
            var th = document.form1;
            th.action = "<%=path%>/CompanionAction?action_flag=view&id=" + getSelectedValue();
            th.submit();
        }
    </script>

</head>
<body>
<script src="js/bootstrap.min.js"></script>
<div id="page-wrapper">
    <div class="graphs">
        <div class="xs">
            <h3><b>结伴信息列表</b></h3>
            <form class="form-horizontal" name="form2" action="" method="post">
                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>名称</b></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control1" name="title"
                               value="<%= title!=null?title:"" %>"/>
                        <button type="button" onclick="search()">查找</button>
                    </div>
                </div>
            </form>
            <form class="form-horizontal" form name="form1" action="" method="post">
                <div class="tab-content">
                    <div class="tab-pane active" id="horizontal-form">

                        <div class="bs-example4" data-example-id="contextual-table">
                            <table class="table">
                                <thead>
                                <tr>
                                    <td width=10%></td>
                                    <th style="width: 10%;text-align: center; ">标题</th>
                                    <th style="width: 10%;text-align: center; ">出发时间</th>
                                    <th style="width: 10%;text-align: center; ">结束时间</th>
                                    <th style="width: 10%;text-align: center; ">旅行地</th>
                                    <th style="width: 10%;text-align: center; ">限制人数</th>
                                    <th style="width: 10%;text-align: center; ">联系方式</th>
                                    <th style=text-align:center;>组队详情</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="active">
                                        <%
   			if(list!=null && !list.isEmpty()){

   				for(Map<String,Object> map :list){%>

                                <tr align="center">
                                    <td width=10%><input type="checkbox" name="ids" value="<%=map.get("id") %>"/></td>
                                    <td width=10%><%=map.get("title") %>
                                    </td>
                                    <td width=10%><%=map.get("start_date") %>
                                    </td>
                                    <td width=10%><%=map.get("end_date") %>
                                    </td>
                                    <td width=10%><%=map.get("location") %>
                                    </td>
                                    <td width=10%><%=map.get("limit_num") %>
                                    </td>
                                    <td width=10%><%=map.get("phone") %>
                                    </td>
                                    <td><%=map.get("getDetail") %>
                                    </td>

                                        <%}
   			}else{%>
                                <tr align="center">
                                    <td width=10%><input type="checkbox" name=""/></td>
                                    <td width=10%></td>
                                    <td width=10%></td>
                                    <td width=10%></td>
                                    <td width=10%></td>
                                    <td width=10%></td>
                                    <td width=10%></td>
                                    <td></td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
            </form>
            </td>

            </tr>

            <tr>
                <td>
                    <button type="button" onclick="javascript:del();">删除</button>
                    <button type="button" onclick="javascript:view();">查看</button>

                </td>
            </tr>

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
        </div>


        <div class="panel-footer">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2">
                    <div class="col-sm-8 col-sm-offset-2" style="height: 93px; ">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>