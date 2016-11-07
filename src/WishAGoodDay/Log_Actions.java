package WishAGoodDay;
import WishAGoodDay.FileUploadAction2.* ;
import WishAGoodDay.FileUploadAction.* ;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class  Log_Actions{
	private Connection conn = null;
	PreparedStatement statement = null;
	//for fileupload
    //注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
    private File file1;
    //提交过来的file的名字
    private String file1FileName;
    //提交过来的file的MIME类型
    private String file1ContentType;
	
    
    private File file2;
    //提交过来的file的名字
    private String file2FileName;
    //提交过来的file的MIME类型
    private String file2ContentType;
    
    
    
    /*
     * For pictures
     * 
     */
  //这里用List来存放上传过来的文件，file同样指的是临时文件夹中的临时文件，而不是真正上传过来的文件
    private List<File> Pic;
    
   //这个List存放的是文件的名字，和List<File>中的文件相对应
    private List<String> PicFileName;
    
    private List<String> PicContentType;
	//for search
	String Search_Name;
	String Search_Time1;
	String Search_Time2;
	boolean Search_Conference;
	boolean Search_AcademicTeamwork;
	boolean Search_Exchange;
	boolean Search_Others;
	//for create
	int ID;
	boolean InOrOut;
    String  Name;
	boolean Conference;
	boolean AcademicTeamwork;
    boolean Exchange;
    boolean Others;
    int Item_end=0;
    //for conference
    String c_Title1;
    String c_StartTime;
    String c_Position;
    String c_Sponsor;
    String c_Content1;
    boolean c_End;
    String c_Title2;
    String c_Endtime;
    String c_Content2;
    String c_Image;
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
    String a_Image;
    //for exchange student 
    String e_Title1;
    String e_StartTime;
    String e_Position;
    String e_Funded;
    String e_Content1;
    boolean e_End;
    String e_Title2;
    String e_Endtime;
    int e_Expenditure;
    String e_Content2;
    String e_Image;
    //for others
    String o_Title1;
    String o_StartTime;
    String o_Position;
    String o_Kind;
    String o_Content1;
    boolean o_End;
    String o_Title2;
    String o_Endtime;
    String o_Content2;
    String o_Image;
    
    
    public ArrayList<String> list=null;
    public ArrayList<String> reference=null;
    public ArrayList<String> list_c=null;
    public ArrayList<String> list_a=null;
    public ArrayList<String> list_e=null;
    public ArrayList<String> list_o=null;
	// connect to MySQL
    ArrayList<String> getList(){
    	return list;
    }
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




public String Logdetail(){
	
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM Items";  
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String InOrOut=null;
    String Name=null;
    String Conference=null;
    String AcademicTeamwork=null;
    String Exchange=null;
    String Others=null;
    String Item_end=null;
    while(rs.next()){
    	ID=rs.getString("ID");
    	InOrOut=rs.getString("InOrOut");
    	Name=rs.getString("Name");
    	Conference=rs.getString("Conference");
    	AcademicTeamwork=rs.getString("AcademicTeamwork");
    	Exchange=rs.getString("Exchange");
    	Others=rs.getString("Others");
    	Item_end=rs.getString("Item_end");
    	list2.add(ID);
    	if(InOrOut.equals("0"))
    	list2.add("外校来访");
    	else
    	list2.add("本校出访");
    	list2.add(Name);
    	if(Conference.equals("1"))
    	list2.add("查看详情"); 
    	else list2.add("无"); 
    	if(AcademicTeamwork.equals("1"))
    	list2.add("查看详情");
    	else list2.add("无"); 
    	if(Exchange.equals("1"))
    	list2.add("查看详情");
    	else list2.add("无"); 
    	
    	if(Others.equals("1"))
        list2.add("查看详情"); 
        else list2.add("无"); 
    	
    	
    	list2.add(Item_end);
    	System.out.println(list2);
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
return "SUCCESS";


}

public String Detail_c() {
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	int value=ID;
	String titletemp1="";
	String titletemp2="";
	String temp=null;
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "select * FROM Conference where ID =" + value;  
	//System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Sponsor=null;
    String Content1=null;
    Blob Contenttemp=null;
    String End=null;
    String Title2=null;
    String Endtime=null;
    String Content2=null;
    String Image=null;
    String Item1=null;
    String Item2=null;
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	titletemp1=Title1;
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Sponsor=rs.getString("Sponsor");
    	list2.add(Sponsor);
    	Contenttemp=rs.getBlob("Content1");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content1 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}

		System.out.println(Content1);
		String tmp = "";
		if(Content1!=null)
		for (int i = 0; i < Content1.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content1.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content1.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content1.charAt(i);
			}
		}
		Content1 = tmp;
		System.out.println(Content1);
    	list2.add(Content1);
    	End=rs.getString("End");
    	list2.add(End);
 
    	Item1=rs.getString("Item1");
       	list2.add(Item1);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	titletemp2=Title2;
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	Contenttemp=rs.getBlob("Content2");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content2 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	tmp = "";
    	if(Content2!=null)
		for (int i = 0; i < Content2.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content2.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content2.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content2.charAt(i);
			}
		}
		Content2 = tmp;
    	list2.add(Content2);
    	Image=rs.getString("Image");
    	list2.add(Image);
    	Item2=rs.getString("Item2");
       	list2.add(Item2);
    	System.out.println(list2);
    	
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
	reference_c();
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
return "SUCCESS";
}


