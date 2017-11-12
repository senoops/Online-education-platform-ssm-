<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css"> 
<script src="${pageContext.request.contextPath }/style/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style type="text/css">
body {
	background-color: #f5f5f5;
}

#contents {
	background-color: #FFF;
	padding-left: 20px;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12">
				<nav class="navbar navbar-inverse "
					role="navigation" >
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index">start</a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class=""><a href="index" class="glyphicon glyphicon-home">首页</a></li>
						<li><a href="#" style="margin-top: 2px;" id="w"></a></li>
						
					

					</ul>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${loginUser != null }">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">[${loginUser.username }]<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="user/logOut"
										class="glyphicon glyphicon-inbox"> 退出帐号</a></li>
									
								</ul></li>
						</c:if>
						<li><a href="#">关于 </a></li>
						<c:if test="${loginUser == null }">
							<li><a  href="loginer"><span
									class="glyphicon glyphicon-log-in"></span> 登录</a></li>
							<li><a href="register"><span
									class="glyphicon glyphicon-user"></span> 注册 </a></li>
						</c:if>

					</ul>
				</div>
			</div>
			</nav>
		</div>

		<br> <br> <br> <br> <br> <br>
	
	<!-- Content -->
	<div class="row-fluid">
		<div class="col-md-3"></div>
		<div class="col-md-6" id=contents>
			<h1>关于DEMO</h1>
			<h2>简介</h2>
			<h2>快速使用</h2>
			<ol>
				<li>导入sql文件，修改数据库文件，update项目</li>
				<li>用户名：admin 密码：123</li>
			</ol>
			<h2>内置功能</h2>
			<ol>
				<li>用户登录校验以及注册(默认注册用户角色为【user】)。</li>
				
				
			</ol>
			<h2>技术选型</h2>
			<p>1.后端</p>
			<ul>
				<li>核心框架：Spring Framework 4.2.7</li>
				
				<li>视图框架：Spring MVC 4.2.7</li>
				<li>持久层框架：Mybatis 3.4.0</li>
				<li>日志管理：Log4j</li>
				
			</ul>
			<P>2.前端</P>
			<ul>
				<li>布局：DIV+CSS bootstrap</li>
				<li>字体：fonts-awesome</li>
				
				<li>JS框架：jQuery min</li>
				
				<li>实时天气：新浪天气api</li>
				
			</ul>
			<P>3.开发平台</P>
			<ul>
				<li>开发环境： jdk1.8 + tomcat9</li>
				<li>语言：java jsp</li>
				<li>开发环境：Java EE、Eclipse、Maven、</li>
			</ul>
		</div>
	</div>
</div>
	<script type="text/javascript">
	
	
		/* 天气预报 */
		$
				.getScript(
						'http://php.weather.sina.com.cn/iframe/index/w_cl.php?code=js&day=0&city=&dfc=1&charset=utf-8',
						function(a) {
							var s = "", r = "", q = "";
							for (s in window.SWther.w) {
								q = SWther.w[s][0];
								r = {
									city : s,
									date : SWther.add.now.split(" ")[0] || "",
									day_weather : q.s1,
									night_weather : q.s2,
									day_temp : q.t1,
									night_temp : q.t2,
									day_wind : q.p1,
									night_wind : q.p2
								}, $("#w").html(
										"[" + r.city + "]" + " " + q.s1 + " "
												+ q.t1 + "℃");
							}
						});
	</script>
</body>
</html>