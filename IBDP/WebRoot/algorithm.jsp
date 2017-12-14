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
		<link href="assets/css/docs.min.css" rel="stylesheet">
	
		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/colorbox.min.css" />
	      <!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
	
		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
	
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		
		<script src="assets/js/ace-extra.min.js"></script>
		
	    <script type="text/javascript" src="Myjs/check.js"></script>
	    
	    <style type="text/css">
	    
	    </style>

	</head>


	<body class="no-skin">
		<%@include file="template.jsp" %>
		<%@include file="top_menu.jsp" %>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script> 
			<div>&nbsp;</div>
			<div class="main-content">
				<div class="page-content">
					<div class="content-wrapper">
						<div class="container" style="align:center;width:85%">
	

							<div  id="page-wrapper">
								<div id="page-inner" class="container bs-docs-container">
									<div class="row">
														
										<div class="col-md-9" role="main">
											<div class="bs-docs-section">
												<h1 id="algorithm_clean" class="page-header">数据处理</h1>
												<!-- <table border="1" class="table table-striped table-bordered table-hover">
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#filter"><h6>filter</h6></button></td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	filter() 和slice()函数可以按给定的逻辑条件筛选出符合要求的子数据集, 类似于 base::subset() 函数，但代码更加简洁, 同时也支持对同一对象的任意个条件组合（表示AND时要使用&或者直接使用逗号），返回与.data相同类型的对象。原数据集行名称会被过滤掉。
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#select"><h6>select()</h6></button></td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	Select()用列名作参数来选择子数据集。dplyr包中提供了些特殊功能的函数与select函数结合使用， 用于筛选变量，包括starts_with，ends_with，contains，matches，one_of，num_range和everything等。用于重命名时，select()只保留参数中给定的列，rename()保留所有的列，只对给定的列重新命名。原数据集行名称会被过滤掉。
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#distinct"><h6>distinct()</h6></button></td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	distinct()用于对输入的tbl进行去重，返回无重复的行，类似于 base::unique() 函数，但是处理速度更快。原数据集行名称会被过滤掉。
																</tr>
															</table>
														</td>																		
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Sample"><h6>Sample()</h6></button></td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	抽样函数，sample_n()随机抽取指定数目的样本，sample_frac()随机抽取指定百分比的样本，默认都为不放回抽样，通过设置replacement = TRUE可改为放回抽样，可以用于实现Bootstrap抽样。
																</tr>
															</table>
														</td>
													</tr>
												</table> -->
												
												<h6 id="algorithm_clean_lack">
													<a class="anchorjs-link " href="#algorithm_clean_lack" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#filter"><h3>数据缺失值处理</h3></button>
													<p>数据缺失值处理</p>
												</h6>
												<h6 id="algorithm_clean_select">
													<a class="anchorjs-link " href="#algorithm_clean_select" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#select"><h3>变量选择</h3></button>
													<p>Select()用列名作参数来选择子数据集。dplyr包中提供了些特殊功能的函数与select函数结合使用， 用于筛选变量，包括starts_with，ends_with，contains，matches，one_of，num_range和everything等。用于重命名时，select()只保留参数中给定的列，rename()保留所有的列，只对给定的列重新命名。原数据集行名称会被过滤掉。</p>
												</h6>
												<h6 id="algorithm_clean_filter">
													<a class="anchorjs-link " href="#algorithm_clean_filter" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#filter"><h3>变量筛选</h3></button>
													<p>filter() 和slice()函数可以按给定的逻辑条件筛选出符合要求的子数据集, 类似于 base::subset() 函数，但代码更加简洁, 同时也支持对同一对象的任意个条件组合（表示AND时要使用&或者直接使用逗号），返回与.data相同类型的对象。原数据集行名称会被过滤掉</p>
												</h6>
												<h6 id="algorithm_clean_distinct">
													<a class="anchorjs-link " href="#algorithm_clean_distinct" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#distinct"><h3>数据去重</h3></button>
													<p>distinct()用于对输入的tbl进行去重，返回无重复的行，类似于 base::unique() 函数，但是处理速度更快。原数据集行名称会被过滤掉。</p>
												</h6>
												<h6 id="algorithm_clean_sample">
													<a class="anchorjs-link " href="#algorithm_clean_sample" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Sample"><h3>数据取样</h3></button>
													<p>抽样函数，sample_n()随机抽取指定数目的样本，sample_frac()随机抽取指定百分比的样本，默认都为不放回抽样，通过设置replacement = TRUE可改为放回抽样，可以用于实现Bootstrap抽样。</p>
												</h6>
												
											</div>
											
											
											
											<div class="bs-docs-section">
												<h1 id="algorithm_analysis" class="page-header">分析算法</h1>
												<table border="1" class="table table-striped table-bordered table-hover">
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;">回归算法</td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>线性回归</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">对一个或多个自变量和因变量之间的线性关系进行建模，可用最小二乘法求解模型系数</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>非线性回归</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">对一个或多个自变量和因变量之间的非线性关系进行建模。如果非线性关系关系可以通过简单的函数变换转化成线性关系，用线性回归的思想求解；如果不能转化，用非线性最小二乘法求解</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#LR"><h6>Logistic回归</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">是广义线性回归模型的特例，利用Logistic函数将因变量的取值范围控制在0和1之间，表示取值为1的概率</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>岭回归</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">是一种改进最小二乘估计的方法</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>主成分回归</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">主成分回归是根据主成分分析的思想提出来的，是对最小二乘法的一种改进，它是参数估计的一种有偏估计。可以消除自变量之间的多重共线性</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;">聚类算法</td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#k-means"><h6>K-Means</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">K-均值聚类也叫快速聚类法，在最小化误差函数的基础上将数据划分为预定的类数K。该算法原理简单并便于处理大量数据</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#PAM"><h6>k-中心点</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">K-均值算法对孤立点的敏感性，K-中心点算法不采用簇中对象的平均值最为簇中心，而选用簇中离平均值最近的对象作为簇中心</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>系统聚类</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">系统聚类也叫多层次聚类，分类的单位由高到低呈树形结构，且所处的位置越低，其所包含的对象就越少，但这些对象建的共同特征越多。该聚类方法只适合在小数据量时使用，数据量大时速度会非常慢</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;">分类与预测算法</td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>回归分析</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">回归分析是确定预测属性（数值型）与其他变量间相互依赖的定量关系最常用的统计学方式。</br>包括线性回归、非线性回归、Logistic回归、岭回归、主成分回归、偏最小二乘回归等模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#tree"><h6>决策树</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">决策树采用自顶向下的递归方式，在内部节点进行属性值的比较，并根据不同的属性值从该节点乡下分支，最终得到的叶节点是学习划分的类</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#BP"><h6>人工神经网络</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">人工神经网络是一种模仿大脑神经网络结构和功能而建立的信息处理系统，表示神经网络的输入与输出变量之间关系的模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Naive-Bayes"><h6>贝叶斯网络</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">贝叶斯网络又称信度网络，是Bayes方法的扩展，是目前不确定知识表达和推理领域最有效的理论模型之一</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>支持向量机</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">支持向量机是一种通过某种非线性映射，把低维的非线性可分转化为高维的线性可分，在高维空间进行线性分析的算法</td>
																</tr>
															</table>
														</td>																		
													</tr>
													<tr>
														<td align="center" style="vertical-align: middle;width: 10%;">时间序列</td>
														<td align="center" style="vertical-align: middle;width: 90%;">
															<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>平滑法</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">平滑法常用于趋势分析和预测，利用修匀技术，削弱短期随机波动对序列的影响，是序列平滑化。根据所用平滑技术的不同，可具体分为移动平均法和指数平滑法</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>趋势拟合法</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">趋势拟合法把时间作为自变量，相应的序列观察值作为因变量，建立回归模型。根据序列的特征，可具体分为线性拟合和曲线拟合</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#"><h6>组合模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">时间序列的变化主要受到长期趋势（T）、季节变动（S）、周期变动（C）和不规则变动（）这四个因素的影响。根据序列的特点，可以构建加法模型和乘法模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#AR"><h6>AR模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">AR模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#MA"><h6>MA模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">MA模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#ARMA"><h6>ARMA模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">ARMA模型</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#ARIMA"><h6>ARIMA模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">许多非平稳序列差后会显示出平稳序列的性质，称这个非平稳序列为差分平稳序列。对差分平稳序列可以使用ARIMA模型进行拟合</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#ARCH"><h6>ARCH模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">ARCH模型能准确地模拟时间序列变量的波动性变化，适用于序列具有异方差性并且异方差函数短期自相关</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 30%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#GARCH"><h6>GARCH模型及其衍生模型</h6></button></td>
																	<td align="center" style="vertical-align: middle;width: 70%;">GARCH模型称为ARCH模型，是ARCH模型的拓展。相比于ARCH模型，GARCH模型及其衍生模型更能反映实际序列中的长期记忆性、信息的非对称性等性质</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div>
										</div>
										
										
										
										<div class="col-md-3" role="complementary">
								        	<nav  class="bs-docs-sidebar hidden-print hidden-xs hidden-sm">
								            	<ul id="sidenav" class="nav bs-docs-sidenav">
								              		<li>
														<a href="#algorithm_clean">数据处理</a>
														<ul class="nav">
														    <li><a href="#algorithm_clean_lack">数据缺失值处理</a></li>
														    <li><a href="#algorithm_clean_select">变量选择</a></li>
														    <li><a href="#algorithm_clean_filter">变量筛选</a></li>
														    <li><a href="#algorithm_clean_distinct">数据去重</a></li>
														    <li><a href="#algorithm_clean_sample">数据取样</a></li>
														</ul>
													</li>
									                <li>
														<a href="#algorithm_clean_lack">分析算法</a>
														<ul class="nav">
														    <li><a href="#algorithm_analysis_lack">统计量分析</a></li>
															<li><a href="#algorithm_analysis_select">贝叶斯算法</a></li>
															<li><a href="#algorithm_analysis_filter">相关性计算</a></li>
															<li><a href="#algorithm_analysis_distinct">决策树（基于R）</a></li>
															<li><a href="#algorithm_analysis_sample">决策树（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_lack">主成分分析（基于R）</a></li>
															<li><a href="#algorithm_analysis_select">主成分分析（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_filter">BP神经网络</a></li>
															<li><a href="#algorithm_analysis_distinct">多层感知机（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_sample">随机森林（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_lack">Kmeans（基于R）</a></li>
															<li><a href="#algorithm_analysis_select">Keams（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_filter">层次聚类</a></li>
															<li><a href="#algorithm_analysis_distinct">线性回归（基于R）</a></li>
															<li><a href="#algorithm_analysis_sample">线性回归（基于Spark_MLlib）</a></li>
															<li><a href="#algorithm_analysis_lack">Logistic回归（基于R）</a></li>
															<li><a href="#algorithm_analysis_select">Logistic回归（基于Spark_MLlib）</a></li>
														</ul>
													</li>
									            </ul>
									            <a class="back-to-top" href="#top">返回顶部</a>
									            
									            <a href="#login.jsp" class="bs-docs-theme-toggle" role="button">返回主页</a>
								          </nav>
								        </div>
								        
								       
										
										<!-- 
										<div class="col-md-2" role="complementary">
											<nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix">
												<ul class="nav bs-docs-sidenav" >
													<li>
														<a href="#algorithm_clean">数据清理算法</a>
														<ul class="nav">
															<li class=""><a href="#algorithm_clean_lack">数据缺失值处理</a></li>
															<li class=""><a href="#algorithm_clean_select">变量选择</a></li>
															<li class=""><a href="#algorithm_clean_filter">变量筛选</a></li>
															<li class=""><a href="#algorithm_clean_distinct">数据去重</a></li>
															<li class=""><a href="#algorithm_clean_sample">数据取样</a></li>
														</ul>
													</li>
													<li>
														<a href="#algorithm_analysis">数据分析算法</a>
														<ul class="nav">
															<li class="active"><a href="#algorithm_analysis_lack">统计量分析</a></li>
															<li class=""><a href="#algorithm_analysis_select">贝叶斯算法</a></li>
															<li class=""><a href="#algorithm_analysis_filter">相关性计算</a></li>
															<li class=""><a href="#algorithm_analysis_distinct">决策树（基于R）</a></li>
															<li class=""><a href="#algorithm_analysis_sample">决策树（基于Spark_MLlib）</a></li>
															<li class="active"><a href="#algorithm_analysis_lack">主成分分析（基于R）</a></li>
															<li class=""><a href="#algorithm_analysis_select">主成分分析（基于Spark_MLlib）</a></li>
															<li class=""><a href="#algorithm_analysis_filter">BP神经网络</a></li>
															<li class=""><a href="#algorithm_analysis_distinct">多层感知机（基于Spark_MLlib）</a></li>
															<li class=""><a href="#algorithm_analysis_sample">随机森林（基于Spark_MLlib）</a></li>
															<li class="active"><a href="#algorithm_analysis_lack">Kmeans（基于R）</a></li>
															<li class=""><a href="#algorithm_analysis_select">Keams（基于Spark_MLlib）</a></li>
															<li class=""><a href="#algorithm_analysis_filter">层次聚类</a></li>
															<li class=""><a href="#algorithm_analysis_distinct">线性回归（基于R）</a></li>
															<li class=""><a href="#algorithm_analysis_sample">线性回归（基于Spark_MLlib）</a></li>
															<li class="active"><a href="#algorithm_analysis_lack">Logistic回归（基于R）</a></li>
															<li class=""><a href="#algorithm_analysis_select">Logistic回归（基于Spark_MLlib）</a></li>
														</ul>
													</li>
													<li>
														<a class="back-to-top" href="#top">返回顶部</a>
													</li>
												</ul>
												<a class="back-to-top" href="#top">返回顶部</a>
												<a href="#" class="bs-docs-theme-toggle" role="button">主题预览</a>
											</nav>
										</div>
				 -->
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
		</div>
		
		
		
		<!-- filter模态框 -->
		<div class="modal fade" id="filter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 65%">
				<div class="modal-content">
					<div class="col-sm-12">
						<h3 class="header blue lighter smaller">filter</h3>
					</div>
					<div class="col-sm-12">
						<h3>例子</h3>
						<div>
							<p>
								语法 ： tbl_df(data)</br>
								#data.frame类型数据集</br>
								class(mtcars)</br>
								#转换为tbl_df类型</br>
								ds <- tbl_df(mtcars)</br>
								#转换为data.frame类型</br>
								df <- as.data.frame(ds)</br>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
					</div>		
							
				</div>
			</div>
		</div>
	
	
		<!-- select模态框 -->
		<div class="modal fade" id="select" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 65%">
				<div class="modal-content">
					<div class="col-sm-12">
						<h3 class="header blue lighter smaller">select</h3>
					</div>
					<div class="col-sm-12">
						<h3>例子</h3>
						<div>
							<p>
								iris <- tbl_df(iris)</br>
								#选取变量名前缀包含Petal的列</br>
								select(iris, starts_with("Petal"))</br>
								#选取变量名前缀不包含Petal的列</br>
								select(iris, -starts_with("Petal"))</br>
								#选取变量名后缀包含Width的列</br>
								select(iris, ends_with("Width"))</br>
								#选取变量名后缀不包含Width的列</br>
								select(iris, -ends_with("Width"))</br>
								#选取变量名中包含etal的列</br>
								select(iris, contains("etal"))</br>
								#选取变量名中不包含etal的列</br>
								select(iris, -contains("etal"))</br>
								#正则表达式匹配，返回变量名中包含t的列</br>
								select(iris, matches(".t."))</br>
								#正则表达式匹配，返回变量名中不包含t的列</br>
								select(iris, -matches(".t."))</br>
								#直接选取列</br>
								select(iris, Petal.Length, Petal.Width)</br>
								#返回除Petal.Length和Petal.Width之外的所有列</br>
								select(iris, -Petal.Length, -Petal.Width)</br>
								#使用冒号连接列名，选择多个列</br>
								select(iris, Sepal.Length:Petal.Width)</br>
								#选择字符向量中的列，select中不能直接使用字符向量筛选，需要使用one_of函数</br>
								vars <- c("Petal.Length", "Petal.Width")</br>
								select(iris, one_of(vars))</br>
								#返回指定字符向量之外的列</br>
								select(iris, -one_of(vars))</br>
								#返回所有列，一般调整数据集中变量顺序时使用</br>
								select(iris, everything())</br>
								#调整列顺序，把Species列放到最前面</br>
								select(iris, Species, everything())</br>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
					</div>		
							
				</div>
			</div>
		</div>
	
	
		<!-- distinct模态框 -->
		<div class="modal fade" id="distinct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 65%">
				<div class="modal-content">
					<div class="col-sm-12">
						<h3 class="header blue lighter smaller">distinct</h3>
					</div>
					<div class="col-sm-12">
						<h3>例子</h3>
						<div>
							<p>
								df <- data.frame(</br>
								  x = sample(10, 100, rep = TRUE),</br>
								  y = sample(10, 100, rep = TRUE)</br>
								)</br>
								#以全部两个变量去重，返回去重后的行数</br>
								nrow(distinct(df))</br>
								nrow(distinct(df, x, y))</br>
								#以变量x去重，只返回去重后的x值</br>
								distinct(df, x)</br>
								#以变量y去重，只返回去重后的y值</br>
								distinct(df, y)</br>
								#以变量x去重，返回所有变量</br>
								distinct(df, x, .keep_all = TRUE)</br>
								#以变量y去重，返回所有变量</br>
								distinct(df, y, .keep_all = TRUE)</br>
								#对变量运算后的结果去重</br>
								distinct(df, diff = abs(x - y))</br>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
					</div>		
							
				</div>
			</div>
		</div>
	
	
		<!-- Sample模态框 -->
		<div class="modal fade" id="Sample" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width: 65%">
				<div class="modal-content">
					<div class="col-sm-12">
						<h3 class="header blue lighter smaller">Sample</h3>
					</div>
					<div class="col-sm-12">
						<h3>例子</h3>
						<div>
							<p>
								Sample_n(mtcars,10)                        #随机无重复的选取10行数据</br>
								sample_n(mtcars,50,replace=true)             #随机有重复的选取50行数据</br>
								Sample_n(mtcars,10,weight=mpg)             #随机选取无重复的以mpg值做权重的10行数据</br>
								Sample_frac(mtcars)                           #相当于对全部数据进行无重复重新抽样</br>
								Sample_frac(mtcars,0.1)                        #随机无重复的选取10%的数据</br>
								Sample_frac(mtcars,1.5,replace=true)           #随机有重复的选取总行数的1.5倍的数据</br>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
					</div>		
							
				</div>
			</div>
		</div>
														
														
														
		
	</body>
	<!--[if !IE]> -->
	 <script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script> 
	
	<script src="assets/js/docs.min.js"></script>
	<script type="text/javascript">
		window.onload=function(){
	  		if($(window).scrollTop() == 0){
				$('.bs-docs-sidenav li').removeClass('active');
			}
		};
		$(document).ready(function(){
			//$('#dataTables-ModelLibrary').dataTable();
/* 			$('.bs-docs-sidenav li').click(function(e) {
				$('.bs-docs-sidenav li').removeClass('active');
				$(this).addClass('active');
			 });  */
			 $(window).scroll(function () {
			 	if($(window).scrollTop() == 0){
				 	$('.bs-docs-sidenav ul').children().eq(4).removeClass('active');
				 }
				 if($(window).scrollTop() > 0 && $(window).scrollTop() < 155){
				 	$('.bs-docs-sidenav li').removeClass('active');
				 }
				 if($(window).scrollTop() > 155 && $(window).scrollTop() < 799){
				 	$('.bs-docs-sidenav li').removeClass('active');
					$('.bs-docs-sidenav').children().eq(0).addClass('active');
					if($(window).scrollTop() > 233 && $(window).scrollTop() < 333){
						$('.bs-docs-sidenav ul').children().eq(0).addClass('active');
					}
					if($(window).scrollTop() > 333 && $(window).scrollTop() < 446){
						$('.bs-docs-sidenav ul').children().eq(1).addClass('active');
					}
					if($(window).scrollTop() > 446 && $(window).scrollTop() < 564){
						$('.bs-docs-sidenav ul').children().eq(2).addClass('active');
					}
					if($(window).scrollTop() > 564 && $(window).scrollTop() < 666){
						$('.bs-docs-sidenav ul').children().eq(3).addClass('active');
					}
					if($(window).scrollTop() > 666 && $(window).scrollTop() < 799){
						$('.bs-docs-sidenav ul').children().eq(4).addClass('active');
					}
				 }
				 if($(window).scrollTop() > 799 && $(window).scrollTop() < 1200){
				 	$('.bs-docs-sidenav li').removeClass('active');
					$('.bs-docs-sidenav').children().eq(1).addClass('active');
				 }
			 
				
			 }); 
		})
	</script>
</html>