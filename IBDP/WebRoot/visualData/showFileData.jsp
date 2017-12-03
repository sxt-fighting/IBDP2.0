<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.sdu.datashow.utilis.DataNew"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
	
	//String selname = (String)request.getAttribute("selname");
	//String colNum = (String)request.getAttribute("colNum");
%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  

<div style="width:100%;height:680px;">
		<table id="dataTab">
			<c:forEach var="dataVO" items="${dataList }" varStatus="indexStatus">
				<tr class="dataTr" id="tr${indexStatus.index }" idvalue="${indexStatus.index }">
					
					<c:forEach var="str" items="${dataVO.data }" varStatus="indexStatustd">
					<td>
							<input type="text" name="text${indexStatus.index }${indexStatustd.index }" value="${str }" disabled/>
					</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
</div>
