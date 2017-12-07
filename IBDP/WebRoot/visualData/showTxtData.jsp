<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sdu.entity.DataNew"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	//String selname = (String)request.getAttribute("selname");
//	String colNum = (String)request.getAttribute("colNum");
%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

 											 

	<div style="text-align: center;width:100%;height:660px;">
		<div style="text-align: left;border: 2px solid;border-color: rgba(175,175,175,0.16);width: 90%;text-align: left;margin:20px auto;padding: 10px 30px;background-color: #eff3f8;">
			<c:forEach var="dataVO" items="${dataList }" varStatus="indexStatus">
				<c:forEach var="str" items="${dataVO.data }" varStatus="indexStatustd">
					${str }<br>
				</c:forEach>
			</c:forEach>
		</div>
	</div>

								           
  

