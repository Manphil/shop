<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/18
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

                <form class="navbar-form navbar-right" role="search" method="get" action="${pageContext.request.contextPath}/search">
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
