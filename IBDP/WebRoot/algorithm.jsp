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

		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		
		<script src="assets/js/ace-extra.min.js"></script>
		
        <script type="text/javascript" src="Myjs/check.js"></script>
        
  </head>
  
  
  <body class="no-skin" ng-app="algorithm">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
					<div class="main-container ace-save-state" id="main-container">
 			<script type="text/javascript">
 				try{ace.settings.loadState('main-container')}catch(e){}
			</script> 
			<div>&nbsp;</div>
			<div  class="main-content">
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
															<table border="1" class="table table-striped table-bordered table-hover">
																<tr>
																	<td align="center" style="vertical-align: middle;width: 10%;">数据处理</td>
																	<td align="center" style="vertical-align: middle;width: 90%;">
																		<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																			<tr>
																				<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#filter"><h6>filter</h6></button></td>
																				<td align="left" style="vertical-align: middle;width: 90%;">
																					<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																						<tr>
																							filter() 和slice()函数可以按给定的逻辑条件筛选出符合要求的子数据集, 类似于 base::subset() 函数，但代码更加简洁, 同时也支持对同一对象的任意个条件组合（表示AND时要使用&或者直接使用逗号），返回与.data相同类型的对象。原数据集行名称会被过滤掉。
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#select"><h6>select()</h6></button></td>
																				<td align="left" style="vertical-align: middle;width: 90%;">
																					<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																						<tr>
																							Select()用列名作参数来选择子数据集。dplyr包中提供了些特殊功能的函数与select函数结合使用， 用于筛选变量，包括starts_with，ends_with，contains，matches，one_of，num_range和everything等。用于重命名时，select()只保留参数中给定的列，rename()保留所有的列，只对给定的列重新命名。原数据集行名称会被过滤掉。
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#distinct"><h6>distinct()</h6></button></td>
																				<td align="left" style="vertical-align: middle;width: 90%;">
																					<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																						<tr>
																							distinct()用于对输入的tbl进行去重，返回无重复的行，类似于 base::unique() 函数，但是处理速度更快。原数据集行名称会被过滤掉。
																						</tr>
																					</table>
																				</td>																		
																			</tr>
																			<tr>
																				<td align="center" style="vertical-align: middle;width: 10%;"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#Sample"><h6>Sample()</h6></button></td>
																				<td align="left" style="vertical-align: middle;width: 90%;">
																					<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
																						<tr>
																							抽样函数，sample_n()随机抽取指定数目的样本，sample_frac()随机抽取指定百分比的样本，默认都为不放回抽样，通过设置replacement = TRUE可改为放回抽样，可以用于实现Bootstrap抽样。
																						</tr>
																					</table>
																				</td>
																			</tr>
																		</table>
																		
																	</td>
																</tr>
																<tr>
																	<td align="center" style="vertical-align: middle;width: 10%;">分析算法</td>
																	<td align="center" style="vertical-align: middle;width: 90%;">
																		<table frame="void" border="1" cellspacing="0" cellpadding="0" style="width: 100%;">
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
																		
																	</td>
																</tr>
															</table>
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
																		<h3 class="header blue lighter smaller">filter</h3>
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
																		<h3 class="header blue lighter smaller">filter</h3>
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
																		<h3 class="header blue lighter smaller">filter</h3>
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
														
														
														<!-- 逻辑回归（Logistic Regression）模态框 -->
														<div class="modal fade" id="LR" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">逻辑回归（Logistic Regression）</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>1.什么是逻辑回归</h3>
																		<div>
																			<p>
												 								Logistic Regression 属于广义线性模型（generalized linear model）的一种，是基于Sigmoid函数（又叫“S型函数”）的有监督二类分类模型。Sigmoid函数公式为：
																			</p>
																			<img src="img/Sigmoid1.png" alt="图片加载失败">
																			<p>其导数形式为：</p>
																			<img src="img/Sigmoid2.png" alt="图片加载失败">
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<h3>2.目标函数</h3>
									
																		<div class="col-sm-12">
																			<p>
																				假设训练集中有个样本，每个样本属于正类别的概率为 ，属于负类别的概率就是 ，在训练过程中，我们应该尽可能地使整个训练集的分类结果与这个样本的类别标记尽可能地一致。换句话说，我们要使训练样本集分类正确的似然函数最大，而我们可以很容易地写出如下的似然函数：
																			</p>
																			<img src="img/Sigmoid3.png" alt="图片加载失败">
																			<p>其中是训练集中第  个样本已经被标记好的类别，若为1.则上式的前半部分起作用，反之后半部分起作用。由于对 整体求 ，其极值点保持不变，因此可以简化为：</p>
																			<img src="img/Sigmoid4.png" alt="图片加载失败">
																			<p>接下来的任务是求相应的值，使得取最大值。如果对整体取负号即为Logistic回归的损失函数（loss function），相应地，应该求使取最小值的。</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>3.正则化</h3>
																		<p>
																			在实际应用中,为了防止过拟合，使得模型具有较强的泛化能力，往往还需要在目标函数中加入正则项。在逻辑回归的实际应用中，L1正则应用较为广泛，原因是在面临诸如广告系统等实际应用的场景，特征的维度往往达到百万级甚至上亿，而L1正则会产生稀疏模型，在避免过拟合的同时起到了特征选择的作用。工业界一般采用更快的L-BFGS算法求解。													
																		</p>
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
														
														
														<!--  朴素贝叶斯模态框 -->
														<div class="modal fade" id="Naive-Bayes" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 50%">
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3 class="header blue lighter smaller">朴素贝叶斯算法（Naive-Bayes）</h3>
																	</div>
																	<div class="col-sm-12">
																		<h3>应用场景：</h3>
																		<div>
																			<p>
																				是与决策树模型应用同样广泛的分类模型，朴素贝叶斯模型所需估计的参数很少，对缺失数据不太敏感。在属性相关性较小时，朴素贝叶斯模型的性能最为良好。
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>使用说明（参数说明）：</h3>
																		<div class="col-sm-12">
																			<p>
																				(dataframe,预测结果列名response，特征列名features，lambda=0)
																				lambda是为了避免先验概率为零而进行的“平滑”操作而进行的“拉普拉斯修正”参数。
																				lambda为非负数，当λ=0，就是最大似然估计，λ=1就是拉普拉斯平滑.													
																			</p>
																		</div>
																	</div>
																	<div class="col-sm-12">																			
																		<h3>原理介绍：</h3>
																		<div class="col-sm-12">
																			<p>
																				贝叶斯分类器的分类原理是通过某对象的先验概率，利用贝叶斯公式计算出其后验概率，即该对象属于某一类的概率，选择具有最大后验概率的类作为该对象所属的类。</br>													
																				<img src="img/Naive-Bayes.png" alt="图片加载失败">
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


    
