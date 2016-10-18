<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> See All The Logs</title>
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
<% ArrayList<String>list_c=(ArrayList<String>)  session.getAttribute("list_c");
ArrayList<String>list_a=(ArrayList<String>)  session.getAttribute("list_a");
ArrayList<String>list_e=(ArrayList<String>)  session.getAttribute("list_e");
%>
<!--  For Conference-->
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
	
                <% if((String)list_c.get(0)=="true")
                out.print("<h3 class=\"text-success\">"+"Conference Logs:"+"</h3>");%>
	
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_c.get(0)=="true")
                out.print("<th>ID</th><th>公告标题</th><th>开始时间</th><th>地点</th><th>总结标题</th><th>结束时间</th>");%>
	

					</tr>
				</thead>
				<tbody>
<% 

int i=1;
if((String)list_c.get(0)=="true")
	if(list_c.size()>0){
while(i<list_c.size())
{
String str1=(String)list_c.get(i);
out.print("<tr><td>"+str1+"</td>");
i++;
String str2=(String)list_c.get(i);
out.print("<td><a href=ConferenceDetail?ID="+str1+ ">" + str2 + "</a></td>");
i++;
if(i<list_c.size())
str2=(String)list_c.get(i);
else break;
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_c.get(i);
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_c.get(i);

out.print("<td><a href=ConferenceDetail?ID="+str1+ ">" + str2 + "</a></td>");

i++; str2=(String)list_c.get(i);

out.print("<td>"+str2+"</td>");
i++;
	}
%></td>
<% }%>
				</tbody>
			</table>
		</div>
	</div>
</div>





<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
                <% if((String)list_a.get(0)=="true")
                out.print("<h3 class=\"text-success\">"+"AcademicTeamwork Logs:"+"</h3>");%>
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_a.get(0)=="true")
                out.print("<th>ID</th><th>公告标题</th><th>开始时间</th><th>地点</th><th>总结标题</th><th>结束时间</th>");%>
	

					</tr>
				</thead>
				<tbody>
<% 

i=1;
if((String)list_a.get(0)=="true")
	if(list_a.size()>0){
while(i<list_a.size())
{
String str1=(String)list_a.get(i);
out.print("<tr><td>"+str1+"</td>");
i++;
String str2=(String)list_a.get(i);
out.print("<td><a href=AcademicTeamworkDetail?ID="+str1+ ">" + str2 + "</a></td>");
i++;
if(i<list_a.size())
str2=(String)list_a.get(i);
else break;
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_a.get(i);
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_a.get(i);

out.print("<td><a href=AcademicTeamworkDetail?ID="+str1+ ">" + str2 + "</a></td>");

i++; str2=(String)list_a.get(i);

out.print("<td>"+str2+"</td>");
i++;
	}
%></td>
<% }%>
				</tbody>
			</table>
		</div>
	</div>
</div>




<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			                <% if((String)list_e.get(0)=="true")
                out.print("<h3 class=\"text-success\">"+"Exchange Logs:"+"</h3>");%>
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_e.get(0)=="true")
                out.print("<th>ID</th><th>公告标题</th><th>开始时间</th><th>地点</th><th>总结标题</th><th>结束时间</th>");%>
	
					</tr>
				</thead>
				<tbody>
<% 

i=1;
if((String)list_e.get(0)=="true")
	if(list_e.size()>0){
while(i<list_e.size())
{
String str1=(String)list_e.get(i);
out.print("<tr><td>"+str1+"</td>");
i++;
String str2=(String)list_e.get(i);
out.print("<td><a href=ExchangeDetail?ID="+str1+ ">" + str2 + "</a></td>");
i++;
if(i<list_e.size())
str2=(String)list_e.get(i);
else break;
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_e.get(i);
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_e.get(i);

out.print("<td><a href=ExchangeDetail?ID="+str1+ ">" + str2 + "</a></td>");

i++; str2=(String)list_e.get(i);

out.print("<td>"+str2+"</td>");
i++;
	}
%></td>
<% }%>
				</tbody>
			</table>
		</div>
	</div>
</div>



<br>
<br>
<br>
<br>
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