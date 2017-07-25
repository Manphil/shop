<%--
  Created by IntelliJ IDEA.
  User: 蒋松冬
  Date: 2017/7/23
  Time: 10:02
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
    <title>Visual Admin Dashboard - Preferences</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">

    <%--<c:if test="${empty msg}">
        <script>
            swal(${msg}, "成功","success");
        </script>
    </c:if>--%>
</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"></jsp:include>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <jsp:include page="goodsNav.jsp"></jsp:include>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget white-bg">
                <h2 class="margin-bottom-10">添加商品分类</h2>
                <label class="control-label" for="catename">分类名称</label>
                <form action="${pageContext.request.contextPath}/admin/goods/addCategoryResult" method="post">
                    <div class="row form-group">
                        <div class="col-lg-6 form-group">
                            <input type="text" class="form-control" id="catename" name="catename">
                        </div>
                        <div class="col-lg-4 form-group">
                            <button type="submit" class="templatemo-blue-button">添加</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>        <!-- Templatemo Script -->
<c:if test="${!empty msg}">
    <script type="text/javascript">
        $(document).ready(function () {
            swal('${msg}');
        });
    </script>
</c:if>
</body>
</html>

