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
				以下是本校所有日志：
			</h3>
			  <a class="btn btn-primary btn-large" href="SeeAllUser.jsp">点击查看个人日志</a>
			  <br>
			   <br>
			<table class="table table-striped alert alert-info animated fadeInDown" >
				<thead>
					<tr>
<h3>
						<th>
							ID
						</th>
						<th>
							来访出访
						</th>
						<th>
							TITLE
						</th>
						<th>
							会议情况
						</th>
						<th>
							研究合作
						</th>
						<th>
							上课授课
						</th>
						<th>
							其他事程
						</th>
					</tr></h3>
				</thead>
				<tbody>
<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");
int i=0;
	if(list.size()>0){
while(i<list.size())
{
String str1=(String)list.get(i);
out.print("<tr><td>"+str1+"</td>");
i++;
String str2=(String)list.get(i);
out.print("<td>"+str2+"</td>");
i++;
if(i<list.size())
str2=(String)list.get(i);
else break;
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print("<td><a href=ConferenceShow?ID="+str1+ ">" + str2 + "</a></td>");
else
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print(" <td><h1><a href=AcademicTeamworkShow?ID="</h1>+str1+ ">" + str2 + "</a>
</td>");
else
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print(" <td><a href=ExchangeShow?ID="+str1+ ">" + str2 + "</a></td>");
else
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print(" <td><a href=OthersShow?ID="+str1+ ">" + str2 + "</a></td>");
else
out.print("<td>"+str2+"</td>");

i++;i++;

	}
%></td>
<% }%>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div  onclick="goToWhere(0)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 150px;"><img  style="width:70px;height:70px;" src="image/top.png" /></div>  
<div  onclick="goToWhere(1)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 30px;"><img  style="width:70px;height:70px;" src="image/bottum.png" /></div>  
</body>
</html>