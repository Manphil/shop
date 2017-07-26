<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/26
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Maps</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <!--
    Visual Admin Template
    http://www.templatemo.com/preview/templatemo_455_visual_admin
    -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- JS -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>
    <!-- Templatemo Script -->
    <style>
        .head-div {
            font-size: 18px;
        }

        .goods-table thead {
            background-color: #1a3133;
        }
    </style>
</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"/>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <jsp:include page="adminOrderNav.jsp"/>
        <div class="templatemo-content-container">
            <%--<div class="templatemo-content-widget white-bg">--%>
            <%--<h2 class="margin-bottom-10">Geo Charts</h2>--%>
            <%--<p class="margin-bottom-0">Credit goes to <a href="http://jqvmap.com" target="_parent">JQVMap</a>.</p>--%>
            <%--</div>--%>

            <c:forEach items="${pageInfo.list}" var="orderInfo">
                <div class="templatemo-flex-row flex-content-row">
                    <div class="col-1">
                        <div class="panel panel-default margin-10">
                            <div class="panel-heading"><h2>${orderInfo.}</h2></div>
                            <div class="panel-body">
                                <div>
                                    <div class="order-info margin-bottom-10">
                                        <div class="head-div">订单信息</div>
                                        <div>
                                            <table id="orderinfo" class="table table-striped table-bordered templatemo-user-table goods-table">
                                                <thead>
                                                <tr>
                                                    <td><a href="" class="white-text templatemo-sort-by">订单号<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">用户<span class="caret"></span></a>
                                                    </td>
                                                    <td><a href="" class="white-text templatemo-sort-by">原价<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">实付款<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">收货人<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">收货地址<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">联系方式<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">时间<span
                                                            class="caret"></span></a></td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>2<%--${goods.goodsid}--%></td>
                                                    <td>暗室逢灯<%--${goods.goodsname}--%></td>
                                                    <td>￥23<%--${goods.price}--%></td>
                                                    <td>3<%--${goods.num}--%></td>
                                                    <td>234<%--${goods.detailcate}--%></td>
                                                    <td><a href="" class="templatemo-link">详情</a></td>
                                                    <td>
                                                        <button href="" class="templatemo-edit-btn">编辑</button>
                                                    </td>
                                                    <td>
                                                        <button href="" class="templatemo-delete-btn">删除</button>
                                                    </td>
                                                </tr>

                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="goods-info margin-bottom-10">
                                        <div class="head-div">商品信息</div>
                                        <div>
                                            <table id="goodsinfo" class="table table-striped table-bordered templatemo-user-table goods-table">
                                                <thead>
                                                <tr>
                                                    <td><a href="" class="white-text templatemo-sort-by">商品id<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">商品名<span class="caret"></span></a>
                                                    </td>
                                                    <td><a href="" class="white-text templatemo-sort-by">价格<span
                                                            class="caret"></span></a></td>
                                                    <td><a href="" class="white-text templatemo-sort-by">数量<span
                                                            class="caret"></span></a></td>
                                                        <%--<td><a href="" class="white-text templatemo-sort-by">类别<span--%>
                                                        <%--class="caret"></span></a></td>--%>
                                                    <td>详情</td>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>2<%--${goods.goodsid}--%></td>
                                                    <td>暗室逢灯<%--${goods.goodsname}--%></td>
                                                    <td>￥23<%--${goods.price}--%></td>
                                                    <td>3<%--${goods.num}--%></td>
                                                        <%--<td>234&lt;%&ndash;${goods.detailcate}&ndash;%&gt;</td>--%>
                                                    <td><a href="" class="templatemo-link">详情</a></td>
                                                        <%--<td>
                                                            <button href="" class="templatemo-edit-btn">编辑</button>
                                                        </td>
                                                        <td>
                                                            <button href="" class="templatemo-delete-btn">删除</button>
                                                        </td>--%>
                                                </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="margin-bottom-10">
                                        <a href="" class="templatemo-edit-btn pull-right">发货</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
