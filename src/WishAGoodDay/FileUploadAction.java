package WishAGoodDay;
import java.io.*;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import WishAGoodDay.Log_Actions.*;
public class FileUploadAction extends ActionSupport
{

    

    public static String LOCATION="/home/sion/new eclipse/eclipse/workplace/IAL/WebContent/Files/";
  //if windows, uses \\
    public static String Seperator="/";



    
    
    public static String execute1(File file,String  fileFileName,String fileContentType) throws Exception
    {
        String root = ServletActionContext.getServletContext().getRealPath("/");
       // System.out.println(root);
        InputStream is = new FileInputStream(file);
        File fs = new File(LOCATION, fileFileName);
        while (true){
        	if(!fs.exists())    
        	{    
        		try {    
        			fs.createNewFile();    
        		} catch (IOException e) {    
        			// TODO Auto-generated catch block    
        			e.printStackTrace();    
        		}
        		break;
        	} else {
        		fileFileName =  "1"+fileFileName;
        		fs = new File(LOCATION, fileFileName);
        	}
        }
        
        
        OutputStream os = new FileOutputStream(fs);  
       
        byte[] buffer = new byte[1024];
        int length = 0;	        
        while(-1 != (length = is.read(buffer, 0, buffer.length)))
        {
            os.write(buffer);
        }
        os.close();
        is.close();    
        return "Files/"+fileFileName;
    }
}