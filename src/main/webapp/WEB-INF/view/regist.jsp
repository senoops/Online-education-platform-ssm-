<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<title>Bootstrap 实例</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"> 
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/11.css">

</head>
<!-- ajax验证用户名可用 -->
<!-- var url = "${pageContext.request.contextPath }/user/checkUser?username="
					+ (username.value) + "&time=" + new Date().getTime(); -->
<script type="text/javascript">
	function validate() {
		var username = $("#username").val();
		var password = $("#password").val();
		var email = $("#email").val();
		var reg =  /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		var birth = $("#birthDate").val();
		var gender = $('input:radio:checked').val();
		var okUsername = false;
		var okPassword = false;
		var okEmail = false;
		var okBirth = false;
		if (username == "") {
			$("#spanUsername").html("<b style='color:red;font-size:15px;margin-top:auto;'>用户名不能为空！</b>");
		} else {
			if (validateUsername() == "false") {
				okUsername = true;
			}
		}
		if (password == "") {
			$("#spanPassword").html("<b style='color:red;font-size:15px;margin-top:auto;'>密码不能为空！</b>");
		} else {
			$("#spanPassword")
					.html(
							"<div class='glyphicon glyphicon-ok' style='float:left'></div>");
			okPassword = true;
		}
		if (email == "") {
			$("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email不能为空！</b>");
		} else {
			if(reg.test(email)){
				
			$("#spanEmail").html(
							"<div class='glyphicon glyphicon-ok' style='float:left'></div>");
			okEmail = true;
			}else{
				$("#spanEmail").html("<b style='color:red;font-size:15px;margin-top:auto;'>email格式错误！</b>");
			}
		}

		if (birth == "") {
			$("#spanBirth").html(
							"<b style='color:red;font-size:15px;margin-top:auto;'>年月不能为空！</b>");
		} else {
			$("#spanBirth").html(
							"<div class='glyphicon glyphicon-ok' style='float:left'></div>");
			okBirth = true;
		}
		if (okUsername && okPassword && okEmail && okBirth) {
			$("#form1").submit();
		}

	}
	/* 检查用户名是否可用 */
	function validateUsername() {
		var result;
		$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath }/checkUser?username="
							+ (username.value)
							+ "&time="
							+ new Date().getTime(),
					async : false,
					success : function(res) {
						if (res == "true") {
							$("#spanUsername")
									.html(
											"<b style='color:red;font-size:15px;margin:5px auto;text-align:left'>用户名已被使用！</b>");
							$("#username").focus();
							result = res;
						} else {
							$("#spanUsername")
									.html(
											"<div class='glyphicon glyphicon-ok' style='float:left'></div>");
							result = res;
						}
					}
				})
		return result;
	}
</script>
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
			<li ><a href="loginer" style=" font-size:20px;">login</a></li>
			<li class="active"><a href="#" style="	font-size:20px;">regist</a></li>
		
		</ul>
	
	
	</nav>

	<div class="container-fluid full ">
	<form action="${pageContext.request.contextPath }/regist"
			class="form-horizontal col-md-9 col-md-offset-2 " role="form" method="post" id="form1">
			
			<div class="form-group">
				<label for="firstName" class="col-md-3 control-label">用户名</label>
				<div class="col-md-6">
					<input name="username" type="text" id="username" maxlength="10"
						placeholder="请输入用户名" class="input form-control" autofocus />
				</div>
				<label class="col-md-3 control-label" id="spanUsername" style="text-align:left;"></label>
			</div>

			<div class="form-group">
				<label for="password" class="col-md-3 control-label">密码</label>
				<div class="col-md-6">
					<input name="password" type="password" id="password" maxlength="15"
						placeholder="请输入密码" class="input form-control">
				</div>

				<label class="col-md-3 control-label" id="spanPassword" style="text-align:left;"></label>
			</div>
			<div class="form-group">
				<label for="email" class="col-md-3 control-label">Email</label>
				<div class="col-md-6">
					<input name="email" type="email" id="email" placeholder="Email"
						class="form-control">
				</div>
				<label class="col-md-3 control-label" id="spanEmail"  style="text-align:left;"></label>
			</div>

			<div class="form-group">
				<label for="birthDate" class="col-md-3 control-label">出生年月</label>
				<div class="col-md-6">
					<input name="birth" type="date" id="birthDate" class="form-control">
				</div>
				<label class="col-md-3 control-label" id="spanBirth"  style="text-align:left;"></label>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3">性别</label>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-6">
							<label class="radio-inline"> <input name="gender"
								class="gender" type="radio" id="femaleRadio" value="Female"
								checked=true>女
							</label>
						</div>
						<div class="col-sm-6">
							<label class="radio-inline"> <input name="gender"
								class="gender" type="radio" id="maleRadio" value="Male">男
							</label>
						</div>

					</div>
				</div>
			</div>
			<!-- /.form-group -->

			<div class="form-group">
				<div class="col-sm-9 col-sm-offset-3"></div>
			</div>
			<!-- /.form-group -->
			<div class="form-group">
				<div class="col-md-9 col-md-offset-1">
					<button type="button" id="submit1"
						class="btn btn-primary btn-block" onclick="validate()">立即注册</button>
				</div>
			</div>
		</form>
	</div>
	</div>
	<div class="footer">
	<a id="back_home" href="index">
	返回首页</a>
	<p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx11010802013162</p>
	</div>
	</div>
	</div>
	

	
	
	
	
	
	


	</body>
	</html>