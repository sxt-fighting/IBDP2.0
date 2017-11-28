<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@page import="com.sdu.entity.Admin"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>IBDP</title>
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
		<script type="text/javascript">
		
     
    // alert(user);
    
    var user = '<%=session.getAttribute("user")%>';
     if( user==null	||typeof user == "undefined" ||user=="null")
     {
    //	 alert(user);
     window.location.href="login.jsp"; 
	 }
	 <%Admin userobj=(Admin)session.getAttribute("user");
		%>
				
    var username = '<%=userobj.getName()%>';
    var userid='<%=userobj.getId()%>';
</script>
</head>
  <body ng-app="newProject" class="no-skin">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
					<div class="main-container ace-save-state" id="main-container">
 			

			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			


			<div class="main-content">
				<div class="main-content-inner">
					

					<div class="page-content">
						
						

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								

								<div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->

								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">新建项目</h4>
										
									</div>

									<div class="widget-body" ng-controller="project_modelCtrl" >
										<div class="widget-main">
											<div id="fuelux-wizard-container">
												<div>
													<ul class="steps">
														<li data-step="1" class="active">
															<span class="step">1</span>
															<span class="title">创建项目</span>
														</li>

														<li data-step="2">
															<span class="step">2</span>
															<span class="title">上传数据</span>
														</li>

														<li data-step="3">
															<span class="step">3</span>
															<span class="title">选择模型</span>
														</li>

														<!-- <li data-step="4">
															<span class="step">4</span>
															<span class="title">上传数据</span>
														</li>
														<li data-step="5">
															<span class="step">5</span>
															<span class="title">设置参数</span>
														</li> -->
													</ul>
												</div>
												<hr />

		<div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 90%;text-align: left;margin:0 auto;padding: 10px 30px">
		
												<div class="step-content pos-rel">
												<form class="form-horizontal" id="validation-form" method="get">
													<div class="step-pane active" data-step="1">
														<h3 class="lighter block green">填写项目信息</h3>
														
															<div class="form-group">
																<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="name">项目名称:</label>

																<div class="col-xs-12 col-sm-9">
																	<div class="clearfix">
																		<input type="text" name="name" ng-model="project.name" class="col-xs-12 col-sm-5" />
																	</div>
																</div>
															</div>

															<div class="space-2"></div>

															<div class="form-group">
																<label class="control-label col-xs-12 col-sm-3 no-padding-right" for="comment">项目描述:</label>

																<div class="col-xs-12 col-sm-9">
																	<div class="clearfix">
																		<textarea class="col-xs-12 col-sm-5" name="describe"  ng-model="project.describe"></textarea>
																	</div>
																</div>
															</div>


															
														
													</div>

													<div class="step-pane" data-step="2">
													
													<!-- <div class="center"> -->
															<div class="form-group">
																<label class="control-label col-xs-12 col-sm-3 no-padding-right">上传文件:</label>

																<div class="col-xs-12 col-sm-9">
																	<div class="clearfix">
																		<input type="file" multiple="" accept="*/*" id="upload" name="uploadFile">
																	</div>
																</div>
															</div>
															<div class="space-2"></div>
															<div class="form-group">
																<label class="control-label col-xs-12 col-sm-3 no-padding-right">是否包含表头</label>

																<div class="col-xs-12 col-sm-9">
																	
																		<select id="gender">
																			<option>是</option>
																			<option>否</option>
																		</select>
																	
																</div>
															</div>
												<!-- 		</div> -->
													
												
													</div>

													<div class="step-pane" data-step="3">
													<div  style="z-index: 9999; position: fixed ! important; right: 25px; top: 300px;">  
														<button class="btn btn-app btn-info btn-sm " ng-click="search_models()"
																data-toggle="modal" data-target="#searchModels">
														<i class="ace-icon fa fa-cloud-download bigger-180"></i>
														导入模型
														</button>  
													</div>  
												
													<div  style="z-index: 9999; position: fixed ! important; right: 25px; top: 380px;">
														<button class="btn btn-app btn-info btn-sm" 
														data-toggle="modal" data-target="#showAlgorithmList"> 
														<i class="ace-icon fa fa-plus-circle bigger-180"></i>
														添加算法
														</button>
													</div>
														<div>
															<div class="alert alert-info">
																<button type="button" class="close" data-dismiss="alert">
																	<i class="ace-icon fa fa-times"></i>
																</button>
																<strong>注意:</strong>
																项目模型可以导入已有模型或添加新模型。
																<br />
															</div>
														</div>
														
														<div class="hr hr-dotted"></div>
														<h3 class="lighter block green">模型详情</h3>
														<div class="center" ng-show="algorithmValList.length==0"><span>模型为空，请选择导入模型或添加算法</span></div> 
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
														
														<%-- <div class="form-group">
																<label class="control-label col-xs-12 col-sm-3 no-padding-right" >算法</label>

																<div class="col-xs-12 col-sm-9">
																	<div class="clearfix">
																		<select class="input-medium" ng-model="algorithmNum" name="platform">
																			<option value="">------------------</option>
																			<option value="0">人工神经网络</option>
																			<option value="1">统计量分析</option>
																			<option value="2">概率分布</option>
																			<option value="3">K-means聚类</option>
																			<option value="4">K-中心点聚类(PAM算法)</option>
																			<option value="5">关联规则挖掘</option>
																		</select>
																	</div>
																</div>
														</div>
														<div class="form-group">
														<label class="control-label col-xs-12 col-sm-3 no-padding-right" >参数</label>
														<div class="col-xs-12 col-sm-9">
														 
														</div>
														
														</div> --%>
														
													</div>
													</form>
												</div>
												</div>

											</div>

											<hr />
											<div class="wizard-actions">
												<button class="btn btn-info" ng-show="isChanged" data-toggle="modal"
												 data-target="#newModelInfo">保存为模型</button>
												<button class="btn btn-prev">
													<i class="ace-icon fa fa-arrow-left"></i>
													上一步
												</button>
												<button class="btn btn-success btn-next" data-last="提交">
													下一步
													<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
												</button>
											</div>
										</div><!-- /.widget-main -->
								    <div class="modal fade" id="searchModels" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								         aria-hidden="true">
								        <div class="modal-dialog" style="width: 50%">
								            <div class="modal-content">
								                <div style="background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
								                    <p style="padding: 5px;text-align:center">请选择要导入的模型</p>
								                </div>
								                <div class="input-group" style="margin: 10px 10px">
								                <div style="border:none;  float:left ;height:30px" >
								                  索引内容： <input  type="text" placeholder="请输入模型名称或模型创建人名称进行查询" style="width:500px;height:30px"
								                                 ng-model="searchString">
								                </div>
								                  
					                                <div style="border:none;  float:left ;height:30px" class="input-group-btn">
									                    <button style="" type="button" class=" btn btn-info btn-sm" ng-click="search_models()">
									                        <i class="ace-icon fa fa-search icon-on-right bigger-110"></i>
									                    </button>
									                </div>
								                </div>
								                
								                <div  style="margin: 10px 10px">
								                    <table class="table table-bordered" ng-init="selectIndex=-1;">
								                        <tr>
								                            <th WIDTH="50px"></th>
								                            <th WIDTH="200px">名称</th>
								                            <th WIDTH="150px">来源（创建人）</th>
								                            <th WIDTH="100px">被使用次数</th>
								                            <th WIDTH="100px">收藏数</th>
								
								                        </tr>
								                        <tr ng-repeat="m in searched_models">
								                            <td WIDTH="50px" align="center"><input type="radio" ng-click="select_modelID($index)" value="true"
								                                                      name="radio"></td>
								                            <td WIDTH="200px">{{m.m_name}}</td>
								                            <td WIDTH="150px">{{m.author}}</td>
								                            <td WIDTH="100px">{{m.m_used}}</td>
								                            <td WIDTH="100px">{{m.m_collect}}</td>
								
								                        </tr>
								                    </table>
								                    <div class="modal-footer">
								                        <button type="button" class="btn btn-sm btn-info" ng-click="importModel()"  data-dismiss="modal">确定
								                        </button>
								                        <button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
								                    </div>
								                </div>
								            </div>
								        </div>
								    </div>
								     <div class="modal fade" id="showAlgorithmList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								         aria-hidden="true">
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
								    <div class="modal fade" id="newModelInfo" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								         aria-hidden="true">
								         
								          <div class="modal-dialog" style="width: 50%">
								            <div class="modal-content">
								                <div style="background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
								                    <p style="padding: 5px;text-align:center">请填写新建模型的必要信息</p>
								                </div>
								                 <div class="input-group" style="margin: 10px 10px">
								                 	 <label class="col-xs-3 control-label no-padding-right" >模型名称</label>
												<div class="col-xs-9">
													<input type="text" ng-model="model.m_name"  class="col-xs-5 col-sm-5"></input>
												</div>
												<label class="col-xs-3 control-label no-padding-right" >模型介绍</label>
												<div class="col-xs-9">
													<textarea  ng-model="model.m_describe"  class="col-xs-5 col-sm-5"></textarea>
												</div>
												<label class="col-xs-3 control-label no-padding-right" >可见性</label>
												<div class="col-xs-9">
													<select class="input-medium"   ng-model="model.m_state"  class="col-xs-5 col-sm-5">
																			<option value="0">私有模型</option>
																			<option value="1">公有模型</option>
																		</select>
												</div>
								                 </div>
								                 
								                
								                <div  style="margin: 10px 10px">
								                    
								                    <div class="modal-footer">
								                        <button type="button" class="btn btn-sm btn-info" ng-click="saveModelInfo()" data-dismiss="modal">确定
								                        </button>
								                        <button type="button" class="btn  btn-sm btn-default" ng-click="cancel_newModel()" data-dismiss="modal">关闭</button>
								                    </div>
								                </div>
								            </div>
								        </div>
								         
								        
								    </div>
									</div><!-- /.widget-body -->
								</div>
								


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
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

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
		<script src="assets/js/angular.js"></script>
 		<script src="assets/js/angular-route.js"></script>
		<script src="assets/js/wizard.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/jquery-additional-methods.min.js"></script>
		<script src="assets/js/bootbox.js"></script>
		<script src="assets/js/jquery.maskedinput.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="Myjs/algorithmList.js"></script>
 		<script src="assets/js/ajaxfileupload.js"></script>
		<!-- ace scripts -->
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
			var project_modelapp=angular.module('newProject', ['ngRoute']);
			project_modelapp.controller('project_modelCtrl', ['$http','$scope','$location',function($http,$scope,$location) {
			$scope.searchString='';
			$scope.project={
			name:'',
			describe:'',
			userid:userid,
			datafileid:'',
			modelid:''
			};
			$scope.isChanged=false;
			
			$scope.searched_models=[];
		/* 	[{
				name:'模型A12',
				type:'训练模型',
				createDate:new Date(),
				used:421,
				collection:23,
				author:'administrator'			
			},{
				name:'模型B123',
				type:'测试模型',
				createDate:new Date(),
				used:161,
				collection:13,
				author:'administrator'		
			}
			]; */
			$scope.algorithmList=algorithmJSONList;//从静态文件Myjs/algorithmList.js中读取
			$scope.algorithmValList=[];//将要被传到后台的对象数组
			$scope.model={
				m_id:'',
				m_name:'',
				m_state:'',
				m_describe:'',
				m_createTime:'',
				m_type:'',
				m_used:'',
				m_collect:'',
				author:'',
				algorithmString:''
			};
			//$scope.models=null;
				$scope.search_models=function(){
					$http({
                           method:'POST',
                           url:"<%=request.getContextPath()%>/Model_getModels.action",
                           data:{searchString:$scope.searchString}
                       })
                           .success(function (data) {
                           	$scope.searched_models=JSON.parse(data.searched_models);
                           	//console.log(data.searched_models);
                              //alert("搜索成功"+JSON.stringify(data));    
	                       })
                            .error(function (data) {
                              alert("搜索models时出现问题:");
	                       }); 
				};
				$scope.select_modelID=function(ID){
		            $scope.selectIndex=ID;
		        };
		        $scope.changeState=function(){
		        	$scope.model.m_id='';
		        	$scope.model.m_name='';
					$scope.model.m_state='';
					$scope.model.m_describe='';
		        	$scope.isChanged=true;
		        };
		        $scope.saveModelInfo=function(){
		        	$scope.isChanged=false;
		        };
		        
		        $scope.importModel=function () {
		             if($scope.selectIndex!=-1){
		                //$scope.models.push($scope.searched_models[$scope.selectIndex]);
		                //$scope.algorithmValList=[];
		                $scope.algorithmValList.splice(0,$scope.algorithmValList.length);
		                //console.log("$scope.algorithmValList清空了");
		                $scope.algorithmValList=JSON.parse($scope.searched_models[$scope.selectIndex].algorithmString);
		                $scope.model.m_id=$scope.searched_models[$scope.selectIndex].m_id;
		                $scope.project.modelid=$scope.searched_models[$scope.selectIndex].m_id;
		                $scope.isChanged=false;
		                //console.log(JSON.stringify( $scope.algorithmValList));
		            } 
		        };
		        $scope.cancel_newModel=function(){
		        	$scope.model.m_name='';
					$scope.model.m_state='';
					$scope.model.m_describe='';
		        };
		        $scope.addAlgorithm=function(algorithm){
		        	$scope.algorithmValList.push(angular.copy(algorithm));
		        	$scope.changeState();
		        };
		        
		        $scope.delModel=function(modelID,$index) {
		        	$scope.models.splice($index,1);
		        };
		        $scope.hasLegalVal=function(){
		        	if($scope.algorithmValList.length==0){
		        	alert('请选择至少一个算法再提交');
		        		return false;
		        	}
		        	else{
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
		        	}
		        };
		        $scope.createProject=function(){
		        		 $http({
                           method:'POST',
                           url:"<%=request.getContextPath()%>/Project_addProject.action",
                           data:{
                        	   	projectJSONStr:JSON.stringify($scope.project)
                        	   }})
                           .success(function (data) {
                             console.log("创建Project成功"+data);	
                             bootbox.dialog({
     						message: "您的分析任务已被提交，请稍后到我的项目中查看详情！", 
     						buttons: {
     							"success" : {
     								"label" : "OKay",
     								"className" : "btn-sm btn-primary"
     							}
     						}
     					}); 
                             
                             
	                       })
                           .error(function (data) {
                             alert("创建Project失败");
	                       });
		        };
		        $scope.createModel=function(){
		        	$scope.model.algorithmString=$scope.algorithmValList;
		        		 $http({
                           method:'POST',
                           url:"<%=request.getContextPath()%>/Model_addModel.action",
                           data:{modelJSONStr:JSON.stringify($scope.model)}
                       })
                           .success(function (data) {
                              console.log("创建Model成功");
                              console.log(JSON.stringify(data));
                              console.log("modelid:"+data.modelid);
                              $('div[ng-controller="project_modelCtrl"]').scope().project.modelid= data.modelid;
				            $scope.createProject();             
	                       })
                            .error(function (data) {
                              alert("创建Model失败");
	                       }); 
                
		        };

    }]);
		</script>
		<script type="text/javascript">
		$("#upload").change(function(){
			console.log("userid"+userid);
			$.ajaxFileUpload({
				url:"<%=request.getContextPath()%>/DataFile_saveDataFile.action",
				type:'post',
				data:{userid:userid},
				dataType:'json',
				fileElementId:'upload',
				success:function(data){
					console.log("上传成功");
					console.log("返回的数据是:"+data);
					console.log("data.fileid:"+data.fileid);
					 $('div[ng-controller="project_modelCtrl"]').scope().project.datafileid= data.fileid;
					 console.log("设置成功");
					alert("上传成功!");
				},
				error:function(){
					console.log("上传失败!");
					alert("上传失败!");
				}
			});
		});
			jQuery(function($) {
			
				//var $validation = false;//禁用表单验证
				var controllerScope = $('div[ng-controller="project_modelCtrl"]').scope();
				var wizard = $('#fuelux-wizard-container').data('fu.wizard');
				$('#fuelux-wizard-container')
				.ace_wizard({
					step: 1 //optional argument. wizard will jump to step "2" at first
					//buttons: '.wizard-actions:eq(0)'
				})
				.on('actionclicked.fu.wizard' , function(e, info){
				//点击上一步、下一步时触发
					if(info.step == 1 ) {//info.step == 1 && $validation
					//console.log("11111前");
						if(controllerScope.project.name==""||controllerScope.project.name==null||controllerScope.project.describe==""||controllerScope.project.describe==null){
							alert("项目数据不能为空，请填写必要的信息");
							e.preventDefault();
						} 
					}
					if(info.step == 2 ) {
					//console.log("222222前");
					//在这点击下一步后，更新文件“是否包含表头”的信息。
					$.post("<%=request.getContextPath()%>/DataFile_updateDataFile.action",
							{
								fileid: $('div[ng-controller="project_modelCtrl"]').scope().project.datafileid,
								hasheader:$("#gender").val(),
							},
							function(data,status){
							    //alert("Data: " + data + "\nStatus: " + status);
							  });
			/* 		$.ajax({
									url:'DataFile_save
									DataFile.action',
												success:function(data){
										    	console.log("支持inittable之后!");
											},
											error:function(){
											 e.preventDefault();
												console.log("服务器响应失败!");
											}
						}); */
					}
					if(info.step == 3 ) {
					//console.log("33333前");
						if(!$('#validation-form').valid())
							e.preventDefault();
					}
				})
				.on('changed.fu.wizard', function(e,info) {
				//console.log('跳转完成后，step='+info.step);
				})
				.on('finished.fu.wizard', function(e) {
				console.log("提交ajax请求");
				if(controllerScope.hasLegalVal()){
					if(controllerScope.model.m_id==undefined||controllerScope.model.m_id==""||controllerScope.model.m_id==null){//如果模型是新建的或是修改的，就创建新模型
						controllerScope.createModel();
					}
					else{
						controllerScope.createProject();
					}
				}
				console.log("请求完成");
				
				//console.log("提交结果后");
					/* bootbox.dialog({
						message: "您的分析任务已被提交，请稍后到我的项目中查看详情！", 
						buttons: {
							"success" : {
								"label" : "OKay",
								"className" : "btn-sm btn-primary"
							}
						}
					}); */
				})
				.on('stepclick.fu.wizard', function(e){
					e.preventDefault();//this will prevent clicking and selecting steps
				});
			
			
				//jump to a step
				/**
				var wizard = $('#fuelux-wizard-container').data('fu.wizard')
				wizard.currentStep = 3;
				wizard.setState();
				*/
			
				//determine selected step
				//wizard.selectedItem().step
			
		
			
				//documentation : http://docs.jquery.com/Plugins/Validation/validate
			
				/* $('#validation-form').validate({
					errorElement: 'div',
					errorClass: 'help-block',
					focusInvalid: false,
					ignore: "",
					rules: {
						
						name: {
							required: true
						},
						comment: {
							required: true
						},
						
						gender: {
							required: true,
						}
						
					},
			
					messages: {
						// email: {
						// 	required: "Please provide a valid email.",
						// 	email: "Please provide a valid email."
						// },
						
						gender: "Please choose gender"
					},
			
			
					highlight: function (e) {
						$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
					},
			
					success: function (e) {
						$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
						$(e).remove();
					},
			
					errorPlacement: function (error, element) {
						if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
							var controls = element.closest('div[class*="col-"]');
							if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
							else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
						}
						else error.insertAfter(element.parent());
					},
			
					submitHandler: function (form) {
					},
					invalidHandler: function (form) {
					}
				}); */
			
				
			});
			
</script>

	</body>
	
</html>
