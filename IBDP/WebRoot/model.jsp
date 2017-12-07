<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<!-- 引入bootstrap-table样式 -->
		<link href="assets/css/bootstrap-table.css" rel="stylesheet">

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
		<script type="text/javascript">
		
		    var user = '<%=session.getAttribute("user")%>';
		     
		    // alert(user);
		     if( user==null	||typeof user == "undefined" ||user=="null")
		     {
		    //	 alert(user);
		     window.location.href="login.jsp"; 
			 }
		</script>
	</head>
	<body  class="no-skin" ng-app="viewModel">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
			<div class="main-container ace-save-state" id="main-container">
 			

			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
			


			<div class="main-content" ng-controller="viewModelCtrl">
				<div class="main-content-inner">	

					<div class="page-content">

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->

								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">模型库</h4>
									</div>
									
									
									<div class="widget-body" >
										<div class="widget-main">
											 <div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 90%;text-align: center;margin:0 auto;padding: 10px 30px">
											 	<div id="toolbar">
											 		<button id="new" class="btn btn-success">
											           	<i class="glyphicon glyphicon-plus"></i> 新建模型
											        </button>
											       	<button id="remove" class="btn btn-danger"  >
											           	<i class="glyphicon glyphicon-trash"></i> 批量删除
											       	</button>
											 	</div>
											 	<table id="model-table" 
										  	 	   	data-toolbar="#toolbar"
										           	data-search="true"
										           	data-show-refresh="true"
										           	data-show-toggle="true"
										           	data-show-pagination-switch="true"
										           	data-pagination="true"
										           	data-page-size="5"
										           	data-page-list="[3, 5, 10, ALL]">
												</table>
											</div>
										</div>
									</div>
								</div>
								
								
								<!-- 模型详情模态框 -->
								<div class="modal fade" id="model_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width: 65%">
										<div class="modal-content">
											<div class="col-sm-12">
												<h3 class="header blue lighter smaller" id="modal_detail_name1"></h3>
											</div>
											<div class="col-sm-12">
												<table class="table table-striped table-bordered table-hover">
													<thead>
														<h4>模型基本信息</h4>
													</thead>
													<tbody>
														<tr>
															<td width="20%">模型名称</td>
															<td width="20%" id="modal_detail_name"></td>
															<td width="20%">模型类型</td>
															<td width="20%" id="modal_detail_type"></td>
														</tr>
														<tr>
															<td width="20%">创建时间</td>
															<td width="20%" id="modal_detail_createDate"></td>
															<td width="20%">创建人</td>
															<td width="20%" id="modal_detail_author"></td>
														</tr>
														<tr>
															<td width="20%">收藏数</td>
															<td width="20%" id="modal_detail_collection"></td>
															<td width="20%">使用数</td>
															<td width="20%" id="modal_detail_used"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="col-sm-12">
												<h4>使用算法</h4>
												<div ng-show="algorithmString==null||algorithmString==undefined||algorithmString==''">aaaa</div>
												
												<table class="table table-striped table-bordered table-hover" ng-repeat="a in algorithmString track by $index" >
													<tr>
														<td width="25%">算法{{$index+1}}&nbsp;:&nbsp;&nbsp;{{a.name}}</td>
														<td width="75%">
															<table ng-repeat="p in a.param">
																<tr>
																	<td width="30%">{{p.name}}&nbsp;:&nbsp;</td>
																	<td width="70%">&nbsp;&nbsp;{{p.value}}</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</div>
											<div class="modal-footer">
						                        <button type="button" class="btn  btn-sm btn-default" data-dismiss="modal">关闭</button>
						                    </div>		
										</div>
									</div>
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
		<script src="assets/js/bootstrap-table.js"></script>
		<script src="assets/js/bootstrap-table-zh-CN.js"></script>

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
 
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		
		<script>
			var $table = $('#model-table');
			var $new = $('#new');
			var $remove = $('#remove');
			var selections = [];
			var viewModelapp = angular.module('viewModel', ['ngRoute']);
			viewModelapp.controller('viewModelCtrl', ['$scope','$http',function($scope, $http){
				$scope.algorithmString = [];
				$scope.asss = function(array){
					console.log("array==="+array);
					$scope.algorithmString = JSON.parse(array);
				};
			}]);
       		
       		function initTable() {
        		$table.bootstrapTable({
        			// 获取表格数据的url
        			url: "<%=request.getContextPath()%>/Model_showAllModelsByUserId.action",
        			/*必须写成get方式，后台接收不到*/
        			method:'get',
   					height: 500,
   					pageList: [10, 20], // 设置页面可以显示的数据条数
   		            pageSize: 10, // 页面数据条数
   		            pageNumber: 1, // 首页页码
   		            sidePagination: 'server', // 设置为服务器端分页
   		   			height: 500,
            		columns: [
                    {
                    	checkbox: true, // 显示一个勾选框
              			align: 'center', // 居中显示
              			valign: 'middle' // 上下居中
          			}, {
              			field: 'm_name', // 返回json数据中的name
              			title: '模型名称', // 表格表头显示文字
              			align: 'center', // 左右居中
              			valign: 'middle' // 上下居中
          			}, {
              			field: 'm_state',
              			title: '模型状态',
              			align: 'center',
              			valign: 'middle',
              			formatter: function (value, row, index){
              				if(row.m_state==1){
              					return "共有模型";
              				}else if(row.m_state==0){
              					return "私有模型";
              				}}
          			}, {
              			field: 'm_createTime',
              			title: '创建时间',
              			align: 'center',
              			valign: 'middle'
          			}, {
          	  			field:'m_creator',
              			title: '创建者',
              			align: 'center',
              			valign: 'middle',
              			width: 160// 定义列的宽度，单位为像素px
          			}, {
          	  			field:'m_collect',
              			title: '收藏数',
              			align: 'center',
              			valign: 'middle',
              			width: 160// 定义列的宽度，单位为像素px
          			}, {
          	  			field:'m_used',
              			title: '使用数',
              			align: 'center',
              			valign: 'middle',
              			width: 160// 定义列的宽度，单位为像素px
          			},{
              			title: '操作',
              			align: 'center',
              			valign: 'middle',
              			width: 160, // 定义列的宽度，单位为像素px
             			formatter: function (value, row, index) {
                   			return '<button class="btn btn-xs btn-success btn-sm" data-toggle="tooltip"  data-placement="bottom" title="查看" onclick="viewmodel(\''+row.m_id+'\')"><i class="ace-icon fa fa-search-plus bigger-120"></i></button>'
                   					+'<button class="btn btn-xs btn-info btn-sm" data-toggle="tooltip" data-placement="bottom" title="收藏" onclick="like(\'' + row.m_id + '\')"><i class="ace-icon fa fa-heart-o bigger-120"></i></button>'
              				 		+'<button class="btn btn-xs btn-danger btn-sm" onclick="del(\'' + row.m_id + '\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>';}
          			}],
          			queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

                        return {
                            pageSize: params.limit, // 每页要显示的数据条数
                            offset: params.offset, // 每页显示数据的开始行号
                          /*   sort: params.sort, // 要排序的字段 */
                          /*   sortOrder: params.order, // 排序规则 */
           					}
           			},
          			responseHandler:function(res) {
            	  		//console.log("到了前台");
            	  		//console.log('DataJson'+JSON.stringify(res.DataJson));
                   		return JSON.parse(res.DataJson) ; //数据
              		},
        		});
        	}
       		
   			
   			$(function(){
   				initTable();
   			});
   			
   			
   			//新建按钮
   			$new.click(function(){
   				  window.location.href="addModel.jsp"; 
   				
   			});
   			
   			
       		function getIdSelections() {
       			return $.map($table.bootstrapTable('getSelections'), function (row) {
           			return row.m_id;
       			});
   			}
   			
   			//批量删除按钮
   			$remove.click(function () {
            	var ids = getIdSelections();
            	
            	$.post("Model_deleteModels.action",
		    		{
		    			mids:JSON.stringify(ids),
		    		},function(data,status){
		    			$table.bootstrapTable('remove', {
		                	field: 'm_id',
		                	values: ids
		            	});
		    		}
		    	)
        	});
        	
			//查看详情按钮（模态框）
		    function viewmodel(m_id) {
		    	
		    	$.post("Model_viewModel.action",
		    		{
		    			m_id : m_id,
		    		},function(data,status){
		    			var model = JSON.parse(data.DataJson);
		    			//console.log(model);
		    			$('#modal_detail_name1').text(model[0].m_name);	
 	    				$('#modal_detail_name').text(model[0].m_name);
	    				$('#modal_detail_type').text(model[0].m_type);
	    				$('#modal_detail_createDate').text(model[0].m_createTime);
	    				$('#modal_detail_author').text(model[0].admin_moid);
	    				$('#modal_detail_collection').text(model[0].m_collect);
	    				$('#modal_detail_used').text(model[0].m_used);
	    				var controllerScope = $('div[ng-controller="viewModelCtrl"]').scope();
	    				controllerScope.asss(model[0].algorithmString);
	    				controllerScope.$digest();  //双向绑定
	    			}
		    	)
	    		
	    		$('#model_detail').modal();
	    		
		    }
		    
		    //喜欢按钮
		    function like(m_id,index){
		    	
		    	$.post("Model_likeModel.action",
		    		{
		    			m_id:m_id,
		    		},function(data,status){
		    			$table.bootstrapTable('refresh');
		    		}
		    	);
		    }
		    
		    //单行删除
		    function del(m_id){
		    	$.post("Model_deleteModel.action",
		    		{
		    			m_id:m_id,
		    		},function(data,status){
		    			$table.bootstrapTable('refresh');
		    		}
		    	)
		    }	
		</script>
		
	</body>
	
</html>
