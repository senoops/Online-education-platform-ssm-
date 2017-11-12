<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>  
<head>  
<meta charset="utf-8"> 
  
    
  <link rel="stylesheet" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css"> 
<script src="${pageContext.request.contextPath }/style/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/style/js/bootstrap.min.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/course.css">
<title>XXXXX系统</title>
<!--[if lt IE 9]>  
<script src="js/html5shiv.js"></script>  
<script src="js/respond.min.js"></script>  
<![endif]-->  
<style>  
        body {  
            padding-top: 50px;  
            padding-bottom: 40px;  
            color: #5a5a5a;  
        }  
  

  
</style>  
  
</head>  
  
<body>  
<!--下面是顶部导航栏的代码-->  
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">  
<div class="container-fluid">  
<div class="navbar-header">  
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"  
                    data-target="#bs-example-navbar-collapse-1">  
<span class="sr-only">Toggle navigation</span>  
<span class="icon-bar"></span>  
<span class="icon-bar"></span>  
<span class="icon-bar"></span>  
</button>  
<a class="navbar-brand" href="#">某管理系统</a>  
</div>  
  
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">  
<ul class="nav navbar-nav">  
<li class="active"><a href="#">首页</a></li>  
<li class="dropdown">  
<a href="#" class="dropdown-toggle" data-toggle="dropdown">功能<span class="caret"></span></a>  
<ul class="dropdown-menu" role="menu">  
<li class="dropdown-header">业务功能</li>  
<li><a href="#">信息建立</a></li>  
<li><a href="#">信息查询</a></li>  
<li><a href="#">信息管理</a></li>  
<li class="divider"></li>  
<li class="dropdown-header">系统功能</li>  
<li><a href="#">设置</a></li>  
</ul>  
</li>  
<li><a href="#">帮助</a></li>  
</ul>  
<form class="navbar-form navbar-left" >
				
				<input type="text" class="form-control" placeholder="课程">  
				<button type="submit" class="btn">查找</button>
			</form>
<ul class="nav navbar-nav navbar-right">
						
						<li><a href="${pageContext.request.contextPath }/mylearn">我的学习 </a></li>
						
							<li><a  href="${pageContext.request.contextPath }/loginer"><span
									class="glyphicon glyphicon-log-in"></span> 登录</a></li>
							<li><a href="${pageContext.request.contextPath }/register"><span
									class="glyphicon glyphicon-user"></span> 注册 </a></li>
						

					</ul>
</div>  
</div>  
</nav>  
 <div class="mc-search-course-breadcrumb">
<ul class="g-flow f-cb">
<li>
<a href="//study.163.com/" target="_blank">首页</a>
</li>

<li class="current">
<span class="arrow"></span>
<a href="javascript: void(0);">搜索结果</a>
</li>
<li>
<span class="arrow"></span>
<a href="//study.163.com/courses" target="_blank">全部课程</a>
</li>
</ul>
</div>
<!-- <!—自适应布局-->   
<div class="container-fluid"    style=" text-align: center;">  
<video  controls autoplay>
  <object height="200" width="200" data="<c:url value="/style/video/${videoid}.swf"/>"></object>

  
</video>
</div>  
  
  

  
</body>  
</html>
