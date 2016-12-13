package WishAGoodDay;
import WishAGoodDay.FileUploadAction2.* ;
import WishAGoodDay.FileUploadAction.* ;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;
import java.io.File;   
import java.io.InputStream;   
import java.io.FileInputStream;   
import java.io.ByteArrayInputStream;
import java.io.DataInputStream;

import java.text.SimpleDateFormat;
import java.util.Date;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class User {
private String UserID;
private String Email;
private String Passport;
private String rpassword;
private Connection conn = null;
PreparedStatement statement = null;


String User=null;
public void connSQL() {
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8&useSSL=false";
	
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	try { 
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password ); 
		}
	//捕获加载驱动程序异常
	 catch ( ClassNotFoundException cnfex ) {
		 System.err.println(
		 "装载 JDBC/ODBC 驱动程序失败。" );
		 cnfex.printStackTrace(); 
	 } 
	 //捕获连接数据库异常
	 catch ( SQLException sqlex ) {
		 System.err.println( "无法连接数据库" );
		 sqlex.printStackTrace(); 
	 }
}
public String CreateUser()
{
	connSQL(); 
	String instruction="insert into User (UserID,Email,Passport) Values ('"+getUserID()+"','"+getEmail()+"','"+getPassport()+"')";
	try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
		return "FALSE";
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
		return "FALSE";
	}
	System.out.println(instruction);

	return "SUCCESS";

}
public String Login()
{
	
	String sql="select * from User where UserID='"+getUserID()+"'";
    System.out.println(sql);
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库
	String UserID=null;
    String Passport=null;
    String Email=null;
    int counter=0;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
    while(rs.next()){
    	UserID=rs.getString("UserID");
    	Passport=rs.getString("Passport");
    	Email=rs.getString("Email");
    	System.out.println(UserID);
    	counter++;
    }
    if(counter==0)return "FALSE";
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
	return "FALSE";
    }
if(!Passport.equals(getPassport()))
		return "FALSE";
else	 this.User=UserID;
System.out.println(User);
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("User",User);
session.setAttribute("Email",Email);
return "SUCCESS";

}
public String Edit()
{

	connSQL(); 
	String instruction="update  User set Email='"+getEmail()+"',Passport='"+getPassport()+"' where UserID='"+getUserID()+"'";
	if(!getPassport().equals(getRpassword()))
		return "FALSE";
	try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
		return "FALSE";
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
		return "FALSE";
	}
	System.out.println(instruction);

	return "SUCCESS";



}


public String getUserID() {
	return UserID;
}
public void setUserID(String userID) {
	UserID = userID;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getPassport() {
	return Passport;
}
public void setPassport(String passport) {
	Passport = passport;
}
public String getRpassword() {
	return rpassword;
}
public void setRpassword(String rpassword) {
	this.rpassword = rpassword;
}
}
