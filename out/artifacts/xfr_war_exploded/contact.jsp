<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="my.personal"%>
<%@page import="com.util.DBUtil"%>
<jsp:include page="top.jsp" />
<body>

<jsp:include page="navigationBar.jsp"/>

<!--contact-->
<div class="contact">
	<div class="container">
		<h3>联系我们</h3>
	 <div class="contact-top">
		<div class="col-md-6 contact-top1">
		  <h4 > <b>尊敬的用户您好：</b></h4>
          <p class="text-contact"> 本网站是旨在提供XX地区旅游信息服务的品台。若您有需要咨询的问题，或对我们的服务有更好的要求或建议，您可以通过以下几种方式联系我们。</p>
		  <div class="contact-address">
		  	<div class="col-md-6 contact-address1">
			  	 <h5>XX地址</h5>
	             <p><b>XX旅游咨询处</b></p>
	             <p>XX省XX市</p>
	             <p>具体地址</p>	
		  	</div>
		  	<div class="col-md-6 contact-address1">
			  	  <h5>联系邮箱 </h5>
	             <p> <a href="malito:mail@demolink.org">1：XXX(at)163.com</a></p>
	             <p>2：<a href="malito:mail@demolink.org"> XXX(at)163.com</a></p>
		  	</div>
		  	<div class="clearfix"></div>
		  </div>
		  <div class="contact-address">
		  	<div class="col-md-6 contact-address1">
			  	 <h5 >联系电话： </h5>
	             <p>固定电话 : 021-111-1111</p>
	             <p>移动电话: +158 XXXX XXXX</p>
	        </div>
		  	<div class="clearfix"></div>
		  </div>
		</div>
		<div class="col-md-6 contact-right">
	
            <form action="contact" method=post>
               <div class="blog-list">
	     	<h4>站内消息</h4></div>
	     	
			   <input type="text" placeholder="您的邮箱" id="lxmail" name="lxmail">
			   <input type="text" placeholder="主题" id="lxsub" name="lxsub">
			   
			 
	           </label><textarea placeholder="欢迎您留下你的意见以及疑问，我们将尽快回复" id="lxnr" name="lxnr"></textarea>
	           <label class="hvr-sweep-to-right">
	            <input type="submit" value="提交">
			</form>
		</div>
		<div class="clearfix"> </div>
</div>
	</div>
	<div class="map">
	     <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3150859.767904157!2d-96.62081048651531!3d39.536794757966845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1408111832978"> </iframe>
	    </div>
</div>
<!--//contact-->
<!--footer-->
<jsp:include page="bottom.jsp" />
<!--//footer-->
</body>
</html>