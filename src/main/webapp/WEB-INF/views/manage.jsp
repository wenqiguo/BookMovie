<%@page import="com.nylg.wq.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)request.getSession().getAttribute("user");
	if(user == null){
		response.sendRedirect("/user/mainMovie.do");
	}else{
        if(user.getUserRole() != 1){
            response.sendRedirect("/user/mainMovie.do");
        }
    }
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="<%=basePath%>static/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=basePath%>static/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>static/static/bootstrap/js/bootstrap.min.js"></script>
    <link rel="icon" type="image/x-icon" href="<%=basePath%>static/static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/manage.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/footer.css">
    <script src="<%=basePath%>static/static/js/header.js" charset="utf-8"></script>
    <script src="<%=basePath%>static/static/js/echarts.js"></script>
    <script src="<%=basePath%>static/static/js/Api.js"></script>
    <script src="<%=basePath%>static/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=basePath%>static/static/layui/css/layui.css" media="all">
    <title>沃美电影-后台管理</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>

    <!-- 占位符 -->
    <div style="margin-top: 110px;"></div>

    <!-- 主体 -->
    <div class="container">
        <div class="contents">
            <div class="nav-next">
                <div class="nav-title">
                    <h3>后台管理</h3>
                </div>
                <a class="cardId">用户管理</a>
                <a class="cardId">电影管理</a>
                <a class="cardId">场次管理</a>
                <a class="cardId">评论管理</a>
                <a class="cardId">订单管理</a>
                <a class="cardId">票房统计</a>
            </div>
            <div class="nav-body">
                <!-- 用户管理 -->
                <div class="one card" style="display: block;">
                    <div>
                        <div class="title">用户管理</div>
                        <hr/>
                    </div>
                    <!-- 用户列表 -->
                    <div class="userlist">
                        <table class="layui-hide" id="user_table_id" lay-filter="UserTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 电影管理 -->
                <div class="two card" style="display: none;">
                    <div>
                        <div class="title">电影管理</div>
                        <hr/>
                    </div>
                    <div class="main-inner">
                        <div class="addMovie">
                            <img alt="" src="<%=basePath%>static/static/images/addMovie.png" onclick="addConfirm(-1)">
                            <span>添加电影</span>
                        </div>
                        <div class="movie-grid">
                            <div class="panel-header">
                                <span class="panel-title">
                                </span>
                            </div>
                            <div class="panel-content">
                                <ul class="movies-list">
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 场次管理 -->
                <div class="three card" style="display: none;">
                    <div>
                        <div class="title">场次管理</div>
                        <hr/>
                    </div>
                    <!-- 场次列表 -->
                    <div class="schedulelist">
                        <table class="layui-hide" id="schedule_table_id" lay-filter="ScheduleTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 评论管理 -->
                <div class="four card" style="display: none;">
                    <div>
                        <div class="title">评论管理</div>
                        <hr/>
                    </div>
                    <!-- 评论列表 -->
                    <div class="commentlist">
                        <table class="layui-hide" id="comment_table_id" lay-filter="CommentTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 订单管理 -->
                <div class="five card" style="display: none;">
                    <div>
                        <div class="title">订单管理</div>
                        <hr/>
                    </div>
                    <!-- 订单列表 -->
                    <div class="ticketlist">
                        <table class="layui-hide" id="ticket_table_id" lay-filter="TicketTable" style="margin-right: 5%;"></table>
                    </div>
                </div>
                <!-- 票房统计 -->
                <div class="six card" style="display: none;">
                    <div>
                        <div class="title">票房统计</div>
                        <hr/>
                    </div>
                    <div id="aaa"></div>
                </div>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->

    <!--     用户管理      -->
    <script type="text/html" id="userbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/html" id="usertoolbar">

        <div class="usercheck">
            <input id="userfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="finduserbtn">搜索</button> 
        </div>
        <div class="layui-btn-container adduserbtn">
            <button class="layui-btn  layui-btn-sm" lay-event="useradd">添加用户</button>
        </div>

    </script>

    <!--     场次管理      -->
    <script type="text/html" id="schedulebar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">下架</a>
    </script>
    <script type="text/html" id="scheduletoolbar">
        <div class="layui-btn-container addbtn">
            <button class="layui-btn layui-btn-warm layui-btn-sm" lay-event="scheduleadd">添加场次</button>     
        </div>
        <div class="schedulecheck">
            <input id="scheduletext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入电影名" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findschedulebtn">搜索</button> 
        </div>
        <div class="scheduleonall">
            <button class="layui-btn layui-btn-sm" lay-event="scheduleonallbtn">显示上映</button>
        </div>
        <div class="scheduledownall">
            <button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="scheduledownallbtn">显示下架</button>
        </div>
    </script>
    <script type="text/html" id="scheduledownbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </script>

    <!--     评论管理      -->
    <script type="text/html" id="commentbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="edit">保存</a>
        <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delete">删除</a>
    </script>
    <script type="text/html" id="commenttoolbar">
        <div class="commentcheck">
            <input id="commentfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findcommentbtn">搜索</button>
        </div>

    </script>

    <!--     订单管理      -->
    <script type="text/html" id="ticketbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    </script>
    <script type="text/html" id="tickettoolbar">
        <div class="ticketcheck">
            <input type="button" class="layui-btn-primary layui-btn-sm changeticketBtn" style="width:70px;" lay-event="changeticketbtn" value="用户帐号">
            <input id="ticketfindtext" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户账号" class="layui-input">
            <button class="layui-btn layui-btn-sm" lay-event="findticketbtn">搜索</button>
        </div>
        <div class="orderall">
            <button class="layui-btn layui-btn-sm" lay-event="findorderall">退票审核</button>
        </div>
        <div class="backorder">
            <button class="layui-btn layui-btn-sm layui-btn-normal changeorderBtn" lay-event="backorderbtn">退票订单</button>
        </div>

    </script>
    <script type="text/html" id="backticketbar">
        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="pass">通过</a>
    </script>

    

    <script>
        var clientHeight = document.documentElement.clientHeight;
        var AddUserHtml;
        var MoviesListHtml;
        var addScheduleContent;
        var AddMoviesHtml;
        var ActorNum = 1;
        var temp, flag;
        var changeticketbtn1 = $('.changeticketBtn');
        var selectmovieName;
        var movieArr = [];
        var cinemaArr = [];
        var cinemaJsonArr = [];
        var boxOffice = []; //票房数组
        var movieArray = []; //电影数组
        var movieType = []; //电影类型数组
        var movieTypeBoxOffice = []; //电影类型票房数组
        var types = [];
        window.onload = function(){
            initHeader();
            initHtml(); //初始化html
            initCard(); //选项卡
            initUser(); //用户界面
            initMovies(); //电影界面
            initSchedule(); //场次界面
            initComment(); //评论界面
            initTicket();  //订单界面
            initBoxOffice();//票房统计
        }

        //选项卡
        function initCard(){
            var aArr = $(".nav-next").find(".cardId");
            var divArr = $(".nav-body").find(".card");
            if(localStorage.getItem("cardId")==null){
                localStorage.setItem("cardId",0);
            }
            for(var i=0; i<aArr.length; i++){
                aArr[i].index = i;
                aArr[i].onclick = function(){
                    localStorage.setItem("cardId",this.index);
                    for(var j=0;j<divArr.length;j++){
                        divArr[j].style.display = "none";
                        aArr[j].style.cssText = "background-color: #f4f3f4; color: #333;";
                    }
                    divArr[this.index].style.display = "block";
                    aArr[this.index].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
            for(var p=0;p<aArr.length;p++){
                divArr[p].style.display = "none";
                aArr[p].style.cssText = "background-color: #f4f3f4; color: #333;";
                if(localStorage.getItem("cardId",this.index)==p){
                    divArr[p].style.display = "block";
                    aArr[p].style.cssText = "background-color: #ed3931; color: #fff;";
                }
            }
        }
        //初始化html
        function initHtml(){
            AddUserHtml =
            "<h3 class=\"addusertitle\">用户信息</h3>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">账号</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"username\" class=\"layui-input\">" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">密码</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_pwd\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"password\" class=\"layui-input\">" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item\">" +
                "<label class=\"layui-form-label\">邮箱</label>" +
                "<div class=\"layui-input-block addusertext\">" +
                    "<input id=\"user_email\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"email\" class=\"layui-input\">" +
                "</div>" +
            "</div>";

            AddMoviesHtml =
            "<h3 class=\"addusertitle\">电影信息</h3>" +
            "<div class=\"textside\">" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影名</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_cn_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入电影名字\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影外名</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_fg_name\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入外文电影名字\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">导演</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_director\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入导演名字\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\" style=\"display:inline-block;\">演职人员</label>" +
                    "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                        "<input id=\"movie_actor1\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入演员名字\" class=\"layui-input\">" +
                    "</div>" +
                    "<span style=\"margin-left:10px\">饰</span>" +
                    "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                        "<input id=\"movie_role1\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入演员角色\" class=\"layui-input\">" +
                    "</div>" +
                    "<button type=\"button\" class=\"layui-btn layui-btn-xs\" onclick=\"addActor()\">+</button>" +
                    "<button type=\"button\" class=\"layui-btn layui-btn-xs\" onclick=\"deleteActor()\">-</button>" +
                "</div>" +
                "<div class=\"layui-form-item temp\">" +
                    "<label class=\"layui-form-label\">电影简介</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<textarea id=\"movie_detail\" placeholder=\"请输入电影简介\" class=\"layui-textarea\"></textarea>" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影时长</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_duration\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入数字时长\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影类型</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_type\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"请输入电影类型\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +
                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">上映时间</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_releaseDate\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"格式必须为xxxx-xx-xx\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +

                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">制片地区</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_country\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"输入电影制作国家\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +

                "<div class=\"layui-form-item\">" +
                    "<label class=\"layui-form-label\">电影评分</label>" +
                    "<div class=\"layui-input-block addusertext\">" +
                        "<input id=\"movie_score\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"评分必须为数字\" class=\"layui-input\">" +
                    "</div>" +
                "</div>" +

            "</div>" +
            "<div class=\"pictureside\">" +
                "<div class=\"layui-upload\">" +
                    "<p class=\"movie-picture\">电影海报</p>" +
                    "<div class=\"layui-upload-list\">" +
                        "<img class=\"layui-upload-img\" id=\"demo1\">" +
                        "<p id=\"demoText\"></p>" +
                    "</div>" +
                    "<a href=\"javascript:;\" class=\"file\">选择文件" +
                        "<input type=\"file\" name=\"file\" id=\"file\">" +
                    "</a>" +
                "</div>" +
            "</div>";


            addScheduleContent =
            "<h3 class=\"addtitle\">场次信息</h3>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">电影</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-movie\" lay-filter=\"select\">" +
                    "<select id=\"select_movie_name\" name=\"modules\" lay-verify=\"required\" lay-search=\"\">" +
                        "<option>选择电影</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +
            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">影院</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-cinema\" lay-filter=\"selectCinema\">" +
                    "<select id=\"select_cinema_name\" name=\"modules\" lay-verify=\"required\" lay-filter=\"selectCinemaName\" lay-search=\"\">" +
                        "<option >选择影院</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +

            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">放映厅</label>" +
                "<div class=\"layui-form layui-input-inline addselect drop-hall\" lay-filter=\"select\">" +
                    "<select id=\"select_schedule_hall\" name=\"modules\" lay-verify=\"required\" lay-search=\"\">" +
                        "<option>选择放映厅</option>" +
                    "</select>" +
                "</div>" +
            "</div>" +

            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">场次时间</label>" +
                "<div class=\"layui-input-inline addselect\">" +
                    "<input type=\"text\" class=\"layui-input\" id=\"schedule_startTime_Text\" placeholder=\"yyyy-MM-dd HH:mm\">" +
                "</div>" +
            "</div>" +

            "<div class=\"layui-form-item schedule-div\">" +
                "<label class=\"scheduleLabel\">价格</label>" +
                "<div class=\"layui-input-inline addselect\">" +
                    "<input id=\"schedule_price_Text\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"money\" class=\"layui-input\">" +
                "</div>" +
            "</div>";
        }

        //初始化用户管理界面  用户1
        function initUser(){
            var actionUrl = "";
            //用户列表
            layui.use(['laypage', 'layer', 'table'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                var table = layui.table;
                table.render({
                    elem: '#user_table_id'
                    ,url: url + '/user/findTotalUser.do'
                    ,method: 'post'
                    ,toolbar: '#usertoolbar'
                    ,title: '用户列表'
                    ,cols: [[
                        {field:'userId', title:'用户ID', width:102, unresize: true, sort: true}
                        ,{field:'userName', title:'用户账号', width:270, unresize: true,sort: true}
                        ,{field:'userPwd', title:'密码', width:270, unresize: true, edit: "text"}
                        ,{field:'userEmail', title:'邮箱', width:270, unresize: true, sort: true, edit: "text"}
                        ,{title:'操作', width:300, unresize: true, align:'center', toolbar: '#userbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.status, //解析接口状态
                            "msg": res.message, //解析提示文本
                            "count": res.length, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(UserTable)', function(obj){
                    //对用户信息的查看
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('ID：'+ data.userId + '</br>账号：'+ data.userName + '</br>密码：'+ data.userPwd  + '</br>邮箱：'+ data.userEmail, {offset: clientHeight/4,area: '300px;'});
                    }
                    else if(obj.event === 'edit'){
                        layer.alert('确定要对id为“'+ JSON.stringify(data.userId) + '”的用户修改进行保存吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: "/user/modifyUser.do",
                                    dataType:'json',
                                    data: {
                                        userId: data.userId,
                                        userName: data.userName,
                                        userPwd: data.userPwd,
                                        userEmail: data.userEmail
                                    },
                                    success:function (date) {

                                        if(date.type == "success"){

                                            layer.alert('修改成功！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert('用户名已存在，修改失败！',{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                    else if(obj.event === 'del'){
                        layer.alert('确定要对id为“'+ data.userName + '”的用户进行删除吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/user/delUser.do",
                                    dataType:'json',
                                    data: {
                                        userId: data.userId
                                    },
                                    success:function (date) {
                                        if(date.type == "success"){
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });


                        });
                }
            })
                //监听头工具条
                table.on('toolbar(UserTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'useradd':
                            //添加用户
                            layer.open({
                                type: 1
                                ,title: "添加用户" //不显示标题栏
                                ,closeBtn: false
                                ,area: '400px;'
                                ,shade: 0.8
                                ,offset: clientHeight/5
                                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                                ,btn: ['确认添加', '取消']
                                ,yes: function(){
                                    var user_name = $('#user_name').val();
                                     var  user_pwd = $('#user_pwd').val();
                                     var  user_email = $('#user_email').val();
                                    if((user_name == "") || (user_pwd == "") || (user_email == "")){
                                        layer.alert('添加信息不能存在空，添加失败！',{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                    }
                                    else{
                                        $.ajax({
                                            type:'post',
                                            url:"/user/register.do",
                                            dataType:'json',
                                            data: {
                                                userName: user_name,
                                                userPwd: user_pwd,
                                                userEmail: user_email
                                            },
                                            success:function (date) {
                                                if(date.type == "success"){

                                                    layer.alert('添加成功！',{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                            location.reload();
                                                        }
                                                    );
                                                }else{

                                                    layer.alert('用户名已存在，添加失败！',{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                        }
                                                    );
                                                }
                                            }
                                        });
                                    }

                                }
                                ,btnAlign: 'c'
                                ,moveType: 0 //拖拽模式，0或者1
                                ,content: AddUserHtml
                                ,success: function(layero){
                                    var btn = layero.find('.layui-layer-btn');
                                    btn.find('.layui-layer-btn0').attr({
                                    });
                                }
                            });
                        break;
                        /*根据名字模糊查询*/
                        case 'finduserbtn':
                            var user_name = $('#userfindtext').val();
                            table.reload('user_table_id', {
                                url: url + '/user/findTotalUser.do'
                                ,method: "POST"
                                ,where: {
                                    user_name: user_name
                                }
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        break;
                            
                    }
                });
            });
        }

        //初始化电影管理界面
        function initMovies(){
            //添加电影
            var MoviesNum = $(".two").find(".panel-title");
            //对所有电影进行展示
            var MovieLi =  $(".two").find(".movies-list");

            $.ajax({
                type:'post',
                url: url + "/movie/findTotalMovies.do",
                dataType:'json',
                data: {},
                success:function (obj) {
                    MoviesNum.append("<span class=\"textcolor_red\">正在热映（" + obj.data.length + "部）</span>");
                    for(var i=0;i<obj.data.length;i++){
                        var bathPath = "<%=basePath%>";
                        MoviesListHtml =
                        "<li>" +
                            "<div class=\"movie-item\">" +
                                "<a href=\"javascript:void(0)\" target=\"_blank\" data-act=\"playingMovie-click\" data-val=\""+ obj.data[i].movieId +"\">" +
                                    "<div class=\"movie-poster\">" +
                                        "<img src=\""+"http://localhost:8080/"+obj.data[i].moviePicture +"\" onclick=\"movieDetail("+obj.data[i].movieId+")\">" +
                                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                                            "<div class=\"movie-info\">" +
                                                "<div class=\"movie-score\"><i class=\"integer\">"+ obj.data[i].movieScore +"</i></div>" +
                                                "<div class=\"movie-title movie-title-padding\" title=\"\">"+ obj.data[i].movieCname +"</div>\"" +
                                            "</div>" +
                                        "</div>" +
                                    "</div>" +
                                "</a>" +
                                "<div class=\"moive-btn\">" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<a class=\"active\" onclick=\"addConfirm("+ obj.data[i].movieId +")\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"\">修改</a>" +
                                    "</div>" +
                                    "<div class=\"movies-detail movie-detail-strong movie-sale\">" +
                                        "<span id=\"deleteId\" style=\"display:none;\">${u.id}</span>" +
                                        "<a class=\"active\" onclick=\"deleteConfirm("+ obj.data[i].movieId +")\" data-act=\"salePlayingMovie-click\" id=\"delete\">下架</a>" +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                        "</li>";
                                        /*将所有电影添加到电影管理界面*/
                        MovieLi.append(MoviesListHtml);
                    }
                }
            });


        }
        //查看电影详情，将id传过去
        function movieDetail(movieId){
           window.open("<%=basePath%>movie/movieDetail.do?movieId=" + movieId);
        }
        //电影添加&修改点击事件
        function addConfirm(movie_id){
            //movie_id在添加时设置为-1，修改时为修改电影的movie_id
            var file;
            var formData = new FormData();
            var tempurl;
            //添加电影
            if(movie_id == -1){
                tempurl = "/movie/insertMovie.do";
                temp = "添加";
                flag = 0;
            }
            //修改电影
            else{
                tempurl = "/movie/updateMovie.do";
                temp="修改";
                flag = 1;
            }
            layui.use(['laypage', 'layer', 'table'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                var table = layui.table
                //电影添加
                layer.open({
                    type: 1
                    ,title: temp + "电影" //不显示标题栏
                    ,closeBtn: false
                    ,area: '750px;'
                    ,shade: 0.8
                    ,offset: clientHeight/20
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认' + temp, '取消']
                    ,yes: function(){
                        var movie_cn_name = $('#movie_cn_name').val(),
                            movie_fg_name = $('#movie_fg_name').val(),
                            movie_director = $('#movie_director').val(),
                            movie_actor = "",
                            movie_detail = $('#movie_detail').val(),
                            movie_duration = $('#movie_duration').val(),
                            movie_type = $('#movie_type').val(),
                            movie_releaseDate = $('#movie_releaseDate').val(),
                            movie_country = $('#movie_country').val(),
                            movie_score = $('#movie_score').val();

                        for(var i = 1;i<(ActorNum+1);i++){
                            //演员1名字：，如果演员数量大于1，演员1：扮演角色，演员2：扮演角色
                            movie_actor += $("#movie_actor" + i).val() + ":";
                            if(i==ActorNum){
                                movie_actor += $("#movie_role" + i).val();
                            }
                            else{
                                movie_actor += $("#movie_role" + i).val() + ",";
                            }
                        }
                        if((movie_cn_name == "") || (movie_director == "") || (movie_actor == "") ||
                            (movie_detail == "") || (movie_duration == "") || (movie_type == "") ||
                            (movie_fg_name == "") || (movie_releaseDate == "") || (movie_country == "")|| (movie_score == "")){
                            layer.alert(temp + '信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                function (){
                                    layer.close(layer.index);
                                }
                            );
                        }


                        //添加
                        if(flag == 0){
                            if(file == null){
                                layer.alert('图片信息不能存在空，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                    function (){
                                        layer.close(layer.index);
                                    }
                                );
                            }
                            var dateTime = new Date(movie_releaseDate);
                            var reg=/^[0-9]+.?[0-9]*$/;
                            if(!Date.parse(dateTime) || !reg.test(movie_score)){
                                layer.alert(temp + '检查日期格式或者评分是否为数字，' + temp + '失败！',{icon: 0,offset: clientHeight/5},
                                    function (){
                                        layer.close(layer.index);
                                    }
                                );
                            }

                            else{
                                formData.append("movieCname",movie_cn_name);
                                formData.append("movieFname",movie_fg_name);
                                formData.append("movieDirector",movie_director);
                                formData.append("movieActor",movie_actor);
                                formData.append("movieDetail",movie_detail);
                                formData.append("movieDuration",movie_duration);
                                formData.append("movieType",movie_type);
                                formData.append("moviePutdate",movie_releaseDate);
                                formData.append("movieCountry",movie_country);
                                formData.append("movieScore",movie_score);
                                formData.append("file",file);
                                $.ajax({
                                    type:'post',
                                    url: url + tempurl,
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    success:function (result) {
                                        /*var obj = eval('(' + result + ')');*/
                                        var type = result.type
                                        if(type == "success"){
                                            layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                           // 修改电影
                        } else{
                            if(file != null){
                                formData.append("file",file);
                            }
                            formData.append("movieCname",movie_cn_name);
                            formData.append("movieFname",movie_fg_name);
                            formData.append("movieDirector",movie_director);
                            formData.append("movieActor",movie_actor);
                            formData.append("movieDetail",movie_detail);
                            formData.append("movieDuration",movie_duration);
                            formData.append("movieType",movie_type);
                            formData.append("moviePutdate",movie_releaseDate);
                            formData.append("movieCountry",movie_country);
                            formData.append("movieScore",movie_score);
                            formData.append("movieId",movie_id);
                            $.ajax({
                                type:'post',
                                url: url + tempurl,
                                data: formData,
                                processData: false,
                                contentType: false,
                                success:function (result) {
                                    var msg = result.message;
                                   /* var obj = eval('(' + result + ')');*/
                                    if(result.type == "success"){
                                        //当执行添加方法时，temp设置为添加，修改的时候设置为修改
                                        layer.alert(msg,{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.closeAll();
                                                location.reload();
                                            }
                                        );
                                    }else{
                                        layer.alert(msg,{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.closeAll();
                                            }
                                        );
                                    }
                                }
                            });
                        }
                    }
                    ,btnAlign: 'c movie-last'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: AddMoviesHtml
                    ,success: function(layero){
                        if(flag == 1){
                            var TextSide = $(".textside").find(".temp");
                            var StrActor,StrRole;            
                            $.ajax({
                                type:'post',
                                url: url + "/movie/findMovieById.do",
                                dataType:'json',
                                data: {
                                    movieId: movie_id
                                },
                                success:function (obj) {
                                    var picture = "http://localhost:8080/"+obj.data.moviePicture
                                    $('#movie_cn_name').val(obj.data.movieCname);
                                    $('#movie_director').val(obj.data.movieDirector);
                                    ActorTemp = obj.data.movieActor;
                                    $('#movie_detail').val(obj.data.movieDetail);
                                    $('#movie_duration').val(obj.data.movieDuration);
                                    $('#movie_type').val(obj.data.movieType);
                                    $('#movie_score').val(obj.data.movieScore)
                                    $('#movie_fg_name').val(obj.data.movieFname);
                                    $('#movie_releaseDate').val(obj.data.moviePutdate);
                                    $('#movie_country').val(obj.data.movieCountry);
                                    $('#demo1').attr('src', picture);

                                    StrActor = ActorTemp.split(',');
                                    $('#movie_actor1').val(StrActor[0].split(':')[0]);
                                    $('#movie_role1').val(StrActor[0].split(':')[1]);
                                    for(var i = 1;i<StrActor.length;i++){
                                        StrRole = StrActor[i].split(':');
                                        TextSide.before(
                                            "<div class=\"layui-form-item\">" +
                                                "<label class=\"layui-form-label\" style=\"display:inline-block;\">人员" + (i+1) + "</label>" +
                                                "<div class=\"layui-input-block addusertext actor\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                                                    "<input id=\"movie_actor" + (i+1) + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieActor" + (i+1) + "\" class=\"layui-input\">" +
                                                "</div>" +
                                                "<span style=\"margin-left:10px\">饰</span>" +
                                                "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                                                    "<input id=\"movie_role" + (i+1) + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieRole" + (i+1) + "\" class=\"layui-input\">" +
                                                "</div>" +
                                            "</div>"
                                        );
                                        $('#movie_actor'+(i+1)).val(StrRole[0]);
                                        $('#movie_role'+(i+1)).val(StrRole[1]);
                                    }
                                    ActorNum = StrActor.length;
                                }
                            });
                        }
                        else{
                            ActorNum = 1;
                        }
                        //图片上传
                        layui.use('upload', function(){
                            var $ = layui.jquery
                            ,upload = layui.upload;         
                            //普通图片上传
                            var uploadInst = upload.render({
                                elem: '#file'
                                ,auto: false
                                , choose: function (obj) {
                                    //预读本地文件
                                    obj.preview(function (index, file, result) {
                                        $('#demo1').attr('src', result); //图片链接（base64）
                                    })
                                    file = $('#file')[0].files[0];
                                }
                            });
                        });
                    }
                });
            });
        }
        //电影下架点击事件
        function deleteConfirm(movie_id){
            console.log(movie_id);
            layui.use(['layer'], function(){
                var layer = layui.layer;
                layer.alert('确定要对id为“'+ movie_id + '”的电影修改进行下架吗？',{icon: 0,offset: clientHeight/5},
                    function () {
                        $.ajax({
                            type:'post',
                            url: url + "/movie/deleteMovie.do",
                            dataType:'json',
                            data: {
                                movieId: movie_id,
                            },
                            success:function (date) {
                                if(date.type == "success"){
                                    layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                            location.reload();
                                        }
                                    );
                                }else{
                                    layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                        function (){
                                            layer.closeAll();
                                        }
                                    );
                                }
                            }
                        });
                    }
                );
            });
        }
        //电影添加演员
        function addActor(){
            var TextSide = $(".textside").find(".temp");
            if(ActorNum<5){
                ActorNum++;
                TextSide.before(
                    "<div class=\"layui-form-item\">" +
                        "<label class=\"layui-form-label\" style=\"display:inline-block;\">人员" + ActorNum + "</label>" +
                        "<div class=\"layui-input-block addusertext actor\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                            "<input id=\"movie_actor" + ActorNum + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieActor" + ActorNum + "\" class=\"layui-input\">" +
                        "</div>" +
                        "<span style=\"margin-left:10px\">饰</span>" +
                        "<div class=\"layui-input-block addusertext\" style=\"display:inline-block; margin-left: 10px !important; width: 118px;\">" +
                            "<input id=\"movie_role" + ActorNum + "\" type=\"text\" name=\"title\" lay-verify=\"title\" autocomplete=\"off\" placeholder=\"MovieRole" + ActorNum + "\" class=\"layui-input\">" +
                        "</div>" +
                    "</div>"
                );
            }
            else{
                layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                    layer.alert('最多只能存在5个演职人员！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
        }
        //电影删除演员
        function deleteActor(){
            console.log(ActorNum);
            if(ActorNum>1){
                var TextSide = $(".textside").find(".layui-form-item");
                TextSide[(ActorNum+2)].remove();
                ActorNum--;
            }
            else{
                layui.use(['laypage', 'layer'], function(){
                var laypage = layui.laypage;
                var layer = layui.layer;
                    layer.alert('最少要存在1个演职人员！',{icon: 0,offset: clientHeight/5},
                        function (){
                            layer.close(layer.index);
                        }
                    );
                });
            }
        }

        //初始化评论管理界面
        function initComment(){
            //评论列表
            layui.use('table', function(){
                var table = layui.table;
                table.render({
                    elem: '#comment_table_id'
                    ,url: url + '/comment/findCommentsByPage.do'
                    ,method: 'post'
                    ,toolbar: '#commenttoolbar'
                    ,title: '订单列表'
                    ,cols: [[

                        ,{field:'commentId', title:'评论编号', width:102, unresize: true, sort: true}
                        ,{field:'CommentUser', title:'用户账号', width:100, unresize: true,templet: '<div>{{d.commentUser.userName}}</div>'}
                        ,{field:'commentTime', title:'评论时间', width:180, unresize: true, sort: true}
                        ,{field:'commentContent', title:'评论内容', width:590, unresize: true, edit: "text"}
                        ,{title:'操作', width:240, unresize: true, align:'center', toolbar: '#commentbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 00
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(CommentTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('ID：'+ data.commentId + '</br>账号：'+ data.commentUser.userName + '</br>时间：'+ data.commentTime  + '</br>内容：'+ data.commentContent, {offset: clientHeight/4});
                    }
                    else if(obj.event === 'edit'){
                        console.log(obj);
                        layer.alert('确定要对id为“'+ JSON.stringify(data.commentId) + '”的评论内容修改进行保存吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/comment/ModifyComment.do",
                                    dataType:'json',
                                    data: {
                                        commentId: data.commentId,
                                        commentContent: data.commentContent
                                    },
                                    success:function (date) {
                                        if(date.status == "success"){
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }else{
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                    else if(obj.event === 'delete'){
                        layer.alert('确定要对id为“'+ JSON.stringify(data.commentId) + '”的评论进行删除吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/comment/removeComemnt.do",
                                    dataType:'json',
                                    data: {
                                        commentId: data.commentId
                                    },
                                    success:function (date) {
                                        if(date.status == "success"){
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(date.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //监听头工具条
                table.on('toolbar(CommentTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'findcommentbtn':
                            var user_name = $('#commentfindtext').val();
                            table.reload('comment_table_id', {
                                url: url + '/comment/findCommentsByPage.do'
                                ,method: "POST"
                                ,where: {
                                    user_name: user_name
                                }
                                ,page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                            });
                        break;
                        case 'findcommentall':
                            table.render({
                                elem: '#comment_table_id'
                                ,url: url + '/comment/findAllCommentsPage.do'
                                ,method: 'post'
                                ,toolbar: '#commenttoolbar'
                                ,title: '订单列表'
                                ,cols: [[
                                    {field:'commentId', title:'评论编号', width:102, unresize: true, sort: true}
                                    ,{field:'CommentUser', title:'用户账号', width:100, unresize: true,templet: '<div>{{d.CommentUser.userName}}</div>'}
                                    ,{field:'commentTime', title:'评论时间', width:180, unresize: true, sort: true}
                                    ,{field:'commentContent', title:'评论内容', width:590, unresize: true, edit: "text"}
                                    ,{title:'操作', width:240, unresize: true, align:'center', toolbar: '#commentbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 00
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                }
                            });
                        break;
                    }
                });
            });
        }

        //初始化订单管理界面
        function initTicket(){
            var PageStatus=0;
            var actionUrl = "";
            //订单列表
            layui.use('table', function(){

                var table = layui.table;
                table.render({
                    elem: '#ticket_table_id'
                    ,url: url + "/order/findOrdersByPage.do"
                    ,method: 'post'
                    ,toolbar: '#tickettoolbar'
                    ,where: {"orderState": 1}
                    ,title: '订单列表'
                    ,cols: [[
                        {field:'orderId', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                        ,{field:'userName', title:'用户账号', width:100, unresize: true}
                        ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.schedule.scheduleStartTime}}</div>'}
                        ,{field:'orderPosition',title:'位置',width:100,unresize:true}
                        ,{field:'orderPrice',title:'价格',width:80,unresize:true}
                        ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleMovie.movieCname}}</div>'}
                        ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule.scheduleHall.hallName}}</div>'}
                        ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleCinema.cinemaName}}</div>'}
                        ,{field:'orderState',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.orderState == 1) return '<div style="color:#337ab7">完成</div>';else if(d.orderState == 0) return '<div style="color:#ef4238">已退票</div>';else return '<div style="color:#5cb85c">退票审核</div>';}}
                        ,{title:'操作', width:100, unresize: true, align:'center', toolbar: '#ticketbar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    },
                });
              
                //监听工具条
                table.on('tool(TicketTable)', function(obj){
                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('订单编号：'+ data.orderId + '&nbsp;&nbsp;&nbsp;用户：' + data.userName + '<br>场次：'+ data.schedule.scheduleStartTime + '&nbsp;&nbsp;&nbsp;位置：' + data.orderPosition + '<br>电影：《' + data.schedule.scheduleMovie.movieCname + '》&nbsp;&nbsp;&nbsp;价格：￥' + data.schedule.schedulePrice + '<br>影院：'+ data.schedule.scheduleCinema.cinemaName + '&nbsp;&nbsp;&nbsp;影厅：' + data.schedule.scheduleHall.hallName, {offset: clientHeight/4,area:['400px','140px']});
                    }
                    else if(obj.event === 'pass'){
                        layer.alert('确定要通过订单编号为“' + data.orderId + '”的退票申请吗？',{icon: 0,offset: clientHeight/5},
                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/order/returnForRefund.do",
                                    dataType:'json',
                                    data: {
                                        orderId: data.orderId
                                    },
                                    success:function (data) {
                                        if(data.code == 0){
                                            layer.alert(data.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(data.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //监听头工具条
                table.on('toolbar(TicketTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    //控制用户账号还是订单编号
                    var changeticketbtn = $('.changeticketBtn');
                    //填入的订单编号或者用户账号
                    var ticketfindtext = $('#ticketfindtext');
                    switch(obj.event){
                        case 'findticketbtn':
                            var url_temp;
                            var find_temp = $('#ticketfindtext').val();
                            find_temp = find_temp.toString();
                            //订单管理
                            if(PageStatus == 0){
                                //判断让搜索的是订单编号还是用户账号
                                if(changeticketbtn.val()=="订单编号"){
                                    url_temp = '/order/findOrderById.do';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            orderId: find_temp,
                                            orderState: 1
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                                else{
                                    url_temp = '/order/findOrdersByPage.do';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            userName: find_temp,
                                            orderState:1
                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                            }
                            //退票审核
                            else{
                                if(changeticketbtn.val()=="订单编号"){
                                    url_temp = '/order/findOrderById.do';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            orderId: find_temp,
                                            orderState: 2

                                        }
                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                                else{
                                    url_temp = '/order/findOrdersByPage.do';
                                    table.reload('ticket_table_id', {
                                        url: url + url_temp
                                        ,method: "POST"
                                        ,where: {
                                            userName: find_temp,
                                            orderState: 2
                                        }

                                        ,page: {
                                            curr: 1 //重新从第 1 页开始
                                        }
                                    });
                                }
                            }
                        break;
                        case 'changeticketbtn':
                            if(changeticketbtn.val()=="订单编号"){
                                changeticketbtn.val("用户帐号");
                                ticketfindtext.attr("placeholder","请输入用户帐号");
                            }
                            else{
                                changeticketbtn.val("订单编号");
                                ticketfindtext.attr("placeholder","请输入订单编号");
                            }
                        break;
                        case 'findorderall':
                            PageStatus = 0;
                            table.render({
                                elem: '#ticket_table_id'
                                ,url: url + "/order/findOrdersByPage.do"
                                ,method: 'post'
                                ,toolbar: '#tickettoolbar'
                                ,title: '订单列表'
                                ,cols: [[
                                    {field:'orderId', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                                    ,{field:'userName', title:'用户账号', width:100, unresize: true}
                                    ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.schedule.scheduleStartTime}}</div>'}
                                    ,{field:'orderPosition',title:'位置',width:100,unresize:true}
                                    ,{field:'orderPrice',title:'价格',width:80,unresize:true}
                                    ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleMovie.movieCname}}</div>'}
                                    ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule.scheduleHall.hallName}}</div>'}
                                    ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleCinema.cinemaName}}</div>'}
                                    ,{field:'orderState',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.orderState == 1) return '<div style="color:#337ab7">完成</div>';else if(d.orderState == 0) return '<div style="color:#ef4238">已退票</div>';else if(d.orderState == 2) return '<div style="color:#ef4238">退票审核</div>'}}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#backticketbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                },
                            });
                        break;
                        case 'backorderbtn':
                            PageStatus = 1;
                            table.render({
                                elem: '#ticket_table_id'
                                ,url: url + "/order/findOrdersByPage.do"
                                ,method: 'post'
                                ,toolbar: '#tickettoolbar'
                                ,title: '订单列表'
                                ,where:{
                                    orderState:0
                                }
                                ,cols: [[
                                    {field:'orderId', title:'订单编号', width:160,unresize:true,sort: true,fixed:'left'}
                                    ,{field:'userName', title:'用户账号', width:100, unresize: true}
                                    ,{field:'order_schedule', title:'场次', width:180, unresize: true,templet:'<div>{{d.schedule.scheduleStartTime}}</div>'}
                                    ,{field:'orderPosition',title:'位置',width:100,unresize:true}
                                    ,{field:'orderPrice',title:'价格',width:80,unresize:true}
                                    ,{field:'order_schedule',title:'电影',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleMovie.movieCname}}</div>'}
                                    ,{field:'order_schedule', title:'影厅', width:100, unresize: true, templet:'<div>{{d.schedule.scheduleHall.hallName}}</div>'}
                                    ,{field:'order_schedule',title:'影院',width:240,unresize:true,templet:'<div>{{d.schedule.scheduleCinema.cinemaName}}</div>'}
                                    ,{field:'orderState',title:'订单状态',width:100,unresize:true,align:'center',templet:function(d){if(d.orderState == 1) return '<div style="color:#337ab7">已完成</div>';else if(d.orderState == 0) return '<div style="color:#ef4238">已退票</div>'; else return '<div style="color:#ef4238">退票审核</div>'}}
                                    ,{title:'操作', width:100, unresize: true, align:'center', toolbar: '#ticketbar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data //解析数据列表
                                    };
                                },
                            });
                        break;
                    };
                });
            });
        }
         //初始化场次管理界面
         function initSchedule(){
            var ScheduleStatus=0; //0：上映      1：下架
            //场次列表
            layui.use(['table','form'], function(){
                var table = layui.table;
                var form = layui.form;
                table.render({
                    elem: '#schedule_table_id'
                    ,url: url + '/schedule/findAllScheduleByState.do'
                    ,method: 'post'
                    ,where: {"schedule_state": 1}  //接口的其他参数
                    ,toolbar: '#scheduletoolbar'
                    ,title: '场次列表'
                    ,cols: [[
                        {field:'scheduleId', title:'场次编号', width:100, unresize: true, sort: true}
                        ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaName}}</div>'}
                        ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaAdress}}</div>'}
                        ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.scheduleHall.hallName}}</div>'}
                        ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.scheduleMovie.movieCname}}</div>'}
                        ,{field:'scheduleStartTime', title:'放映时间', width:180, unresize: true, sort: true}
                        ,{field:'schedulePrice', title:'价格(￥)', width:100,align:'center', unresize: true ,templet:'<div>{{d.schedulePrice }}</div>'}
                        ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderCount}}</div>'}
                        ,{field:'scheduleSeatremain',title:'剩余票数',width:100,align:'center',unresize:true}
                        ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.totalPrice}}</div>'}
                        ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#schedulebar'}
                    ]]
                    ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                        ,curr: 1 //设定初始在第 1 页
                        ,groups: 5 //只显示 5 个连续页码
                        ,first: false //显示首页
                        ,last: false //显示尾页
                        ,limits: [10,15,20]
                    }
                    ,response: {
                        statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                    }
                    ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                        return {
                            "code": res.code, //解析接口状态
                            "msg": res.msg, //解析提示文本
                            "count": res.count, //解析数据长度
                            "data": res.data //解析数据列表
                        };
                    }
                });
                //监听工具条
                table.on('tool(ScheduleTable)', function(obj){

                    var data = obj.data;
                    if(obj.event === 'detail'){
                        layer.msg('编号：'+ data.scheduleId + '</br>影院：'+ data.scheduleCinema.cinemaName + '&nbsp;&nbsp;&nbsp;放映厅：'+ data.scheduleHall.hallName  + '</br>影院地址：'+ data.scheduleCinema.cinemaAdress + '</br>电影：'+ data.scheduleMovie.movieCname + '</br>场次：' + data.scheduleStartTime + '&nbsp;&nbsp;&nbsp;价格：' + data.schedulePrice, {offset: clientHeight/5});
                    }
                    else if(obj.event === 'edit'){
                        layer.alert('确定要对id为“'+ data.scheduleId + '”的场次进行下架吗？',{icon: 0,offset: clientHeight/5},

                            function () {
                                $.ajax({
                                    type:'post',
                                    url: url + "/schedule/deleteSchedule.do",
                                    dataType:'json',
                                    data: {
                                        scheduleId: data.scheduleId,
                                    },
                                    success:function (result) {
                                        if(result.type == "success"){
                                            layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                    location.reload();
                                                }
                                            );
                                        }else{
                                            layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                function (){
                                                    layer.closeAll();
                                                }
                                            );
                                        }
                                    }
                                });
                            }
                        );
                    }
                });
                //头工具栏事件
                table.on('toolbar(ScheduleTable)', function(obj){
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch(obj.event){
                        case 'scheduleadd':
                            //示范一个公告层
                            layer.open({
                                type: 1
                                ,title: '添加场次' //不显示标题栏
                                ,closeBtn: false
                                ,area: '400px;'
                                ,shade: 0.8
                                ,offset: clientHeight/10
                                ,id: 'scheduleadd' //设定一个id，防止重复弹出
                                ,btn: ['确认添加', '取消']
                                ,yes: function(){
                                    console.log("queding");
                                    var select_movie_name = $('#select_movie_name').val();
                                    var select_cinema_name = $("#select_cinema_name").val();
                                    var select_schedule_hall = $('#select_schedule_hall').val();
                                    var schedule_startTime_Text = $("#schedule_startTime_Text").val();
                                    var schedule_price_Text = $('#schedule_price_Text').val();
                                    if((select_movie_name == "选择电影") || (select_cinema_name == "选择影院") || (select_schedule_hall == "选择放映厅") ||
                                        (schedule_startTime_Text =="") || (schedule_price_Text =="")){
                                        layer.alert('添加信息不能存在空，添加失败！',{icon: 0,offset: clientHeight/5},
                                            function (){
                                                layer.close(layer.index);
                                            }
                                        );
                                    }
                                    else{
                                        $.ajax({
                                            type:'post',
                                            url: url + "/schedule/insertSchedule.do",
                                            dataType:'json',
                                            data: {
                                                movieName: select_movie_name,
                                                cinemaName: select_cinema_name,
                                                hallName: select_schedule_hall,
                                                scheduleStartTime: schedule_startTime_Text,
                                                schedulePrice: schedule_price_Text
                                            },
                                            success:function (result) {
                                                if(result.type == "success"){
                                                    layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                            location.reload();
                                                        }
                                                    );
                                                }else{
                                                    layer.alert(result.msg,{icon: 0,offset: clientHeight/5},
                                                        function (){
                                                            layer.closeAll();
                                                        }
                                                    );
                                                }
                                            }
                                        });
                                    }
                                }
                                ,end: function(){
                                    cinemaJsonArr = [];
                                }
                                ,btnAlign: 'c'
                                ,moveType: 1 //拖拽模式，0或者1
                                ,content: addScheduleContent
                                ,success: function(layero){
                                    layui.use(['form','laydate'], function(){
                                        var form = layui.form,
                                           // layedit = layui.layedit,
                                            laydate = layui.laydate;
                                        laydate.render({
                                            elem: '#schedule_startTime_Text'
                                            ,type: 'datetime'
                                            ,format:'yyyy-MM-dd HH:mm'
                                        });
                                        form.render('select' ,'select');
                                    });
                                    $.ajax({
                                        type:'post',
                                        url: url + "/schedule/findAllSchedule.do",
                                        dataType:'json',
                                        data: {},
                                        success:function (objs) {
                                            //得到所有电影名字
                                            movieArr = objs.movieNames;
                                            //得到影院以及影院对应的影厅
                                            cinemaArr = objs.cinemaAndHalls;
                                            //得到所有的影院
                                            cNames = objs.cinemaNames;

                                            for (var name in cNames ) {
                                                var cinemaJson = {};
                                                //输出每个影院
                                                var cinemaNames =cNames[name];
                                                var hallArr = [];
                                                hallArr.push(cinemaArr[cinemaNames]);
                                                cinemaJson.cinema = cinemaNames;
                                                cinemaJson.hallArr = hallArr;
                                                cinemaJsonArr.push(cinemaJson);
                                            }
                                            for(var i =0;i<movieArr.length;i++){
                                                //添加电影名字
                                                $("#select_movie_name").append(new Option(movieArr[i]));
                                                layui.form.render("select");
                                            }
                                            for(var i = 0;i<cinemaJsonArr.length;i++){
                                                //添加影院的名字
                                                $("#select_cinema_name").append(new Option(cinemaJsonArr[i].cinema));
                                                layui.form.render("select");
                                            }
                                        }
                                    });
                                }
                            });
                            break;
                        case 'findschedulebtn':
                            var find_temp = $('#scheduletext').val();
                            //上映
                            if(ScheduleStatus==0){
                                table.reload('schedule_table_id', {
                                    url: url + "/schedule/selectScheduleByMovieName.do"
                                    ,method: "POST"
                                    ,where: {
                                        movieName: find_temp
                                    }
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }
                            //下架
                            else{
                                table.reload('schedule_table_id', {
                                    url: url + "/schedule/selectScheduleByMovieName.do"
                                    ,method: "POST"
                                    ,where: {
                                        movie_name: find_temp
                                    }
                                    ,page: {
                                        curr: 1 //重新从第 1 页开始
                                    }
                                });
                            }
                            break;
                        case 'scheduleonallbtn':
                            ScheduleStatus = 0;
                            table.render({
                                elem: '#schedule_table_id'
                                ,url: url + '/schedule/findAllScheduleByState.do'
                                ,method: 'post'
                                ,where: {"schedule_state": 1}
                                ,toolbar: '#scheduletoolbar'
                                ,title: '场次列表'
                                ,cols: [[
                                    {field:'scheduleId', title:'场次编号', width:100, unresize: true, sort: true}
                                    ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaName}}</div>'}
                                    ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaAdress}}</div>'}
                                    ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.scheduleHall.hallName}}</div>'}
                                    ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.scheduleMovie.movieCname}}</div>'}
                                    ,{field:'scheduleStartTime', title:'放映时间', width:180, unresize: true, sort: true}
                                    ,{field:'schedulePrice', title:'价格(￥)', width:100,align:'center', unresize: true ,templet:'<div>{{d.schedulePrice }}</div>'}
                                    ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderCount}}</div>'}
                                    ,{field:'scheduleSeatremain',title:'剩余票数',width:100,align:'center',unresize:true}
                                    ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.totalPrice}}</div>'}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#schedulebar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data, //解析数据列表
                                        "income": res.income //解析数据列表
                                    };
                                }
                            });
                            break;
                        case 'scheduledownallbtn':
                            ScheduleStatus = 1;
                            table.render({
                                elem: '#schedule_table_id'
                                ,url: url + '/schedule/findAllScheduleByState.do'
                                ,method: 'post'
                                ,where: {"schedule_state": 0}
                                ,toolbar: '#scheduletoolbar'
                                ,title: '场次列表'
                                ,cols: [[
                                    {field:'scheduleId', title:'场次编号', width:100, unresize: true, sort: true}
                                    ,{field:'schedule_hall', title:'影院', width:240, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaName}}</div>'}
                                    ,{field:'schedule_hall', title:'影院地址', width:300, unresize: true,templet:'<div>{{d.scheduleCinema.cinemaAdress}}</div>'}
                                    ,{field:'schedule_hall', title:'影厅', width:100, unresize: true, templet:'<div>{{d.scheduleHall.hallName}}</div>'}
                                    ,{field:'schedule_movie', title:'电影', width:240, unresize: true,templet:'<div>{{d.scheduleMovie.movieCname}}</div>'}
                                    ,{field:'scheduleStartTime', title:'放映时间', width:180, unresize: true, sort: true}
                                    ,{field:'schedulePrice', title:'价格(￥)', width:100,align:'center', unresize: true ,templet:'<div>{{d.schedulePrice }}</div>'}
                                    ,{field:'orderList',title:'订单数量',width:100,unresize:true,align:'center',templet:'<div>{{d.orderCount}}</div>'}
                                    ,{field:'scheduleSeatremain',title:'剩余票数',width:100,align:'center',unresize:true}
                                    ,{field:'orderList',title:'场次收入(￥)',width:120,align:'center',unresize:true,templet:'<div>{{d.totalPrice}}</div>'}
                                    ,{title:'操作', width:200, unresize: true, align:'center', toolbar: '#schedulebar'}
                                ]]
                                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                                    ,curr: 1 //设定初始在第 1 页
                                    ,groups: 5 //只显示 5 个连续页码
                                    ,first: false //显示首页
                                    ,last: false //显示尾页
                                    ,limits: [10,15,20]
                                }
                                ,response: {
                                    statusCode: 0 //重新规定成功的状态码为 200，table 组件默认为 0
                                }
                                ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                                    return {
                                        "code": res.code, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.count, //解析数据长度
                                        "data": res.data, //解析数据列表
                                        "income": res.income //解析数据列表
                                    };
                                }
                            });
                            break;
                    }
                });
                //监听影院二级联动
                form.on('select(selectCinemaName)',function(data){
                    $("#select_schedule_hall").empty();
                    layui.form.render("select");
                    for(var i = 0;i < cinemaJsonArr.length;i++){
                        //判断监听得到的电影院值存在第几个
                        if(cinemaJsonArr[i].cinema == data.value){
                            //得到所有的影厅
                            var hallLen = cinemaJsonArr[i].hallArr;
                            //获取第i个电影有多少个影厅
                            var halls =hallLen[0];
                            for(var j =0;j<halls.length;j++){
                                //一个个添加影厅
                                $("#select_schedule_hall").append(new Option(halls[j]))
                                layui.form.render("select");
                            }
                        }
                    }
                });
            });
         }

        function sortUp(a,b){
                return a-b;
         }
        /*票房统计页面*/
        function initBoxOffice(){
            $.ajax({
                type:'post',
                url: url + "/movie/findAllMovies.do",
                dataType:'json',
                data: {},
                success:function (obj) {

                    for(var i = obj.movieOrder.length - 1;i >= 0;i--){
                        //获取票房前十的电影名字
                        movieArray.push(obj.movieOrder[i].movieCname);
                        //获取票房前十的电影票房
                        boxOffice.push(obj.movieOrder[i].movieTotalticket);
                    }
                    for (var i=0;i<obj.type.length;i++){
                        var movieJson = {};
                        //获取所有电影类型
                        movieJson.name = obj.type[i];
                        //获取所有电影类型的票房
                        movieJson.value = obj.TypeTickets[i];
                        types.push(movieJson);
                    }
                     //扇形图
                    var aaa = $("#aaa");
                    aaa.append("<div id=\"main1\" style=\"width: 1100px;height:400px;\"></div>")
                    var myChart1 = echarts.init(document.getElementById('main1'));   
                    option1 = {
                        title : {
                            text: '类型统计',
                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        color: ['#6dd8da', '#b6a2de', '#58afed', '#9AC0CD','#ff99cc'],
                        legend: {
                            orient : 'vertical',
                            x : '10%',
                            y : '15%',
                            data:types
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType : {
                                    show: true, 
                                    type: ['pie', 'funnel'],
                                    option: {
                                        funnel: {
                                            x: '25%',
                                            width: '50%',
                                            funnelAlign: 'left',
                                            max: 1548
                                        }
                                    }
                                },
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        series : [
                            {
                                name:'类型，票房',
                                type:'pie',
                                radius : '60%',
                                center: ['50%', '50%'],
                                data: types,
                            }
                        ]
                    };
                    myChart1.setOption(option1);

                    //统计图
                    var aaa = $("#aaa");
                    aaa.append("<div id=\"main2\" style=\"width: 1200px;height:450px;margin-top:100px;\"></div>")
                    var myChart2 = echarts.init(document.getElementById('main2'));  
                    option2 = {
                        title : {
                            text: '电影票房排名',
                            subtext: '排行前十'
                        },
                        tooltip : {
                            trigger: 'axis'
                        },
                        legend: {
                            data:['总体票房']
                        },
                        toolbox: {
                            show : true,
                            feature : {
                                mark : {show: true},
                                dataView : {show: true, readOnly: false},
                                magicType: {show: true, type: ['line', 'bar']},
                                restore : {show: true},
                                saveAsImage : {show: true}
                            }
                        },
                        calculable : true,
                        xAxis : [
                            {
                                type : 'value',
                                boundaryGap : [0, 0.01]
                            }
                        ],
                        
                        yAxis : [
                            {
                                type : 'category',
                                data : movieArray,
                            }
                        ],
                        series : [
                            {
                                name:'总体票房',
                                type:'bar',
                                data: boxOffice,
                                color:'#11EEC2'
                            },
                        ]
                    };
                    myChart2.setOption(option2);
                }
            });
        }

    </script>
    <!-- ------------------------------------------------------------------- -->
</body>
</html>