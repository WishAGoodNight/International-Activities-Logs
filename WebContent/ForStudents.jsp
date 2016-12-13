<%@ taglib uri="/struts-tags" prefix="s"%>
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
<title> 国际合作日志</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap-3.3.7-dist/jquery-3.1.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>



  <!-- JS -->
  <script type="text/javascript" src="javascripts/vendor/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="javascripts/vendor/jquery.hideseek.min.js"></script>
    <script type="text/javascript" src="javascripts/initializers.js"></script>
  <!-- JS ends -->



</head>
<s:action name="ForStudents" executeResult="true" />

<%
String [] s1 = (String []) session.getAttribute("s1");
String [] s2 = (String []) session.getAttribute("s2");
int [] fg = (int []) session.getAttribute("fg");
int Count = (int ) session.getAttribute("Count");
%>

<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;top:0;left:0;">    
<img src="image/b2.jpg" height="100%" width="100%" style="position:fixed;top:0;left:0;"/>    
</div>   

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
	     <br>
	     <br>
	     <br>

			<h3 class="text-success animated fadeInDown">
				以下是本校发布的日志：
			</h3>
			 <br>
	     <br>
            <img style="width:20px;height:20px;" src="image/search.png" /><input id="search-highlight" name="search-highlight" placeholder="Typing Here" type="text" data-list=".highlight_list" autocomplete="off">	   
			
			<table class="table table-striped alert alert-info animated fadeInDown" >
				<thead>
					<tr>
						<th>
							活动类别
						</th>
					    <th>
							事前公告
						</th>
						 <th>
							事后总结
						</th>
				</tr>
				</thead>
				<tbody class="vertical highlight_list">
				
<% 

for (int i = 1; i <= Count; i++) {
	if (fg[i] == 1) {
		out.print("<tr><td>" + "会议情况" + "</td>");
	}	
	if (fg[i] == 2) {
		out.print("<tr><td>" + "研究合作" + "</td>");
	}
	if (fg[i] == 3) {
		out.print("<tr><td>" + "上课授课" + "</td>");
	}
	if (fg[i] == 4) {
		out.print("<tr><td>" + "其他事程" + "</td>");
	}
	out.print("<td>" + s1[i] + "</td>");
	out.print("<td>" + s2[i] + "</td>");
}

/*
for (int i = 1; i <= 12; i++) {
	int tmp = goalOut[i];
	if (i == 1) out.print("<tr><td>" + "出访次数" + "</td>");
	out.print("<td>" + goalOut[i] + "</td>");
}

for (int i = 1; i <= 12; i++) {
	int tmp = goalIn[i];
	if (i == 1) out.print("<tr><td>" + "来访次数" + "</td>");
	out.print("<td>" + goalIn[i] + "</td>");
}*/
%></td>
           
    </div>
				</tbody>
			</table>
			
			
		</div>
	</div>
</div>


<div  onclick="goToWhere(0)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 150px;"><img  style="width:70px;height:70px;" src="image/top.png" /></div>  
<div  onclick="goToWhere(1)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 30px;"><img  style="width:70px;height:70px;" src="image/bottum.png" /></div>  
</body>
</html>