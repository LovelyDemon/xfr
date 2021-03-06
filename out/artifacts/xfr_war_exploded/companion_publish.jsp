<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.change.CompanionService" pageEncoding="UTF-8" %>
<%@ page import="com.change.CompanionServiceImpl" %>
<%@ page import="com.util.DividePage" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<jsp:include page="top.jsp"/>

<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    //获取 session 中的 username;
    String username = (String) session.getAttribute("username");
    //获取从中 传递的参数(数据库查询的结果)
    List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute("getListByPage");
    // 获取 分页对象
    DividePage dividePage = (DividePage) request.getAttribute("dividePage");
    // 获取查询的关键词
    Object titleObj = request.getAttribute("title");
    String title = "";
    if (titleObj != null) {
        title = (String) titleObj;
    }

    if (list == null) {
        //第一次进页面，默认加载所有的数据
        CompanionService service = new CompanionServiceImpl();
        int totalRecord = service.getCount("");
        dividePage = new DividePage(20, totalRecord, 1);
        int start = dividePage.fromIndex();
        int end = dividePage.toIndex();
        list = service.getListByPage("", start, end);
    }
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

%>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css" media="all">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/scripts.js"></script>
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
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

<jsp:include page="navigationBar.jsp"/>

<div class="dealers">
    <div class="container">
        <h3>发布组队</h3>
        <br>

        <div class="container">
            <form class="layui-form" action="/CompanionAction">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题</label>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入少于30字标题" class="layui-input" style="width: 500px">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label" style="width: 100px">出发时间</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" name="startDate" id="startDate" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label" style="width: 100px">结束时间</label>
                        <div class="layui-input-inline">
                            <input type="text" class="layui-input" name="endDate" id="endDate" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">旅行地</label>
                    <div class="layui-input-block">
                        <input type="text" name="location" lay-verify="location" autocomplete="off" placeholder="请输入旅行地点，越详细越好哦！" class="layui-input" style="width: 500px">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">人数限制</label>
                    <div class="layui-input-block">
                        <input type="text" name="limitNum" lay-verify="location" autocomplete="off" class="layui-input" style="width: 50px">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label" style="width: 100px">联系方式</label>
                    <div class="layui-input-block">
                        <input type="text" name="phone" lay-verify="phone" autocomplete="off" class="layui-input" style="width: 200px">
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label" style="width: 100px">组队详情</label>
                    <div class="layui-input-block">
                        <textarea name="detail" placeholder="请尽可能详细的描述你的组队及出行计划哦！" class="layui-textarea" style="width: 500px"></textarea>
                    </div>
                </div>

                <div class="layui-upload">
                    <button type="button" class="layui-btn" id="uploadImg">上传图片</button>
                    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                        预览图：
                        <div class="layui-upload-list" id="preview"></div>
                    </blockquote>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="submit" lay-filter="submit" id="submit">发布</button>
                    </div>
                </div>
            </form>
        </div>

    </div>
</div>

<script src="layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate','upload'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        var $ = layui.jquery
            ,upload = layui.upload;

        //日期
        laydate.render({
            elem: '#startDate'
        });

        laydate.render({
            elem: '#endDate'
        });

        //多图片上传
        upload.render({
            elem: '#uploadImg'
            ,auto:false
            ,bindAction:'#submit'
            ,url: '/upload'
            ,multiple: true
            ,choose: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#preview').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="height: 100px">')
                });
            }
            ,done: function(res){
                //上传完毕
            }
        });

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(submit)', function(data){
            console.log(data.elem) //被执行事件的元素DOM对象，一般为button对象
            console.log(data.form) //被执行提交的form对象，一般在存在form标签时才会返回
            console.log(data.field) //当前容器的全部表单字段，名值对形式：{name: value}
        });
    });
</script>
<!--footer-->
<jsp:include page="bottom.jsp"/>
<!--//footer-->
</body>
</html>