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
<a href="javascript: void(0);">我的学习</a>
</li>

</ul>
</div>
<div class="container-fluid">  
<div class="j-course-list"><div class="uc-course-list g-flow">
	 <div class="uc-course-list_content">	
		
	    <ul class="uc-course-list_ul">
	        <!--Regular list-->
	    <c:forEach var="course" items="${courses}" varStatus="status">
	       
	        <li id="${course.courseid}" class="uc-course-list_itm f-ib">
				<!--Regular if23-->
    <div class="uc-coursecard uc-ykt-coursecard f-fl">
    <a target="_blank" class="j-href" href="coursedetail?courseid=${course.courseid}">
        <div class="uc-ykt-coursecard-wrap f-cb f-pr">
            <div class="uc-ykt-coursecard-wrap_box">
                <div class="uc-ykt-coursecard-wrap_picbox f-pr"> 
                	<img class="imgPic j-img" src="<c:url value="/style/image/courses/${course.courseid}.jpg?imageView&amp;thumbnail=223y124&amp;quality=100"/>" data-src="" alt="课程图片" >
                          <div class="uc-ykt-course-card_closewrap">
							<div class="uc-ykt-course-card_close f-dn" ></div>
						</div>
                    <div class="m-showLectorTag f-pa" style="display: none;">老师参与</div>
                </div>
                <div class="uc-ykt-coursecard-wrap_tit">
                    <h3 class="">${course.coursename}</h3>
                </div>
                <div class="uc-ykt-coursecard-wrap_orgName f-fs0 f-thide">
               ${course.coursedetail}</div>
                <div class="uc-ykt-coursecard-wrap_scorewrap f-thide f-cb f-pa">
                    <div class="m-scorecnt f-fl f-cb">
                        <div class="uc-starrating">
	 
	<span class="uc-starrating_score">4.7</span>
</div>
                    </div>
                    <div class="m-hot f-fl">
                        <!--Regular if24-->
                            (XXXX人学过)
                        
                    </div>
                </div>
                <div class="uc-ykt-coursecard-wrap_price f-pa">
                    <!--Regular if25-->
                        <span class="u-free">免费</span> 
                    
                </div>
                <!--Regular if26-->
            </div>
        </div>
    </a>
</div>

	        </li>
	        </c:forEach>
	        
	        
	       
	        
	    </ul>
	  
	    <!--Regular if22-->
	 </div>
</div></div>
</div>  
  
  

   <div id="loginModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
						aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					你确定放弃学习？
				</h4>
			</div>
			<div class="modal-body">
				放弃学习将不再收到相关的课件更新和教学服务通知，你可以在课程有效期内免费重新参加。
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" 
						data-dismiss="modal">取消
				</button>
				<button type="button" class="btn btn-primary" onclick="deleteCourse()">
					确定
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
	</div>

  <script>
$(document).ready(function(){
  $(".uc-ykt-coursecard-wrap_box").mouseenter(function(){
    $(this).children(".f-pr").children(".uc-ykt-course-card_closewrap").children(".f-dn").show();

  });
});
$(document).ready(function(){
$(".uc-ykt-coursecard-wrap_box").mouseleave(function(){
   $(this).children(".f-pr").children(".uc-ykt-course-card_closewrap").children(".f-dn").hide();
 });
  });
  
 
  $(document).ready(function(){
  $(".f-dn").click(function(){
   id =$(this).parents("li").attr('id');
  
  
  $('#loginModal').modal('show');
	return false;
	
  });
});

function deleteCourse() {
			
			$
					.ajax({
						type : "post",
						url : "deleteCourse",
						data : {
							"courseid" : id ,
							"userid" :   "${loginUser.id}"
						},
						async : true,
						success : function(data) {
							/* alert(password==data); */
							if (data == "true") {
								$('#loginModal').modal('hide');
								window.location = "${pageContext.request.contextPath }/mylearn";
							} else {
								$("#loginModal").focus();
									return;
							}
							/* alert(data); */
						}
					})
		}
</script>
</body>  
</html>
