<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> See All The Logs</title>
<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href='css/css.css' rel='stylesheet' type='text/css'>
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
<%String User=(String)  session.getAttribute("User");
%>
<div class="content">
	<ul class="orion-menu green">
	
		<li class="active"><a href="index.jsp"><h3>主页</h3></a></li>
		<li><a href="newlog.jsp"><h3>新的日志</h3></a></li>
		<li><a href=SeeAllUser?User=<%=User%>><h3>所有日志</h3></a></li>
		<li><a href="Search.jsp"><h3>搜索日志</h3></a></li>
		<li><a href=Graph?User=<%=User%>><h3>数据统计</h3></a></li>
		<li><a href="Settings1.jsp"><h3>个人设置</h3></a></li>
	
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
</div>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h2 >
			<font  color="blue">
				多维度查询
				</font>
			</h2>
			<form action="Search_Action">
				<div class="form-group">
				<h3 >
					 <label><font  color="white">按标题查询</font></label><input type="text" name="Search_Name"   class="form-control"  />
					 </h3>
				</div>
				<div class="form-group">
				<h3 >
					 <label><font  color="white">按时间段查询</font></label><input type="date" name="Search_Time1"  class="form-control"   style="width:200px" />至<input type="date" class="form-control"  name="Search_Time2" style="width:200px" />
				</h3>
				</div>
				<!--  div class="form-group">
					 <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div-->
				<h3>
				 <font  color="white">按活动类别查询：</font><br></h3>
				 <h4>
				 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Conference   value="true"><font  color="white">会议情况</font>
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_AcademicTeamwork  value="true"><font  color="white">研究合作</font>
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Exchange  value="true"><font  color="white">上课授课</font>
                 </label>
                 <label class="checkbox-inline">
                 <input type="checkbox"  name = Search_Others  value="true"><font  color="white">其他事项</font>
                 </label>
                 </h4>
                 <br>
                 <br>
                 <br>
                 
                 <button type="submit" class="btn btn-default">查询</button>
			</form>
		</div>
	</div>
</div>


</body>
</html>