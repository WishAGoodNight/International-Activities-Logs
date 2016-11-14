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
<div class="content">
	<ul class="orion-menu green">
		<li class="active"><a href="index.jsp">Home</a></li>
		<li><a href="newlog.jsp">NewLogs</a></li>
		<li><a href= AllBlogs>AllLogs</a></li>
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
</div>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 >
			<font  color="white">
				维度查询
				</font>
			</h3>
			<form action="Search_Action">
				<div class="form-group">
					 <label><font  color="white">标题</font></label><input type="text" name="Search_Name"   class="form-control"  />
				</div>
				<div class="form-group">
					 <label><font  color="white">时间段</font></label><input type="date" name="Search_Time1"  class="form-control"   style="width:200px" />至<input type="date" class="form-control"  name="Search_Time2" style="width:200px" />
				</div>
				<!--  div class="form-group">
					 <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div-->
				 <font  color="white">选择活动类别：</font><br>
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
                 <br>
                 <br>
                 <br>
                 
                 <button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>
</div>


<table>
<tr>
<td>1</td>
</tr>
<tr>
<td><%=request.getParameter("num1") %></td>
<td style="color:red">
<%=isNum1Right %>
</td>
</tr>
<tr>
<td> </td>
</tr>
<tr>
<td>2</td>
</tr>
<tr>
<td><%=request.getParameter("num2") %></td>
<td style="color:red">
<%=isNum2Right %>
</td>
</tr>
<tr>
<td> </td>
</tr>
<tr>
<td>3</td>
</tr>
<tr>
<td>：<%=request.getParameter("num3") %></td>
<td style="color:red">
<%=isNum3Right %>
</td>
</tr>
<tr>
<td> </td>
</tr>
<tr>
<td style="color:red"><%=point %><%=point %></td>
</tr>
</table>

</body>
</html>
