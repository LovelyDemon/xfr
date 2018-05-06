<%@ page language="java" import="java.util.Map" pageEncoding="UTF-8" %>
<jsp:include page="top.jsp"/>
<body>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    Map<String, Object> map = (Map<String, Object>) request.getAttribute("hotelMap");
    String userName = (String) request.getSession().getAttribute("userName");
%>

<jsp:include page="navigationBar.jsp"/>

<!--contact-->
<div class="contact">
    <div class="container">
        <h3>酒店预订</h3>
        <div class="contact-top">
            <form class="form-horizontal" action="hotel_order" method="post">
                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>酒店名称</b></label>
                    <div class="col-sm-8"><input type="text" class="form-control1" id="ordname" name="ordname"
                                                 value=<%=map.get("honame") %> readonly><br></div>
                </div>


                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>房型</b></label>
                    <div class="col-sm-8"><select class="in-drop" style="width: 155px; height: 29px" id="ordkind"
                                                  name="ordkind">
                        <option>大床房</option>
                        <option>标准间</option>

                    </select><br></div>
                </div>

                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>入住人姓名</b></label>
                    <div class="col-sm-8"><input type="text" class="form-control1" id="orduname" name="orduname"
                                                 value=<%out.print(userName); %> readonly><br></div>
                </div>
                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>联系方式</b></label>
                    <div class="col-sm-8"><input type="text" class="form-control1" id="ordphone" name="ordphone"
                                                 required><br></div>
                </div>
                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>入住时间</b></label>
                    <div class="col-sm-8"><input type="date" class="form-control1 ng-invalid ng-invalid-required"
                                                 id="orddate" name="orddate" ng-model="model.date" required
                                                 style="height: 27px; ">
                    </div>
                </div>

                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>入住天数</b></label>
                    <div class="col-sm-8"><input type="text" class="form-control1" id="ordlong" name="ordlong" required><br>
                    </div>
                </div>


                <div class="form-group">
                    <label for="focusedinput" class="col-sm-2 control-label"><b>备注</b></label>
                    <div class="col-sm-8"><textarea name="ordbz" id="ordbz" cols="50" rows="4" class="form-control1"
                                                    style="height: 125px; width: 683px; "></textarea></div>
                    <br/>
                </div>

                <button type="submit" class="btn btn-primary">确定</button>
                <button type="button" class="btn btn-primary" onclick="javascript:history.go(-1)">返回</button>
            </form>

        </div>


        <div class="clearfix"></div>
    </div>
</div>

</div>
<!--//contact-->
<!--footer-->
<jsp:include page="bottom.jsp"/>
<!--//footer-->
</body>
</html>