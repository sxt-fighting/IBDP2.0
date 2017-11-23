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
	<form class="form-horizontal" role="form" action="BP" name="BPForm" id="BPForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>BP神经网络</h2></center></legend>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="formula">预测函数 </label>

										<div class="col-sm-9">
											<input type="text" id="formula" name="formula" placeholder="请遵照预测函数说明方法填写，不要包含中文字符"  class="col-xs-10 col-sm-5" required="true"/>
											
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="size">隐藏层神经元数量 </label>

										<div class="col-sm-9">
											<input type="text" id="size" name="size" placeholder=""  class="col-xs-10 col-sm-5" required="true"/>
											
										</div>
							</div>
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="maxit">最大迭代次数 </label>

								<div class="col-sm-9">
								<input type="text" id="maxit" name="maxit" placeholder="默认为100"  class="col-xs-10 col-sm-5" required="true"/>
								
								</div>
							</div>
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"  for="Statistics_file">上传训练数据集</label>
		     						<div class="col-sm-9">
									<input type="file" id="datafile" name="datafile" required="true" class="col-xs-10 col-sm-5" />
									<span class="help-inline col-xs-12 col-sm-7">
												<label class="middle">
													<input class="ace" type="checkbox" id="id-disable-check" name="hasheader" value="has"/>
													<span class="lbl"> <font color="red">是否包含表头! </font></span>
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
											BP神经网络
										</h3>

										<div id="accordion" class="accordion-style2">
											<div class="group">
												<h3 class="accordion-header">BP神经网络</h3>
												<div>
												<img src="img/BP.png" alt="图片加载失败"/>
												<p>
												BP神经网络是一种按照误差传播算法训练的多层前馈网络，主要用于分类。BP算法，它的基本思想是梯度下降法，利用梯度搜索技术，以期使网络的实际输出值和期望输出值的误差均方差为最小。
												</p>
												</div>
											</div>
											<div class="group">
												<h3 class="accordion-header">预测函数书写方法说明</h3>

												<div>
													<p>
														预测函数即指定的模型形式。例如在人违约（Z）与教育（X）和收入（Y）有关,那预测函数可以写作<pre>Z ~ X+Y</pre>
													</p>
													<p><font color="red" size="3">预测函数中请不要包含中文文字或字符！</font></p>
													<table class="table table-bordered">
  													<caption>函数符号说明</caption>
  												  <thead>
                                                  <tr>
                                                   <th>符号</th>
                                                   <th>用途</th>
   													 </tr>
												  </thead>
												  <tbody>
												    <tr>
												      <td>~</td>
												      <td>分隔符号，左边为反应变量，右边为预测变量。例如，要通过x、z和w预测y，代码为y ~ x + z + w</td>												      
												    </tr>
												    <tr>
												      <td>+</td>
												      <td>分隔预测变量</td>												      
												    </tr>
												    <tr>
												      <td>:</td>
												      <td>分隔预测变量表示预测变量的交互项。例如，要通过x、z及x与z的交互项预测y，代码为y ~ x + z + x:z</td>												      
												    </tr>
												    <tr>
												      <td>*</td>
												      <td>表示所有可能交互项的简洁方式。代码y~ x * z * w可展开为y ~ x + z + w + x:z + x:w + z:w + x:z:w</td>												      
												    </tr>
												    </tbody>
												    </table>
												</div>
											</div>
												<div class="group">
												<h3 class="accordion-header">预测结果解释</h3>

												<div>
													<p>
														预测结果信息主要包括残差（Residuals），系数（Coefficients），剩余标准差（Residual standard error），拟合优度（Multiple R-squared），修正的拟合优度（Adjusted R-squared），F统计量（F-statistic）.
														<br>Estimate Std. Error t value Pr(>|t|) 分别对应估值，标准误差，T值，P值。													
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