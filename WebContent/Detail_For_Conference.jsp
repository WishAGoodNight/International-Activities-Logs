<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Conference details</title>
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
<<<<<<< HEAD
=======


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="tabbable" id="tabs-329239">
				<ul class="nav nav-tabs">
					<li>
						 <a href="#panel-705027" data-toggle="tab">事前公告</a>
					</li>
					<li class="active">
						 <a href="#panel-574844" data-toggle="tab">事后记录</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-705027">

>>>>>>> origin/searchdone
<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");
int i=0;
	
String ID=(String)list.get(i);i++;
String Title1=(String)list.get(i);i++;
String StartTime=(String)list.get(i);i++;
String Position=(String)list.get(i);i++;
String Sponsor=(String)list.get(i);i++;
String Content1=(String)list.get(i);i++;
String End=(String)list.get(i);i++;
String Title2=(String)list.get(i);i++;
String Endtime=(String)list.get(i);i++;
String Content2=(String)list.get(i);i++;
String Image=(String)list.get(i);
%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
<<<<<<< HEAD
			<ul class="nav nav-tabs">
				<li class="active">
					 <a href="#">事前公告</a>
				</li>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
=======
>>>>>>> origin/searchdone
			<div class="page-header">
			
				<h1>
					<% out.print(Title1);%><small><%out.print("ID="+ID) ;%></small>
				</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>
							开始时间
						</th>
						<th>
							地点
						</th>
						<th>
							赞助
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<%out.print(StartTime); %>
						</td>
						<td>
							<%out.print(Position); %> 
						</td>
						<td>
							<%out.print(Sponsor); %>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="jumbotron">
				<h1>
					Preview Of The Conference：
				</h1>
				<p>
					<% 
					//Content1.replaceAll("\\r\\n","<br>" );
					//Content1.replaceAll("\\n","<br>" );
					//Content1.replaceAll("\\r","<br>" );
					//Content1.replace(" ", "&nbsp;");
					out.print(Content1);
					
					%>
				</p>
				<p>
					<%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ConferenceEdit?ID="+ID+ ">" +" Edit "+ "</a>");%>
				</p>
			</div>
		</div>
	</div>
</div>
<<<<<<< HEAD
				</li>
				<li class="active">
					 <a href="#">事后记录</a>
					 <div class="container">
=======

					</div>
					<div class="tab-pane active" id="panel-574844">
<div class="container">
>>>>>>> origin/searchdone
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="page-header">
			
				<h1>
					<% out.print(Title2);%><small><%out.print("ID="+ID) ;%></small>
				</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>
							结束时间
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<%out.print(Endtime); %>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="jumbotron">
				<h1>
					Overview Of The Conference：
				</h1>
				<p>
					<% out.print(Content2);%>
					
				</p>
				<p>
					 <%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ConferenceEdit?ID="+ID+ ">" +" Edit "+ "</a>");%>
				</p>
			</div>
		</div>
	</div>
</div>
<<<<<<< HEAD
					 
					 
					 
				</li>
			</ul>
		</div>
	</div>
</div>
=======
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





					 
					 
					 

>>>>>>> origin/searchdone
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