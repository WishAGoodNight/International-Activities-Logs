<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> New Logs</title>
<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
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
<%String User=(String)  session.getAttribute("User");
%>
<%String Email=(String)  session.getAttribute("Email");
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
			<h3>
				<font  color="white">创建一个新的项目，请完成以下信息的填写：</font>
			</h3>
			<br>
			<form action="newblog">
				<div class="form-group">
					 <label for="exampleInputPassword1"><font  color="white"><h3>主题</h3></font></label><input type="text" name="Name" placeholder="这里输入项目名称" class="form-control" required/>
				</div>
				<div class="form-group">
					 <font  color="white"><h3>项目时间</h3></font><input type="date" name="Date"  class="form-control" required/>
				</div>
				 <h4>
	           <font  color="white"><h3>本校出访 OR 外校来访:</h3></font>     <br><input name ="InOrOut"  type="radio" value="true" checked>
	          
               <font  color="white">本校出访</font>&nbsp;
               <input name ="InOrOut" type="radio"  value="false">
               <font  color="white">外校来访</font>
                </h4>
               <br>
               <br>
                <h4>
               <font  color="white">参与活动：</font>
               <input name = Conference type="checkbox"  value="true" >
               <font  color="white">交流会议</font>
               <input name = AcademicTeamwork type="checkbox"  value="true" >
               <font  color="white">合作研究</font>
               <input name = Exchange type="checkbox" value="true" >
               <font  color="white">交换生项目 </font>
               <input name = Others type="checkbox" value="true" >
              <font  color="white"> 其他事程</font>
               </h4>
               <br>
               <br>
               <button type="submit" class="btn btn-default">提交</button>
               <% out.print("<input type=\"hidden\" name=\"User\" value=\""+User+"\"/>");%>
			</form>
		</div>
	</div>
</div>

</body>
</html>