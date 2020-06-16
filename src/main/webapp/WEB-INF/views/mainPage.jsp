<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/main2.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>static/static/css/footer.css">
    <script src="<%=basePath%>static/static/js/header.js" charset="utf-8"></script>
    <script src="<%=basePath%>static/static/js/Api.js"></script>

    <script src="<%=basePath%>static/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" href="<%=basePath%>static/static/layui/css/layui.css" media="all">
    <title>沃美电影-首页</title>
</head>
<body>
<!-- ------------------------------------------------------------------- -->
<!-- 导航栏 -->
<jsp:include page="header.jsp"/>

<!-- 占位符 -->
<div style="margin-top: 100px;"></div>

<!-- 主体 -->
<div class="main">
    <div class="main-inner main-page">
        <div class="layui-carousel" id="test3" lay-filter="test4">
            <div carousel-item="">
                <div>
                    <img src="<%=basePath%>static/static/images/pic4.jpg">
                </div>
                <div>
                    <img src="<%=basePath%>static/static/images/pic2.jpg">
                </div>
                <div>
                    <img src="<%=basePath%>static/static/images/pic3.jpg">
                </div>
                <div>
                    <img src="<%=basePath%>static/static/images/pic5.jpg">
                </div>
                <div>
                    <img src="<%=basePath%>static/static/images/pic1.jpg">
                </div>
            </div>
        </div>
        <div class="aside">
            <!-- 1 -->
            <div class="ranking-box-wrapper">
                <div class="panel sidepanel">
                    <div class="panel-header">
                            <span class="panel-title">
                                <span class="textcolor_red">总体票房</span>
                            </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-box boxOffice">
                        </ul>
                    </div>
                </div>
            </div>
            <!-- 2 -->
            <div class="box-total-wrapper clearfix" style="height: 80px">

            </div>
            <!-- 3 -->
            <div class="most-expect-wrapper">
                <div class="panel">
                    <div class="panel-header">
                            <span class="panel-more">
                              <a href="#" class="textcolor_orange" data-act="all-mostExpect-click">
                                <span>查看完整榜单</span>
                              </a>
                              <span class="panel-arrow panel-arrow-orange"></span>
                            </span>
                        <span class="panel-title">
                              <span class="textcolor_orange">最受期待</span>
                            </span>
                    </div>
                    <div class="panel-content">
                        <ul class="ranking-wrapper ranking-mostExpect">

                            <li class="ranking-item ranking-index-1">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1229534}">
                                <span class="normal-link">
                                  <i class="ranking-index">1</i>
                                  <span class="ranking-movie-name">唐人街探案3</span>

                                  <span class="ranking-num-info">
                                      <span class="stonefont">2148078</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>


                            <li class="ranking-item ranking-index-1">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:346210}">
                                <span class="normal-link">
                                  <i class="ranking-index">2</i>
                                  <span class="ranking-movie-name">姜子牙</span>

                                  <span class="ranking-num-info">
                                      <span class="stonefont">517365</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>


                            <li class="ranking-item ranking-index-1">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1227611}">
                                <span class="normal-link">
                                  <i class="ranking-index">3</i>
                                  <span class="ranking-movie-name">爵迹2</span>

                                  <span class="ranking-num-info">
                                      <span class="stonefont">392336</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>


                            <li class="ranking-item ranking-index-4">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1215605}">
                                <span class="normal-link">
                                  <i class="ranking-index">4</i>
                                  <span class="ranking-movie-name">急先锋</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">315230</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>
                            <li class="ranking-item ranking-index-5">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1197417}">
                                <span class="normal-link">
                                  <i class="ranking-index">5</i>
                                  <span class="ranking-movie-name">西游记真假美猴王</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">306130</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-6">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1217023}">
                                <span class="normal-link">
                                  <i class="ranking-index">6</i>
                                  <span class="ranking-movie-name">紧急救援</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">137888</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-7">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1203134}">
                                <span class="normal-link">
                                  <i class="ranking-index">7</i>
                                  <span class="ranking-movie-name">北平会馆</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">112327</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-8">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:342903}">
                                <span class="normal-link">
                                  <i class="ranking-index">8</i>
                                  <span class="ranking-movie-name">夺冠</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">90324</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-9">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1250700}">
                                <span class="normal-link">
                                  <i class="ranking-index">9</i>
                                  <span class="ranking-movie-name">小妇人</span>
                      
                                  <span class="ranking-num-info">
                                      <span class="stonefont">56772</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                            <li class="ranking-item ranking-index-10">
                                <a target="_blank" data-act="mostExpect-movie-click" data-val="{movieid:1207254}">
                                <span class="normal-link">
                                  <i class="ranking-index">10</i>
                                  <span class="ranking-movie-name">六人-泰坦尼克上的中国幸存者</span>
                                  <span class="ranking-num-info">
                                       <span class="stonefont">7430</span>人想看
                                    </span>
                                </span>
                                </a>
                            </li>

                        </ul>


                    </div>
                </div>
            </div>
        </div>
        <div class="movie-grid">
            <%--正在热映--%>
            <div class="panel-header">
                    <span class="panel-more">  <%--全部这里会跳转到电影的分类--%>
                        <a href="/movie/movieList.do" class="textcolor_red" data-act="all-playingMovie-click">
                            <span>全部</span>
                        </a>
                        <span class="panel-arrow panel-arrow-red"></span>
                    </span>
                <span class="panel-title hot-title">
                    </span>
            </div>

            <div class="panel-content">
                <ul class="movie-list movie-hot">
                </ul>
            </div>
            <%--即将上映--%>
            <div class="panel">
                    <span class="panel-more">
                        <a href="/movie/movieList.do" class="textcolor_red" data-act="all-upcomingMovie-click">
                            <span>全部</span>
                        </a>
                        <span class="panel-arrow panel-arrow-blue"></span>
                    </span>
                <span class="panel-title on-title">
                    </span>
            </div>
            <div class="panel-content">
                <ul class="movie-list movie-on">
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- 脚 -->
<jsp:include page="footer.jsp"/>

