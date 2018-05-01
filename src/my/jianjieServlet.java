 package my;  
import javax.servlet.*;  
import javax.servlet.http.*;  

import java.io.*;  
import java.util.*;  

import org.apache.commons.beanutils.BeanUtils;  

import com.util.DBUtil;
      
    public class jianjieServlet extends HttpServlet   
    {    
      protected void doGet(HttpServletRequest request,HttpServletResponse response)  
                             throws ServletException,java.io.IOException  
       {  
          
    	  request.setCharacterEncoding("UTF-8");
    	  String jieshao = request.getParameter("jieshao"); 
    	  request.setCharacterEncoding("UTF-8");
    	  String wenhua = request.getParameter("wenhua");
    	  System.out.println(jieshao);
          jianjie form=new jianjie();  
          form.setJieshao(jieshao);
          form.setWenhua(wenhua);
          
          DBUtil db = new DBUtil();//构建数据库对象
          boolean pan=db.injianjie(form);
          if(pan)
          {
          String script = "<script> alert('修改成功!');location.href='jianjie.jsp'</script>";
			 response.setContentType("text/html;charset=UTF-8"); 
			 response.getWriter().println(script);
          }
          else
          {
              String script = "<script> alert('修改失败，请输入全部内容！');location.href='jianjie.jsp'</script>";
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