<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>  
<head>  
<meta content="text/html; charset=UTF-8"> 
  
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
<a class="navbar-brand" href="#">上课吧		</a>  
</div>  
  
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">  
<ul class="nav navbar-nav">  
<li class="active"><a href="${pageContext.request.contextPath }">首页</a></li>  
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
						<c:if test="${loginUser != null }">
							<li><a href="mylearn">我的学习 </a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">[${loginUser.username }]<strong
									class="caret"></strong></a>
								<ul class="dropdown-menu">
									<li><a href="user/logOut"
										class="glyphicon glyphicon-inbox"> 退出帐号</a></li>
									
								</ul></li>
						
						
						</c:if>
						<c:if test="${loginUser == null }">
							
						
						
						
							<li><a  href="loginer"><span
									class="glyphicon glyphicon-log-in"></span> 登录</a></li>
							<li><a href="register"><span
									class="glyphicon glyphicon-user"></span> 注册 </a></li>
							<li><a href="#">关于 </a></li>
						</c:if>

					</ul>
</div>  
</div>  
</nav>  
 <div class="mc-search-course-breadcrumb">
<ul class="g-flow f-cb">
<li>
<a href="${pageContext.request.contextPath }" target="_blank">首页</a>
</li>

<li class="current">
<span class="arrow"></span>
<a href="javascript: void(0);">课程详情</a>
</li>

</ul>
</div>
<div class="g-flow f-cb">


<div class="f-bg courseheadbox" id="j-coursehead">

<div class="u-courseHead" id="auto-id-1509947716498">

<div class="ov f-pr j-ch" style="
    padding-top: 0px;
    top: 10px;
">


<div class="g-sd1 left j-chimg">
<img width="450" height="250" src="<c:url value="/style/image/courses/${course.courseid}.jpg?imageView&amp;thumbnail=450y250&amp;quality=100"/>">
</div>

<div class="g-mn1">

<div class="g-mn1c right j-right f-pr">
<div class="ctarea f-fl j-cht">
<div class="u-coursetitle f-fl" id="auto-id-1509947716616">        <h2 class="f-thide">
<span class="u-coursetitle_title" 
title="">${course.coursename}</span></h2>    
    
<div class="f-cb margin-top-15">             
   
		<span class="cmt">学习人数(218)
		</span>     
 
      
                                 
 
<div class="f-fl" style="margin-right:3px;">
 <a href="#" target="_blank" class="j-userNode" data-id="837467"
 data-type="10" id="auto-id-1509947716617">${course.coursedetail}</a>
</div>                    
 


           

</div>
 
</div>
</div>
<div>

<div class="btnarea f-pa j-chbtnarea">

<c:if test="${isSelect == false }">
	<a class="learnbtn f-db f-cb j-joinBtn" >
	<span>立即参加</span>
	</a>
</c:if>
<c:if test="${isSelect == true }">
<a class="learnbtn f-db f-cb j-joinBtn" ><span>取消课程</span></a>
</c:if>
</div>
</div>
</div>
</div>
</div>


</div>
</div>



</div>
<script>
$(document).ready(function(){
	  $(".learnbtn").click(function(){
		  
		  if(!"${loginUser}")
	  {window.location = "${pageContext.request.contextPath }/loginer";}
		  else
			  {
			  if("${isSelect}"=="true" )
			  		{deleteCourse();}
			  else{insertCourse();}
			  }
	  
		
	  });
	});
	
function insertCourse() {
			
			$
					.ajax({
						type : "post",
						url : "insertCourse",
						data : {
							"courseid" : "${course.courseid}" ,
							"userid" :   "${loginUser.id}"
						},
						async : true,
						success : function(data) {
							/* alert(password==data); */
							if (data == "true") {
								
								location.reload(true) ;
							} else {
								$(".learnbtn").focus();
									return;
							}
							/* alert(data); */
						}
					})
		}
function deleteCourse() {
	
	$
			.ajax({
				type : "post",
				url : "deleteCourse",
				data : {
					"courseid" : "${course.courseid}",
					"userid" :   "${loginUser.id}"
				},
				async : true,
				success : function(data) {
					/* alert(password==data); */
					if (data == "true") {
						
						location.reload(true) ;
					} else {
						$(".learnbtn").focus();
							return;
					}
					/* alert(data); */
				}
			})
}
	</script>
</body>  
</html>
