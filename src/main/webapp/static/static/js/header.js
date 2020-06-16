//验证用户身份
function init_manage(){
    var user_json = JSON.parse(localStorage.getItem("userJson"));
    var user_role = user_json.userRole;  //身份验证
    var nav = $(".nav").find("ul");
    var html;
    if(user_json.userRole == 1){

        html = "<li><a href=\"http://localhost:8080/user/adminMovie.do\" onclick=\"managePage()\">管理</a></li>"
        nav.append(html);
    }
    function managePage(){
        localStorage.setItem("cardId",0);
    }
}

//验证用户身份
function init_comment(){
    var user = localStorage.getItem("userJson");
    var UserCommentsContainer = $(".comment-list-container").find("ul");   
    if(user == null){
        $.ajax({
            type:'post',
            url: url + "/movie/findMovieById.do",
            dataType:'json',
            data: {
                movieId: movie_id
            },
            success:function (obj) {
                var UserComments = obj.commentList;
                for(var i=0;i<obj.commentList.length;i++){
                    UserCommentsContainer.append(
                        "<li class=\"comment-container\">" +
                            "<div class=\"portrait-container\">" +
                                "<div class=\"portrait\">" +
                                    "<img src=\""+ UserComments[i].commentUser.userPhoto +"\" alt=\"\">" +
                                "</div>" +
                                "<i class=\"level-4-icon\"></i>" +
                            "</div>" +
                            "<div class=\"main2\">" +
                                "<div class=\"main2-header clearfix\">" +
                                    "<div class=\"user\">" +
                                        "<span class=\"name\">" + UserComments[i].commentUser.userName + "</span>	" +
                                        "<span class=\"tag\">购</span>" +
                                    "</div>" +
                                    "<div class=\"time\" title=\"2018-11-16 12:06:10\">" +
                                        "<span title=\"2018-11-16 12:06:10\">" + UserComments[i].commentTime + "</span>" +
                                    "</div>" +
                                    "<div class=\"approve\" data-id=\"1044884745\">" +
                                    "</div>" +
                                "</div>" +
                                "<div class=\"comment-content\"> " +
                                    UserComments[i].commentContent+
                                "</div>" +
                            "</div>" +
                        "</ul>"
                    );
                }
            }
        });
    }else{
        user = eval('(' + user + ')');
        var user_role = user.userRole;  //身份验证
        var user_name = user.userName;
        var html;
        $.ajax({
            type:'post',
            url: url + "/movie/findMovieById.do",
            dataType:'json',
            data: {
                movieId: movie_id
            },
            success:function (obj) {
               // console.log(obj);

                var UserComments = obj.commentList;
                var len = UserComments.length;
                if (len>10){
                    len=10;
                }
                for(var i=0;i<len;i++){
                    if((user_role == 1) && (user_name == UserComments[i].commentUser.userName)){
                        html =  "<div class=\"updateBtn\" onclick='updateConfirm(\"" + UserComments[i].commentId + "\",\"" + UserComments[i].commentUser.userName + "\",\"" + UserComments[i].commentContent + "\",\"" + UserComments[i].commentTime + "\")'>修改</div>" +
                        "<div class=\"deleteCom\" onclick='deleteConfirm(\"" + UserComments[i].commentId + "\")'>删除</div>";
                    }else if(user_role == 1){
                        html = "<div class=\"deleteCom\" onclick='deleteConfirm(\"" + UserComments[i].commentId + "\")'>删除</div>";
                    }else if((user_name == UserComments[i].commentUser.userName) && (user_role != 1)){
                                html = "<div class=\"updateBtn\" onclick='updateConfirm(\"" + UserComments[i].commentId + "\",\"" + UserComments[i].commentUser.userName + "\",\"" + UserComments[i].commentContent + "\",\"" + UserComments[i].commentTime + "\")'>修改</div>";
                    }else{
                        html="";
                    }   
                    UserCommentsContainer.append(
                        "<li class=\"comment-container\">" +
                            "<div class=\"portrait-container\">" +
                                "<div class=\"portrait\">" +
                                    "<img src=\""+ UserComments[i].commentUser.userPhoto +"\" alt=\"\">" +
                                "</div>" +
                                "<i class=\"level-4-icon\"></i>" +
                            "</div>" +
                            "<div class=\"main2\">" +
                                "<div class=\"main2-header clearfix\">" +
                                    "<div class=\"user\">" +
                                        "<span class=\"name\">" + UserComments[i].commentUser.userName + "</span>	" +
                                        "<span class=\"tag\">购</span>" +
                                    "</div>" +
                                    "<div class=\"time\" title=\"2018-11-16 12:06:10\">" +
                                        "<span title=\"2018-11-16 12:06:10\">" + UserComments[i].commentTime + "</span>" +
                                    "</div>" +
                                    "<div class=\"approve\" data-id=\"1044884745\">" +
                                        html +
                                    "</div>" +
                                "</div>" +
                                "<div class=\"comment-content\"> " +
                                    UserComments[i].commentContent  +
                                "</div>" +
                            "</div>" +
                        "</ul>"
                    );
                }
            }
        });
    }
}

//初始化
function initHeader(){
    var LayuiNavMore = $(".header-li");
    console.log(LayuiNavMore);
    var user_json = JSON.parse(localStorage.getItem("userJson"));
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            layer.msg(elem.text());
        });
    });
    if(user_json == null){
        LayuiNavMore.append(
            "<a href=\"javascript:;\" style=\"padding: 0;height: 42px; width: 42px;\"><img src=\"http://localhost:8080/static/static/images/head.jpg\" class=\"layui-nav-img\"></a>" +
            "<dl class=\"layui-nav-child nav-image\">" +
                "<dd><a href=\"/user/showLogin.do\">登录</a></dd>" +
            "</dl>"
        );
    }
    else{
        var HeadImg = "";
    	if(user_json.userPhoto == null || typeof user_json.userPhoto == "undefined"){
            HeadImg = "http://localhost:8080/static/static/upload/head/demo.jpg";
        }else{
            HeadImg = user_json.userPhoto;
        }
        LayuiNavMore.append(
            "<a href=\"javascript:;\" style=\"padding: 0;height: 42px; width: 42px;\"><img src=\"" + HeadImg + "\" class=\"layui-nav-img\"></a>" +
            "<dl class=\"layui-nav-child nav-image\">" +
            "<dd><a href=\"/movie/center.do\" onclick=\"mycenter()\">我的订单</a></dd>" +
            "<hr/>" +
            "<dd><a href=\"/movie/center.do\" onclick=\"myinformation()\">基本信息</a></dd>" +
                "<hr/>" +
                "<dd><a onclick=\"ReLogin()\" style=\"text-decoration: none; cursor: pointer;\">注销</a></dd>" +
                "<hr/>" +
            "</dl>"
        );
        init_manage();
    }

}
function mycenter(){
    localStorage.setItem("usercardId",0);
}
function myinformation(){
    localStorage.setItem("usercardId",1);
}
//注销
function ReLogin(){
    layui.use(['layer'], function(){
    var layer = layui.layer;
        layer.alert('确认要注销吗？',{icon: 0,offset: clientHeight/5}, function (){
                $.ajax({
                    type:'post',
                    url: url + "/user/logout.do",
                    dataType:'json',
                    data: {},
                    success:function (obj) {
                        if (obj.type=="success"){
                            localStorage.removeItem('userJson');
                        }
                        layer.closeAll();
                        window.location.href = url+"/user/mainMovie.do";
                    }
                });
            }
        );
    });
}