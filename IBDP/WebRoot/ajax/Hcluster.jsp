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
	<form class="form-horizontal" role="form" action="Hcluster" name="HclusterForm" id="HclusterForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>分层聚类</h2></center></legend>
					
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="Metric">联结方法</label>

										<div class="col-sm-9">
											
											<select name="Metric" id="Metric" class="col-sm-6">
 											 <option value="average"  selected="selected">average</option>
 											 <option value="single">single</option>
 											 <option value="complete">complete</option>
 											 <option value="centroid">centroid</option>
 											 </select>
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="cutnumber"> 分割分层聚类数 </label>

										<div class="col-sm-9">
											<input disabled="disabled" type="text" class="col-xs-10 col-sm-5" id="cutnumber" name="cutnumber" value="默认不选择分割分层聚类结果!" />
											<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" name="cut" id="cut" />
													<span class="lbl"> 分割分层聚类</span>
												</label>
											</span>
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
											分层聚类
										</h3>

										<div id="accordion" class="accordion-style2">
											<div class="group">
												<h3 class="accordion-header">分层聚类含义</h3>
												<div>
												
												<p>
												分层聚类是指在类里面再聚类，并不需要像k-means和k-medoids那样预先设定聚类的树目。一个分层聚类
												的结果可以想象成一棵树，显示为树状图。在树的顶端，是包含所有观测值的一个类，在树的底端每一个观测值都是一个完整的类，在中间是不同层次的类。
												</p>
												</div>
											</div>
											<div class="group">
												<h3 class="accordion-header">分类结果解释</h3>

												<div>
													<p>
														结果中的图片是会将所有的记录按照不同的联结方法进行分层聚类。若选择了分割聚类数目，系统会自动将记录划分为对应数目的类，并用红线框出，文字中也会表明不用类别所包含的具体记录。													
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

<script type="text/javascript">
			jQuery(function($) {
				$('#cut').on('click', function() {
					var inp = $('#cutnumber').get(0);
					if(inp.hasAttribute('disabled')) {
						
						inp.removeAttribute('disabled');
						inp.value="";
					}
					else {
						inp.setAttribute('disabled' , 'disabled');
						
						inp.value="默认不选择分割分层聚类结果!";
					}
				});
				});
	</script>
</body>
</html>