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
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-success">
				以下是您创建的所有日志：
			</h3>
			<table class="table table-striped">
				<thead>
					<tr>
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

					</tr>
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
out.print("<td><a href=ConferenceDetail?ID="+str1+ ">" + str2 + "</a></td>");
else
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print(" <td><a href=detail_a?ID="+str1+ ">" + str2 + "</a></td>");
else
out.print("<td>"+str2+"</td>");

i++; str2=(String)list.get(i);
if(str2.equals("查看详情"))
out.print(" <td><a href=detail_e?ID="+str1+ ">" + str2 + "</a></td>");
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
</body>
</html>