<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="<%=basePath%>static/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/static/bootstrap/css/bootstrap.css" rel="stylesheet">
    <script src="<%=basePath%>static/static/bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>static/static/bootstrap/js/bootstrap.min.js"></script>

    <link rel="icon" type="image/x-icon" href="<%=basePath%>static/static/images/logo.ico"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/header.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/footer.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/buyTickets.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/movieDetail.css">
    <script src="<%=basePath%>static/static/js/header.js" charset="utf-8"></script>
    <script src="<%=basePath%>static/static/js/Api.js"></script>

    <script src="<%=basePath%>static/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=basePath%>static/static/layui/css/layui.css" media="all">
    <title>沃美电影-选影院</title>
</head>
<body>
    <!-- ------------------------------------------------------------------- -->
    <!-- 导航栏 -->
    <jsp:include page="header.jsp"/>
  
    <!-- 占位符 -->
    <div style="margin-top: 80px;"></div>

    <!-- 巨幕 -->
    <div class="banner2">
        <div class="wrapper clearfix">
            <div class="celeInfo-left">
                <div class="avatar-shadow">
                    <!-- 图片 -->
                </div>
            </div>
            
            <div class="celeInfo-right clearfix">
                <div class="movie-brief-container">
                    <!-- 上 -->
                </div>
                <div class="action-buyBtn">
                    <div class="action clearfix" data-val="{movieid:42964}">
                        <a class="wish " data-wish="false" onclick="wantSee()">
                            <div>
                                <i class="icon wish-icon"></i>
                                <span class="wish-msg" data-act="wish-click">想看</span>
                            </div>
                        </a>
                        <a class="score-btn " data-bid="b_rxxpcgwd" onclick="giveScore()">
                            <div>
                                <i class="icon score-btn-icon"></i>
                                <span class="score-btn-msg" data-act="comment-open-click">评分</span>
                            </div>
                        </a>
                    </div>
                </div>

                <div class="movie-stats-container">
                    <div class="movie-index">
                        <p class="movie-index-title">用户评分</p>
                        <div class="movie-index-content score normal-score">
                            <span class="index-left info-num ">
                                <!-- 评分 -->
                            </span>
                            <div class="index-right">
                                <div class="star-wrapper">
                                    <div id="MovieScore"></div>
                                </div>
                                <span class="score-num">
                                    <!-- 评分数 -->
                                </span>
                            </div>
                        </div>
                    </div>   

                    <div class="movie-index">
                        <p class="movie-index-title">累计票房</p>
                        <div class="movie-index-content box stonefont-num">
                            <!-- 票房数 -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- 占位符 -->
    <div style="margin-top: 50px;"></div>

    <!-- 主体 -->
    <div class="main">
        <div class="main-inner main-buyticket">
            <!-- 标签 -->
            <div class="tags-panel">
                <ul class="tags-lines">
                    <li class="tags-line">
                        <div class="tags-title">日期:</div>
                        <ul class="tags tags-date">
                            <!-- 日期 -->
                        </ul>
                    </li>
            
                </ul>
            </div>	
            <!-- 列表 -->
            <div class="cinemas-list">
                <h2 class="cinemas-list-header">影院列表</h2>   
            </div>
            <!-- 分页 -->
            <div class="cinema-pager">
                <ul class="list-pager">	
                </ul>
            </div>
        </div>
    </div>

    <!-- 脚 -->
    <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->
    <script>
        var clientHeight = document.documentElement.clientHeight;
        var movie_id;
        var date;
        var brand;
        var area;
        var hall;
        var page;
        var ScoreHtml;
        var CinemaLength;

        window.onload = function(){
            initHeader();
            initParams(); //参数
            initBanner(); //巨幕
            initHtml(); //HTML
            initTags(); //标签和分页
            initList();
        };

        //初始化HTML
        function initHtml(){
            ScoreHtml = 
                "<div style=\"text-align:center; margin:30px 0;\">" +
                    "<div id=\"GiveScore\"></div>" +
                    "<p style=\"color:#888;\">点击星星进行评分</p>" +
                "</div>"
            ;
        }

        //初始化巨幕
        function initBanner(){
            movie_id = getUrlParams('movieId');
            var avatar = $(".avatar-shadow");
            var movieBriefContainer = $(".movie-brief-container");
            var infoNum = $(".info-num");
            var scoreNum = $(".score-num");
            var stonefontNum = $(".stonefont-num");
            var actionBuyBtn = $(".action-buyBtn");
            var StonefontTemp;
            var path = "<%=basePath%>";

            $.ajax({
                type:'post',
                url: url + "/movie/findMovieById.do",
                dataType:'json',
                data: {
                    movieId: movie_id
                },
                success:function (obj) {
                    StonefontTemp = obj.data.movieTotalticket;
                    StonefontTemp += "万";
                    avatar.append("<img class=\"avatar\" src=\""+path + obj.data.moviePicture + "\" alt=\"\">");
                    movieBriefContainer.append(
                    "<h3 class=\"name\">" + obj.data.movieCname + "</h3>" +
                    "<div class=\"ename ellipsis\">" + obj.data.movieFname + "</div>" +
                    "<ul>" +
                        "<li class=\"ellipsis\">" + obj.data.movieType + "</li>" +
                        "<li class=\"ellipsis\">" + obj.data.movieDuration + " / " + obj.data.movieCountry + "</li>" +
                        "<li class=\"ellipsis\">" + obj.data.moviePutdate + "</li>" +
                    "<ul>");
                    infoNum.append("<span class=\"stonefont\">" + obj.data.movieScore + "</span>");
                    scoreNum.append("<span class=\"stonefont\">" + obj.commentList.length + "</span>人评分");
                    stonefontNum.append("<span class=\"stonefont\">" + StonefontTemp + "</span>");
                    actionBuyBtn.append("<a class=\"btn buy\" href=\"/movie/movieDetail.do?movieId=" + movie_id + "\" data-act=\"more-detail-click\">查看更多电影详情</a>");
                    layui.use('rate', function(){
                        var rate = layui.rate;
                        rate.render({
                            elem: '#MovieScore'
                            ,value: (obj.data.movieScore / 2)
                            ,half: true
                            ,readonly: true
                        })
                    });

                }
            });
        }
        //评分
        function giveScore(){
            layui.use(['rate','layer'], function(){
                var layer = layui.layer;
                var rate = layui.rate;
                layer.open({
                    type: 1
                    ,title: "电影评分"
                    ,closeBtn: false
                    ,area: '400px;'
                    ,shade: 0.8
                    ,offset: clientHeight/5
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['确认评分', '取消']
                    ,yes: function(){
                        layer.alert('感谢你的评价,祝你生活愉快！',{icon: 0,offset: clientHeight/5},
                            function (){
                                layer.closeAll();
                                location.reload();
                            }
                        );
                    }
                    ,btnAlign: 'c'
                    ,moveType: 0 //拖拽模式，0或者1
                    ,content: ScoreHtml
                    ,success: function(layero){
                        rate.render({
                            elem: '#GiveScore'
                            ,value: 4.5
                            ,half: true
                            ,text: true
                            ,setText: function(value){
                                this.span.text(value*2+"分");
                            }
                        })
                    }
                });
            });
        }
        //想看
        function wantSee(){
            layui.use(['rate','layer'], function(){
                var layer = layui.layer;
                var rate = layui.rate;
                layer.alert('感谢你的支持！',{icon: 0,offset: clientHeight/5},
                    function (){
                        layer.closeAll();
                        location.reload();
                    }
                );
            });
        }

        //初始化标签和分页
        function initTags(obj){
            //通过js获取当前时间
            var Data = new Date();
            var Month = Data.getMonth() + 1;
            var Day = Data.getDate();
            var tagsDate = $(".tags-date");
            var DateStr = ["今天","明天","后天"],
            DateActive = []
            var urlTemp = ["&date="+date,"&brand="+brand,"&area="+area,"&hall="+hall,"&page="+page];
            for(var i=0;i<DateStr.length;i++){
                if((Day+i)>31){
                    Day=1;
                    Month = Month+1;
                    urlTemp[0] = "&date="+ i;
                    tagsDate.append(
                        "<li " + DateActive[i] + ">" +
                        "<a href=\"?movieId="+ movie_id + urlTemp[0] +"\">"+
                        DateStr[i] + " " + Month + "月" + Day +
                        "</a>" +
                        "</li>"
                    );
                }else{
                    urlTemp[0] = "&date="+ i;
                    tagsDate.append(
                        "<li " + DateActive[i] + ">" +
                        "<a href=\"?movieId="+ movie_id + urlTemp[0] +"\">"+
                        DateStr[i] + " " + Month + "月" + (Day+i) +
                        "</a>" +
                        "</li>"
                    );
                }
            }

        }
        //导入活跃标签
        function inputTags(length, Active, tags){
            for(var i=0;i<length;i++){
                if(tags==null&&i==0){
                    Active.push("class=\"active\"");
                    break;
                }
                if(i==tags){
                    Active.push("class=\"active\"");
                }
                else
                Active.push(" ");
            }
            return Active;
        }



        date = getUrlParams('date');
        movie_id = getUrlParams('movieId');

         function initList(){

             //获得影院列表，把内容追加进去
             var cinemasList = $(".cinemas-list");
             if (date=='undefined') {
                 date=0
             }
             console.log(date);

                 $.ajax({
                     type:'post',
                      url:url+ "/movie/findCinemaByMovieAndDate.do",
                     datatype:'json',
                     data: {
                         movieId:movie_id,
                         date:date,
                     },
                     success: function (obj) {
                         console.log(date);
                         /*增加对长度的判断，只获取十条内容*/
                         for(var i=0;i<obj.cinemas.length;i++){
                             cinemasList.append(
                                 "<div class=\"cinema-cell\">" +
                                 "<div class=\"cinema-info\">" +  /*电影名字*/
                                 "<a class=\"cinema-name\">" + obj.cinemas[i].cinemaName + "</a>" +
                                 /*电影地址*/
                                 "<p class=\"cinema-address\">地址：" + obj.cinemas[i].cinemaAdress + "</p>" +
                                 "</div>" +
                                 "<div class=\"buy-btn\">" +
                                 "<a href=\"/order/selectSeat.do?cinemaId=" + obj.cinemas[i].cinemaId + "&movieId=" + movie_id  + "&date=" + date + "\">选座购票</a>"+
                                 "</div>" +
                                 "</div>"
                             );
                         }
                     }

                 })
             /*}*/
         }






        //初始化url参数
        function initParams(){
            if(getUrlParams('date') == null){
                date = "0";
            }else{
                date = getUrlParams('date');
            }

        }
        //获取url参数
        function getUrlParams(name) { // 不传name返回所有值，否则返回对应值
            var url = window.location.search;
            if (url.indexOf('?') == 1) { return false; }
            url = url.substr(1);
            url = url.split('&');
            var name = name || '';
            var nameres;
            // 获取全部参数及其值
            for(var i=0;i<url.length;i++) {
                var info = url[i].split('=');
                var obj = {};
                obj[info[0]] = decodeURI(info[1]);
                url[i] = obj;
            }
            // 如果传入一个参数名称，就匹配其值
            if (name) {
                for(var i=0;i<url.length;i++) {
                    for (const key in url[i]) {
                        if (key == name) {
                            nameres = url[i][key];
                        }
                    }
                }
            } else {
                nameres = url;
            }
            // 返回结果
            return nameres;
        }


    </script>
    <!-- ------------------------------------------------------------------- -->

</body>
</html>