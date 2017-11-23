<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div >
<center>
			<s:form id="workform" action="doworkAction" method="post" name="workform" cssStyle="margin-top:10px" enctype="multipart/form-data" onsubmit="return mysubmitcheck()">
			<table>			
			<tr><s:select label="选择相关性系数"  name="chosework" list="{'pearson相关系数','kendall系数','spearman系数'}"  cssStyle="width:230px"></s:select></tr>
			<tr><s:file name="uploadFile" required="true"  label="上传需要计算相关性的文件" /></tr>
		   <tr><s:textfield label="选择需要计算相关性的对应列" name="chosecolumn" class="chosecolumn" cssStyle="width:230px"/> </tr>
		    <tr></tr>
		    <tr><td><s:submit  value="提交" theme ="simple" class="btn btn-default" cssStyle="float:left; width:60px" /></td><td><a data-toggle="modal" data-target="#myModal" style="float:left; width:100px" >
	填写细节说明
</a></td><td> <s:reset  value="重置" theme="simple" cssStyle="float:right; width:60px"/></td></tr> 
			</table>
			</s:form>


	</center>
	</div>