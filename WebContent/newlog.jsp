<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> New Logs</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap-3.3.7-dist/jquery-3.1.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3>
				创建一个新的项目，请完成以下信息的填写：
			</h3>
			<br>
			<form action="newblog">
				<div class="form-group">
					 <label for="exampleInputPassword1">Title</label><input type="text" name="Name" placeholder="这里输入项目名称" class="form-control" required/>
				</div>
	           本校出访OR外校来访:     <br><input name ="InOrOut"  type="radio" value="true" checked>
               本校出访&nbsp;
               <input name ="InOrOut" type="radio"  value="false">
               外校来访
                
               <br>
               <br>
               参与活动：
               <input name = Conference type="checkbox"  value="true" >
               交流会议
               <input name = AcademicTeamwork type="checkbox"  value="true" >
               合作研究
               <input name = Exchange type="checkbox" value="true" >
               交换生项目 
               <br>
               <br>
               <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<ul class="breadcrumb">
				<li>
					 <a href="index.jsp">Home</a>
				</li>
				<li>
					 <a href=AllBlogs>AllBlogs</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>