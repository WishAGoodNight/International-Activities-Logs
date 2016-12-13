<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<%@ page import="java.lang.String.*"%> 
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<link href="animate.css" rel="stylesheet" type="text/css"/>
<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc2.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
<link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
<link href='css/css.css' rel='stylesheet' type='text/css'>
<style type="text/css">  
    </style>  
    <script type="text/javascript">  
        var goToWhere = function (where)  
        {  
            var me = this;  
            me.site = [];  
            me.sleep = me.sleep ? me.sleep : 16;  
            me.fx = me.fx ? me.fx : 6;  
            clearInterval (me.interval);  
            var dh = document.documentElement.scrollHeight || document.body.scrollHeight;  
            var height = !!where ? dh : 0;  
            me.interval = setInterval (function ()  
            {  
                var top = document.documentElement.scrollTop || document.body.scrollTop;  
                var speed = (height - top) / me.fx;  
                if (speed === me.site[0])  
                {  
                    window.scrollTo (0, height);  
                    clearInterval (me.interval);  
                }  
                window.scrollBy (0, speed);  
                me.site.unshift (speed);  
            }, me.sleep);  
        };  
    </script>  
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 可选的Bootstrap主题文件（一般不使用） -->
<script src="bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"></script>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="bootstrap-3.3.7-dist/jquery-3.1.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<%int a1=15,a2=15,a3=15,a4=15,a5=15,a6=15,a7=15,a8=15,a9=15,a10=15,a11=15,a12=15;
int b1=15,b2=15,b3=15,b4=15,b5=15,b6=15,b7=15,b8=15,b9=15,b10=15,b11=15,b12=15;
int c1=15,c2=15,c3=15,c4=15,c5=15,c6=15,c7=15,c8=15,c9=15,c10=15,c11=15,c12=15;
int d1=15,d2=15,d3=15,d4=15,d5=15,d6=15,d7=15,d8=15,d9=15,d10=15,d11=15,d12=15;
%>
<% 

int [] Final1 = (int []) session.getAttribute("Final1");
int [] Final2 = (int []) session.getAttribute("Final2");
int [] Final3 = (int []) session.getAttribute("Final3");
int [] Final4 = (int []) session.getAttribute("Final4");
a1=Final1[1];a2=Final1[2];a3=Final1[3];a4=Final1[4];a5=Final1[5];a6=Final1[6];a7=Final1[7];a8=Final1[8];a9=Final1[9];a10=Final1[10];a11=Final1[11];a12=Final1[12];
b1=Final2[1];b2=Final2[2];b3=Final2[3];b4=Final2[4];b5=Final2[5];b6=Final2[6];b7=Final2[7];b8=Final2[8];b9=Final2[9];b10=Final2[10];b11=Final2[11];b12=Final2[12];
c1=Final3[1];c2=Final3[2];c3=Final3[3];c4=Final3[4];c5=Final3[5];c6=Final3[6];c7=Final3[7];c8=Final3[8];c9=Final3[9];c10=Final3[10];c11=Final3[11];c12=Final3[12];
d1=Final4[1];d2=Final4[2];d3=Final4[3];d4=Final4[4];d5=Final4[5];d6=Final4[6];d7=Final4[7];d8=Final4[8];d9=Final4[9];d10=Final4[10];d11=Final4[11];d12=Final4[12];

%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<script type="text/javascript">
var chart;
//var x1 = Final1[1];

