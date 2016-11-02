<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> See All The Logs</title>
                   <style type="text/css"> 
					#footer {
						position: absolute;
						bottom: 0;
						width: 100%;
						height: 60px;/*脚部的高度*/
						clear:both;
					}</style>

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
				维度查询
			</h3>
			<form action="Search_Action">
				<div class="form-group">
					 <label>标题</label><input type="text" name="Search_Name"   class="form-control"  />
				</div>
				<div class="form-group">
					 <label>时间段</label><input type="date" name="Search_Time1"  class="form-control"   style="width:200px" />至<input type="date" class="form-control"  name="Search_Time2" style="width:200px" />
				</div>
				<!--  div class="form-group">
					 <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div-->
				 选择活动类别：<br>
				 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Conference   value="true">会议情况
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_AcademicTeamwork  value="true">研究合作
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Exchange  value="true">上课授课
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Others  value="true">其他事项
                 </label>
                 <br>
                 <br>
                 <br>
                 
                 <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>

<div id="footer"> 

			<ul class="breadcrumb">
				<li>
					 <a href="index.jsp">Home</a>
				</li>
				<li>
					 <a href=AllBlogs>AllBlogs</a>
				</li>
			</ul>
		</div>

</body>
</html>