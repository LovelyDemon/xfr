<%@ page language="java" import="java.util.Map" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath() + "/" + "admin";
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Map<String, Object> map = (Map<String, Object>) request.getAttribute("detailMap");
%>
<jsp:include page="index_admin.jsp"/>
<head>
    <base href="<%=basePath%>">

    <title>查看结伴详情</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">

</head>
<body>
<script src="js/bootstrap.min.js"></script>
<div id="page-wrapper">
    <div class="graphs">
        <div class="xs">
            <h3><b>结伴详情</b></h3>
            <div class="tab-content">
                <div class="tab-pane active" id="horizontal-form">
                    <form class="form-horizontal" action="pro_add" method=post enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>标题</b></label>
                            <div class="col-sm-8"><input type="text" class="form-control1" id="title" name="title"
                                                         value=<%=map.get("title") %> readonly></div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>出发时间</b></label>
                            <div class="col-sm-8" style="width: 250px">
                                <input type="text" class="form-control1" id="startDate" name="startDate"
                                                         value=<%=map.get("start_date") %> readonly>
                            </div>
                            <label for="focusedinput" class="col-sm-2 control-label"><b>结束时间</b></label>
                            <div class="col-sm-8" style="width: 250px">
                                <input type="text" class="form-control1" id="endDate" name="endDate"
                                       value=<%=map.get("end_date") %> readonly>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>旅行地</b></label>
                            <div class="col-sm-8"><input type="text" class="form-control1" id="location" name="location"
                                                         value=<%=map.get("location") %> readonly></div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>人数限制</b></label>
                            <div class="col-sm-8"><input type="text" class="form-control1" id="limitNum" name="limitNum"
                                                         value=<%=map.get("limit_num") %> readonly></div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>联系方式</b></label>
                            <div class="col-sm-8"><input type="text" class="form-control1" id="phone" name="phone"
                                                         value=<%=map.get("phone") %> readonly></div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="focusedinput" class="col-sm-2 control-label"><b>组队详情</b></label>
                            <div class="col-sm-8"><textarea name="detail" id="detail" value=cols="50" rows="4"
                                                            class="form-control1"
                                                            style="height: 125px; width: 683px; "><%=map.get("detail") %></textarea>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <br>
                            <label for="focusedinput" class="col-sm-2 control-label"><b>图片</b></label>
                            <img src="../images/1-1.jpg">
                        </div>
                    </form>
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