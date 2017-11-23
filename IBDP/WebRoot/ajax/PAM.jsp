<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>basic</title>
    <sx:head />
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
  </head>
  <body>
<div class="col-xs-12">
	<form class="form-horizontal" role="form" action="PAM" name="PAMForm" id="PAMForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>K-中心点聚类(PAM算法)</h2></center></legend>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="number">聚类数目</label>

										<div class="col-sm-9">
											<input type="text" id="number" name="number" placeholder="请设置 所要聚类的数目"  class="col-xs-10 col-sm-5" required="true"/>
											
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="Metric">距离计算标准</label>

										<div class="col-sm-9">
											
											<select name="Metric" id="Metric">
 											 <option value="euclidean"  selected="selected">euclidean</option>
 											 <option value="manhattan">manhattan</option>
 											 </select>
										</div>
							</div>
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="datafile">上传文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="datafile" name="datafile" required="true" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" id="id-disable-check" name="hasheader" value="has"/>
													<span class="lbl"> 是否包含表头!</span>
												</label>
											</span>
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
								<div class="col-sm-12">
										<h3 class="header blue lighter smaller">
											<i class="ace-icon fa fa-list smaller-90"></i>
											K中心点聚类（K-medoids）-PAM算法
										</h3>

										<div id="accordion" class="accordion-style2">
											<div class="group">
												<h3 class="accordion-header">PAM</h3>
												<div>
												
												<p>
												 K-medoids是K-means的一种代替，把聚类中心作为聚类的均值，这个中心势聚类里的一个观测值，它类似于中位数，对异常值较稳健。
												</p>
												</div>
											</div>
											<div class="group">
												<h3 class="accordion-header">分类结果解释</h3>

												<div>
													<p>
														运行结果信息中包含以及每个类中对应属性的中心店（Medoids），以及最重要的是
														每条记录所属于的类别（Clustering vector）。
														<br>结果中的图片是结果的轮廓图，每一条线代表一个观测，多条线组成的组为一类。拟合好的观测值具有较长的正的线，同时，
														拟合不好的观测值具有较小或负的线。一个类的平均宽度意味着类聚的越好。													
													</p>
													
													
												</div>
											</div>
										</div><!-- #accordion -->
									</div><!-- ./span -->
							
 </div>
 
<script type="text/javascript">
jQuery(function($) {
			//console.log("aaaaaaaaa");
				jQuery(function($) {

//jquery accordion
				$( "#accordion" ).accordion({
					collapsible: true ,
					heightStyle: "content",
					animate: 250,
					header: ".accordion-header"
				}).sortable({
					axis: "y",
					handle: ".accordion-header",
					stop: function( event, ui ) {
						// IE doesn't register the blur when sorting
						// so trigger focusout handlers to remove .ui-state-focus
						ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
					}
				});

});
			});

 
</script>


</body>
</html>