$(document).ready(function() {
	//var Final1=document.getElementByld('ttest').value;
	var str="<%=a1%>";
	var fa1=parseInt(str);
	
	str="<%=a2%>";
	var fa2=parseInt(str);
	
	str="<%=a3%>";
	var fa3=parseInt(str);
	
	str="<%=a4%>";
	var fa4=parseInt(str);
	
	str="<%=a5%>";
	var fa5=parseInt(str);
	
	str="<%=a6%>";
	var fa6=parseInt(str);
	
	str="<%=a7%>";
	var fa7=parseInt(str);
	
	str="<%=a8%>";
	var fa8=parseInt(str);
	
	str="<%=a9%>";
	var fa9=parseInt(str);
	
	str="<%=a10%>";
	var fa10=parseInt(str);
	
	str="<%=a11%>";
	var fa11=parseInt(str);
	
	str="<%=a12%>";
	var fa12=parseInt(str);
	
	/////
	str="<%=b1%>";
	var fb1=parseInt(str);
	
	str="<%=b2%>";
	var fb2=parseInt(str);
	
	str="<%=b3%>";
	var fb3=parseInt(str);
	
	str="<%=b4%>";
	var fb4=parseInt(str);
	
	str="<%=b5%>";
	var fb5=parseInt(str);
	
	str="<%=b6%>";
	var fb6=parseInt(str);
	
	str="<%=b7%>";
	var fb7=parseInt(str);
	
	str="<%=b8%>";
	var fb8=parseInt(str);
	
	str="<%=b9%>";
	var fb9=parseInt(str);
	
	str="<%=b10%>";
	var fb10=parseInt(str);
	
	str="<%=b11%>";
	var fb11=parseInt(str);
	
	str="<%=b12%>";
	var fb12=parseInt(str);
	////
	
	str="<%=c1%>";
	var fc1=parseInt(str);
	
	str="<%=c2%>";
	var fc2=parseInt(str);
	
	str="<%=c3%>";
	var fc3=parseInt(str);
	
	str="<%=c4%>";
	var fc4=parseInt(str);
	
	str="<%=c5%>";
	var fc5=parseInt(str);
	
	str="<%=c6%>";
	var fc6=parseInt(str);
	
	str="<%=c7%>";
	var fc7=parseInt(str);
	
	str="<%=c8%>";
	var fc8=parseInt(str);
	
	str="<%=c9%>";
	var fc9=parseInt(str);
	
	str="<%=c10%>";
	var fc10=parseInt(str);
	
	str="<%=c11%>";
	var fc11=parseInt(str);
	
	str="<%=c12%>";
	var fc12=parseInt(str);
	////
	str="<%=d1%>";
	var fd1=parseInt(str);
	
	str="<%=d2%>";
	var fd2=parseInt(str);
	
	str="<%=d3%>";
	var fd3=parseInt(str);
	
	str="<%=d4%>";
	var fd4=parseInt(str);
	
	str="<%=d5%>";
	var fd5=parseInt(str);
	
	str="<%=d6%>";
	var fd6=parseInt(str);
	
	str="<%=d7%>";
	var fd7=parseInt(str);
	
	str="<%=d8%>";
	var fd8=parseInt(str);
	
	str="<%=d9%>";
	var fd9=parseInt(str);
	
	str="<%=d10%>";
	var fd10=parseInt(str);
	
	str="<%=d11%>";
	var fd11=parseInt(str);
	
	str="<%=d12%>";
	var fd12=parseInt(str);
	chart = new Highcharts.Chart({
		chart: {
			renderTo: 'container',
			defaultSeriesType: 'line',
			margin: [50, 150, 60, 80]
		},
		title: {
			text: '项目频率统计图',
			style: {
				margin: '10px 100px 0 0' // center it
			}
		},
		subtitle: {
			text: '',
			style: {
				margin: '0 100px 0 0' // center it
			}
		},
		xAxis: {
			categories: ['一月', '二月', '三月', '四月', '五月', '六月', 
				'七月', '八月', '九月', '十月', '十一月', '十二月'],
			title: {
				text: 'Month'
			}
		},
		yAxis: {
			title: {
				text: ''
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		tooltip: {
			formatter: function() {
	                return '<b>'+ this.series.name +'</b><br/>'+
					this.x +': '+ this.y +'';
			}
		},
		legend: {
			layout: 'vertical',
			style: {
				left: 'auto',
				bottom: 'auto',
				right: '10px',
				top: '100px'
			}
		},
		
		series: [{
			name: '会议情况',
			data: [0,0,0,0,0,0,0,0,0,0,0,0]
		}, {
			name: '研究合作',
			data: [0,0,0,0,0,0,0,0,0,0,0,0]
		}, {
			name: '上课授课',
			data: [0,0,0,0,0,0,0,0,0,0,0,0]
		}, {
			name: '其他事程',
			data: [0,0,0,0,0,0,0,0,0,0,0,0]
		}]
	});
	
	
});
</script>












</head>
<body>
<%String User=(String)  session.getAttribute("User");
%>
<%String Email=(String)  session.getAttribute("Email");
%>
<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1;top:0;left:0;">    
<img src="image/b2.jpg" height="100%" width="100%"  style= "position:fixed;top:0;left:0;" /></div>   
<div class="content">
	<ul class="orion-menu green">
		<li class="active"><a href="index.jsp"><h3>主页</h3></a></li>
		<li><a href="newlog.jsp"> <h3>新的日志</h3></a></li>
		<li><a href=SeeAllUser?User=<%=User%>> <h3>所有日志</h3></a></li>
		<li><a href="Search.jsp"> <h3>搜索日志</h3></a></li>
		<li><a href=Graph?User=<%=User%>> <h3>数据统计</h3></a></li>
		<li><a href="Settings1.jsp"> <h3>个人设置</h3></a></li>
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
				<%out.print("这是用户 "+User+" 的日志统计数据");
				%>
			</h3>
			</div>
			</div>
			</div>
<br>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
<form action="SeeAllUser">
			  <p>
					<%out.print(" <a class=\"btn btn-primary btn-large\"  href=Graph?User="+User+ ">" +" 2016年 "+ "</a>");%>
				</p>
</form>
<form action="SeeAllUser">
			  <p>
					<%out.print(" <a class=\"btn btn-primary btn-large\"  href=\"graph2.jsp\">" +" 2017年 "+ "</a>");%>
				</p>
				</form>
</div></div></div>


<div id="container" style="width: 800px; height: 400px; margin: 0 auto"></div>


<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h3 class="text-success animated fadeInDown">
				每月来访出访统计：
			</h3>
			 	<form action="SeeAllUser">
			  <p>
					<%//out.print(" <a class=\"btn btn-primary btn-large\"  href=SeeAllUser?User="+User+ ">" +" 点击查看个人日志 "+ "</a>");%>
				</p>
				</form>
			
			
			<table class="table table-striped alert alert-info animated fadeInDown" >
				<thead>
					<tr>
						<th>
							出访来访
						</th>
					    <th>
							一月
						</th>
						<th>
							二月
						</th>
						<th>
							三月
						</th>
						<th>
							四月
						</th>
						<th>
							五月
						</th>
						<th>
							六月
						</th>
						<th>
							七月
						</th>
						<th>
							八月
						</th>
						<th>
							九月
						</th>
						<th>
							十月
						</th>
						<th>
							十一月
						</th>
						<th>
							十二月
						</th>
				</tr>
				</thead>
				<tbody class="vertical highlight_list">
				
<% 

int [] goalOut = (int []) session.getAttribute("goalOut");
int [] goalIn = (int []) session.getAttribute("goalIn");

for (int i = 1; i <= 12; i++) {
	int tmp = goalOut[i];
	if (i == 1) out.print("<tr><td>" + "出访次数" + "</td>");
	out.print("<td>" +"0"+ "</td>");
}

for (int i = 1; i <= 12; i++) {
	int tmp = goalIn[i];
	if (i == 1) out.print("<tr><td>" + "来访次数" + "</td>");
	out.print("<td>" +"0" + "</td>");
}
	
%></td>
<% %>
           
    </div>
				</tbody>
			</table>
			
			
		</div>
	</div>
</div>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<h4>
				<%
				int all1 = 0, all2 = 0, all3 = 0, all4 = 0;
				for (int i = 1; i <= 12; i++) all1 += Final1[i];
				for (int i = 1; i <= 12; i++) all2 += Final2[i];
				for (int i = 1; i <= 12; i++) all3 += Final3[i];
				for (int i = 1; i <= 12; i++) all4 += Final4[i];
				out.print("<br>本年度共有0个会议项目<br>");
				out.print("本年度共有0个研究合作项目<br>");
				out.print("本年度共有0个上课授课项目<br>");
				out.print("本年度共有0个其他项目<br>");
				%>
			</h4>
			</div>
			</div>
			</div>

</body>
</html>