<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Others Edit</title>

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
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;top:0;left:0;">    
<img src="image/b2.jpg" height="100%" width="100%" style="position:fixed;top:0;left:0;"/>    
</div>   
<%String User=(String)  session.getAttribute("User");
%>
<div class="content">
	<ul class="orion-menu green">
		<li class="active"><a href="index.jsp">主页</a></li>
		<li><a href="newlog.jsp">新的日志</a></li>
		<li><a href=SeeAllUser?User=<%=User%>>所有日志</a></li>
		<li><a href="Search.jsp">搜索日志</a></li>
		<li><a href=Graph?User=<%=User%>>数据统计</a></li>
		<li><a href="Settings1.jsp">个人设置</a></li>
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



<form action="OthersEditDone" method="post" enctype="multipart/form-data">
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
					 <br>
				<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");

	
int i=0;
String str1=(String)list.get(i);
out.print("<label>Number</label><input name=\"Number\" type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
i++;
String str=null;
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>标题</label><input name=\"o_Title1\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>开始时间</label><input name=\"o_StartTime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>地点</label><input name=\"o_Position\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>事件类型</label><input name=\"o_Kind\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
//<textarea class="form-control" rows="3"></textarea>
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"o_Content1\" type=\"text\" class=\"form-control\"  id=\"c_Content1\"    rows=\"20\" required/>"+str +"</textarea>");
i++;}

%>
                    <div class="form-group">
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file1" id="exampleInputFile" />
					<p class="help-block">
						这里添加压缩包
					</p>
				    </div>
				
				
				
				
			
 

					</div>
					<div class="tab-pane" id="panel-828736">
 
					 <br>
					 <%
					 i++;
				     i++;
out.print("<label>Number</label><input type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
str=(String)list.get(i);
if(str!=null)
out.print("<label>标题</label><input name=\"o_Title2\" type=\"text\" class=\"form-control\"  value = \""+str+"\"  />");
else out.print("<label>标题</label><input name=\"o_Title2\" type=\"text\" class=\"form-control\"  value = \"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>结束时间</label><input name=\"o_Endtime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"o_Content2\" type=\"text\" class=\"form-control\"   rows=\"20\"/>"+str+"</textarea>");
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

			
		
<button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>