<!-- ------------------------------------------------------------------- -->
<script>
    var clientHeight = document.documentElement.clientHeight;

    window.onload = function () {
        initHostMovie(); //初始化正在热映和即将上映电影
        //initBoxOffice(); //初始化总体票房
        initHeader();
    }

    //图片轮播
    layui.use(['carousel', 'form'], function () {
        var carousel = layui.carousel, form = layui.form;
        carousel.render({
            elem: '#test3'
            , width: '1200px'
            , height: '500px'
            , interval: 3000
        });
    });

    //初始化正在热映和即将上映电影
    function initHostMovie() {
        var MoiveLiHot = $(".movie-hot");
        var MoiveLiOn = $(".movie-on");
        var htmlHot, htmlOn;
        var ListLength;
        var notice, sale;
        var HotNum = $(".hot-title");
        var OnNum = $(".on-title");
        var TempName;

        $.ajax({
            type: 'post',
            url: url + "/movie/findTotalMovies.do",
            dataType: 'json',
            data: {},
            success: function (obj) {
                console.log(obj);
                var bathPath = "<%=basePath%>";
                HotNum.append("<span class=\"textcolor_red\">正在热映（" + obj.data.length + "部）</span>");
                if (obj.data.length < 8) {
                    ListLength = obj.data.length;
                } else {
                    ListLength = 8;
                }
                for (var i = 0; i < ListLength; i++) {
                    htmlHot =
                        "<li>" +
                        "<div class=\"movie-item\">" +
                        "<a href=\"/movie/movieDetail.do?movieId=" + obj.data[i].movieId + "\" target=\"_blank\" data-act=\"playingMovie-click\" data-val=\"" + obj.data[i].movieId + "\">" +
                        "<div class=\"movie-poster\" style=\"cursor:default;\">" +
                        "<img id=\"moive_picture\" src=\"" + bathPath + obj.data[i].moviePicture + "\">" +
                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                        "<div class=\"movie-info\">" +
                        "<div class=\"movie-score\"><i id=\"moive_score\" class=\"integer\">" + obj.data[i].movieScore + "</i></div>" +
                        "<div class=\"movie-title movie-title-padding\" title=\"" + obj.data[i].movieCname + "\">" + obj.data[i].movieCname + "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "<div class=\"movie-detail movie-detail-strong movie-sale\">" +
                        "<a href=\"/order/ByTickets.do?movieId=" + obj.data[i].movieId + "\" class=\"active\" target=\"_blank\" data-act=\"salePlayingMovie-click\" data-val=\"{movieid:42964}\">购 票</a>" +
                        "</div>" +
                        "</div>" +
                        "</li>";
                    MoiveLiHot.append(htmlHot);
                }

                /*即将上映中，想看数目是随机生成的*/
                OnNum.append("<span class=\"textcolor_blue\">即将上映（" + obj.data1.length + "部）</span>");
                if (obj.data1.length < 8) {
                    ListLength = obj.data1.length;
                } else {
                    ListLength = 8;
                }
                for (var i = 0; i < ListLength; i++) {
                    var bathPath = "<%=basePath%>";
                    var random = Math.floor(Math.random(1, 10) * 50000);
                    htmlOn =
                        "<li>" +
                        "<div class=\"movie-item\">" +
                        "<a href=\"/movie/movieDetail.do?movieId=" + obj.data1[i].movieId + "\" target=\"_blank\" data-act=\"playingMovie-click\" data-val=\"" + obj.data1[i].movieId + "\">" +
                        "<div class=\"movie-poster\" style=\"cursor:default;\">" +
                        "<img id=\"moive_picture\" src=\"" + bathPath + obj.data1[i].moviePicture + "\">" +
                        "<div class=\"movie-overlay movie-overlay-bg\">" +
                        "<div class=\"movie-info\">" +
                        "<div class=\"movie-score\"><i id=\"moive_score\" class=\"integer\">" + obj.data1[i].movieScore + "</i></div>" +
                        "<div class=\"movie-title movie-title-padding\" title=\"" + obj.data1[i].movieCname + "\">" + obj.data1[i].movieCname + "</div>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "</a>" +
                        "<div class=\"movie-detail movie-wish\"><span class=\"stonefont\">" + random + "</span>人想看</div>" +
                        "<div class=\"movie-detail movie-detail-strong movie-presale\">" +
                        "<a id=\"movie-notice\" class=\"movie-presale-sep movie-notice\">预告片</a>" +
                        "<a id=\"movie-sale\" class=\"movie-presale-sep movie-sale\">预 售</a>" +
                        "</div>" +
                        "</div>" +
                        "</li>";
                    MoiveLiOn.append(htmlOn);
                }
                notice = $(".movie-on").find(".movie-notice");
                sale = $(".movie-on").find(".movie-sale");
                for (var i = 0; i < ListLength; i++) {
                    notice[i].index = i;
                    notice[i].onclick = function () {
                        layer.alert('‘' + obj.data1[this.index].movieCname + '’电影暂未有预告片！', {
                            icon: 0,
                            offset: clientHeight / 7
                        });
                    }
                    sale[i].index = i;
                    sale[i].onclick = function () {
                        layer.alert('预售‘' + obj.data1[this.index].movieCname + '’电影成功！', {
                            icon: 0,
                            offset: clientHeight / 7
                        });
                    }
                }
                initBoxOffice(obj);
            }
        });
    }

    //初始化总体票房
    function initBoxOffice(obj) {
        console.log(obj);
        var TempLength;
        if (obj.data2.length > 10) {
            TempLength = 10;
        } else {
            TempLength = obj.data2.length;
        }
        var BoxOffice = $(".boxOffice");
        for (var i = 0; i < TempLength; i++) {
            if (i == 0) {
                BoxOffice.append(
                    "<li class=\"ranking-item ranking-top ranking-index-1\">" +
                    /*这里有个跳转*/
                    "<a href=\"/movie/movieDetail.do?movieId=" + obj.data2[i].movieId + "\" target=\"_blank\">" +
                    "<div class=\"ranking-top-left\">" +
                    "<i class=\"ranking-top-icon\"></i>" +
                    "<img class=\"ranking-imgs  default-img\" src=\"" + url + "/" + obj.data2[i].moviePicture + "\">" +
                    "</div>" +
                    "<div class=\"ranking-top-right\">" +
                    "<div class=\"ranking-top-right-main\">" +
                    "<span class=\"ranking-top-moive-name\">" + obj.data2[i].movieCname + "</span>" +
                    "<p class=\"ranking-top-wish\">" +
                    "<span class=\"stonefont\">" + obj.data2[i].movieTotalticket + "</span>万" +
                    "</p>" +
                    "</div>" +
                    "</div>" +
                    "</a>" +
                    "</li>"
                );

            } else {
                BoxOffice.append(
                    "<li class=\"ranking-item ranking-index-4\">" +
                    /*这里有个跳转*/
                    "<a href=\"/movie/movieDetail.do?movieId=" + obj.data2[i].movieId + "\" target=\"_blank\">" +
                    "<span class=\"normal-link\">" +
                    "<i class=\"ranking-index ranking-index-" + (i + 1) + "\">" + (i + 1) + "</i>" +
                    "<span class=\"ranking-movie-name\">" + obj.data2[i].movieCname + "</span>" +
                    "<span class=\"ranking-num-info\">" +
                    "<span class=\"stonefont\">" + obj.data2[i].movieTotalticket + "</span>万" +
                    "</span>" +
                    "</span>" +
                    "</a>" +
                    "</li>"
                );
            }
        }
    }


</script>
<!-- ------------------------------------------------------------------- -->
</body>
</html>