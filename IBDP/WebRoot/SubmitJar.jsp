<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form  action="RunSpark" name="RunSparkForm" id="RunSparkForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>提交运行程序</h2></center></legend>
					
							
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="MainClass"> 主类名 </label>

										<div class="col-sm-9">
											<input  type="text" class="col-xs-10 col-sm-5" id="MainClass" name="MainClass" value="请包含包名，例如[PackagesName].[MainclassName]" />
											
										</div>
									</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="argument"> 其他参数 </label>

										<div class="col-sm-9">
											<input type="text" class="col-xs-10 col-sm-5" id="argument" name="argument" value="请以空格隔开！" />
											
										</div>
									</div>
				
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="jarfile">上传运行程序文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="jarfile" name="jarfile" required="true" class="col-xs-10 col-sm-5" />
				
									</div>
							</div>
									<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="datafile">上传数据文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="datafile" name="datafile" required="true" class="col-xs-10 col-sm-5" />
				
									</div>
							</div>
										<div class="col-md-offset-3 col-md-9">
											<button  class="btn btn-info" id="RgBtn"  type="submit" value="提交">
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
</body>
</html>