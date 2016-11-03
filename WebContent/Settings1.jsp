<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="animate.css" rel="stylesheet" type="text/css"/>
<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc3.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href='css/css.css' rel='stylesheet' type='text/css'>
<script>
	function signOut(){
		var r = window.confirm("确认登出？");
		if (r == true)
			window.location.href="index.jsp";
		else
			window.location.href="#";
	}
</script>

 

<title>User Settings</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap-3.3.7-dist/jquery-3.1.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>

<div class="content">
	<ul class="orion-menu green">
		<li class="active"><a href="index.jsp">Home</a></li>
		<li><a href="newlog.jsp">NewLogs</a></li>
		<li><a href=AllBlogs>AllLogs</a></li>
		<li><a href="Search.jsp">Search</a></li>
		<li><a href="Settings1.jsp">Settings</a></li>

		<li class="search">
		<form action="Search_Action">
			<input type="text" name="Search_Name"  class="search" />
			<input type="hidden" name="Search_Time1"/>
			<input type="hidden"  name = "Search_Conference" value="true" />
			<input type="hidden" name="Search_AcademicTeamwork" value="true"/>
			<input type="hidden" name="Search_Exchange" value="true"/>
			<input type="hidden" name="Search_Others" value="true"/>
			</form>
		</li>
	</ul>  
	  
	  
	 <div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-3 column">
				
<link href='css/css.css' rel='stylesheet' type='text/css'>
<!--  <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css"> -->
<dropdown>
<br>
<br>
  <input id="toggle1" type="checkbox" checked >
  <label for="toggle1" class="animate">MENU<i class="fa fa-bars float-right"></i></label>
  <ul class="animate">
    <a href="Settings1.jsp"><li class="animate">个人信息<i class="fa fa-user float-right"></i></li></a>
    <a href="Settings2.jsp"><li class="animate">编辑信息<i class="fa fa-cog float-right"></i></li></a>
    <a onclick="signOut()"><li class="animate">登出账户<i class="fa fa-home float-right"></i></li></a>
  </ul>
</dropdown>
				</div>
				<div class="col-md-7 column">
				<br>
                <br>
                <br>
                <div class="jumbotron">

				<p>
				<img  style="width:25px;height:25px;" src="image/user.png" />Your ID:  
				</p>
				 <p>
				<br>
				<img  style="width:25px;height:25px;" src="image/email.png" />Your Registered Email:  
				</p>
			</div>
				</div>
			</div>
		</div>
	</div>
</div>

	
	
	
	
</div>
</body>
</html>