<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/18
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>东大淘身边</title>
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/css/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sort.js"></script>
    <script src="${pageContext.request.contextPath}/js/holder.js"></script>
    <!-- 	<script>
            $(document).ready(function(){
                $(".list-group-item").hover(function(){
                    $(this).children("div.sort-detail").show();
                },function(){
                    $(this).children("div.sort-detail").hide();
                });
            })
        </script> -->
</head>
<body>
<div id="main" class="container">
    <!-- <div id="header">
        <ul id="header_left">
            <li id="login"><a href="">登录</a></li>
            <li id="register"><a href="">注册</a></li>
        </ul>
        <ul>
            <li><a href="">购物车</a></li>
            <li><a href="">收藏夹</a></li>
            <li><a href="">客服</a></li>
        </ul>
    </div>
    <div>

    </div> -->
    <div id="header">
        <%@ include file="header.jsp" %>
        <%--<%
            String userId = (String) session.getAttribute("userId");
            //out.println(userId);
            String username = (String) session.getAttribute("username");
            if (username == null) {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">

                    <li><a href="./login.jsp" style="color: #F22E00">请登录</a></li>


                    <li><a href="./register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./login.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="header-nav-middle">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><!-- <img alt="Brand" style="display: inline-block;" src="./image/tao.jpg" width="20" height="20"> --><span class="logo-word">淘身边</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./login.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./login.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="login.jsp">出售中</a></li>
                                    <li><a href="login.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./login.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
        } else {
        %>
        <div class="row">
            <div class="col-md-4" role="navigation">
                <!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->

                <ul class="nav nav-pills">
                    <li class="info-a"><a href="./info.jsp"
                                          style="color: #F22E00"><%=username%><span class="glyphicon glyphicon-triangle-bottom" style="font-size: 5px;margin-left: 7px;" aria-hidden="true"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="./info.jsp">账户管理</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="./login.jsp" class="login-out">退出登录</a></li>

                        </ul></li>
                    <li><a href="register.jsp">注册</a></li>
                </ul>
            </div>
            <div class="col-md-8">
                <ul class="nav nav-pills pull-right">
                    <li><a href="./chat.jsp"> <span
                            class="glyphicon glyphicon-comment"></span> 消息
                    </a></li>
                    <li><a href="./shopcart.jsp"> <span
                            class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
                        购物车
                    </a></li>
                    <li><a href="./favorite.jsp"> <span
                            class="glyphicon glyphicon-star"></span> 收藏夹
                    </a></li>
                </ul>
            </div>
        </div>
        <div id="header-nav">
            <nav class="navbar navbar-default" id="&lt;%&ndash;header-nav-middle&ndash;%&gt;">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed"
                                data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1"
                                aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span> <span
                                class="icon-bar"></span> <span class="icon-bar"></span> <span
                                class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="./index.jsp"><span class="logo-word">淘身边</span></a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse"
                         &lt;%&ndash;id="bs-example-navbar-collapse-1"&ndash;%&gt;>
                        <ul class="nav navbar-nav">
                            <li><a class="a-color" href="./index.jsp">首页</a></li>
                            <li><a class="a-color" href="./release.jsp">发布闲置</a></li>
                            <li class="dropdown"><a class="a-color" href="./info.jsp"
                                                    class="dropdown-toggle" data-toggle="dropdown" role="button"
                                                    aria-haspopup="true" aria-expanded="false">我的闲置 <span
                                    class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="info.jsp">出售中</a></li>
                                    <li><a href="info.jsp">交易中</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="./chat.jsp">新消息</a></li>
                                </ul></li>
                        </ul>

                        <form class="navbar-form navbar-right" role="search" method="get" action="./searchResult.jsp">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search" name="keyword">
                            </div>
                            <button type="submit" class="btn btn-default">
                                <span class="glyphicon glyphicon-search" aria-label="搜索"></span>
                            </button>
                        </form>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
        </div>
        <%
            }
        %>--%>
        <!-- 旋转图 -->
        <div class="header-bottom">
            <div class="sort">
                <div class="sort-channel">
                    <ul class="sort-channel-list list-group">
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=数码">闲置数码</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=手机">手机</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=手机壳">手机壳</a> <a
                                            href="./categoty.jsp?categoty=充电器">充电器</a> <a href="">电池</a> <a
                                            href="./categoty.jsp?categoty=耳机">耳机</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=相机">相机</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=镜头">镜头</a> <a
                                            href="./categoty.jsp?categoty=单反">单反</a> <a
                                            href="./categoty.jsp?categoty=胶片">胶片</a> <a
                                            href="./categoty.jsp?categoty=摄像">摄像</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=电脑">电脑</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=显示屏">显示屏</a> <a
                                            href="./categoty.jsp?categoty=显卡">显卡</a> <a
                                            href="./categoty.jsp?categoty=硬盘">硬盘</a> <a
                                            href="./categoty.jsp?categoty=内存条">内存条</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=影音">影音</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=MP3">MP3</a> <a
                                            href="./categoty.jsp?categoty=音响">音响</a> <a
                                            href="./categoty.jsp?categoty=麦克风">麦克风</a> <a
                                            href="./categoty.jsp?categoty=收音机">收音机</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=日用">闲置日用</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=护肤">护肤</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=洗发水">洗发水</a> <a
                                            href="./categoty.jsp?categoty=沐浴露">沐浴露</a> <a href="">洗面奶</a> <a
                                            href="">洗手液</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=美妆">美妆</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=面膜">面膜</a> <a
                                            href="./categoty.jsp?categoty=口红">口红</a> <a
                                            href="./categoty.jsp?categoty=防嗮">防嗮</a> <a
                                            href="./categoty.jsp?categoty=香水">香水</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=家居">家居</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=书架">书架</a><a href="./categoty.jsp?categoty=鞋柜">鞋柜</a>
                                        <a href="./categoty.jsp?categoty=衣架">衣架</a> <a
                                            href="./categoty.jsp?categoty=台灯">台灯</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=闲置书籍">闲置书籍</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=英语">英语</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=四六级">四六级</a> <a
                                            href="./categoty.jsp?categoty=充电器">商务英语</a> <a
                                            href="./categoty.jsp?categoty=听力">听力</a> <a
                                            href="./categoty.jsp?categoty=考研">考研</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=考研">考研</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=计算机">计算机</a> <a
                                            href="./categoty.jsp?categoty=自动化">自动化</a> <a
                                            href="./categoty.jsp?categoty=金融">金融</a> <a
                                            href="./categoty.jsp?categoty=其他">其他</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=体育">体育</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=足球">足球</a> <a
                                            href="./categoty.jsp?categoty=乒乓球">乒乓球</a> <a
                                            href="./categoty.jsp?categoty=篮球">篮球</a> <a
                                            href="./categoty.jsp?categoty=羽毛球">羽毛球</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=经典">经典</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=历史">历史</a> <a
                                            href="./categoty.jsp?categoty=名人">名人</a> <a
                                            href="./categoty.jsp?categoty=政治">政治</a> <a
                                            href="./categoty.jsp?categoty=小说">小说</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=服饰">闲置服饰</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=女装">女装</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=连衣裙">连衣裙</a> <a
                                            href="./categoty.jsp?categoty=充电器"> 半身裙</a> <a
                                            href="./categoty.jsp?categoty= T恤"> T恤 衬衫</a> <a
                                            href="./categoty.jsp?categoty=卫衣">卫衣</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=男装">男装</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=外套">外套</a> <a
                                            href="./categoty.jsp?categoty=衬衫">衬衫</a> <a
                                            href="./categoty.jsp?categoty=夹克">夹克</a> <a
                                            href="./categoty.jsp?categoty=运动外套">运动外套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=鞋子">鞋子</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=运动鞋">运动鞋</a> <a
                                            href="./categoty.jsp?categoty=单鞋">单鞋</a> <a
                                            href="./categoty.jsp?categoty=皮鞋">皮鞋</a> <a
                                            href="./categoty.jsp?categoty=拖鞋">拖鞋</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=箱包">箱包</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=女包">女包</a> <a
                                            href="./categoty.jsp?categoty=男包">男包</a> <a
                                            href="./categoty.jsp?categoty=旅行箱">旅行箱</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=装饰品">装饰品</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=配饰">配饰</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=腰带">腰带</a> <a
                                            href="./categoty.jsp?categoty=皮带">皮带</a> <a
                                            href="./categoty.jsp?categoty=帽子">帽子</a> <a
                                            href="./categoty.jsp?categoty=围巾">围巾</a>
                                        <a
                                                href="./categoty.jsp?categoty=手套">手套</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=手表">手表</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=机械表">机械表</a><a
                                            href="./categoty.jsp?categoty=石英表">石英表</a> <a
                                            href="./categoty.jsp?categoty=电子表">电子表</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=饰品">饰品</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=眼镜">眼镜</a> <a
                                            href="./categoty.jsp?categoty=手链">手链</a> <a
                                            href="./categoty.jsp?categoty=项链">项链</a> <a
                                            href="./categoty.jsp?categoty=吊坠">吊坠</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=收藏品">收藏品</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=古玩">古玩</a> <a
                                            href="./categoty.jsp?categoty=邮票">邮票</a> <a
                                            href="./categoty.jsp?categoty=钱币">钱币</a> <a
                                            href="./categoty.jsp?categoty=陶瓷">陶瓷</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=学习用品">学习用品</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=编码">编码</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=Java">Java</a> <a
                                            href="./categoty.jsp?categoty=PHP">PHP</a> <a
                                            href="./categoty.jsp?categoty=C">C++</a> <a
                                            href="./categoty.jsp?categoty=Python">Python</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=培训">培训</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=驾照">驾照</a> <a
                                            href="./categoty.jsp?categoty=考研">考研</a> <a
                                            href="./categoty.jsp?categoty=计算机证书">计算机证书</a> <a
                                            href="./categoty.jsp?categoty=四六级">四六级</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=线上课程">线上课程</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=健身">健身</a> <a
                                            href="./categoty.jsp?categoty=考证">考证</a> <a
                                            href="./categoty.jsp?categoty=学习">学习</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                        <li class="list-group-item"><a href="./categoty.jsp?categoty=闲置百货">闲置百货</a>
                            <div class="sort-detail">
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=日用">日用</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=雨伞">雨伞</a> <a
                                            href="./categoty.jsp?categoty=口罩">口罩</a> <a
                                            href="./categoty.jsp?categoty=拖布">拖布</a> <a
                                            href="./categoty.jsp?categoty=电风扇">电风扇</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=餐具">餐具</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=餐盘">餐盘</a> <a
                                            href="./categoty.jsp?categoty=保温杯">保温杯</a> <a
                                            href="./categoty.jsp?categoty=饭盒">饭盒</a> <a
                                            href="./categoty.jsp?categoty=餐具套装">餐具套装</a>
                                    </dd>
                                </dl>
                                <dl class="dl-hor">
                                    <dt>
                                        <a href="./categoty.jsp?categoty=出行">出行</a>
                                    </dt>
                                    <dd>
                                        <a href="./categoty.jsp?categoty=自行车">自行车</a> <a
                                            href="./categoty.jsp?categoty=电动车">电动车</a> <a
                                            href="./categoty.jsp?categoty=滑板">滑板</a>
                                    </dd>
                                </dl>
                            </div>
                        </li>
                    </ul>
                </div>
                <!-- <div class="sort-detail">
                    <dl class="dl-horizontal">
                        <dt>手机</dt>
                        <dd>
                            <a href="./categoty.jsp?categoty=手机壳">手机壳</a>
                            <a href="./categoty.jsp?categoty=充电器">充电器</a>
                            <a href="">电池</a>
                            <a href="./categoty.jsp?categoty=耳机">耳机</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>相机</dt>
                        <dd>
                            <a href="">镜头</a>
                            <a href="">单反</a>
                            <a href="">胶片</a>
                            <a href="">摄像</a>
                        </dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>电脑</dt>
                        <dd></dd>
                    </dl>
                    <dl class="dl-horizontal">
                        <dt>MP3</dt>
                        <dd></dd>
                    </dl>
                </div> -->
            </div>
            <div id="mycarousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/image/4.jpg" alt="">
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/3.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/5.jpg" alt="">
                    </div>
                    <div class="item">
                        <img src="${pageContext.request.contextPath}/image/6.jpg" alt="">
                    </div>
                </div>

                <ol class="carousel-indicators">
                    <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#mycarousel" data-slide-to="1"></li>
                    <li data-target="#mycarousel" data-slide-to="2"></li>
                    <li data-target="#mycarousel" data-slide-to="3"></li>
                </ol>

                <a class="left carousel-control" href="#mycarousel" role="button"
                   data-slide="prev" style="display: none;"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a> <a class="right carousel-control" href="#mycarousel" role="button"
                        data-slide="next" style="display: none;"> <span
                    class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
            </div>
            <div class="clear-float"></div>
        </div>
    </div>
    <div class="content">

        <c:if test="${!empty digGoods}">
            <div class="module">
                <div class="hd">
                    <h2>数码</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${digGoods}" var="goods">
                                <li class="data-item-li">
                                    <div>
                                        <a href=""><img src="/goodsimage/${goods.value[0].path}" alt=""
                                                        width="200" height="200"/>
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="">${goods.key.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${goods.key.price}</b>
                                    </div>
                                    <div>
                                        <button
                                                class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                data-id=""
                                                style="display: none;"></button>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>


                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty houseGoods}">
            <div class="module">
                <div class="hd">
                    <h2>家电</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${houseGoods}" var="housegoods">
                                <li class="data-item-li">
                                    <div>
                                        <a href="./detail.jsp?goodsid="> <img
                                                src="/goodsimage/${housegoods.value[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="./detail.jsp?goodsid=">${housegoods.key.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${housegoods.key.price}</b>
                                    </div>
                                    <div>
                                        <button
                                                class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                data-id=""
                                                style="display: none;"></button>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>

                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty colGoods}">
            <div class="module">
                <div class="hd">
                    <h2>服饰</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${colGoods}" var="colgoods">
                                <li class="data-item-li">
                                    <div>
                                        <a href="./detail.jsp?goodsid="> <img
                                                src="/goodsimage/${colgoods.value[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="./detail.jsp?goodsid=">${colgoods.key.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${colgoods.key.price}</b>
                                    </div>
                                    <div>
                                        <button
                                                class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                data-id=""
                                                style="display: none;"></button>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty bookGoods}">
            <div class="module">
                <div class="hd">
                    <h2>书籍</h2>
                    <hr>
                </div>

                <div class="bd">
                    <div class="data">
                        <ul>
                            <c:forEach items="${bookGoods}" var="bookgoods">
                                <li class="data-item-li">
                                    <div>
                                        <a href="./detail.jsp?goodsid="> <img
                                                src="/goodsimage/${bookgoods.value[0].path}" alt=""
                                                width="200" height="200">
                                        </a>
                                    </div>
                                    <p class="text-right">
                                        <a href="./detail.jsp?goodsid=">${bookgoods.key.goodsname}</a>
                                    </p>
                                    <div class="text-right">
                                        <b>￥${bookgoods.key.price}</b>
                                    </div>
                                    <div>
                                        <button
                                                class="like-button glyphicon glyphicon-heart-empty btn btn-default"
                                                data-id=""
                                                style="display: none;"></button>
                                        <!-- <button class="like-button1 glyphicon glyphicon-heart-empty btn btn-default "></button> -->
                                    </div>
                                </li>
                            </c:forEach>

                            <div class="clear-float" style="clear: both;"></div>
                        </ul>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>


