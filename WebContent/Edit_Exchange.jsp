<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Conference Edit</title>


<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc2.css" rel="stylesheet">
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
</div>



<form action="ExchangeEditDone" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
		
		<div class="tabbable" id="tabs-663860">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-271268" data-toggle="tab">事前公告</a>
					</li>
					<li>
						 <a href="#panel-248050" data-toggle="tab">事后记录</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-271268">
						<p>
						 <br>
				<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");

	
int i=0;
String str1=(String)list.get(i);
out.print("<label>ID</label><input name=\"ID\" type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
i++;
String str=null;
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>标题</label><input name=\"e_Title1\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>开始时间</label><input name=\"e_StartTime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>地点</label><input name=\"e_Position\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>资助来源</label><input name=\"e_Funded\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
//<textarea class="form-control" rows="3"></textarea>
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"e_Content1\" type=\"text\" class=\"form-control\"      rows=\"20\" required/>"+str+"</textarea>");
i++;
i++;}

%>

				                    <div class="form-group">
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file1" id="exampleInputFile" />
					<p class="help-block">
						这里添加压缩包
					</p>
				    </div>
				
				
				
			
  
					</div>
					<div class="tab-pane" id="panel-248050">
						<p>
 
					 <br>
					 <%
					 i++;
out.print("<label>ID</label><input type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
str=(String)list.get(i);
if(str!=null)
out.print("<label>标题</label><input name=\"e_Title2\" type=\"text\" class=\"form-control\"  value = \""+str+"\"  />");
else out.print("<label>标题</label><input name=\"e_Title2\" type=\"text\" class=\"form-control\"  value = \"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>结束时间</label><input name=\"e_Endtime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>实际花费</label><input name=\"e_Expenditure\" type=\"number\" class=\"form-control\"  value = \""+str+"\"  />");
%>
(单位：RMB)<br>
<% 
i++;
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"e_Content2\" type=\"text\" class=\"form-control\"    rows=\"20\"/>"+str+"</textarea>");
i++;
str=(String)list.get(i);

					 %>
					                     <div class="form-group">
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file2" id="exampleInputFile" />
					<p class="help-block">
						这里添加压缩包
					</p>
					 <label for="exampleInputFile">添加图片</label><input type="file" name="Pic" id="exampleInputFile"  multiple="true"/>(支持格式：png,jpg,gif,bmp)
				    </div>
	 
					</div>
				</div>
			</div>
 
</div> <button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>