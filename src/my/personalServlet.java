 package my;  
import javax.servlet.*;  
import javax.servlet.http.*;  

import java.io.*;  
import java.util.*;  

import org.apache.commons.beanutils.BeanUtils;  

import com.util.DBUtil;
      
    public class personalServlet extends HttpServlet   
    {    
      protected void doGet(HttpServletRequest request,HttpServletResponse response)  
                             throws ServletException,java.io.IOException  
       {  
          
    	  request.setCharacterEncoding("UTF-8");
    	  String cuname = request.getParameter("cuname"); 
    	  request.setCharacterEncoding("UTF-8");
    	  String cupass = request.getParameter("cupass");
    	  request.setCharacterEncoding("UTF-8");
    	  String cuphone = request.getParameter("cuphone");
    	  request.setCharacterEncoding("UTF-8");
    	  String cumail = request.getParameter("cumail");
    	  String sename = (String)request.getSession().getAttribute("userName");
    	  System.out.println(sename);
          personal form=new personal();  
          form.setcuname(cuname);
          form.setcupass(cupass);
          form.setcuphone(cuphone);
          form.setcumail(cumail);
          
          DBUtil db = new DBUtil();//构建数据库对象
          boolean pan=db.cuser(form);
          if(pan)
          {
          String script = "<script> alert('修改个人信息成功!');location.href='personal.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
          }
          else
          {
              String script = "<script> alert('修改失败，姓名密码不得为空！');location.href='personal.jsp'</script>";
    			 response.setContentType("text/html;charset=UTF-8"); 
    			 response.getWriter().println(script);
          }
      
       }
            
    protected void doPost(HttpServletRequest request,HttpServletResponse response)  
                                    throws ServletException,java.io.IOException  
      {  
           doGet(request,response);  
        }  
    }  