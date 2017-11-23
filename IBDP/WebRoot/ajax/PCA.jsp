<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xs-12">
	<form class="form-horizontal" role="form" action="PCAAction" name="PCAform" method="post" enctype="multipart/form-data" onsubmit="return mysubmitcheck()">
	<legend ><center><h2>主成分分析</h2></center></legend>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="PCAcolumn">分析列号 </label>

										<div class="col-sm-9">
											<input type="text" id="PCAcolumn" name="PCAcolumn" placeholder="输入所需分析的列号"  class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" id="id-disable-check" name="hasheader" value="has"/>
													<span class="lbl"> 是否包含表头!</span>
												</label>
											</span>
										</div>
									</div>

									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="PCAfile">上传文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="PCAfile" name="PCAfile" required="true" />
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