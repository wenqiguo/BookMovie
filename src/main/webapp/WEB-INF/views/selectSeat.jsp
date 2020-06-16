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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/selectSeat.css">
    <script src="<%=basePath%>static/static/js/header.js" charset="utf-8"></script>
    <script src="<%=basePath%>static/static/js/Api.js"></script>
    <script src="<%=basePath%>static/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=basePath%>static/static/layui/css/layui.css" media="all">
    <title>沃美电影-选场次</title>
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
            <div class="cinema-left">
                <div class="avatar-shadow">

                </div>
            </div>

            <div class="cinema-main clearfix">
                <div class="cinema-brief-container">
                    <div class="telphone">电话：0335-2661222</div>
                    <div class="features-group">
                        <div class="group-title">影院服务</div>

                        <div class="feature">
                            <span class="tag ">3D眼镜</span>
                            <p class="desc text-ellipsis" title="免押金">免押金</p>
                        </div>
                        <div class="feature">
                            <span class="tag ">可停车</span>
                            <p class="desc text-ellipsis" title="可停车">停车场可凭电影票在影城票台领取3小时内免停权益</p>
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
        <div class="main-inner main-bodyz">
            <div class="movie-list-container" data-cinemaid="8330">
                <!-- 电影海报 -->
                <div class="movie-list">
                    <!--<span class="pointer" style="left: 395px;"></span>-->
                </div>
                <span class="scroll-prev scroll-btn"></span>
                <span class="scroll-next scroll-btn"></span>
            </div>

            <div class="show-list active" data-index="0">
                <!-- 电影信息 -->
                <div class="movie-info">
                </div>
                <!-- 观影时间 -->
                <div class="show-date">
                    <span>观影时间 :</span>  
                </div>
                <!-- 场次列表 -->
                <div class="plist-container active">
                    <table class="plist">
                        <thead>
                            <tr>
                                <th>放映时间</th>
                                <th>语言版本</th>
                                <th>放映厅</th>
                                <th>售价（元）</th>
                                <th>选座购票</th>
                            </tr>
                        </thead>
                        <tbody>
                          
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

     <!-- 脚 -->
     <jsp:include page="footer.jsp"/>

    <!-- ------------------------------------------------------------------- -->
    <script>
        window.onload = function(){
            initBanner(); //初始化巨幕
            initHeader();
        }

        //初始化巨幕
        function initBanner(){
            movie_id = getUrlParams('movieId');
            cinema_id = getUrlParams('cinemaId');
            date = getUrlParams("date");
            var cinemaBriefContainer = $(".cinema-brief-container");
            var avatarShadow = $(".avatar-shadow");
            $.ajax({
                type:'post',
                url: url + "/schedule/SelectByCinemaAndMovieId.do",
                dataType:'json',
                data: {
                    movieId: movie_id,
                    cinemaId: cinema_id,
                    date:date
                },
                success:function (obj) {
                    console.log(obj);
                    if (obj.status=="error"){
                        window.location = "/user/showLogin.do"
                    }
                    cinemaBriefContainer.prepend(
                        /*获取电影院名字*/
                        "<h3 class=\"name text-ellipsis\">" + obj.cinema.cinemaName + "</h3>" +
                            /*获取电影院地址*/
                        "<div class=\"address text-ellipsis\">" + obj.cinema.cinemaAdress + "</div>"
                    );
                    avatarShadow.append(
                        /*获取电影院的图片*/
                        "<img class=\"avatar\" src=\"<%=basePath%>static/static/images/cinemas/" + obj.cinema.cinemaName + ".jpg\">" +
                        "<div class=\"avatar-num\"></div>"
                    );
                    initMoive(obj); //初始化电影信息
                    initSchedule(obj); //初始化场次信息
                }
            });
        }

        //初始化电影信息
        function initMoive(obj){
           // console.log(obj);
            var Data = new Date();
            var Month = Data.getMonth() + 1;
            var Day = Data.getDate();
            var movieList = $(".movie-list");
            var movieInfo = $(".movie-info");
            var showDate = $(".show-date");
            /*查看更多电影图片*/
            for(var i=0;i<5;i++){
                movieList.append(
                    "<div class=\"movie active\" data-index=\"0\">" +
                        "<img src=\"<%=basePath%>static/static/images/more/"+obj.movie.movieId+"/" + obj.movie.movieCname + (i+1) + ".jpg\" alt=\"\">" +
                    "</div>"
                );
            }
         
            movieInfo.append(
                "<div>" +
                    "<h3 class=\"movie-name\">"+ obj.movie.movieCname +"</h3>" +
                    "<span class=\"score sc\">"+ obj.movie.movieScore +"</span>" +
                "</div>" +
                "<div class=\"movie-desc\">" +
                    "<div>" +
                        "<span class=\"key\">时长 : </span>" +
                        "<span class=\"value\">"+ obj.movie.movieDuration +"</span>" +
                    "</div>" +
                    "<div>" +
                        "<span class=\"key\">类型 :</span>" +
                        "<span class=\"value\">"+ obj.movie.movieType +"</span>" +
                    "</div>" +
                    "<div>" +
                        "<span class=\"key\">导演 :</span>" +
                        "<span class=\"value\">"+ obj.movie.movieDirector+"</span>" +
                    "</div>" +
                "</div>"
            )
            showDate.append("<span class=\"date-item active\" data-index=\"${status.index}\">今天" + Month + "月" + Day + "</span>  ");
        }

        //初始化场次信息
        function initSchedule(obj){
            var plist = $(".plist").find("tbody");

            for(var i = 0;i < obj.schedules.length;i++){
                plist.append(
                    "<tr class=\"\">" +
                        "<td> <span class=\"begin-time\">"+ obj.schedules[i].scheduleStartTime +"</span> <br> </td>" +
                        "<td> <span class=\"lang\">" + obj.movie.movieCountry +"</span> </td>" +
                        "<td> <span class=\"hall\">" + obj.schedules[i].scheduleHall.hallName + "</span> </td>" +
                        "<td> <span class=\"sell-price\"> <span class=\"stonefont\">" + obj.schedules[i].schedulePrice  + "</span> </span> </td>" +
                        "<td> <a href=\"/order/buySeat.do?schedule_id="+ obj.schedules[i].scheduleId +"\" class=\"buy-btn normal\">选座购票</a> </td>" +
                    "</tr>"   
                            );
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