package WishAGoodDay;



import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import java.net.URLDecoder;
import javax.servlet.http.HttpSession;


public class  Log_Actions{
	private Connection conn = null;
	PreparedStatement statement = null;
	int ID;
	boolean InOrOut;
    String  Name;
	boolean Conference;
	boolean AcademicTeamwork;
    boolean Exchange;
    int Item_end=0;
    //for conference
    String c_Title1;
    String c_date;
    String c_Position;
    String c_Sponsor;
    String c_Content1;
    boolean c_End;
    String c_Title2;
    String c_Endtime;
    String c_Content2;
  //for academic
    String a_Title1;
    String a_StartTime;
    String a_Position;
    String a_Content1;
    boolean a_End;
    String a_Title2;
    String a_Endtime;
    int a_Expenditure;
    String a_Content2;
    //for exchange student 
    String e_Title1;
    String e_StartTime;
    String e_Position;
    int e_Funded;
    String e_Content1;
    boolean e_End;
    String e_Title2;
    String e_date;
    int e_Expenditure;
    String e_Content2;
    
    public ArrayList<String> list=null;
	// connect to MySQL
    ArrayList<String> getList(){
    	return list;
    }
	public void connSQL() {
		String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
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

	// disconnect to MySQL
	public void deconnSQL() {
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.println("关闭数据库问题 ：");
			e.printStackTrace();
		}
	}


public String findAuthor()
{
	String url = "jdbc:mysql://localhost:3306/library?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	String value=Name;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM Author where Name = '"+value+"'";  
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID="";
	while (rs.next()) { 
		ID=rs.getString("AuthorID");
	 } 
	
	sql="select * from Book where AuthorID="+ID;
	ResultSet rs2 = stmt.executeQuery(sql); 
    String ISBN=null;
    String Title=null;
    while(rs2.next()){
    	ISBN=rs2.getString("ISBN");
    	Title=rs2.getString("Title");
    	list2.add(ISBN);
    	list2.add(Title);
    }
	 rs2.close();
	 rs.close();  
	 conn.close();
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
if(list.size()>0) return "SUCCESS";
else return "FALSE";
}

public String bookdetail(){
	
	String url = "jdbc:mysql://localhost:3306/library?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	String value=Name;
	System.out.println(Name);
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM Book where Title = '"+value+"'";  
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ISBN=null;
    String Title=null;
    String AuthorID=null;
    String Publisher=null;
    String Publishdate=null;
    String Price=null;
    while(rs.next()){
    	ISBN=rs.getString("ISBN");
    	Title=rs.getString("Title");
    	AuthorID=rs.getString("AuthorID");
    	Publisher=rs.getString("Publisher");
    	Publishdate=rs.getString("Publishdate");
    	Price=rs.getString("Price");
    	list2.add(ISBN);
    	list2.add(Title);
    	list2.add(AuthorID);
    	list2.add(Publisher); 
    	list2.add(Publishdate);
    	list2.add(Price);
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
if(list.size()>0) return "SUCCESS";
else return "FALSE";

}
public String delete() {
	connSQL();
	String instruction="delete from Book where Title='"+Name+"'";
	System.out.println(instruction);
	try {
	    System.out.println(instruction);
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
		return "SUCCESS";
	} catch (Exception e) {
		System.out.println("删除时出错：");
		e.printStackTrace();
	}
	return "FALSE";
}
public String insertblog(){
	connSQL();
	System.out.println(getConference());
	String instruction="insert into Items (InOrOut,Name,Conference,AcademicTeamwork,Exchange) Values ("
	+isInOrOut()+",'"+getName()+"',"+getConference()+","+isAcademicTeamwork()+","+isExchange()+")";
	System.out.println(instruction);
	try {
	    System.out.println(instruction);
		statement = conn.prepareStatement(instruction);
		//statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
	return "SUCCESS";
}


/*public String update(){
	connSQL();
	String instruction1="update Book set Title='"+getTitle()+"',Publisher='"+getPublisher()+"' , Publishdate='"+getPubishdate()+"',Price="+getPrice()+" where ISBN ="+getISBN();
	try {
	    System.out.println(instruction1);
		statement = conn.prepareStatement(instruction1);
		statement.executeUpdate();
		return "SUCCESS";
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	return "FALSE";

}*/
public int getID() {
	return ID;
}
public void setID(int iD) {
	ID = iD;
}
public boolean isInOrOut() {
	return InOrOut;
}
public void setInOrOut(boolean InOrOut) {
	this.InOrOut = InOrOut;
}
public String getName() {
	return Name;
}
public void setName(String Name) {
	this.Name = Name;
}
public boolean getConference() {
	return Conference;
}
public void setConference(boolean Conference) {
	this.Conference = Conference;
}
public boolean isAcademicTeamwork() {
	return AcademicTeamwork;
}
public void setAcademicTeamwork(boolean AcademicTeamwork) {
	this.AcademicTeamwork = AcademicTeamwork;
}
public boolean isExchange() {
	return Exchange;
}
public void setExchange(boolean Exchange) {
	this.Exchange = Exchange;
}
public String getC_Title1() {
	return c_Title1;
}
public void setC_Title1(String c_Title1) {
	this.c_Title1 = c_Title1;
}
public String getC_date() {
	return c_date;
}
public void setC_date(String c_date) {
	this.c_date = c_date;
}
public String getC_Position() {
	return c_Position;
}
public void setC_Position(String c_Position) {
	this.c_Position = c_Position;
}
public String getC_Sponsor() {
	return c_Sponsor;
}
public void setC_Sponsor(String c_Sponsor) {
	this.c_Sponsor = c_Sponsor;
}
public String getC_Content1() {
	return c_Content1;
}
public void setC_Content1(String c_Content1) {
	this.c_Content1 = c_Content1;
}
public boolean isC_End() {
	return c_End;
}
public void setC_End(boolean c_End) {
	this.c_End = c_End;
}
public String getC_Title2() {
	return c_Title2;
}
public void setC_Title2(String c_Title2) {
	this.c_Title2 = c_Title2;
}
public String getC_Endtime() {
	return c_Endtime;
}
public void setC_Endtime(String c_Endtime) {
	this.c_Endtime = c_Endtime;
}
public String getC_Content2() {
	return c_Content2;
}
public void setC_Content2(String c_Content2) {
	this.c_Content2 = c_Content2;
}
public String getA_Title1() {
	return a_Title1;
}
public void setA_Title1(String a_Title1) {
	this.a_Title1 = a_Title1;
}
public String getA_StartTime() {
	return a_StartTime;
}
public void setA_StartTime(String a_StartTime) {
	this.a_StartTime = a_StartTime;
}
public String getA_Position() {
	return a_Position;
}
public void setA_Position(String a_Position) {
	this.a_Position = a_Position;
}
public String getA_Content1() {
	return a_Content1;
}
public void setA_Content1(String a_Content1) {
	this.a_Content1 = a_Content1;
}
public boolean isA_End() {
	return a_End;
}
public void setA_End(boolean a_End) {
	this.a_End = a_End;
}
public String getA_Title2() {
	return a_Title2;
}
public void setA_Title2(String a_Title2) {
	this.a_Title2 = a_Title2;
}
public String getA_Endtime() {
	return a_Endtime;
}
public void setA_Endtime(String a_Endtime) {
	this.a_Endtime = a_Endtime;
}
public int getA_Expenditure() {
	return a_Expenditure;
}
public void setA_Expenditure(int a_Expenditure) {
	this.a_Expenditure = a_Expenditure;
}
public String getA_Content2() {
	return a_Content2;
}
public void setA_Content2(String a_Content2) {
	this.a_Content2 = a_Content2;
}
public String getE_Title1() {
	return e_Title1;
}
public void setE_Title1(String e_Title1) {
	this.e_Title1 = e_Title1;
}
public String getE_StartTime() {
	return e_StartTime;
}
public void setE_StartTime(String e_StartTime) {
	this.e_StartTime = e_StartTime;
}
public String getE_Position() {
	return e_Position;
}
public void setE_Position(String e_Position) {
	this.e_Position = e_Position;
}
public int getE_Funded() {
	return e_Funded;
}
public void setE_Funded(int e_Funded) {
	this.e_Funded = e_Funded;
}
public String getE_Content1() {
	return e_Content1;
}
public void setE_Content1(String e_Content1) {
	this.e_Content1 = e_Content1;
}
public boolean isE_End() {
	return e_End;
}
public void setE_End(boolean e_End) {
	this.e_End = e_End;
}
public String getE_Title2() {
	return e_Title2;
}
public void setE_Title2(String e_Title2) {
	this.e_Title2 = e_Title2;
}
public String getE_date() {
	return e_date;
}
public void setE_date(String e_date) {
	this.e_date = e_date;
}
public int getE_Expenditure() {
	return e_Expenditure;
}
public void setE_Expenditure(int e_Expenditure) {
	this.e_Expenditure = e_Expenditure;
}
public String getE_Content2() {
	return e_Content2;
}
public void setE_Content2(String e_Content2) {
	this.e_Content2 = e_Content2;
}
public int getItem_end() {
	return Item_end;
}
public void setItem_end(int Item_end) {
	this.Item_end = Item_end;
}
}



