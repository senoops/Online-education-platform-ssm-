<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>Bootstrap 实例</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css"> 
<script src="${pageContext.request.contextPath }/style/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/11.css">

</head>

<body>

	<div id="ui" style="text-align:center;">
	<div class="user ">
	<div class="logo">
	<a href=#>
	<img src="${pageContext.request.contextPath }/style/image/1.jpg" width="204px" class="img-rounded"></a>
	</div><!-- uiView:  -->
	<div data-ui-view="" class="container">
	<nav class="navbar navbar-default" role="navigation" style="border: 0px solid transparent !important;">
	
	
	
		<ul class="nav navbar-nav" style=" width: auto;  margin-left: 490px;">
			<li class="active" ><a   href="#" style=" font-size:20px;">login</a></li>
			<li  ><a href="register" style="	font-size:20px;">register</a></li>
		
		</ul>
	
	
	</nav>

	<div class="container-fluid full ">
	<form id="login1" action="login" method="post" 
						class="form col-md-4 col-md-offset-4 ">
						<div class="form-group" >
							<input id="username" name="username" type="text"
								class="form-control input-lg" placeholder="用户名">
						</div>
						<div class="form-group">
							<input id="password" name="password" type="password"
								class="form-control input-lg" placeholder="登录密码">
						</div>
						<div class="form-group">
							<div id="loginInfo"></div>
						</div>
					
						 
						<div class="form-group">
							<button id="submit1" class="btn btn-primary btn-lg btn-block"
								type="button" onclick="validatePassword()">立刻登录</button>
						</div>
					</form>
	</div>
	</div>
	<div class="footer">
	<a class="icon-ic_login_backhome" href="index">
	返回首页</a>
	<p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx11010802013162</p>
	</div>
	</div>
	</div>
	

	
	
	<script type="text/javascript">
		function validatePassword() {
			var username = $("#username").val();
			var password = $("#password").val();
			/* 判断用户名密码是否为空 */
			if (username == "") {
				$("#loginInfo").html(
						"<b style='color:red;font-size:15px;'>用户名不能为空！</b>");
				$("#username").focus();
				return;
			}
			if (password == "") {
				$("#loginInfo").html(
						"<b style='color:red;font-size:15px;'>密码不能为空！</b>");
				$("#password").focus();
				return;
			}
			/* ajax验证密码 */
			$
					.ajax({
						type : "GET",
						url : "validatePassword",
						data : {
							"username" : username
						},
						async : true,
						success : function(data) {
							/* alert(password==data); */
							if (password == data) {
								$("#login1").submit();
							} else {
								$("#loginInfo")
										.html(
												"<b style='color:red;font-size:15px;'>用户名或密码错误！</b>");
							}
							/* alert(data); */
						}
					})
		}
	</script>
	
	


	</body>
	</html>