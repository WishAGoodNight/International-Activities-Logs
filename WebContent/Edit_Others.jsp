<%@ page language="java" import="java.net.*" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import ="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Others Edit</title>

<link href="css/maps.css" rel="stylesheet">
<link href="css/zzsc2.css" rel="stylesheet">
<script type="text/javascript" src="js/form.js"></script>
<script type="text/javascript" src="js/maps.js"></script>
<script type="text/javascript">$(document).ready(function(){$().orion({speed: 500,animation: "zoom"});});</script>
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

<%
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;

public final class MyJsp_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("  \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("    \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("  \r\n");
      out.write("    This is my JSP page. 
\r\n");
      out.write("  \r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
我们看到，这个类继承了org.apache.jasper.runtime.HttpJspBase，要想看到这个类的源码，我们需要下载tomcat的源码，然后找到这个类，源码如下：
/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * /*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * /*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.jasper.runtime;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.HttpJspPage;
import javax.servlet.jsp.JspFactory;

import org.apache.jasper.compiler.Localizer;

/**
 * This is the super class of all JSP-generated servlets.
 *
 * @author Anil K. Vijendran
 */
public abstract class HttpJspBase 
    extends HttpServlet 
    implements HttpJspPage 
        
    
{
    
    protected HttpJspBase() {
    }

    public final void init(ServletConfig config) 
	throws ServletException 
    {
        super.init(config);
	jspInit();
        _jspInit();
    }
    
    public String getServletInfo() {
	return Localizer.getMessage("jsp.engine.info");
    }

    public final void destroy() {
	jspDestroy();
	_jspDestroy();
    }

    /**
     * Entry point into service.
     */
    public final void service(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException 
    {
        _jspService(request, response);
    }
    
    public void jspInit() {
    }

    public void _jspInit() {
    }

    public void jspDestroy() {
    }

    protected void _jspDestroy() {
    }

    public abstract void _jspService(HttpServletRequest request, 
				     HttpServletResponse response) 
	throws ServletException, IOException;
}
%>
ArrayList<String>list=(ArrayList<String>)  session.getAttribute("list");

	
int i=0;
String str1=(String)list.get(i);
out.print("<label>Number</label><input name=\"Number\" type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
i++;
String str=null;
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>标题</label><input name=\"o_Title1\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>开始时间</label><input name=\"o_StartTime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>地点</label><input name=\"o_Position\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>事件类型</label><input name=\"o_Kind\" type=\"text\" class=\"form-control\"  value = \""+str+"\"   required/>");
i++;}
//<textarea class="form-control" rows="3"></textarea>
if(i<list.size()){
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"o_Content1\" type=\"text\" class=\"form-control\"  id=\"c_Content1\"    rows=\"20\" required/>"+str +"</textarea>");
i++;}

%>
                    <div class="form-group">
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file1" id="exampleInputFile" />
					<p class="help-block">
						这里添加压缩包
					</p>
				    </div>
				
				
				
				
			
 

					</div>
					<div class="tab-pane" id="panel-828736">
 
					 <br>
					 <%
					 i++;
				     i++;
out.print("<label>Number</label><input type=\"text\" class=\"form-control\"  value = \""+str1+"\"  readonly required/>");
str=(String)list.get(i);
if(str!=null)
out.print("<label>标题</label><input name=\"o_Title2\" type=\"text\" class=\"form-control\"  value = \""+str+"\"  />");
else out.print("<label>标题</label><input name=\"o_Title2\" type=\"text\" class=\"form-control\"  value = \"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>结束时间</label><input name=\"o_Endtime\" type=\"date\" class=\"form-control\"  value = \""+str+"\"  />");
i++;
str=(String)list.get(i);
out.print("<label>内容</label><textarea name=\"o_Content2\" type=\"text\" class=\"form-control\"   rows=\"20\"/>"+str+"</textarea>");
i++;
str=(String)list.get(i);

					 %>
					 <div class="form-group">
           
					 <label for="exampleInputFile">添加文件</label><input type="file" name="file2" id="exampleInputFile" />
					
					<p class="help-block">
						这里添加压缩包
					</p>
					 <label for="exampleInputFile">添加图片</label><input type="file" name="Pic" id="exampleInputFile"  multiple="true"/>(支持格式：png,jpg,gif,bmp)
				</div>
		</div>
	</div>
</div>

			
		
<button type="submit" class="btn btn-default">Submit</button>
</form>
</body>
</html>