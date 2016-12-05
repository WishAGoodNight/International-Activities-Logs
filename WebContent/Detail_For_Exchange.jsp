<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="animate.css" rel="stylesheet" type="text/css"/>
<title> Exchange details</title>
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
<% 
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");
int i=0;
	
String Number=(String)list.get(i);i++;
String Title1=(String)list.get(i);i++;
String StartTime=(String)list.get(i);i++;
String Position=(String)list.get(i);i++;
String Funded=(String)list.get(i);i++;
String Content1=(String)list.get(i);i++;
String End=(String)list.get(i);i++;
String Item1=(String)list.get(i);i++;
String Title2=(String)list.get(i);i++;
String Endtime=(String)list.get(i);i++;
String Expenditure=(String)list.get(i);i++;
String Content2=(String)list.get(i);i++;
String Image=(String)list.get(i);i++;
String Item2=(String)list.get(i);
%>

 
			<div class="page-header">
			
				<h1>
					<% out.print(Title1);%><small><%out.print("Number="+Number) ;%></small>
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
							资助来源
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
							<%out.print(Funded); %> 
						</td>
					</tr>
				</tbody>
			</table>
			<div class="jumbotron">
				<h1>
					Preview Of The Exchange Project：
				</h1>
				<p>
					<% 
					out.print(Content1);
					%>
				</p>
				<p>
					<%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ExchangeEdit?Number="+Number+ ">" +" Edit "+ "</a>");%>
				</p>
				 <% if(Item1!=null)out.print("<a href=\""+Item1+"\">附件下载</a>");%>
			</div>
 
					</div>
					<div class="tab-pane active" id="panel-574844">
 
			<div class="page-header">
			
				<h1>
					<% out.print(Title2);%><small><%out.print("Number="+Number) ;%></small>
				</h1>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>
							结束时间
						</th>
						<th>
							资助总金额(RMB)
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<%out.print(Endtime); %>
						</td>
												<td>
							<%out.print(Expenditure); %> 
						</td>
					</tr>
				</tbody>
			</table>
			<div class="jumbotron">
				<h1>
					Overview Of The Exchange Project：
				</h1>
				<p>
					<% out.print(Content2);%>
										<%
					if(Image!=null)
					if(!Image.equals(""))
					{
						out.print("<br>");
						int start=0;
						int end=0;
						for(int counter=0;counter+3<Image.length();counter++)
						{
							if(Image.charAt(counter+1)=='/'&&Image.charAt(counter+2)=='/'&&Image.charAt(counter+3)=='/')
							{//out.print(Image.substring(start,counter+1));
								out.print("<img src=\""+Image.substring(start,counter+1)+"\" width=\"800\">");
							out.print("<br>");
							start=counter+4;}
							
						}
					}
					%>
				</p>
				<p>
					 <%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ExchangeEdit?Number="+Number+ ">" +" Edit "+ "</a>");%>
					 
				</p>
				 <% if(Item2!=null)out.print("<a href=\""+Item2+"\">附件下载</a>");%>
			</div>
		</div>
	</div>
</div>
				</h1>
				<p>
					<% out.print(Content2);%>
										<%
					if(Image!=null)
					if(!Image.equals(""))
					{
						out.print("<br>");
						int start=0;
						int end=0;
						for(int counter=0;counter+3<Image.length();counter++)
						{
							if(Image.charAt(counter+1)=='/'&&Image.charAt(counter+2)=='/'&&Image.charAt(counter+3)=='/')
							{//out.print(Image.substring(start,counter+1));
								out.print("<img src=\""+Image.substring(start,counter+1)+"\" width=\"800\">");
							out.print("<br>");
							start=counter+4;}
							
						}
					}
					%>
				</p>
				<p>
					 <%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ExchangeEdit?Number="+Number+ ">" +" Edit "+ "</a>");%>
					 
				</p>
				 <% if(Item2!=null)out.print("<a href=\""+Item2+"\">附件下载</a>");%>
			</div>
		</div>
	</div>
</div>
					 
				 
					 
 
			
			
			
  <div class="animated pulse">
	  <h3>
              相关阅读
	  </h3>
<% 
ArrayList<String>reference=(ArrayList<String>)  session.getAttribute("reference");
int j=0;int k=1;
if(reference.size()>0){
while(j<reference.size())
{
String str1=(String)reference.get(j);

j++;
String str2=(String)reference.get(j);
if(!str1.equals(Number)){
if(!str2.equals("null&")&&!str2.equals("&")&&!str2.equals("null&null")){
out.print("<h4 class=\"alert  alert-info\">"+k+":");
out.print("<a href=ExchangeDetail?ID="+str1+">"+str2+"</a></h4>");

k++;}
}
j++;

}}
if(k==1)
	out.print("<h4 class=\"alert  alert-info\">"+"暂无</h4>");
%>
		</div>
	</div>
</div>





<br>
<br>


<div  onclick="goToWhere(0)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 150px;"><img  style="width:70px;height:70px;" src="image/top.png" /></div>  
<div  onclick="goToWhere(1)"   style="position: fixed; cursor: pointer; right: 10px; bottom: 30px;"><img  style="width:70px;height:70px;" src="image/bottum.png" /></div>  
</body>
</html>>