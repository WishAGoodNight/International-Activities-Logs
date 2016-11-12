<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc2.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href='css/css.css' rel='stylesheet' type='text/css'>



<link href="animate.css" rel="stylesheet" type="text/css"/>
<title> See All The Logs</title>
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

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-success animated fadeInDown">
				项目所有会议日程：
<% 
ArrayList<String>show_list=(ArrayList<String>)  session.getAttribute("list");
int i=0;
String str0="";
String str1="";
String str2="";
String str3="";
	if(show_list.size()>0){
while(i<show_list.size())
{
	if(i<show_list.size())
str0=(String)show_list.get(0);
if(i==0)i=1;
if(i<show_list.size())
str1=(String)show_list.get(i);
i++;
if(i<show_list.size())
str2=(String)show_list.get(i);
i++;
if(i<show_list.size())
str3=(String)show_list.get(i);
out.print("<h4 class=\"alert  alert-success animated fadeInDown \"><a href=ConferenceDetail?Number="+str1+ ">" +"<img style=\"width:20px;height:20px;\" src=\"image/tag.png\" />"+ str2+"-------"+str3+ "</a></h4>");
i++;
}
}

%>

<br>
<br>

 <% out.print("<h4 class=\"alert  alert-info\" ><a href=CreateConference?ID="+str0+ ">" + "++++点击这里创建新的活动++++" +"</a>");%>
		</div>
	</div>
</div>

<div  onclick="goToWhere(0)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 150px;"><img  style="width:70px;height:70px;" src="image/top.png" /></div>  
<div  onclick="goToWhere(1)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 30px;"><img  style="width:70px;height:70px;" src="image/bottum.png" /></div>  
</body>
</html>