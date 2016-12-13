<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
                   <style type="text/css"> 
					#footer {
						position: absolute;
						bottom: 0;
						width: 100%;
						height: 60px;/*脚部的高度*/
						clear:both;
					}</style>

<link href="animate.css" rel="stylesheet" type="text/css"/>



<title> New Logs</title>
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
<img src="image/set.jpg" height="100%" width="100%" style="position:fixed;top:0;left:0;"/>    
</div>   

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-center text-success animated zoomInUp">
				账户名或者密码错误！
			</h3>
		</div>
	</div>
</div>

<script language="javascript" type="text/javascript">   
  

// 以下方式定时跳转  
  
setTimeout("javascript:location.href='LogIn.html'", 1000);   
  
</script>  


<br>
<br>
<br>
<br>
</body>
</html>