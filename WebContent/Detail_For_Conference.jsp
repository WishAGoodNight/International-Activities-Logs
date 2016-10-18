<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<%@ page import="java.lang.String.*"%> 
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Conference details</title>
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
	
String ID=(String)list.get(i);i++;
String Title1=(String)list.get(i);i++;
String StartTime=(String)list.get(i);i++;
String Position=(String)list.get(i);i++;
String Sponsor=(String)list.get(i);i++;
String Content1=(String)list.get(i);i++;

String End=(String)list.get(i);i++;
String Item1=(String)list.get(i);i++;
String Title2=(String)list.get(i);i++;
String Endtime=(String)list.get(i);i++;
String Content2=(String)list.get(i);i++;
String Image=(String)list.get(i);i++;
String Item2=(String)list.get(i);
%>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
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
					<%out.print(" <a class=\"btn btn-primary btn-large\"  href=ConferenceEdit?ID="+ID+ ">" +" Edit "+ "</a>");%>
				</p>
				
	            
                <% if(Item1!=null)out.print("<a href=\""+Item1+"\">附件下载</a>");%>
                <!--  -<input type="button" value="点击下载附件" onClick = "downloadFile()">
                <script  LANGUAGE="javascript">
                
                function downloadFile() {
                	
                	window.open (Item1, 'newwindow', 'height=100, width=400, top=0, left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no')
                }
                
                </script>
                  -->
				
				
			</div>
		</div>
	</div>
</div>

					</div>
					<div class="tab-pane active" id="panel-574844">
<div class="container">
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
					 <%  out.print(" <a class=\"btn btn-primary btn-large\"  href=ConferenceEdit?ID="+ID+ ">" +" Edit "+ "</a>");%>
				</p>
				 <% if(Item2!=null)out.print("<a href=\""+Item2+"\">附件下载</a>");%>
			</div>
		</div>
	</div>
</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>





					 
					 
					 

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
<div  onclick="goToWhere(0)"  
     style="border: 1px solid red; height:90px; width: 15px; position: fixed; cursor: pointer; right: 10px; bottom: 150px;">返回顶部</div>  
<div  onclick="goToWhere(1)"  
     style="border: 1px solid red; height: 90px; width: 15px; position: fixed; cursor: pointer; right: 10px; bottom: 30px;">前往底部</div>  
</body>
</html>