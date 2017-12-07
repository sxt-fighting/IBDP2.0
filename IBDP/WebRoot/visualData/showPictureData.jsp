<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sdu.entity.DataNew"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	//String selname = (String)request.getAttribute("selname");
	String filename = (String)request.getAttribute("filename");
%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <body>

<div style="width:100%;height:680px;">
  	
  	
  	<div id="showPicture" style="width:100%;margin:20px auto;display: flex;
  justify-content: center;
  align-items: center;  ">
									
  		<img src="/user/<%=filename %>" />
 	 </div>
  	
</div>	

</body> 	
</html>	 
