<%--
  Created by IntelliJ IDEA.
  User: 文辉
  Date: 2017/7/22
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Visual Admin Dashboard - Preferences</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet'
          type='text/css'>
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- Left column -->
<div class="templatemo-flex-row">
    <jsp:include page="sidebar.jsp"/>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <jsp:include page="goodsNav.jsp"/>
        <div class="templatemo-content-container">
            <div class="templatemo-content-widget no-padding">
                <div class="panel panel-default table-responsive">
                    <table class="table table-striped table-bordered templatemo-user-table">
                        <thead>
                        <tr>
                            <td><a href="" class="white-text templatemo-sort-by">id<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">商品名<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">价格<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">数量<span class="caret"></span></a></td>
                            <td><a href="" class="white-text templatemo-sort-by">类别<span class="caret"></span></a></td>
                            <td>详情</td>
                            <td>编辑</td>
                            <td>删除</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>1.</td>
                            <td>John</td>
                            <td>Smith</td>
                            <td>@jS</td>
                            <td>js@company.com</td>
                            <td><a href="" class="templatemo-link">详情</a></td>
                            <td><a href="" class="templatemo-edit-btn">编辑</a></td>
                            <td><a href="" class="templatemo-delete-btn">删除</a></td>
                        </tr>
                        <tr>
                            <td>2.</td>
                            <td>Bill</td>
                            <td>Jones</td>
                            <td>@bJ</td>
                            <td>bj@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>Mary</td>
                            <td>James</td>
                            <td>@mJ</td>
                            <td>mj@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>4.</td>
                            <td>Steve</td>
                            <td>Bride</td>
                            <td>@sB</td>
                            <td>sb@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>5.</td>
                            <td>Paul</td>
                            <td>Richard</td>
                            <td>@pR</td>
                            <td>pr@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>6.</td>
                            <td>Will</td>
                            <td>Brad</td>
                            <td>@wb</td>
                            <td>wb@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>7.</td>
                            <td>Steven</td>
                            <td>Eric</td>
                            <td>@sE</td>
                            <td>se@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        <tr>
                            <td>8.</td>
                            <td>Landi</td>
                            <td>Susan</td>
                            <td>@lS</td>
                            <td>ls@company.com</td>
                            <td><a href="" class="templatemo-edit-btn">Edit</a></td>
                            <td><a href="" class="templatemo-link">Action</a></td>
                            <td><a href="" class="templatemo-link">Delete</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="pagination-wrap">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true"><i class="fa fa-backward"></i></span></span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li class="active"><a href="#">3 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true"><i class="fa fa-forward"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/templatemo-script.js"></script>
<!-- Templatemo Script -->
<script>
    $(document).ready(function () {
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();
    });
</script>
</body>
</html>
