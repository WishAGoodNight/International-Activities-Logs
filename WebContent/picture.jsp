<%@ page language="java" contentType="text/html;charset=UTF-8"%> 
<%@ page import="java.util.*"%>

<%@ page import="java.io.*"%>

<%@ page import="org.apache.commons.fileupload.*"%>

<%!
String Mkdir(String path) {

    String msg=null;
    java.io.File dir;

    // 新建文件对象
    dir =new java.io.File(path);
    if (dir == null) {
        msg = "错误原因:<BR>对不起，不能创建空目录！";
        return msg;
    }
    if (dir.isFile()) {
        msg = "错误原因:<BR>已有同名文件<B>" + dir.getAbsolutePath() + "</B>存在。";
        return msg;
    }
    if (!dir.exists()) {
        boolean result = dir.mkdirs();
        if (result == false) {
            msg = "错误原因:<BR>目录<b>" + dir.getAbsolutePath() + "</B>创建失败，原因不明！";
            return msg;
        }
        // 如果成功创建目录，则无输出。
        // msg ="成功创建目录: <B>" + dir.getAbsolutePath() + "</B>";
        return msg;
    }else {
    //    msg = "错误原因:<BR>目录<b>" + dir.getAbsolutePath() + "</b>已存在。";
    }
    return msg;
}
String getCurDate(){
    GregorianCalendar gcDate = new GregorianCalendar(); 
    int year  = gcDate.get(GregorianCalendar.YEAR);
    int month = gcDate.get(GregorianCalendar.MONTH);
    int day   = gcDate.get(GregorianCalendar.DAY_OF_MONTH);
    return ""+year+month+day;
}
%> 
<%
 String msg ="";
 String img=null;

 DiskFileUpload fu = new DiskFileUpload();
 // 设置允许用户上传文件大小,单位:字节
 fu.setSizeMax(10000000);
 // maximum size that will be stored in memory?
 // 设置最多只允许在内存中存储的数据,单位:字节
 fu.setSizeThreshold(4096);
 // 设置一旦文件大小超过getSizeThreshold()的值时数据存放在硬盘的目录
 fu.setRepositoryPath("/tmp");
 //开始读取上传信息

 List fileItems = fu.parseRequest(request);

 // 依次处理每个上传的文件
 Iterator iter = fileItems.iterator();
 String updir="/dbweb/upics/";
 String updir2="/upics/";
 String curdate=getCurDate();
 String filepath = getServletContext().getRealPath(updir2)+"/"+curdate;//<---好象在tomcat下getrealpath有点问题
 String opmsg = Mkdir(filepath);
 if( opmsg == null) {

 while (iter.hasNext()) {
  FileItem item = (FileItem) iter.next();
  //忽略其他不是文件域的所有表单信息
  if (!item.isFormField()) {
   String name = item.getName();
   long size = item.getSize();
   if((name==null||name.equals("")) && size==0)
   continue;
    // 注意item.getName()
    // 会返回上载文件在客户端的完整路径名称，这似乎是一个BUG。
    // 为解决这个问题，这里使用了fullFile.getName()。
    name=name.replace('\\','/');
    File fullFile = new File(name); 

    File savedFile = new File(filepath,fullFile.getName());
    item.write(savedFile);
    msg="<img alt='"+fullFile.getName()+"' src='"+updir+curdate+"/"+fullFile.getName()+"' />";
    img="<img alt='"+fullFile.getName()+"' src='"+updir+curdate+"/"+fullFile.getName()+"' />";
  }
 }
}//opmsg=null
%>


