<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.change.ProductfAction"%>
<%@page import="com.change.CompanionServiceImpl"%>
<%@page import="com.change.CompanionService"%>
<%@page import="com.util.DividePage"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Map<String,Object> map = (Map<String,Object>)request.getAttribute("productMap");
List<Map<String,Object>> list2 =(List<Map<String,Object>>) request.getAttribute("listpl");
// 获取 分页对象
DividePage dividePage = (DividePage) request.getAttribute("dividePage");
// 获取查询的关键词
String productName = (String) request.getAttribute("productName");
String a = (String)request.getSession().getAttribute("priiid");
System.out.println("jojojoj"+a);
if(list2==null){
	//第一次进news_ main.jsp页面，默认加载所有的新闻
	CompanionService service = new CompanionServiceImpl();
	int totalRecord = service.getplCount("");
	dividePage = new DividePage(10,totalRecord,1);
	int start = dividePage.fromIndex();
	int end = dividePage.toIndex();

	System.out.println(a);
	list2 = service.listpl(a, start, end);
}
%>
<jsp:include page="top.jsp" />
<script type="text/javascript">
	function first(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=list&prid="+getSelectedValue()+"&pageNum=1";
		
	}
	function next(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=list&ptid="+getSelectedValue()+"&pageNum=<%=dividePage.getCurrentPage()+1%>";		
	
	}
	function forward(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=list&prid="+getSelectedValue()+"&pageNum=<%=dividePage.getCurrentPage()-1%>";
		
	}
	function end(){
		
		window.location.href = "<%=path%>/ProductfAction?action_flag=list&prid="+getSelectedValue()+"&pageNum=<%=dividePage.getPageCount() %>";
			
	}
	
	function changePage(currentPage){
	
		window.location.href = "<%=path%>/ProductfAction?action_flag=list&prid="+getSelectedValue()+"&pageNum="+currentPage;
	
	}
	 
	 
	function selectAll(flag){
		
		var ids = document.getElementsByName("ids");
		for(var i = 0 ; i < ids.length ; i++){
			ids[i].checked = flag;
		}
	
	}
	
	function getSelectedCount(){
	
		var ids = document.getElementsByName("ids");
		var count = 0;
		for(var i = 0 ; i < ids.length ; i++)
		{
						
			ids[i].checked==true?count++:0;					
		}
		return count;
	
	}
	
	function del(){
	
		if(getSelectedCount()==0){
			
			alert("至少选择一个删除项！");
			return;
		
		}
		var th = document.form1;
		th.action="<%=path%>/NewsAction?action_flag=del";
		th.submit();		
		
	}
	
	function add(){
	
		var th = document.form1;
		th.action="<%=path%>/ProductfAction?action_flag=add&prid="+getSelectedValue();
		th.submit();		
		
	}
	
	function getSelectedValue(){
		var ids =  "<%=session.getAttribute("priiid")%>";
		return ids;
		
	}
	
	function view(){
	
		if(getSelectedCount()<1){
			
			alert("至少选择一个查看项！");
			return;
		
		}else if(getSelectedCount()>1){
			alert("只能选择一个查看项！");
			return;
		}
		
		var th = document.form1;
		th.action="<%=path%>/CompanionAction?action_flag=view&prid="+getSelectedValue();
		th.submit();		
	
	}
	
	
	</script>

<jsp:include page="navigationBar.jsp"/>

<!--blog-->
<div class="blog">
<div class="container">
<div class="future">
	    <h3>产品详情</h3>
<center>
	     <div class="blog-top">
	     
	        <img src="<%=path%>/upload/<%=map.get("prpic") %>" class="img-responsive" alt="images" style="height: 269px; width: 544px; "/>
	          <h4><%=map.get("prname") %></h4>
	         <h5>价格 : <%=map.get("prprice") %></h5>
	
	        <p><%=map.get("prjs") %></p>
	        <div class="links">
		  		  <ul class="blog-links">
		  			 </ul>
		  	   </div>
		  	  
		 </div> </center>
		 <!---->
			<div class="single-grid">
								<h5>评论</h5>
			
		 	 
	        <div class="media">
	       
	        
	          
	          
	          <ul class="career-start">
		<%
   			if(list2!=null && !list2.isEmpty()){  			
   				for(Map<String,Object> map2 :list2){
   				
   				%>
   				 <div class="media">
		          <div class="media-left">
		            
		            	<img class="media-object" src="images/av.png" alt="" />
		            
		          </div>
		          <div class="media-body">		     
		            <h4 class="media-heading" style="width: 123px; "><%=map2.get("uname")%></h4>			            
		              <p><%=map2.get("prplnr")%></p>
		              </div>
		        </div>
   				<%}
   			
   			
   			}else{%>
   			
   			<tr align="center">
   				
   				<td></td>
   			
   			</tr><%
   			
   			}   			
   			 %>
		 	</ul>
	          
	          
	        </div>
		</div>
		<!---->
		<center>
 	<tr style=" text-align: center; width: 733px" >
   		<td colspan="4" align="center">
   			共<%=dividePage.getPageCount()  %>页    
   			<a href="javascript:first();">首页</a>   
   			<a href="javascript:forward();">上一页</a> 
   			<a href="javascript:next();">下一页</a> 
   			<a href="javascript:end();">尾页</a> 
   			跳转到<select name="select" onchange="changePage(this.value)">
   			
   			<%
   			int pageCount = dividePage.getPageCount();
   			if(pageCount>0){
   			for(int i = 1 ; i<=pageCount;i++){%>
   			
   			<option value="<%=i %>" <%= (i==dividePage.getCurrentPage()?"selected":"")%>>  <%=i %>
   			</option>
   			
   			<%			
   			}
   			
   			}else{// 无记录
   				%>
   				<option value="1">1</option>   
   			 <%}			
   			
   			%>
   					
   			</select>
   		
   		</td>
   	</tr></center>
		<div class="leave">
			<h5>发表评论</h5>
			<form form name="form1" action="" method="post">
			   
			   <textarea  placeholder="评论" name="prplnr" id="prplnr"></textarea>
			   <label class="hvr-sweep-to-right">
				<input type="submit"  value="提交" onclick="javascript:add();"></input>
	           
	           </label>
			</form>
			</div>
	</div>
</div>
</div>

<!--//blog-->
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>