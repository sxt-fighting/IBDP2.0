<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>算法库</title>
    <sx:head />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="css/example.css" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/colorbox.min.css" />
       <!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->
		
		<script src="assets/js/ace-extra.min.js"></script>
		
        <script type="text/javascript" src="Myjs/check.js"></script>
        <!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
  </head>
  
  
  <body class="no-skin" ng-app="algorithm">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
					<div class="main-container ace-save-state" id="main-container">
 			<script type="text/javascript">
 				try{ace.settings.loadState('main-container')}catch(e){}
			</script> 

			<div  class="main-content">
				<!-- <div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="ModelLibrary.jsp">算法库</a>
							</li>
						</ul>/.breadcrumb
					</div>
				</div> -->
				<div class="page-content">
					<div class="content-wrapper">
					<div class="container" style="align:center;width:85%">
					
						<div  id="page-wrapper"  ng-controller="ACtrl" >
							<div id="page-inner">
								<div class="row">
									<div class="col-md-12">
										<div class="panel panel-default">
											<div class="panel-heading" style="height: 50px" align="center"><h4 class="widget-title lighter" style="vertical-align: middle">算法库</h4></div>
											<div class="panel-body">
												<div class="table-responsive">
													<div id="dataTables-ModelLibrary_wrapper" class="dataTables_wrapper form-inline" role="grid">
														<div class="row">
															<table class="table table-striped table-bordered table-hover">
																<tr>
																	<td align="center" style="vertical-align: middle">Classification [Predictive]分类</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">线性回归算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#linear" >算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">logistic算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#logistic">算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">决策树算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#tree" >算法详情介绍</button>
																				</td>																		
																			</tr>
																			<tr>
																				<td style="width: 40%">人工神经网络（BP）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#BP" >算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">朴素贝叶斯分类器（NaiveBayes）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#NaiveBayes" >算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">K近邻（KNN）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#KNN" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">支持向量机（SVM）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#SVM" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle">Clustering [Descriptive] 聚类</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">k-均值聚类模型（k-means）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#k-means" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">k-中心点聚类模型（PAM）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#PAM" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">密度聚类模型（DBSCAN）算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#DBSCAN" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">分层聚类算法</td>
																				<td style="width: 60%">
																					<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#hierarchical_cluster" ng-click="()">算法详情介绍</button>
																				</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle">Association Rule Discovery [Descriptive]关联规则发现</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">logistic算法</td>
																				<td style="width: 60%">logistic算法介绍</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">决策树</td>
																				<td style="width: 60%">决策树算法介绍</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle">Sequential Pattern Discovery [Descriptive] 时序模式发现</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">logistic算法</td>
																				<td style="width: 60%">logistic算法介绍</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">决策树</td>
																				<td style="width: 60%">决策树算法介绍</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle">Regression [Predictive]回归</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">logistic算法</td>
																				<td style="width: 60%">logistic算法介绍</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">决策树</td>
																				<td style="width: 60%">决策树算法介绍</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle">Deviation Detection [Predictive] 偏差检测</td>
																	<td align="center" style="vertical-align: middle">
																		<table class="table table-striped table-bordered table-hover">
																			<tr>
																				<td style="width: 40%">logistic算法</td>
																				<td style="width: 60%">logistic算法介绍</td>
																			</tr>
																			<tr>
																				<td style="width: 40%">决策树</td>
																				<td style="width: 60%">决策树算法介绍</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
															</table>
														</div>
														
														
														<!-- 线性回归模态框 -->
														<div class="modal fade" id="linear" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">线性回归</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>线性回归分类</h3>
																		<div>
																			<p>
																				本平台对于线性回归中的简单线性、多项式线性以及多元线性都已实现，清遵守相应的标准来完成预测公式.
																			</p>

																			<ul>
																				<li>简单线性：用一个量化的解释变量预测一个量化的响应变量</li>
																				<li>多项式：用一个量化的解释变量预测一个量化的响应变量，模型的关系是n阶多项式</li>
																				<li>多元线性：用两个或多个量化的解释变量预测一个量化的响应变量</li>	
																			</ul>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<h3>预测函数书写方法说明</h3>
									
																		<div class="col-sm-12">
																			<p>
																				预测函数即指定的模型形式。例如在Z的分类与X和Y有关,那建模函数可以写作</p><pre>Z ~ X+Y</pre>
																			<p></p>
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
																	<div class="col-sm-12">																			
																		<h3>预测结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				预测结果信息主要包括残差（Residuals），系数（Coefficients），剩余标准差（Residual standard error），拟合优度（Multiple R-squared），修正的拟合优度（Adjusted R-squared），F统计量（F-statistic）.
																				<br>Estimate Std. Error t value Pr(&gt;|t|) 分别对应估值，标准误差，T值，P值。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>
														
														<!-- logistic模态框 -->
														<div class="modal fade" id="logistic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">Logistic回归</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>Logistic函数</h3>
																		<div>
																			<img src="img/Logistic.png" alt="图片加载失败">
																			<p>
												 								Logistic回归属于概率型非线性回归，因变量只有1-0（如是否，发生和不发生）两种取值，这里的假设有p个独立变量X1,X2,...Xp作用下，记y取1的概率为p，取0概率为1-p.
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<h3>预测函数书写方法说明</h3>
									
																		<div class="col-sm-12">
																			<p>
																				预测函数即指定的模型形式。例如在Z的分类与X和Y有关,那建模函数可以写作</p><pre>Z ~ X+Y</pre>
																			<p></p>
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
																	<div class="col-sm-12">																			
																		<h3>预测结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				预测结果信息主要包括残差（Residuals），系数（Coefficients），剩余标准差（Residual standard error），拟合优度（Multiple R-squared），修正的拟合优度（Adjusted R-squared），F统计量（F-statistic）.
																				<br>Estimate Std. Error t value Pr(&gt;|t|) 分别对应估值，标准误差，T值，P值。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>	
														
															
														<!-- 决策树模态框 -->
														<div class="modal fade" id="tree" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">决策树（Decision Tree）</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>决策树</h3>
																		<div>
																			<p>
																				决策树是一种树形结构，他的每一个叶节点对应着一个分类，非叶节点代表某个属性上的划分，根据样本在该属性上的不同取值划分为若干个子集。
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<h3>预测函数书写方法说明</h3>
									
																		<div class="col-sm-12">
																			<p>
																				预测函数即指定的模型形式。例如在Z的分类与X和Y有关,那建模函数可以写作</p><pre>Z ~ X+Y</pre>
																			<p></p>
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
																	<div class="col-sm-12">																			
																		<h3>预测结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				预测结果信息主要包括残差（Residuals），系数（Coefficients），剩余标准差（Residual standard error），拟合优度（Multiple R-squared），修正的拟合优度（Adjusted R-squared），F统计量（F-statistic）.
																				<br>Estimate Std. Error t value Pr(&gt;|t|) 分别对应估值，标准误差，T值，P值。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>
														
														
														<!-- 人工神经网络模态框 -->
														<div class="modal fade" id="BP" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														        	<div class="col-sm-12">
																		<h3 class="header blue lighter smaller">BP神经网络</h3>
																	</div>
														            <div class="col-sm-12">
																		<h3>BP神经网络</h3>
																		<div>
																			<img src="img/BP.png" alt="图片加载失败">
																			<p>
																			BP神经网络是一种按照误差传播算法训练的多层前馈网络，主要用于分类。BP算法，它的基本思想是梯度下降法，利用梯度搜索技术，以期使网络的实际输出值和期望输出值的误差均方差为最小。
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<h3>预测函数书写方法说明</h3>

																		<div>
																			<p>
																				预测函数即指定的模型形式。例如在人违约（Z）与教育（X）和收入（Y）有关,那预测函数可以写作</p><pre>Z ~ X+Y</pre>
																			<p></p>
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
																	<div class="col-sm-12">
																		<h3>预测结果解释</h3>
																		<div>
																			<p>
																				预测结果信息主要包括残差（Residuals），系数（Coefficients），剩余标准差（Residual standard error），拟合优度（Multiple R-squared），修正的拟合优度（Adjusted R-squared），F统计量（F-statistic）.
																				<br>Estimate Std. Error t value Pr(&gt;|t|) 分别对应估值，标准误差，T值，P值。													
																			</p>	
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																</div>
														    </div>
														</div>
														
														
														<!-- k-均值聚类模型模态框 -->
														<div class="modal fade" id="k-means" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">K-means聚类</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>K-means算法</h3>
																		<div>
																			<p>
																				K-means算法是典型的基于距离的非层次聚类算法，在最小化误差函数的基础上划分为预定的类数k，采用距离作为相似性的评价指标， 即认为两个对象的距离越近，其相似度也越大。 <br>
																				缺点：不能处理分类数据，易受异常值影响
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>分类结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				运行结果信息中包含每个类所包含的点数（size），以及每个类中对应属性的平均值（Cluster means），以及最重要的是每条记录所属于的类别（Clustering vector）。<br>结果中的图片是将高维数据投影到二维，并对不同的类赋予不同的颜色。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>
														
														
														<!-- K-中心点聚类(PAM算法)模态框 -->
														<div class="modal fade" id="PAM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">K中心点聚类（K-medoids）-PAM算法</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>PAM</h3>
																		<div>
																			<p>
																				K-medoids是K-means的一种代替，把聚类中心作为聚类的均值，这个中心势聚类里的一个观测值，它类似于中位数，对异常值较稳健。
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>分类结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				运行结果信息中包含每个类所包含的点数（size），以及每个类中对应属性的平均值（Cluster means），以及最重要的是每条记录所属于的类别（Clustering vector）。<br>结果中的图片是将高维数据投影到二维，并对不同的类赋予不同的颜色。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>
														
											
														<!--  分层聚类模态框 -->
														<div class="modal fade" id="hierarchical_cluster" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller"> 分层聚类</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>分层聚类含义</h3>
																		<div>
																			<p>
																				分层聚类是指在类里面再聚类，并不需要像k-means和k-medoids那样预先设定聚类的树目。一个分层聚类 的结果可以想象成一棵树，显示为树状图。在树的顶端，是包含所有观测值的一个类，在树的底端每一个观测值都是一个完整的类，在中间是不同层次的类。
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>分类结果解释</h3>
																		<div class="col-sm-12">
																			<p>
																				运行结果信息中包含每个类所包含的点数（size），以及每个类中对应属性的平均值（Cluster means），以及最重要的是每条记录所属于的类别（Clustering vector）。<br>结果中的图片是将高维数据投影到二维，并对不同的类赋予不同的颜色。													
																			</p>
																		</div>
																	</div>
																	<div class="modal-footer">
                        												<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
                    												</div>		
																			
																</div>
														    </div>
														</div>
														
														
														   
    													
															
													</div>							
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
			
					</div>
				</div>	
						
					</div><!-- /.page-content -->
				
				
				
				
			</div><!-- /.main-content -->
			
			
				
			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">SDU</span>
							数据分析平台 &copy; 2017-2018
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>
				</div>
			</div>
	</body>
	<!--[if !IE]> -->
	<script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/angular.js"></script>
	<script src="assets/js/angular-route.js"></script>
	<script type="text/javascript">
		var algorithm=angular.module('algorithm', ['ngRoute']);
 		algorithm.controller('ACtrl', ['$scope', '$http', '$location', function ($scope, $http,  $location) {
	 		$scope.detail = function(){
	 		
            var d=$("#detailss");
            var s=$("#searchDelivery");
            
            console.log("dakaile"+'d=='+d);
        };
 		}]);
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			//$('#dataTables-ModelLibrary').dataTable();
		})
	</script>
</html>


    
