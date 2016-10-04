<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> welcome to MySystem</title>
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
				欢迎来到国际合作日志管理系统
			</h3> 
			</br>
			</br>
			<button type="button" class="btn btn-block btn-lg btn-info">查询</button>
			</br>
			</br>
			</br>
			<div class="row clearfix">
				<div class="col-md-6 column">
					<div class="btn-group">
					</div> <a href="newlog.jsp"><button type="button" class="btn btn-default">创建一个新的日志</button></a>
				</div>
				<div class="col-md-6 column">
					 <a href=AllBlogs><button type="button" class="btn btn-default">查看所有日志</button></a>
				</div>
			</div>
		</div>
	</div>
</div>


</body>
</html>
