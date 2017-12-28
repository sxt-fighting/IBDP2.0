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
												<!-- <table border="1" class="table table-striped table-bordered table-hover">
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
												</table> -->
												
												<h6 id="tjlfx">
													<a class="anchorjs-link " href="#tjlfx" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#tjlfx"><h3>统计量分析</h3></button>
													<p>用统计指标对定量数据进行统计描述，常从集中趋势和离中趋势两个方面进行分析</p>
												</h6>
												<h6 id="Bayes">
													<a class="anchorjs-link " href="#Bayes" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Bayes"><h3>贝叶斯算法</h3></button>
													<p>贝叶斯分类算法是统计学的一种分类方法，它是一类利用概率统计知识进行分类的算法</p>
												</h6>
												<h6 id="xgxsf">
													<a class="anchorjs-link " href="#xgxsf" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#xgxsf"><h3>相关性算法</h3></button>
													<p>相关性分析是指对两个或多个具备相关性的变量元素进行分析，从而衡量两个变量因素的相关密切程度。相关性的元素之间需要存在一定的联系或者概率才可以进行相关性分析。</p>
												</h6>
												<h6 id="DT-r">
													<a class="anchorjs-link " href="#DT-r" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#DT"><h3>决策树（基于R）</h3></button>
													<p>决策树(Decision Tree）是在已知各种情况发生概率的基础上，通过构成决策树来求取净现值的期望值大于等于零的概率，评价项目风险，判断其可行性的决策分析方法，是直观运用概率分析的一种图解法。由于这种决策分支画成图形很像一棵树的枝干，故称决策树。在机器学习中，决策树是一个预测模型，他代表的是对象属性与对象值之间的一种映射关系。</p>
												</h6>
												<h6 id="DT-s">
													<a class="anchorjs-link " href="#DT-s" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#DT"><h3>决策树（基于Spark_MLlib）</h3></button>
													<p>决策树(Decision Tree）是在已知各种情况发生概率的基础上，通过构成决策树来求取净现值的期望值大于等于零的概率，评价项目风险，判断其可行性的决策分析方法，是直观运用概率分析的一种图解法。由于这种决策分支画成图形很像一棵树的枝干，故称决策树。在机器学习中，决策树是一个预测模型，他代表的是对象属性与对象值之间的一种映射关系。</p>
												</h6>
												<h6 id="PCA-r">
													<a class="anchorjs-link " href="#PCA-r" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#PCA-r"><h3>主成分分析（基于R）</h3></button>
													<p>主成分分析（Principal Component Analysis，PCA）， 是一种统计方法。通过正交变换将一组可能存在相关性的变量转换为一组线性不相关的变量，转换后的这组变量叫主成分。</p>
												</h6>
												<h6 id="PCA-s">
													<a class="anchorjs-link " href="#PCA-s" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#PCA-s"><h3>主成分分析（基于Spark-MLlib）</h3></button>
													<p>主成分分析（Principal Component Analysis，PCA）， 是一种统计方法。通过正交变换将一组可能存在相关性的变量转换为一组线性不相关的变量，转换后的这组变量叫主成分。</p>
												</h6>
												<h6 id="BP">
													<a class="anchorjs-link " href="#BP" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#BP"><h3>BP神经网络</h3></button>
													<p>BP神经网络具有任意复杂的模式分类能力和优良的多维函数映射能力，解决了简单感知器不能解决的异或(Exclusive OR，XOR)和一些其他问题。从结构上讲，BP网络具有输入层、隐藏层和输出层；从本质上讲，BP算法就是以网络误差平方为目标函数、采用梯度下降法来计算目标函数的最小值。</p>
												</h6>
												<h6 id="dcgzj">
													<a class="anchorjs-link " href="#dcgzj" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#dcgzj"><h3>多层感知机（基于Spark-MLlib）</h3></button>
													<p>多层感知器（MLP，Multilayer Perceptron）是一种前馈人工神经网络模型，其将输入的多个数据集映射到单一的输出的数据集上。</p>
												</h6>
												<h6 id="forrest">
													<a class="anchorjs-link " href="#forrest" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#forrest"><h3>随机森林</h3></button>
													<p>随机森林是一个包含多个决策树的分类器， 并且其输出的类别是由个别树输出的类别的众数而定</p>
												</h6>
												<h6 id="xgxsf">
													<a class="anchorjs-link " href="#xgxsf" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#xgxsf"><h3>相关性算法</h3></button>
													<p></p>
												</h6>
												<h6 id="Kmeans-r">
													<a class="anchorjs-link " href="#Kmeans-r" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Kmeans-r"><h3>Kmeans（基于R）</h3></button>
													<p>K-均值聚类也叫快速聚类法，在最小化误差函数的基础上将数据划分为预定的类数K。该算法原理简单并便于处理大量数据</p>
												</h6>
												<h6 id="Kmeans-s">
													<a class="anchorjs-link " href="#Kmeans-s" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Kmeans-s"><h3>Kmeans（基于Spark_MLlib）</h3></button>
													<p>K-均值聚类也叫快速聚类法，在最小化误差函数的基础上将数据划分为预定的类数K。该算法原理简单并便于处理大量数据</p>
												</h6>
												<h6 id="ccjl">
													<a class="anchorjs-link " href="#ccjl" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#ccjl"><h3>层次聚类</h3></button>
													<p>层次聚类(Hierarchical Clustering)是聚类算法的一种，通过计算不同类别数据点间的相似度来创建一棵有层次的嵌套聚类树。</p>
												</h6>
												<h6 id="xxhg-r">
													<a class="anchorjs-link " href="#xxhg-r" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#xxhg-r"><h3>线性回归（基于R）</h3></button>
													<p>对一个或多个自变量和因变量之间的线性关系进行建模，可用最小二乘法求解模型系数</p>
												</h6>
												<h6 id="xxhg-s">
													<a class="anchorjs-link " href="#xxhg-s" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#xxhg-s"><h3>线性回归（基于Spark_MLlib）</h3></button>
													<p>对一个或多个自变量和因变量之间的线性关系进行建模，可用最小二乘法求解模型系数</p>
												</h6>
												<h6 id="Logistic-r">
													<a class="anchorjs-link " href="#Logistic-r" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Logistic"><h3>Logistic回归（基于R）</h3></button>
													<p>是广义线性回归模型的特例，利用Logistic函数将因变量的取值范围控制在0和1之间，表示取值为1的概率</p>
												</h6>
												<h6 id="Logistic-s">
													<a class="anchorjs-link " href="#Logistic-s" aria-label="Anchor link for: algorithm clean lack" data-anchorjs-icon="" style="font-family: anchorjs-icons; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: normal; line-height: inherit; position: absolute; margin-left: -1em; padding-right: 0.5em;"></a>
													<button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Logistic"><h3>Logistic回归（基于Spark_MLlib）</h3></button>
													<p>是广义线性回归模型的特例，利用Logistic函数将因变量的取值范围控制在0和1之间，表示取值为1的概率</p>
												</h6>
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
														<a href="#algorithm_analysis">分析算法</a>
														<ul class="nav">
														    <li><a href="#tjlfx">统计量分析</a></li>
															<li><a href="#Bayes">贝叶斯算法</a></li>
															<li><a href="#xgxsf">相关性计算</a></li>
															<li><a href="#DT-r">决策树（基于R）</a></li>
															<li><a href="#DT-s">决策树（基于Spark_MLlib）</a></li>
															<li><a href="#PCA-r">主成分分析（基于R）</a></li>
															<li><a href="#PCA-s">主成分分析（基于Spark_MLlib）</a></li>
															<li><a href="#BP">BP神经网络</a></li>
															<li><a href="#dcgzj">多层感知机（基于Spark_MLlib）</a></li>
															<li><a href="#forrest">随机森林（基于Spark_MLlib）</a></li>
															<li><a href="#Kmeans-r">Kmeans（基于R）</a></li>
															<li><a href="#Kmeans-s">Keams（基于Spark_MLlib）</a></li>
															<li><a href="#ccjl">层次聚类</a></li>
															<li><a href="#xxhg-r">线性回归（基于R）</a></li>
															<li><a href="#xxhg-s">线性回归（基于Spark_MLlib）</a></li>
															<li><a href="#Logistic-r">Logistic回归（基于R）</a></li>
															<li><a href="#Logistic-s">Logistic回归（基于Spark_MLlib）</a></li>
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
		
		
		<!-- 决策树模态框 -->
		<div class="modal fade" id="DT" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
		
		
		<!-- logistic模态框 -->
		<div class="modal fade" id="Logistic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			 	//console.log($(window).scrollTop());
			 	if($(window).scrollTop() == 0){
				 	$('.bs-docs-sidenav ul').children().eq(4).removeClass('active');
				 }
				 if($(window).scrollTop() > 0 && $(window).scrollTop() < 155){
				 	$('.bs-docs-sidenav li').removeClass('active');
				 }
				 if($(window).scrollTop() > 155 && $(window).scrollTop() < $('#algorithm_analysis').offset().top){
				 	$('.bs-docs-sidenav li').removeClass('active');
					$('.bs-docs-sidenav').children().eq(0).addClass('active');
					if($(window).scrollTop() > $('#algorithm_clean_lack').offset().top && $(window).scrollTop() < $('#algorithm_clean_select').offset().top){
						$('.bs-docs-sidenav ul').children().eq(0).addClass('active');
					}else{
						if($(window).scrollTop() > $('#algorithm_clean_select').offset().top && $(window).scrollTop() < $('#algorithm_clean_filter').offset().top){
							$('.bs-docs-sidenav ul').children().eq(1).addClass('active');
						}else{
							if($(window).scrollTop() > $('#algorithm_clean_filter').offset().top && $(window).scrollTop() < $('#algorithm_clean_distinct').offset().top){
								$('.bs-docs-sidenav ul').children().eq(2).addClass('active');
							}else{
								if($(window).scrollTop() > $('#algorithm_clean_distinct').offset().top && $(window).scrollTop() < $('#algorithm_clean_sample').offset().top){
									$('.bs-docs-sidenav ul').children().eq(3).addClass('active');
								}else{
									if($(window).scrollTop() > $('#algorithm_clean_sample').offset().top && $(window).scrollTop() < $('#algorithm_analysis').offset().top){
										$('.bs-docs-sidenav ul').children().eq(4).addClass('active');
									}
								}
							}
						}
					}
					
				 }
				 if($(window).scrollTop() > $('#algorithm_analysis').offset().top && $(window).scrollTop() < 2000){
				 	$('.bs-docs-sidenav li').removeClass('active');
					$('.bs-docs-sidenav').children().eq(1).addClass('active');
					if($(window).scrollTop() > $('#tjlfx').offset().top && $(window).scrollTop() < $('#Bayes').offset().top){
						$('.bs-docs-sidenav ul').children().eq(5).addClass('active');
					}else{
						if($(window).scrollTop() > $('#Bayes').offset().top && $(window).scrollTop() < $('#xgxsf').offset().top){
							$('.bs-docs-sidenav ul').children().eq(6).addClass('active');
						}else{
							if($(window).scrollTop() > $('#xgxsf').offset().top && $(window).scrollTop() < $('#DT-r').offset().top){
								$('.bs-docs-sidenav ul').children().eq(7).addClass('active');
							}else{
								if($(window).scrollTop() > $('#DT-r').offset().top && $(window).scrollTop() < $('#DT-s').offset().top){
									$('.bs-docs-sidenav ul').children().eq(8).addClass('active');
								}else{
									if($(window).scrollTop() > $('#DT-s').offset().top && $(window).scrollTop() < $('#PCA-r').offset().top){
										$('.bs-docs-sidenav ul').children().eq(9).addClass('active');
									}else{
										if($(window).scrollTop() > $('#PCA-r').offset().top && $(window).scrollTop() < $('#PCA-s').offset().top){
											$('.bs-docs-sidenav ul').children().eq(10).addClass('active');
										}else{
											if($(window).scrollTop() > $('#PCA-s').offset().top && $(window).scrollTop() < $('#BP').offset().top){
												$('.bs-docs-sidenav ul').children().eq(11).addClass('active');
											}else{
												if($(window).scrollTop() > $('#BP').offset().top && $(window).scrollTop() < $('#dcgzj').offset().top){
													$('.bs-docs-sidenav ul').children().eq(12).addClass('active');
												}else{
													if($(window).scrollTop() > $('#dcgzj').offset().top && $(window).scrollTop() < $('#forrest').offset().top){
														$('.bs-docs-sidenav ul').children().eq(13).addClass('active');
													}else{
														if($(window).scrollTop() > $('#forrest').offset().top && $(window).scrollTop() < $('#Kmeans-r').offset().top){
															$('.bs-docs-sidenav ul').children().eq(14).addClass('active');
														}else{
															if($(window).scrollTop() > $('#Kmeans-r').offset().top && $(window).scrollTop() < $('#Kmeans-s').offset().top){
																$('.bs-docs-sidenav ul').children().eq(15).addClass('active');
															}else{
																if($(window).scrollTop() > $('#Kmeans-s').offset().top && $(window).scrollTop() < $('#ccjl').offset().top){
																	$('.bs-docs-sidenav ul').children().eq(16).addClass('active');
																}else{
																	if($(window).scrollTop() > $('#ccjl').offset().top && $(window).scrollTop() < $('#xxhg-r').offset().top){
																		$('.bs-docs-sidenav ul').children().eq(17).addClass('active');
																	}else{
																		if($(window).scrollTop() > $('#xxhg-r').offset().top && $(window).scrollTop() < $('#xxhg-s').offset().top){
																			$('.bs-docs-sidenav ul').children().eq(18).addClass('active');
																		}else{
																			if($(window).scrollTop() > $('#xxhg-s').offset().top && $(window).scrollTop() < $('#Logistic-r').offset().top){
																				$('.bs-docs-sidenav ul').children().eq(19).addClass('active');
																			}else{
																				if($(window).scrollTop() > $('#Logistic-r').offset().top && $(window).scrollTop() < $('#Logistic-s').offset().top){
																					$('.bs-docs-sidenav ul').children().eq(20).addClass('active');
																				}else{
																					if($(window).scrollTop() > $('#Logistic-s').offset().top && $(window).scrollTop() < 1200){
																						$('.bs-docs-sidenav ul').children().eq(21).addClass('active');
																					}
																				}
																			}
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
					
	
				 }
			 
				
			 }); 
		})
	</script>
</html>