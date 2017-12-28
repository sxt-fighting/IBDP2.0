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
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		
		<link href="assets/css/bootstrap-treeview.min.css" rel="stylesheet">
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

    var user = '<%=session.getAttribute("user")%>';
     
    // alert(user);
     if( user==null	||typeof user == "undefined" ||user=="null")
     {
    //	 alert(user);
     window.location.href="login.jsp"; 
	 }
</script>
	
</head>
  <body ng-app="userApp" class="no-skin">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
		 <div></div>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
	    </div>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">
					<div class="row">
					<div class="col-xs-12" ng-controller="userAppCtrl">
				       <!-- PAGE CONTENT BEGINS -->
				      <div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->
				      <div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">用户管理</h4>
										
									</div>
									<div class="widget-body" >
										<div class="widget-main">
											 <div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 85%;text-align: center;margin:0 auto;padding: 10px 30px">
											 <div id="toolbar">
											        <button id="remove" class="btn btn-danger" >
											            <i class="glyphicon glyphicon-trash"></i> 批量删除
											        </button>
										     </div>
											 	<table id="project-table" 
										  	 	   data-toolbar="#toolbar"
										           data-search="true"
										           data-show-refresh="true"
										           data-show-toggle="true"
										           data-show-pagination-switch="true"
										           data-pagination="true"
										           data-page-size="5"
										           data-page-list="[3, 5, 10, ALL]"
										         >
												</table><!-- data-url="/examples/bootstrap_table/data" -->
											</div>
										</div>
									</div>

								</div>
								<form style="width: 100%" role="form">
								 <div class="modal fade" id="user_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" style="width: 65%">
										<div class="modal-content">
											<div class="col-sm-12">
												<h3 class="header blue lighter smaller">查看详情</h3>
											</div>
											<div class="col-sm-12">
											   <table id="simple-table" class="table">
											   <tr>
											    <input  type="hidden" ng-model="a.admin_id" id="admin_id" />
											    <td style="text-align: center">用户名:</td>
											    <td style="text-align: center"><input width="3%" class="form-control" id="admin_username" ng-model="a.admin_username"></td>
											   </tr>
											   <tr>
											    <td style="text-align: center">密码:</td>
											    <td style="text-align: center"><input width="3%" class="form-control" id="admin_password" ng-model="a.admin_password"></td>										   
									            <input  type="hidden" ng-model="a.admin_company" id="admin_company" />
									            <input  type="hidden" ng-model="a.admin_tel" id="admin_tel" />
									            <input  type="hidden" ng-model="a.admin_email" id="admin_email" />
									            <input  type="hidden" ng-model="a.admin_isAdmin" id="admin_isAdmin" />
											   </tr>
											   </table>		 
				                                   </div>                                  
					                            <div class="modal-footer">
					                               <button type="button" class="btn btn-primary" ng-disabled="sender_form.$invalid"  ng-click="adminUpdate()" data-dismiss="modal">修改
                                                   </button>
                                                   <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>          
                                                 </div>	   					  

				                                   
				                            </div>
											</div>
										</div>
									</div>
								</div>
                               </form>

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
<!-- 		<script src="assets/js/select2.min.js"></script> -->
		<!-- page specific plugin scripts -->
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
 
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		var $table = $('#project-table'),
        $remove = $('#remove'),       
        selections = [];
		var userapp = angular.module('userApp', ['ngRoute']);
		  userapp.controller('userAppCtrl', ['$scope','$http',function($scope, $http){
			  $scope.a={
					     admin_id:"",
					     admin_username:"",
					     admin_password:"",
					     admin_company:"",
					     admin_tel:"",
					     admin_email:"",
					     admin_isAdmin:""
					   }; 	
						 $scope.adminUpdate=function(){
						 	console.log($scope.a.admin_username);
				        		 $http({
		                           method:'POST',
		                           url:"user_adminUpdate.action",
		                           data:{
		                        	   	userJSONStr:JSON.stringify($scope.a)
		                        	   }})
		                           .success(function (data){
		                             console.log("修改成功"+data);
		                             $table.bootstrapTable('refresh');
			                       })
		                           .error(function (data) {
		                             alert("修改失败");
			                       });
				        };
		  }]);		 
    function initTable() {
        $table.bootstrapTable({
            url: "<%=request.getContextPath()%>/user_showAll.action",
            cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
            striped: true,  //表格显示条纹，默认为false
            pagination: true, // 在表格底部显示分页组件，默认false
            pageList: [10, 20], // 设置页面可以显示的数据条数
            pageSize: 10, // 页面数据条数
            pageNumber: 1, // 首页页码
   			height: 500,
            responseHandler:function(res) {
            	  console.log("到了前台");
            	  console.log('DataJson'+JSON.stringify(res.DataJson));             	  
                  return JSON.parse(res.DataJson) ; //数据         
            },
            columns: [
                    {
              checkbox: true, // 显示一个勾选框
              align: 'center' // 居中显示
          }, {
              field: 'name', // 返回json数据中的name
              title: '用户名', // 表格表头显示文字
              align: 'center', // 左右居中
              valign: 'middle' // 上下居中
          }, {
              field: 'password',
              title: '密码',
              align: 'center',
              valign: 'middle'
          }, {
              field: 'company',
              title: '所在公司',
              align: 'center',
              valign: 'middle'
          }, {
          	  field:'telephone',
              title: '电话',
              align: 'center',
              valign: 'middle',
              width: 160// 定义列的宽度，单位为像素px
          },{
          	  field:'email',
              title: '邮箱',
              align: 'center',
              valign: 'middle',
              width: 160// 定义列的宽度，单位为像素px
          },
           {
              title: '操作',
              align: 'center',
              valign: 'middle',
              width: 160, // 定义列的宽度，单位为像素px
              formatter: function (value, row, index) {
                   return '<button class="btn btn-xs btn-info btn-sm" data-toggle="tooltip" data-placement="bottom" title="查看" onclick="view(\'' + row.id + '\')"> <i class="ace-icon fa fa-pencil bigger-120"></i></button>'
              				 +'<button class="btn btn-xs btn-danger btn-sm" onclick="del(\'' + row.id + '\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>';
              }
          }
            ],
        });
        }
    $(function () {
       initTable();
    });
     //修改按钮（模态框）
		    function view(id) {
		    	
		    	$.post("user_show.action",
		    		{
		    			id : id,
		    		},function(data,status){		    	
	    			    var admin = JSON.parse(data.DataJson);
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_id = admin[0].id;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_username = admin[0].name;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_password = admin[0].password;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_company = admin[0].company;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_tel = admin[0].telephone;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_email = admin[0].email;
	    			    $('div[ng-controller="userAppCtrl"]').scope().a.admin_isAdmin = admin[0].isAdmin;
	    		/* 	     $('#admin_id').val(admin[0].id);
 	    				 $('#admin_username').val(admin[0].name);
	    				 $('#admin_password').val(admin[0].password);  */
	    			}
		    	);
	    		
	    		$('#user_detail').modal();
	    		
		    }
    function del(id){
    	$.post("user_delete.action",
    			{id:id,},
    			function(data,status){
    				$table.bootstrapTable('refresh');		
    	});
    }
    //批量删除
    $remove.click(function () {
    	var ids = getIdSelections();
    	
    	$.post("user_deletes.action",
    		{
    			ids:JSON.stringify(ids),
    		},function(data,status){
    			$table.bootstrapTable('remove', {
                	field: 'id',
                	values: ids
            	});
    		}
    	);
	});
    function getIdSelections() {
			return $.map($table.bootstrapTable('getSelections'), function (row) {
   			return row.id;
			});
		}
		</script>  
       </div><!-- ace-save-state -->
     </body>
   </html>