public void reference_c(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	
	
	
	String sql = "SELECT * FROM Conference order by id desc limit 0,10;";  
	System.out.println(sql);
	ArrayList<String> reference1= new ArrayList<String>();
	try{
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title=null;
    
    int counter=0;
    while(rs.next()&&counter<=10){
    	ID=rs.getString("ID");
    	Title=rs.getString("Title1")+"&"+rs.getString("Title2");
    	reference1.add(ID);
		reference1.add(Title);
		
    	counter++;
    }
    System.out.println(reference1);
    rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    } 
	this.reference=reference1;
	ServletRequest request=ServletActionContext.getRequest();
	HttpServletRequest req=(HttpServletRequest) request;
	HttpSession session=req.getSession();
	session.setAttribute("reference",reference);
}


public String Edit_c() throws Exception{
	connSQL();
	String instruction1="update Conference set Title1='"+getC_Title1()+"',StartTime='"+getC_StartTime()+"' ,Position='"+getC_Position()+
			"',Sponsor='"+getC_Sponsor()+"',Content1='"+getC_Content1()+
			"',Title2='"+getC_Title2()+
			"',Endtime='"+getC_Endtime()+
			"',Content2='"+getC_Content2()+
			"',Image='"+getC_Image()+
			"' where ID ="+getID();
	System.out.print(instruction1);
	try {
		statement = conn.prepareStatement(instruction1);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	if(getFile1FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile1(),getFile1FileName(),getFile1ContentType());
	String instruction2="update Conference set Item1='" +url+"' where ID=" +getID();
	System.out.println(instruction2);
	try {
		statement = conn.prepareStatement(instruction2);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	if(getFile2FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile2(),getFile2FileName(),getFile2ContentType());
	String instruction3="update Conference set Item2='" +url+"' where ID=" +getID();
	System.out.println(instruction3);
	try {
		statement = conn.prepareStatement(instruction3);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	
	List<String> Names=getPicFileName();
	//picture
	if(getPic()!=null)
	{     
		//for(int i=0;i<Pic.size();i++)
			//System.out.println(Names.get(i));
		String url=FileUploadAction2.execute1(getPic(),getPicFileName(),getPicContentType());
		String instruction4="update Conference set Image='" +url+"' where ID=" +getID();
		try {
			statement = conn.prepareStatement(instruction4);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
	}
	
	
	
	return "SUCCESS";
}


public String insertblog(){
	connSQL();
	int counter=0;
	if(!isConference())counter++;
	if(!isAcademicTeamwork())counter++;
	if(!isExchange())counter++;
	setItem_end(counter);
	String instruction="insert into Items (InOrOut,Name,Conference,AcademicTeamwork,Exchange,Item_end,Others) Values ("
	+isInOrOut()+",'"+getName()+"',"+isConference()+","+isAcademicTeamwork()+","+isExchange()+","+getItem_end()+","+isOthers()+")";
	try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
	String sql="select ID from Items where Name = '"+getName()+"'";
	System.out.println(sql);
	if(isConference())
		create_c(sql);
	if(isAcademicTeamwork())
		create_a(sql);
	if(isExchange())
		create_e(sql);
	if(isOthers())
		create_o(sql);
	return "SUCCESS";
}


public String Detail_a(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";

	String password = "1234"; // 加载驱动程序以连接数据库 
	int value=ID;
	String titletemp1="";
	String titletemp2="";
	String temp=null;
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM AcademicTeamwork where ID =" + value;  
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Content1=null;
    Blob Contenttemp=null;
    String End=null;
    String Title2=null;
    String Endtime=null;
    String Expenditure=null;
    String Content2=null;
    String Image=null;
    String Item1=null;
    String Item2=null;
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	titletemp1=Title1;
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Contenttemp=rs.getBlob("Content1");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content1 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	
		String tmp = "";
		if(Content1!=null)
		for (int i = 0; i < Content1.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content1.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content1.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content1.charAt(i);
			}
		}
		
		Content1 = tmp;
		System.out.println(Content1);
    	list2.add(Content1);
    	End=rs.getString("End");
    	list2.add(End);
    	Item1=rs.getString("Item1");
    	list2.add(Item1);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	titletemp2=Title2;
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	Expenditure=rs.getString("Expenditure");
    	list2.add(Expenditure);
    	Contenttemp=rs.getBlob("Content2");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content2 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	tmp = "";
    	if(Content2!=null)
		for (int i = 0; i < Content2.length(); i++) {
			if (Content2.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content2.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content2.charAt(i);
			}
		}
		Content2 = tmp;
    	list2.add(Content2);
    	Image=rs.getString("Image");
    	list2.add(Image);
    	Item2=rs.getString("Item2");
    	list2.add(Item2);
    	System.out.println(list2);
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }

reference_a();
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
return "SUCCESS";
}
public void reference_a(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	
	
	
	String sql = "SELECT * FROM AcademicTeamwork order by id desc limit 0,10;";  
	System.out.println(sql);
	ArrayList<String> reference1= new ArrayList<String>();
	try{
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title=null;
    
    int counter=0;
    while(rs.next()&&counter<=10){
    	ID=rs.getString("ID");
    	Title=rs.getString("Title1")+"&"+rs.getString("Title2");
    	reference1.add(ID);
		reference1.add(Title);
		
    	counter++;
    }
    System.out.println(reference1);
    rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    } 
	this.reference=reference1;
	ServletRequest request=ServletActionContext.getRequest();
	HttpServletRequest req=(HttpServletRequest) request;
	HttpSession session=req.getSession();
	session.setAttribute("reference",reference);
}

public String Edit_a() throws Exception{
	connSQL();
	String instruction1="update AcademicTeamwork set Title1='"+getA_Title1()+"',StartTime='"+getA_StartTime()+"' ,Position='"+getA_Position()+
			"',Content1='"+getA_Content1()+
			"',Title2='"+getA_Title2()+
			"',Endtime='"+getA_Endtime()+
			"',Expenditure="+getA_Expenditure()+
			",Content2='"+getA_Content2()+
			"',Image='"+getA_Image()+
			"' where ID ="+getID();
	System.out.print(instruction1);
	try {
		statement = conn.prepareStatement(instruction1);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	
	
	if(getFile1FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile1(),getFile1FileName(),getFile1ContentType());
	String instruction2="update AcademicTeamwork set Item1='" +url+"' where ID=" +getID();
	System.out.println(instruction2);
	try {
		statement = conn.prepareStatement(instruction2);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	if(getFile2FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile2(),getFile2FileName(),getFile2ContentType());
	String instruction3="update AcademicTeamwork set Item2='" +url+"' where ID=" +getID();
	System.out.println(instruction3);
	try {
		statement = conn.prepareStatement(instruction3);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	List<String> Names=getPicFileName();
	//picture
	if(getPic()!=null)
	{     
		//for(int i=0;i<Pic.size();i++)
			//System.out.println(Names.get(i));
		String url=FileUploadAction2.execute1(getPic(),getPicFileName(),getPicContentType());
		String instruction4="update AcademicTeamwork set Image='" +url+"' where ID=" +getID();
		try {
			statement = conn.prepareStatement(instruction4);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
	}
	
	
	return "SUCCESS";
}




public String Detail_e(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";

	String password = "1234"; // 加载驱动程序以连接数据库 
	int value=ID;
	String titletemp1="";
	String titletemp2="";
	String temp=null;
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM Exchange where ID =" + value;  
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Funded=null;
    String Content1=null;
    Blob Contenttemp=null;
    String End=null;
    String Title2=null;
    String Endtime=null;
    String Expenditure=null;
    String Content2=null;
    String Image=null;
    String Item1=null;
    String Item2=null;
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	titletemp1=Title1;
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Funded=rs.getString("Funded");
    	list2.add(Funded);
    	Contenttemp=rs.getBlob("Content1");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content1 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	
		String tmp = "";
		if(Content1!=null)
		for (int i = 0; i < Content1.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content1.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content1.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content1.charAt(i);
			}
		}
		
		Content1 = tmp;
		System.out.println(Content1);
    	list2.add(Content1);
    	End=rs.getString("End");
    	list2.add(End);
    	Item1=rs.getString("Item1");
    	list2.add(Item1);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	titletemp2=Title2;
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	Expenditure=rs.getString("Expenditure");
    	list2.add(Expenditure);
    	Contenttemp=rs.getBlob("Content2");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content2 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	tmp = "";
    	if(Content2!=null)
		for (int i = 0; i < Content2.length(); i++) {
			if (Content2.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content2.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content2.charAt(i);
			}
		}
		Content2 = tmp;
    	list2.add(Content2);
    	Image=rs.getString("Image");
    	list2.add(Image);
    	Item2=rs.getString("Item2");
    	list2.add(Item2);
    	System.out.println(list2);
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }

reference_e();
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
return "SUCCESS";
}

public void reference_e(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	
	
	
	String sql = "SELECT * FROM Exchange order by id desc limit 0,10;";  
	System.out.println(sql);
	ArrayList<String> reference1= new ArrayList<String>();
	try{
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title=null;
    
    int counter=0;
    while(rs.next()&&counter<=10){
    	ID=rs.getString("ID");
    	Title=rs.getString("Title1")+"&"+rs.getString("Title2");
    	reference1.add(ID);
		reference1.add(Title);
		
    	counter++;
    }
    System.out.println(reference1);
    rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    } 
	this.reference=reference1;
	ServletRequest request=ServletActionContext.getRequest();
	HttpServletRequest req=(HttpServletRequest) request;
	HttpSession session=req.getSession();
	session.setAttribute("reference",reference);
}
public String Edit_e() throws Exception{
	connSQL();
	String instruction1="update Exchange set Title1='"+getE_Title1()+"',StartTime='"+getE_StartTime()+"' ,Position='"+getE_Position()+
			"',Funded='"+getE_Funded()+
			"',Content1='"+getE_Content1()+
			"',Title2='"+getE_Title2()+
			"',Endtime='"+getE_Endtime()+
			"',Expenditure="+getE_Expenditure()+
			",Content2='"+getE_Content2()+
			"',Image='"+getE_Image()+
			"' where ID ="+getID();
	
	
	try {
		statement = conn.prepareStatement(instruction1);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	
	
	if(getFile1FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile1(),getFile1FileName(),getFile1ContentType());
	String instruction2="update Exchange set Item1='" +url+"' where ID=" +getID();
	System.out.println(instruction2);
	try {
		statement = conn.prepareStatement(instruction2);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	if(getFile2FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile2(),getFile2FileName(),getFile2ContentType());
	String instruction3="update Exchange set Item2='" +url+"' where ID=" +getID();
	System.out.println(instruction3);
	try {
		statement = conn.prepareStatement(instruction3);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	
	List<String> Names=getPicFileName();
	//picture
	if(getPic()!=null)
	{     
		//for(int i=0;i<Pic.size();i++)
			//System.out.println(Names.get(i));
		String url=FileUploadAction2.execute1(getPic(),getPicFileName(),getPicContentType());
		String instruction4="update Exchange set Image='" +url+"' where ID=" +getID();
		try {
			statement = conn.prepareStatement(instruction4);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
	}
	
	
	
	return "SUCCESS";
}











public void create_c(String x){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	String value=null;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(x); 
	while(rs.next())
    value=rs.getString("ID");
    System.out.println(value);
	rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
    String instruction="insert into Conference (ID) Value( "+value+")";
    System.out.println(instruction);
    try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
}
public void create_a(String x){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	String value=null;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(x); 
	while(rs.next())
    value=rs.getString("ID");
	rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
    String instruction="insert into AcademicTeamwork (ID) Value( "+value+")";
    System.out.println(instruction);
    try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
}
public void create_e(String x){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	String value=null;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(x); 
	while(rs.next())
    value=rs.getString("ID");
	rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
    String instruction="insert into Exchange (ID) Value( "+value+")";
    try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
}
public void create_o(String x){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	String value=null;
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(x); 
	while(rs.next())
    value=rs.getString("ID");
    System.out.println(value);
	rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
    String instruction="insert into Others (ID) Value( "+value+")";
    System.out.println(instruction);
    try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
        
	} catch (SQLException e) {
		System.out.println("插入数据库时出错：");
		e.printStackTrace();
	} catch (Exception e) {
		System.out.println("插入时出错：");
		e.printStackTrace();
	}
}

public String Search(){
	String instruction_c="";
	String instruction_a="";
	String instruction_e="";
	String instruction_o="";
	String Search_Time1=getSearch_Time1();
	String Search_Time2=getSearch_Time2();
	String Search_Name=getSearch_Name();
	boolean Search_Conference=isSearch_Conference();
	boolean Search_AcademicTeamwork=isSearch_AcademicTeamwork();
	boolean Search_Exchange=isSearch_Exchange();
	boolean Search_Others=isSearch_Others();
	if((getSearch_Time1().equals("") || getSearch_Time2().equals(""))&&getSearch_Name().equals("")&&
			isSearch_Conference()==false&&
			isSearch_AcademicTeamwork()==false&&
			isSearch_Exchange()==false&&isSearch_Others()==false)
		return "FALSE";
	String instruction=null;
	String temp1="";
	String temp2="";
	String temp3="";
	if(!getSearch_Time1().equals("") && !getSearch_Time2().equals(""))
		for(int i=0;i<Search_Time1.length();i++)
		{
			if(Search_Time1.charAt(i)!='-')
				{temp1=temp1+Search_Time1.charAt(i);
				temp2=temp2+Search_Time2.charAt(i);
				}
		}
	Search_Time2=temp2;
	Search_Time1=temp1;
	if(!Search_Name.equals(""))
	{
		for(int i=0;i<Search_Name.length();i++)
		{
			temp3=temp3+'%'+Search_Name.charAt(i);
		}
		temp3=temp3+'%';
	}
	Search_Name=temp3;
	
	//只有分类
	 if(getSearch_Name().equals("")&&(getSearch_Time1().equals("") || getSearch_Time2().equals("")))
	{
		instruction_c="select * from Conference";
		instruction_a="select * from AcademicTeamwork";
		instruction_e="select * from Exchange";
		instruction_o="select * from Others";
		}
	//只有title
	 else if(getSearch_Time1().equals("") || getSearch_Time2().equals(""))
		{
		instruction_c="select * from Conference  where Title1 like '"+Search_Name+"' or Title2 like '"
				+ Search_Name+"'";
		instruction_a="select * from AcademicTeamwork  where Title1 like '"+Search_Name+"' or Title2 like '"
				+ Search_Name+"'";
		instruction_e="select * from Exchange  where Title1 like '"+Search_Name+"' or Title2 like '"
				+ Search_Name+"'";
		instruction_o="select * from Others  where Title1 like '"+Search_Name+"' or Title2 like '"
				+ Search_Name+"'";
		}
	//只有time
	else if(getSearch_Name().equals(""))
	{
	instruction_c="select * from Conference  where StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2;
	instruction_a="select * from AcademicTeamwork  where StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2;
	instruction_e="select * from Exchange  where StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2;
	instruction_o="select * from Others  where StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2;
	}
		//有time and title
	else
	{
	instruction_c="select * from Conference  where (StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2+") and (Title1 like '"+Search_Name+"' or Title2 like '"
			+ Search_Name+"')";
	instruction_a="select * from AcademicTeamwork  where ( StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2+") and (Title1 like '"+Search_Name+"' or Title2 like '"
			+ Search_Name+"')";
	instruction_e="select * from Exchange  where (StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2+") and (Title1 like '"+Search_Name+"' or Title2 like '"
			+ Search_Name+"')";
	instruction_o="select * from Others  where (StartTime >= "+Search_Time1+" and StartTime <= "
			+ Search_Time2+") and (Title1 like '"+Search_Name+"' or Title2 like '"
			+ Search_Name+"')";	
	}

	//if(isSearch_Conference())
	//if((getSearch_Time1().equals("") || getSearch_Time2().equals("")))
	//System.out.println(instruction_c);
		Conference_search(instruction_c,isSearch_Conference());
	//if(isSearch_AcademicTeamwork())
		AcademicTeamwork_search(instruction_a,Search_AcademicTeamwork);
	//if(isSearch_Exchange())
		Exchange_search(instruction_e,isSearch_Exchange());
		Others_search(instruction_o,isSearch_Others());
  //  System.out.println(list_c);
  //  System.out.println(list_a);
   // System.out.println(list_e);
	return "SUCCESS";
}

public void Conference_search(String sql, boolean judge_c){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Title2=null;
    String Endtime=null;
    if(judge_c)
    list2.add("true");
    else
    	list2.add("false");
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list_c=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list_c",list_c);
session.setAttribute("judge_c",judge_c);
deconnSQL();
}
public void AcademicTeamwork_search(String sql,boolean judge_a){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Title2=null;
    String Endtime=null;
    if(judge_a)
        list2.add("true");
    else
    	list2.add("false");
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    }
    System.out.println(list2);
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list_a=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list_a",list_a);
deconnSQL();
}
public void Exchange_search(String sql,boolean  judge_e){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Title2=null;
    String Endtime=null;
    if(judge_e)
    	list2.add("true");
    else 
    	list2.add("false");
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list_e=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list_e",list_e);
deconnSQL();
}
public void Others_search(String sql, boolean judge_o){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Title2=null;
    String Endtime=null;
    if(judge_o)
    list2.add("true");
    else
    	list2.add("false");
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
this.list_o=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list_o",list_o);
session.setAttribute("judge_o",judge_o);
deconnSQL();
}


public String Detail_o() {
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	int value=ID;
	String titletemp1="";
	String titletemp2="";
	String temp=null;
	ArrayList<String> list2= new ArrayList<String>();
	try { 
	Class.forName("com.mysql.jdbc.Driver" ); 
	conn = DriverManager.getConnection( url,username, password ); 
	String sql = "SELECT * FROM Others where ID =" + value;  
	System.out.println(sql);
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title1=null;
    String StartTime=null;
    String Position=null;
    String Kind=null;
    String Content1=null;
    Blob Contenttemp=null;
    String End=null;
    String Title2=null;
    String Endtime=null;
    String Content2=null;
    String Image=null;
    String Item1=null;
    String Item2=null;
    while(rs.next()){
    	ID=rs.getString("ID");
    	list2.add(ID);
    	Title1=rs.getString("Title1");
    	titletemp1=Title1;
    	list2.add(Title1);
    	StartTime=rs.getString("StartTime");
    	list2.add(StartTime);
    	Position=rs.getString("Position");
    	list2.add(Position);
    	Kind=rs.getString("Kind");
    	list2.add(Kind);
    	Contenttemp=rs.getBlob("Content1");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content1 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}

		System.out.println(Content1);
		String tmp = "";
		if(Content1!=null)
		for (int i = 0; i < Content1.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content1.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content1.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content1.charAt(i);
			}
		}
		Content1 = tmp;
		System.out.println(Content1);
    	list2.add(Content1);
    	End=rs.getString("End");
    	list2.add(End);
 
    	Item1=rs.getString("Item1");
       	list2.add(Item1);
    	Title2=rs.getString("Title2");
    	list2.add(Title2);
    	titletemp2=Title2;
    	Endtime=rs.getString("Endtime");
    	list2.add(Endtime);
    	Contenttemp=rs.getBlob("Content2");
    	if(Contenttemp != null){
			InputStream is = Contenttemp.getBinaryStream();
			ByteArrayInputStream bais = (ByteArrayInputStream)is;
			byte[] byte_data = new byte[bais.available()]; //bais.available()返回此输入流的字节数

			bais.read(byte_data, 0,byte_data.length);//将输入流中的内容读到指定的数组
			Content2 = new String(byte_data,"utf-8"); //再转为String，并使用指定的编码方式
			is.close();
		}
    	tmp = "";
    	if(Content2!=null)
		for (int i = 0; i < Content2.length(); i++) {
			//System.out.printf("%c",Content1.charAt(i));
			if (Content2.charAt(i) == ' ') {
				tmp = tmp + "&nbsp;";
			} else if (Content2.charAt(i) == '\n') {
				tmp = tmp + "<br>";
			} else {
				tmp = tmp + Content2.charAt(i);
			}
		}
		Content2 = tmp;
    	list2.add(Content2);
    	Image=rs.getString("Image");
    	list2.add(Image);
    	Item2=rs.getString("Item2");
       	list2.add(Item2);
    	System.out.println(list2);
    	
    }
	 rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    }
	 reference_o();
this.list=list2;
ServletRequest request=ServletActionContext.getRequest();
HttpServletRequest req=(HttpServletRequest) request;
HttpSession session=req.getSession();
session.setAttribute("list",list);
return "SUCCESS";
}


public void reference_o(){
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; // 加载驱动程序以连接数据库 
	
	
	
	String sql = "SELECT * FROM Others order by id desc limit 0,10;";  
	System.out.println(sql);
	ArrayList<String> reference1= new ArrayList<String>();
	try{
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password ); 
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	String ID=null;
    String Title=null;
    
    int counter=0;
    while(rs.next()&&counter<=10){
    	ID=rs.getString("ID");
    	Title=rs.getString("Title1")+"&"+rs.getString("Title2");
    	reference1.add(ID);
		reference1.add(Title);
		
    	counter++;
    }
    System.out.println(reference1);
    rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
    } 
	this.reference=reference1;
	ServletRequest request=ServletActionContext.getRequest();
	HttpServletRequest req=(HttpServletRequest) request;
	HttpSession session=req.getSession();
	session.setAttribute("reference",reference);
}





public String Edit_o() throws Exception{
	connSQL();
	String instruction1="update Others set Title1='"+getO_Title1()+"',StartTime='"+getO_StartTime()+"' ,Position='"+getO_Position()+
			"',Kind='"+getO_Kind()+"',Content1='"+getO_Content1()+
			"',Title2='"+getO_Title2()+
			"',Endtime='"+getO_Endtime()+
			"',Content2='"+getO_Content2()+
			"',Image='"+getO_Image()+
			"' where ID ="+getID();
	System.out.print(instruction1);
	try {
		statement = conn.prepareStatement(instruction1);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	if(getFile1FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile1(),getFile1FileName(),getFile1ContentType());
	String instruction2="update Others set Item1='" +url+"' where ID=" +getID();
	System.out.println(instruction2);
	try {
		statement = conn.prepareStatement(instruction2);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	if(getFile2FileName()!=null)
	{
	String url=FileUploadAction.execute1(getFile2(),getFile2FileName(),getFile2ContentType());
	String instruction3="update Others set Item2='" +url+"' where ID=" +getID();
	System.out.println(instruction3);
	try {
		statement = conn.prepareStatement(instruction3);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	}
	
	
	List<String> Names=getPicFileName();
	//picture
	if(getPic()!=null)
	{     
		//for(int i=0;i<Pic.size();i++)
			//System.out.println(Names.get(i));
		String url=FileUploadAction2.execute1(getPic(),getPicFileName(),getPicContentType());
		String instruction4="update Others set Image='" +url+"' where ID=" +getID();
		try {
			statement = conn.prepareStatement(instruction4);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
	}
	
	
	return "SUCCESS";
}




public String Delete()
{
	String url = "jdbc:mysql://localhost:3306/IAL?characterEncoding=UTF-8";
	String username = "root";
	String password = "1234"; 
	String sql = "SELECT * FROM Items where ID =" +ID;  
	int value=ID;
	  String Conference=null;
	    String AcademicTeamwork=null;
	    String Exchange=null;
	    String Others=null;
	System.out.println(sql);
	try{
		Class.forName("com.mysql.jdbc.Driver" ); 
		conn = DriverManager.getConnection( url,username, password );
	
	Statement stmt= conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); 
	
  
    while(rs.next()){
    System.out.println("--------------------");
    Conference=rs.getString("Conference");
    System.out.println("--------------------");
    AcademicTeamwork=rs.getString("AcademicTeamwork");
    Exchange=rs.getString("Exchange");
    Others=rs.getString("Others");

    }
    rs.close();  
	}catch(Exception e)
	{System.out.println("cannot find the driver!");
	e.printStackTrace();
	return "FALSE";
	}
	
	if(AcademicTeamwork.equals("1"))
	{
		String instruction="delete from AcademicTeamwork where ID="+value;
		try {
			statement = conn.prepareStatement(instruction);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
		
	}
	if(Exchange.equals("1"))
	{
		String instruction="delete from Exchange where ID="+value;
		try {
			statement = conn.prepareStatement(instruction);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
		
	}
	if(Others.equals("1"))
	{
		String instruction="delete from Others where ID="+value;
		try {
			statement = conn.prepareStatement(instruction);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
		
	}
	if(Conference.equals("1"))
	{
		String instruction="delete from Conference where ID="+value;
		try {
			statement = conn.prepareStatement(instruction);
			statement.executeUpdate();
		} catch (Exception e) {
			System.out.println("修改时出错：");
			e.printStackTrace();
		}
		
	}
	String instruction="delete from Items where ID="+value;
	try {
		statement = conn.prepareStatement(instruction);
		statement.executeUpdate();
	} catch (Exception e) {
		System.out.println("修改时出错：");
		e.printStackTrace();
	}
	return "SUCCESS";
}

public int getID() {
	return ID;
}
public void setID(int ID) {
	this.ID = ID;
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
public boolean isConference() {
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
public String getC_StartTime() {
	return c_StartTime;
}
public void setC_StartTime(String c_StartTime) {
	this.c_StartTime = c_StartTime;
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
public String getE_Funded() {
	return e_Funded;
}
public void setE_Funded(String e_Funded) {
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
public String getE_Endtime() {
	return e_Endtime;
}
public void setE_Endtime(String e_Endtime) {
	this.e_Endtime = e_Endtime;
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
public String getA_Image() {
	return a_Image;
}
public void setA_Image(String a_Image) {
	this.a_Image = a_Image;
}
public String getC_Image() {
	//  Auto-generated method stub
	return c_Image;
}
public void setC_Image(String c_Image) {
	this.c_Image = c_Image;
}
public String getE_Image() {
	return e_Image;
}
public void setE_Image(String e_Image) {
	this.e_Image = e_Image;
}
public String getSearch_Name() {
	return Search_Name;
}
public void setSearch_Name(String Search_Name) {
	this.Search_Name = Search_Name;
}
public String getSearch_Time1() {
	return Search_Time1;
}
public void setSearch_Time1(String Search_Time1) {
	this.Search_Time1 = Search_Time1;
}
public String getSearch_Time2() {
	return Search_Time2;
}
public void setSearch_Time2(String Search_Time2) {
	this.Search_Time2 = Search_Time2;
}
public boolean isSearch_Conference() {
	return Search_Conference;
}
public void setSearch_Conference(boolean Search_Conference) {
	this.Search_Conference = Search_Conference;
}
public boolean isSearch_AcademicTeamwork() {
	return Search_AcademicTeamwork;
}
public void setSearch_AcademicTeamwork(boolean Search_AcademicTeamwork) {
	this.Search_AcademicTeamwork = Search_AcademicTeamwork;
}
public boolean isSearch_Exchange() {
	return Search_Exchange;
}
public void setSearch_Exchange(boolean Search_Exchange) {
	this.Search_Exchange = Search_Exchange;
}
public ArrayList<String> getList_c() {
	return list_c;
}
public void setList_c(ArrayList<String> list_c) {
	this.list_c = list_c;
}
public ArrayList<String> getList_a() {
	return list_a;
}
public void setList_a(ArrayList<String> list_a) {
	this.list_a = list_a;
}
public ArrayList<String> getList_e() {
	return list_e;
}
public void setList_e(ArrayList<String> list_e) {
	this.list_e = list_e;
}





public File getFile1()
{
    return file1;
}

public void setFile1(File file1)
{
    this.file1 = file1;
}
public String getFile1FileName()
{
    return file1FileName;
}

public void setFile1FileName(String file1FileName)
{
    this.file1FileName = file1FileName;
}

public String getFile1ContentType()
{
    return file1ContentType;
}

public void setFile1ContentType(String file1ContentType)
{
    this.file1ContentType = file1ContentType;
}

public File getFile2()
{
    return file2;
}

public void setFile2(File file2)
{
    this.file2 = file2;
}
public String getFile2FileName()
{
    return file2FileName;
}

public void setFile2FileName(String file2FileName)
{
    this.file2FileName = file2FileName;
}

public String getFile2ContentType()
{
    return file2ContentType;
}

public void setFile2ContentType(String file2ContentType)
{
    this.file2ContentType = file2ContentType;
}
public List<File> getPic() {
	return Pic;
}
public void setPic(List<File> Pic) {
	this.Pic = Pic;
}
public List<String> getPicFileName() {
	return PicFileName;
}
public void setPicFileName(List<String> PicFileName) {
	this.PicFileName = PicFileName;
}
public List<String> getPicContentType() {
	return PicContentType;
}
public void setPicContentType(List<String> PicContentType) {
	this.PicContentType = PicContentType;
}
public String getO_Title1() {
	return o_Title1;
}
public void setO_Title1(String o_Title1) {
	this.o_Title1 = o_Title1;
}
public String getO_StartTime() {
	return o_StartTime;
}
public void setO_StartTime(String o_StartTime) {
	this.o_StartTime = o_StartTime;
}
public String getO_Position() {
	return o_Position;
}
public void setO_Position(String o_Position) {
	this.o_Position = o_Position;
}
public String getO_Kind() {
	return o_Kind;
}
public void setO_Kind(String o_Kind) {
	this.o_Kind = o_Kind;
}
public String getO_Content1() {
	return o_Content1;
}
public void setO_Content1(String o_Content1) {
	this.o_Content1 = o_Content1;
}
public boolean isO_End() {
	return o_End;
}
public void setO_End(boolean o_End) {
	this.o_End = o_End;
}
public String getO_Title2() {
	return o_Title2;
}
public void setO_Title2(String o_Title2) {
	this.o_Title2 = o_Title2;
}
public String getO_Endtime() {
	return o_Endtime;
}
public void setO_Endtime(String o_Endtime) {
	this.o_Endtime = o_Endtime;
}
public String getO_Content2() {
	return o_Content2;
}
public void setO_Content2(String o_Content2) {
	this.o_Content2 = o_Content2;
}
public String getO_Image() {
	return o_Image;
}
public void setO_Image(String o_Image) {
	this.o_Image = o_Image;
}
public boolean isOthers() {
	return Others;
}
public void setOthers(boolean others) {
	Others = others;
}
public boolean isSearch_Others() {
	return Search_Others;
}
public void setSearch_Others(boolean Search_Others) {
	this.Search_Others = Search_Others;
}

}



