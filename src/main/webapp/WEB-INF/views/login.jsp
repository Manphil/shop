<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%--<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>--%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<title>登录</title>
		<script src="../../js/jquery.js"></script>
		<link rel="stylesheet" href="../../css/login.css"/>
		<link rel="stylesheet" href="../../css/main.css"/>
		<link rel="stylesheet" href="../../css/bootstrap/css/bootstrap.min.css"/>
		<script src="../../css/bootstrap/js/bootstrap.min.js"></script>
		<script src="../../js/sort.js"></script>
		<script src="../../js/holder.js"></script>
		<script src="../../js/send.js"></script>
	</head>

<%--<%
	String UserID = request.getParameter("UserID");
	String mimacuowu = null;
	String zhanghaobucunzai = null;
	String cerCode = (String) session.getAttribute("certCode");
	String confirmlogo = request.getParameter("confirmlogo");
%>--%>

<%--<%
	String driver = "com.mysql.jdbc.Driver";

	// URL指向要访问的数据库名test1

	String url = "jdbc:mysql://127.0.0.1:3306/XianYu";

	// MySQL配置时的用户名

	String user = "root";

	// Java连接MySQL配置时的密码

	String password = "123456";

	String cuowu = "密码错误";

	String bucunzai = "账号不存在";

	try {
		// 1 加载驱动程序

		Class.forName(driver);

		// 2 连接数据库

		Connection conn = DriverManager.getConnection(url, user, password);

		// 3 用来执行SQL语句

		Statement statement = conn.createStatement();

		String userID = request.getParameter("UserID");

		session.setAttribute("username", userID);

		String Userpassword = request.getParameter("Userpassword");

		// 要执行的SQL语句

		String sql = "select  *  from customer where UserID='" + userID + "'";

		ResultSet rs = statement.executeQuery(sql);
		if (userID != null) {
	if (rs.next())

	{
		sql = "select  *  from customer where UserID='" + userID + "'and password='" + Userpassword
				+ "'";

				rs = statement.executeQuery(sql);
				if (rs.next())

				{
					if (cerCode.equals(confirmlogo)) {
						response.setHeader("refresh", "0;url = index.jsp");
					}

				} else {
					mimacuowu = "密码错误";
				}
			} else {
				zhanghaobucunzai = "账号不存在";
				out.print(zhanghaobucunzai);

			}
		}

		conn.close();
	} catch (ClassNotFoundException e) {
		System.out.println("Sorry,can`t find the Driver!");
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>--%>
	<script>
		var UserID = "<%--<%=UserID%>--%>";
		var mimacuowu = "<%--<%=mimacuowu%>--%>";
		function input_value() {
			if (UserID != "null") {
				document.getElementById("inputEmail3").value = UserID;
			}
		}
		$(document).ready(function() {
			input_value();
			$(document).keypress(function(e) {
			    if (e.which == 13) {
				e.preventDefault();
				$(".login-input").click();
			    }
			});
		}
		)
	</script>
	<script type="text/javascript">
		function reloadcode() {
		var verify = document.getElementById("code");
		verify.setAttribute("src", "/verificationcodeimg?it=" + Math.random());
	}
	</script>
	<body onload="input_value()">
	<div id="main" class="container">
		<div id="header">
			<div class="row">
				<div class="col-md-4" role="navigation">
					<!-- <h1 style="font-size: 20px;margin-top: 9px">东大咸鱼</h1> -->
					<ul class="nav nav-pills">
						<li><a href="/user/login" style="color: #F22E00">请登录</a></li>
						<li><a href="/user/register">注册</a></li>
					</ul>
				</div>
				<div class="col-md-8">
					<ul class="nav nav-pills pull-right">
						<li><a href="/user/login"> <span
								class="glyphicon glyphicon-comment"></span> 消息
						</a></li>
						<li><a href="/user/login"> <span
								class="glyphicon glyphicon-shopping-cart" style="color: #F22E00"></span>
								购物车
						</a></li>
						<li><a href="/user/login"> <span
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
							<a class="navbar-brand" href="./main.jsp">淘身边</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li><a class="a-color" href="/main">首页</a></li>
								<li><a class="a-color" href="/user/login">发布闲置</a></li>
								<li class="dropdown"><a class="a-color" href="/user/login"
									class="dropdown-toggle" data-toggle="dropdown" role="button"
									aria-haspopup="true" aria-expanded="false">我的闲置 <span
										class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="/user/login">出售中</a></li>
										<li><a href="/user/login">交易中</a></li>
										<li role="separator" class="divider"></li>
										<li><a href="/user/login">新消息</a></li>
									</ul></li>
							</ul>

							<form class="navbar-form navbar-right" role="search" method="get">
								<div class="form-group">
									<input type="text" class="form-control" placeholder="Search"/>
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

		</div>
		<div class="login">
			<div class="row">
				<div class="col-md-6">
					<%--<img src="../../js/holder.js/500x500" alt="">--%>
					<img src="../../js/holder.js" alt=""></img>
				</div>
				<div class="col-md-5 form-login">
					<div>
						<!-- <h2 class="login-h2">登录</h2> -->
						<form class="form-horizontal" action="/user/loginconfirm" method="post">
							<div class="form-group">
								<label for="userid" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="userid"
										name="userid" placeholder="用户名/学号"/>
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="password"
										name="password" placeholder="密码"/>
								</div>
							</div>
							<div class="form-group">
								<label for="confirmlogo" class="col-sm-2 control-label">验证码</label>
								<img src="/verificationcodeimg" id="code" onclick="reloadcode()"
									style="cursor: pointer;" alt="看不清楚,换一张" width="100px"/>
								<div class="col-sm-10" style="width: 150px">
									<input type="text" class="form-control" id="confirmlogo"
										name="confirmlogo"/>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<input type="submit" class="btn btn-primary" value="登录"
										onclick="testcerCode()" name="submit"/>
									<div>
										${errorMsg}
										${verificationCode}
										<%--<%
											if (bucunzai.equals(zhanghaobucunzai)) {
												out.write(zhanghaobucunzai);
											}
										%>
										<%
											if (cuowu.equals(mimacuowu)) {
												out.write(mimacuowu);
											}
										%>
										<%
											if (!"".equals(confirmlogo) && confirmlogo != null && !cerCode.equals(confirmlogo))
												out.print("验证码错误");
										%>--%>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	</body>
</html>