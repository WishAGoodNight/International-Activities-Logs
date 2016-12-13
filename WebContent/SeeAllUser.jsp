
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
<script>
function Delete() {
	var msg = "您真的确定要删除吗？";
	if (confirm(msg)==true){
	return true;
	}else{
	return false;
	}
	}
</script>


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


  <!-- JS -->
  <script type="text/javascript" src="javascripts/vendor/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="javascripts/vendor/jquery.hideseek.min.js"></script>
    <script type="text/javascript" src="javascripts/initializers.js"></script>
  <!-- JS ends -->

</head>
<body>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;top:0;left:0;">    
<img src="image/b2.jpg" height="100%" width="100%" style="position:fixed;top:0;left:0;"/>    
</div>   
<%String User=(String)  session.getAttribute("User");
%>
<div class="content">
	<ul class="orion-menu green">
		<li class="active"><a href="index.jsp"><h3>主页</h3></a></li>
		<li><a href="newlog.jsp"><h3>新的日志</h3></a></li>
		<li><a href=SeeAllUser?User=<%=User%>><h3>所有日志</h3></a></li>
		<li><a href="Search.jsp"><h3>搜索日志</h3></a></li>
		<li><a href=Graph?User=<%=User%>><h3>数据统计</h3></a></li>
		<li><a href="Settings1.jsp"><h3>个人设置</h3></a></li>
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
			<h2 class="text-success animated fadeInDown">
				以下是本学院的交流合作：
			</h2>
			  <a class="btn btn-primary btn-large" href=AllBlogs>点击查看本校所有交流合作</a>
			  <br>
			   <br>
            <img style="width:20px;height:20px;" src="image/search.png" /><input id="search-highlight" name="search-highlight" placeholder="Typing Here" type="text" data-list=".highlight_list" autocomplete="off">	   
			<table class="table table-striped alert alert-info animated fadeInDown" >
				<thead>
					<tr>
						<th>
						<h3>
							ID
							</h3>
						</th>
						<th>
						<h3>
							项目时间
							</h3>
						</th>
						<th>
						<h3>
							来访出访
							</h3>
						</th>
						<th>
						<h3>
							TITLE
							</h3>
						</th>
						<th>
						<h3>
							会议情况
							</h3>
						</th>
						<th>
						<h3>
							研究合作
							</h3>
						</th>
						<th>
						<h3>
							上课授课
							</h3>
						</th>
						<th>
						<h3>
							其他事程
							</h3>
						</th>
						<th>
						<h3>
						    删除事项
						    </h3>
						</th>
					</tr>
				</thead>
				<tbody class="vertical highlight_list">
<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");
int i=0;
	if(list.size()>0){
while(i<list.size())
{
String str1=(String)list.get(i);
out.print("<tr><td><h4>"+str1+"</h4></td>");
i++;
String str2=(String)list.get(i);
out.print("<td><h4>"+str2+"</h4></td>");
i++;
if(i<list.size())
str2=(String)list.get(i);
else break;
out.print("<td><h4>"+str2+"</h4></td>");
i++;
if(i<list.size())
str2=(String)list.get(i);
else break;
out.print("<td><h4>"+str2+"</h4></td>");
i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
	out.print("<td><h4><a href=Show_Conference.jsp?ID="+str1+ ">" + str2 + "</a></h4></td>");
	else
	out.print("<td><h4>"+str2+"</h4></td>");

	i++; str2=(String)list.get(i);
	if(str2.equals("查看详情"))
	out.print("<td><h4><a href=Show_AcademicTeamwork.jsp?ID="+str1+ ">" + str2 + "</a></h4></td>");
	else
	out.print("<td><h4>"+str2+"</h4></td>");

	i++; str2=(String)list.get(i);
	if(str2.equals("查看详情"))
	out.print(" <td><h4><a href=Show_Exchange.jsp?ID="+str1+ ">" + str2 + "</a></h4></td>");
	else
	out.print("<td><h4>"+str2+"</h4></td>");

	i++; str2=(String)list.get(i);
	if(str2.equals("查看详情"))
	out.print(" <td><h4><a href=Show_Others.jsp?ID="+str1+ ">" + str2 + "</a></h4></td>");
else
out.print("<td><h4>"+str2+"</h4></td>");

out.print("<td>"+"<h4><a onclick=\"javascript:return Delete();\"  href=DeleteLogs?ID="+str1+"><span class=\"label label-danger\">删除</span></a></h4>"+"</td>");
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