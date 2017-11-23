<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-xs-12">
	<form class="form-horizontal" role="form" action="Statistic" name="Statisticform" method="post" enctype="multipart/form-data" onsubmit="return mysubmitcheck()">
	<legend ><center><h2>统计量分析</h2></center></legend>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="Statistics_column">输入列号 </label>

										<div class="col-sm-9">
											<input type="text" id="Statistics_column" name="Statistics_column" placeholder="输入需要计算的列"  class="col-xs-10 col-sm-5" />
											<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" id="id-disable-check" name="hasheader" value="has"/>
													<span class="lbl"> 是否包含表头!</span>
												</label>
											</span>
										</div>
									</div>

								<!-- 	<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Full Length </label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1-1" placeholder="Text Field" class="form-control" />
										</div>
									</div>
								-->
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="Statistics_file">上传文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="Statistics_file" name="Statistics_file" required="true" />
									</div>
									</div>
									
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right">选择度量参数</label>

												<div class="col-sm-9">
												<div class="form-group">
												<div class="col-sm-3">
													<label>
														
              										 <input type="checkbox" name="Statistics_work" value="mean" class="ace">
														<span class="lbl"> 均值</span>
													</label>
												</div>
												<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="median" class="ace">
														<span class="lbl"> 中位数</span>
													</label>
												</div>

												<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="most" class="ace">
														<span class="lbl"> 众数	</span>
													</label>
												</div>
												<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="range" class="ace">
														<span class="lbl"> 极差</span>
													</label>
												</div>
												
												</div>
												<div class="form-group">
												<div class="col-sm-3">
													<label>
														<input type="checkbox"  name="Statistics_work" value="std" class="ace">
														<span class="lbl"> 标准差	</span>
													</label>
												</div>
												<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="variation" class="ace">
														<span class="lbl"> 变异系数</span>
													</label>
												</div>
												<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="quantile1" class="ace">
														<span class="lbl"> 1/4分位数</span>
													</label>
												</div>
													<div class="col-sm-3">
													<label>
														<input type="checkbox" name="Statistics_work" value="quantile3" class="ace">
														<span class="lbl"> 3/4分位数</span>
													</label>
												</div>
												</div>
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