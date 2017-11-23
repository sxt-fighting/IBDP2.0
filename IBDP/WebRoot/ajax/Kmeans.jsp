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
	<form class="form-horizontal" role="form" action="Kmeans" name="KmeansForm" id="KmeansForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>K-means聚类</h2></center></legend>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="number">聚类数目</label>

										<div class="col-sm-9">
											<input type="text" id="number" name="number" placeholder="请设置 所要聚类的数目"  class="col-xs-10 col-sm-5" required="true"/>
											
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="MaxIter">最大迭代次数</label>

										<div class="col-sm-9">
											<input type="text" id="MaxIter" name="MaxIter" placeholder="最大迭代次数默认为10"  class="col-xs-10 col-sm-5" />
											
										</div>
							</div>
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="Statistics_file">上传文件</label>
		     						<div class="col-sm-9">
									<input type="file" id="datafile" name="datafile" required="true" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" id="id-disable-check" name="hasheader" value="has"/>
													<span class="lbl"><font color="red"> 是否包含表头!</font></span>
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
											K-means聚类
										</h3>

										<div id="accordion" class="accordion-style2">
											<div class="group">
												<h3 class="accordion-header">K-means算法</h3>
												<div>
												
												<p>
												 K-means算法是典型的基于距离的非层次聚类算法，在最小化误差函数的基础上划分为预定的类数k，采用距离作为相似性的评价指标
												， 即认为两个对象的距离越近，其相似度也越大。 <br>
												缺点：不能处理分类数据，易受异常值影响
												</p>
												</div>
											</div>
											<div class="group">
												<h3 class="accordion-header">分类结果解释</h3>

												<div>
													<p>
														运行结果信息中包含每个类所包含的点数（size），以及每个类中对应属性的平均值（Cluster means），以及最重要的是
														每条记录所属于的类别（Clustering vector）。
														<br>结果中的图片是将高维数据投影到二维，并对不同的类赋予不同的颜色。													
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