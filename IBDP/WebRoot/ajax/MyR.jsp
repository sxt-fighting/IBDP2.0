<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xs-12">
	<form class="form-horizontal" role="form" action="MyRprocedure" name="Statisticform" method="post" enctype="multipart/form-data" onsubmit="return checkR()">
	<legend ><center><h2>运行R程序</h2></center></legend>
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="Statistics_file">上传R程序包</label>
		    
									    <div class="col-sm-9">
											<input type="file" name="Rfile" id="Rfile" id="id-input-file-2"  required="true" />
										</div>
									</div>

		
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="Statistics_file">上传数据文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="Rdatafile" name="Rdatafile" />
									</div>
									</div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> 备注信息</label>

										<div class="col-sm-9">
											<input readonly="" type="text" id="form-field-1-1" placeholder="程序自动设置工作路径（workspace）为服务器路径，请勿重新设置工作路径（setwd）！" class="form-control" />
										</div>
									</div>
								
									
									
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="submit" value="提交">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Submit
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" value="重置">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Reset
											</button>
										</div>
									
</form>
 </div>
