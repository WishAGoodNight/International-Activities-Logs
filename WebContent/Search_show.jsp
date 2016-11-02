<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="animate.css" rel="stylesheet" type="text/css"/>
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
<% ArrayList<String>list_c=(ArrayList<String>)  session.getAttribute("list_c");
ArrayList<String>list_a=(ArrayList<String>)  session.getAttribute("list_a");
ArrayList<String>list_e=(ArrayList<String>)  session.getAttribute("list_e");
ArrayList<String>list_o=(ArrayList<String>)  session.getAttribute("list_o");
%>
			<div class="page-header animated fadeInLeft">
				<h1>
					查询结果 <small>按照事项类别顺序排列</small>
				</h1>
			</div>
<!--  For Conference-->

                <% if((String)list_c.get(0)=="true")
                out.print("<div class=\"alert alert-dismissable alert-info  animated fadeInLeft\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\" disabled=\"true\">Conference Logs</button>");%>
	
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_c.get(0)=="true")
                out.print("<th width=\"5%\">ID</th><th width=\"30%\">公告标题</th><th width=\"10%\">开始时间</th><th width=\"15%\">地点</th><th width=\"30%\">总结标题</th><th width=\"10%\">结束时间</th>");%>
	

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




                <% if((String)list_a.get(0)=="true")
                out.print("<div class=\"alert alert-dismissable alert-success animated fadeInLeft\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\" disabled=\"true\">AcademicTeamwork Logs</button>");%>
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_a.get(0)=="true")
                out.print("<th width=\"5%\">ID</th><th width=\"30%\">公告标题</th><th  width=\"10%\">开始时间</th><th width=\"15%\">地点</th><th width=\"30%\">总结标题</th><th width=\"10%\">结束时间</th>");%>
	

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





			                <% if((String)list_e.get(0)=="true")
                out.print("<div class=\"alert alert-dismissable alert-warning animated fadeInLeft\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\" disabled=\"true\">Exchange Logs</button>");%>
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_e.get(0)=="true")
                out.print("<th width=\"5%\">ID</th><th width=\"30%\">公告标题</th><th  width=\"10%\">开始时间</th><th width=\"15%\">地点</th><th width=\"30%\">总结标题</th><th width=\"10%\">结束时间</th>");%>
	
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




	
                <% if((String)list_o.get(0)=="true")
                out.print("<div class=\"alert alert-dismissable alert-danger animated fadeInLeft\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\" disabled=\"true\">Others Logs</button>");%>
	
			<table class="table table-striped">
				<thead>
					<tr>
						<% if((String)list_o.get(0)=="true")
                out.print("<th width=\"5%\">ID</th><th width=\"30%\">公告标题</th><th  width=\"10%\">开始时间</th><th width=\"15%\">地点</th><th width=\"30%\">总结标题</th><th width=\"10%\">结束时间</th>");%>
	

					</tr>
				</thead>
				<tbody>
<% 

    i=1;
if((String)list_o.get(0)=="true")
	if(list_o.size()>0){
while(i<list_o.size())
{
String str1=(String)list_o.get(i);
out.print("<tr><td>"+str1+"</td>");
i++;
String str2=(String)list_o.get(i);
out.print("<td><a href=OthersDetail?ID="+str1+ ">" + str2 + "</a></td>");
i++;
if(i<list_o.size())
str2=(String)list_o.get(i);
else break;
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_o.get(i);
out.print("<td>"+str2+"</td>");

i++; str2=(String)list_o.get(i);

out.print("<td><a href=OthersDetail?ID="+str1+ ">" + str2 + "</a></td>");

i++; str2=(String)list_o.get(i);

out.print("<td>"+str2+"</td>");
i++;
	}
%></td>
<% }%>
				</tbody>
			</table>
		</div>






<br>
<br>
<br>
<br>
<br>
			<ul class="breadcrumb">
				<li>
					 <a href="index.jsp">Home</a>
				</li>
				<li>
					 <a href=AllBlogs>AllBlogs</a>
				</li>
			</ul>
 
 
</body>
</html>