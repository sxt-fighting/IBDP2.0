<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.sdu.entity.Admin"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <title>IBDP33</title>
	    <sx:head />
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
			<link rel="stylesheet" href="css/example.css" />
			<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
			<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
			<link rel="stylesheet" href="assets/css/colorbox.min.css" />
			<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />
			<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />
			<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
			<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
			<script src="assets/js/ace-extra.min.js"></script>
	        <script type="text/javascript" src="Myjs/check.js"></script>
			<script type="text/javascript">
	
    			// alert(user);
    
    			var user = '<%=session.getAttribute("user")%>';
     			if( user==null	||typeof user == "undefined" ||user=="null")
     			{
    				//	 alert(user);
    				 window.location.href="login.jsp"; 
	 			}
	 			<%Admin userobj=(Admin)session.getAttribute("user");%>
				
    			var username = '<%=userobj.getName()%>';
    			var userid='<%=userobj.getId()%>';
			</script>
	</head>
	<body ng-app="addModel" class="no-skin">
		<%@include file="template.jsp" %>
		<%@include file="top_menu.jsp" %>
		<div class="main-container ace-save-state" id="main-container">
 			
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			
			<div class="main-content" ng-controller="addmodelCtrl">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->
								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">添加模型</h4>
									</div>

									<div class="widget-body">
										<div class="widget-main">
											<div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 90%;text-align: left;margin:0 auto;padding: 10px 30px">
												<div class="row">
													<h3 class="lighter block green">模型基本信息</h3>
													<div class="row">
														<div class="col-xs-2">
															模型名称
														</div>
														<div class="col-xs-2">
															<input type="text" ng-model="model.m_name">
														</div>
														<div class="col-xs-2">
															模型类型
														</div>
														<div class="col-xs-2">
															<select class="input-medium"   ng-model="model.m_type"  class="col-xs-5 col-sm-5">
																<option value="测试模型">测试模型</option>
																<option value="使用模型">使用模型</option>
															</select>
														</div>
														<div class="col-xs-2">
															可见性
														</div>
														<div class="col-xs-2">
															<select class="input-medium"   ng-model="model.m_state"  class="col-xs-5 col-sm-5">
																<option value="0">私有模型</option>
																<option value="1">公有模型</option>
															</select>
														</div>
													</div>
													<div class="row">&nbsp;</div>
													<div class="row">
														<div class="col-xs-2">
															模型介绍
														</div>
														<div>
															<textarea  ng-model="model.m_describe"  class="col-xs-5 col-sm-5"></textarea>
														</div>
													</div>
												</div>
												
												<div class="hr hr-dotted"></div>
												<div class="row">
													<div align="left" class="col-xs-6">
														<h3 class="lighter block green">算法详情</h3>
													</div>
													<div align="right" class="col-xs-6">
														<button class="btn btn-app btn-info btn-sm" data-toggle="modal" data-target="#showAlgorithmList"> 
															<!-- <i class="ace-icon fa fa-plus-circle bigger-180"></i> -->
															添加算法
														</button>
													</div>
												</div>
												
												<div class="row">
													<div id="accordion" class="accordion-style1 panel-group" ng-repeat="a in algorithmValList track by $index">
														<div class="panel panel-default">
														
															<div class="panel-heading">
																<h4 class="panel-title">
																	<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse{{$index}}">
																		<i class="ace-icon fa fa-angle-right bigger-110" data-icon-hide="ace-icon fa fa-angle-down" data-icon-show="ace-icon fa fa-angle-right"></i>
																		&nbsp;算法{{$index+1}}：{{a.name}}
																	</a>
																</h4>
															</div>
	
															<div class="panel-collapse collapse" id="collapse{{$index}}">
																<div class="panel-body" ng-repeat="p in a.param">
																	<div class="form-group">
																		<label class="col-sm-3 control-label no-padding-right" for="Statistics_column">{{p.name}} </label>
																		<div class="col-sm-9">
																			<input type="text" ng-model="p.value" ng-change="changeState()" class="col-xs-10 col-sm-5">
																		</div>
																	</div>
																</div>
															</div>
															
														</div>
													</div>
												</div> 
												 <div class="modal fade" id="showAlgorithmList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
											        <div class="modal-dialog" style="width: 50%">
											            <div class="modal-content">
											                <div style="background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
											                    <p style="padding: 5px;text-align:center">请选择要添加的算法</p>
											                </div>
											                <div class="row"  style="margin: 10px 10px">
											                	<div class="col-xs-3" style="text-align:center" ng-repeat="a in algorithmList ">
											                		<button type="button" class="btn btn-sm btn-info" ng-click="addAlgorithm(a)" data-dismiss="modal">{{a.name}}</button>
											                	</div>   
											                </div>
											            </div>
											        </div>
											    </div>
												<div class="row" align="center">
													<button class="btn btn-app btn-info btn-sm" ng-click="createModel()">创建模型</button>
													<button class="btn btn-app btn-info btn-sm" ng-click="back()">返回</button>
												</div>
												
											</div>
										</div>
									</div>
										
								</div>
							</div><!-- PAGE CONTENT END -->
						</div><!-- row -->	
					</div><!-- page-content END -->		
				</div>							
			</div><!-- main-content -->
			
			
		   
	
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

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/angular.js"></script>
 		<script src="assets/js/angular-route.js"></script>
		<script src="assets/js/wizard.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/jquery-additional-methods.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script src="assets/js/jquery.maskedinput.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="Myjs/algorithmList.js"></script>
 		<script src="assets/js/ajaxfileupload.js"></script>
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script type="text/javascript">
			//jquery accordion
			$( "#accordion" ).accordion({
				collapsible: true ,
				heightStyle: "content",
				animate: 250,
				header: ".accordion-header"
			});
		</script>
		<script type="text/javascript">
			var addmodel = angular.module('addModel', ['ngRoute']);
			addmodel.controller('addmodelCtrl', ['$http','$scope','$location',function($http,$scope,$location) {
				$scope.algorithmList = algorithmJSONList;//从静态文件Myjs/algorithmList.js中读取
				$scope.algorithmValList = [];//将要被传到后台的对象数组
				$scope.model={
					m_id : '',
					m_name : '',
					m_type : '',
					m_state : '',
					m_describe : '',
					m_createTime : new Date(),
					m_used : '0',
					m_collect : '0',
					m_admin : '',
					algorithmString : $scope.algorithmValList,
				};
			    
		        $scope.addAlgorithm = function(algorithm){
		        	$scope.algorithmValList.push(angular.copy(algorithm));
		        };
			    
		        $scope.hasLegalVal=function(){
		        	for(var i=0;i<$scope.algorithmValList.length;i++){
		        		for(var j=0;j<$scope.algorithmValList[i].param.length;j++){
		        		if($scope.algorithmValList[i].param[j].value==undefined||$scope.algorithmValList[i].param[j].value==null||$scope.algorithmValList[i].param[j].value==""){
		        		console.log('参数值为空，坐标：i='+i+',j='+j);
		        		alert('"'+$scope.algorithmValList[i].name+'"的"'+$scope.algorithmValList[i].param[j].name+'"参数不能为空，请修改后重新提交');
		        		return false;
		        		}
		        		}
		        	}
		        	return true;
		        };
		        
		        $scope.createModel=function(){
		        var s = {"name":"hello"};
		       		$http({
		       			method:'POST',
	                    url:"<%=request.getContextPath()%>/Model_addModel.action",
	                    data:{modelJSONStr:JSON.stringify($scope.model)}
		            }).success(function (data) {
	                    console.log("创建Model成功");
	                    console.log(JSON.stringify(data));
	                    console.log("modelid:"+data.modelid);
	                    window.location.href="model.jsp"; 
	                    //$('div[ng-controller="addmodelCtrl"]').scope().project.modelid= data.modelid;
	                    //$scope.createProject();             
	                 })
	                   .error(function (data) {
	                     alert("创建Model失败");
	                 }); 
		        };
		        
		        $scope.back = function(){
		        	window.location.href="model.jsp"; 
		        };

    		}]);
		</script>
		

	</body>	
</html>