<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Conference Edit</title>
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
<form action="ConferenceEditDone" method="post" enctype="multipart/form-data">
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
		
		
		<div class="tabbable" id="tabs-145348">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-895933" data-toggle="tab">事前公告</a>
					</li>
					<li>
						 <a href="#panel-828736" data-toggle="tab">事后报道</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-895933">
						 <div class="container">
	                 <div class="row clearfix">
		             <div class="col-md-12 column">
				<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");

	
int i=0;
String str1=(String)list.get(i);
out.print("<label>ID</label><input name=\"ID\" type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
i++;
String str=null;
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>标题</label><input name=\"c_Title1\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>开始时间</label><input name=\"c_StartTime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>地点</label><input name=\"c_Position\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>赞助人</label><input name=\"c_Sponsor\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
//<textarea class="form-control" rows="3"></textarea>
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"c_Content1\" type=\"text\" class=\"form-control\"  id=\"c_Content1\"    rows=\"20\" required/>"+str +"</textarea>");
i++;}

%>
                    <div class="form-group">
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file1" id="exampleInputFile" />
					<p class="help-block">
						这里添加压缩包
					</p>
				    </div>
				
				
				
				
			
		</div>
	</div>
</div>

					</div>
					<div class="tab-pane" id="panel-828736">
                     <div class="container">
	                 <div class="row clearfix">
		             <div class="col-md-12 column">
					 </br>
					 <%
					 i++;
				     i++;
str=(String)list.get(i);
if(str!=null)
out.print("<label>标题</label><input name=\"c_Title2\" type=\"text\" class=\"form-control\"  value = \""+str+"\"  />");
else out.print("<label>标题</label><input name=\"c_Title2\" type=\"text\" class=\"form-control\"  value = \"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>结束时间</label><input name=\"c_Endtime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"c_Content2\" type=\"text\" class=\"form-control\"   rows=\"20\"/>"+str+"</textarea>");
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
					</div>
				</div>
			</div>
			
		
<button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>