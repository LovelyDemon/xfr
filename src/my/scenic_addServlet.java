 package my;  
import javax.servlet.*;  
import javax.servlet.http.*;  

import java.io.*;  
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;  

import org.apache.commons.beanutils.BeanUtils;  
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.util.DBUtil;
      
    public class scenic_addServlet extends HttpServlet   
    {    
    	
    	 boolean bInited = false;
    	 //加载驱动
    	 public void initJDBC() throws ClassNotFoundException {
    	 //加载MYSQL JDBC驱动程序
    	 Class.forName("com.mysql.jdbc.Driver");
    	 bInited = true;
    	 System.out.println("Success loading Mysql Driver!");
    	 }
    	 
    	 public Connection getConnection() throws ClassNotFoundException,
    	 SQLException{
    	 if(!bInited){
    	 initJDBC();
    	 }
    	 //连接URL为 jdbc:mysql//服务器地址/数据库名
    	 //后面的2个参数分别是登陆用户名和密码
    	 Connection conn = DriverManager.getConnection(
    	 "jdbc:mysql://localhost:3306/zhly","root","838943723");
    	 return conn;
    	 }
      protected void doGet(HttpServletRequest request,HttpServletResponse response)  
                             throws ServletException,java.io.IOException  
       {  
          
  		String  path = request.getContextPath();		
  		DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
  		ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
  		servletFileUpload.setFileSizeMax(3*1024*1024);//单个文件大小限制3M
  		servletFileUpload.setSizeMax(6*1024*1024);//上传文件总大小
  		
  		
  		List<FileItem> list = null;	
  		int i=1;
  		List<Object> params = new ArrayList<Object>();
  		
  		
  		
  		try {
  			//解析request的请求
  			list = servletFileUpload.parseRequest(request);	
  			scenic_add form=new scenic_add(); 
  			form.setscid(getnum());
  			int ii=1;
  			//取出所有表单的值，判断非文本字段和文本字段
  			for(FileItem fileItem : list){
  				
  				if (fileItem.isFormField()) {//是文本字段
  					String fileItemName = fileItem.getFieldName(); //获取 <input>控件的 名称
  					String fileItemValue = fileItem.getString("utf-8");//获取<input>控件的值
  					
  					if (fileItemName.equals("scname")) {
  						form.setscname(fileItemValue); //参数传入 proname
  					}else if (fileItemName.equals("sclocal")) {
  						form.setsclocal(fileItemValue);//参数传入 proprice
  					}else if (fileItemName.equals("scprice")) {
  						form.setscprice(fileItemValue);////参数传入 proaddress
  					}else if (fileItemName.equals("scjs")) {
  						form.setscjs(fileItemValue);////参数传入 proaddress
  					}else if (fileItemName.equals("sctj")) {
  						form.setsctj(fileItemValue);////参数传入 proaddress
  					}
  					
  				}else{ //非文本字段					
  					
  					String imageName = fileItem.getName(); //获取文件名称
  					
  					if(ii==1)
  					{form.setscpic1(imageName);		}	
  					if(ii==2)
  					{form.setscpic2(imageName);		}	
  					if(ii==3)
  					{form.setscpic3(imageName);		}	
  					if(ii==4)
  					{form.setscpic4(imageName);		}	
  					//String path = request.getRealPath("/upload");
  					String upload_dir = request.getServletContext().getRealPath("/upload");//获取服务器端 /upload 路径
  					File uploadFile = new File(upload_dir+"/"+imageName);
  					System.out.println("---upload_dir--->>"+uploadFile);
  					fileItem.write(uploadFile);		
  					ii++;
  				}				
  			}
  			
  			DBUtil db = new DBUtil();//构建数据库对象
            String pan=db.adscenic(form);
            if(pan=="a")
            {
          	  
          		  String script = "<script> alert('添加景点成功!');location.href='scenic_main.jsp'</script>";
          		  response.setContentType("text/html;charset=UTF-8"); 
          		  response.getWriter().println(script);
          	  }
          	  if(pan=="b")
          	  {
          		  String script = "<script> alert('修改已有景点成功!');location.href='scenic_main.jsp'</script>";
          		  response.setContentType("text/html;charset=UTF-8"); 
          		  response.getWriter().println(script);
          	  }
          	  if(pan=="c")
          	  {
          		  String script = "<script> alert('修改已有景点信息失败，请输入全部内容!');location.href='scenic_main.jsp'</script>";
          		  response.setContentType("text/html;charset=UTF-8"); 
          		  response.getWriter().println(script);
          	  }
            else
            {
                String script = "<script> alert('添加失败，请输入全部内容！');location.href='scenic_add.jsp'</script>";
      			 response.setContentType("text/html;charset=UTF-8"); 
      			 response.getWriter().println(script);
            }
        
         }
  		 catch (Exception e) {
 			// TODO: handle exception
 			e.printStackTrace();
 		}
 		
         }
        
      public int getnum(){  //添加新闻

  		System.out.println(" haha!");

  		 Connection conne = null;
  		 Statement stmtt = null;
  		 ResultSet rss = null;
  		 
  		 int hid=1;
  		try{
  		 conne = getConnection();
  		 stmtt = conne.createStatement();
  		 System.out.println(" heihei!");
  		 rss = stmtt.executeQuery("SELECT * FROM news");
  		 while(rss.next()){
  			 System.out.println(" hi!");
  		 hid=rss.getInt("neid");
  		 
  		 }
  	     ++hid;

  		 }
  		catch (ClassNotFoundException e) {
  		 e.printStackTrace();
  		 }catch (SQLException e) {
  		 e.printStackTrace();
  		 }
  		return hid;

  		 }
 
      
      
    protected void doPost(HttpServletRequest request,HttpServletResponse response)  
                                    throws ServletException,java.io.IOException  
      {  
           doGet(request,response);  
        }  
    }  