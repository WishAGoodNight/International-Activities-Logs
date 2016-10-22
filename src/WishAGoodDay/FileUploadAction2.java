package WishAGoodDay;
import java.io.*;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
public class FileUploadAction2 extends ActionSupport {
    public static String LOCATION="/home/sion/eclipse/workplace/International_Activity_Logs/WebContent/Pictures/";
  //if windows, uses \\
    public static String Seperator="/";
    public static String execute1(List<File> file, List<String> fileFileName,List<String> fileContentType) throws Exception
    {
        String root = ServletActionContext.getServletContext().getRealPath("/");
        String path="";
        for(int i = 0; i < file.size(); i++)
        {
        	int len=fileFileName.get(i).length();
        	String after=fileFileName.get(i).substring(len-4,len);
        	if(!after.equals(".jpg")&&!after.equals(".gif")&&!after.equals(".png")&&!after.equals(".bmp"))
        		continue;
        	System.out.println(after);
            InputStream is = new FileInputStream(file.get(i));
            String fileFileNametemp=fileFileName.get(i);
            File fs = new File(LOCATION, fileFileNametemp);
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
            		fileFileNametemp =  "1"+fileFileNametemp;
            		fs = new File(LOCATION, fileFileNametemp);
            	}
            }
            OutputStream os = new FileOutputStream(fs);  
            
            byte[] buffer = new byte[500];
            
            @SuppressWarnings("unused")
            int length = 0;
            
            while(-1 != (length = is.read(buffer, 0, buffer.length)))
            {
                os.write(buffer);
            }
            //   ///作为区分符号
            path=path+"Pictures/"+fileFileNametemp+"///";
            os.close();
            is.close();
        }
        System.out.println(path);
        return path;
    }

}
