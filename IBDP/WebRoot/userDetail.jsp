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
	

		<!-- ace settings handler -->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
		
		<link href="assets/css/bootstrap-treeview.min.css" rel="stylesheet">
	
		
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
  <body  ng-app="adminApp"  class="no-skin">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
		 <div></div>
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
	    </div>
			<div class="main-content" >
				<div class="main-content-inner">
					<div class="page-content">
					 <div class="row">
					  <div class="col-xs-12">
				       <!-- PAGE CONTENT BEGINS -->
				      <div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->
				      <div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">查看用户</h4>										
									</div>
					  </div>
<!-- 					          <form action="user_update.action" type="post"> -->
									<div ng-controller="adminAppCtrl"  class="col-sm-12">
												 <div>
				                                   <div class="user-profile row">
				                                    <div class="col-xs-12 col-sm-3 center">
				                                    <div>
							                         <span class="profile-picture">
							                          <input id="admin_imgName" multiple="" accept="*/*" type="file" name="admin_imgName" style="position:absolute;opacity:0;top:0;left:0;width:100%;height:200px">
								                      <img ng-model="user.admin_imgName" id="imgName" class="editable img-responsive"  alt="Alex's Avatar" ng-src="{{user.admin_imgName}}"/>							                      
							                         </span>							
				                                    </div>
				                                    </div>
				                                   <div class="col-xs-12 col-sm-9">
				                                    <div class="profile-user-info profile-user-info-striped">						                            
						                                <div class="profile-info-row">
						                                  <div class="profile-info-name">用户名 </div>
						                                  <div class="profile-info-value">
							                                <input id="admin_username" ng-model="user.admin_username" />							
						                                  </div>
					                                   </div>
					    
					                                    <div class="profile-info-row">
						                                  <div class="profile-info-name">密码 </div>
						                                  <div class="profile-info-value">
							                                <input id="admin_password" ng-model="user.admin_password" />
						                                  </div>
					                                    </div>
					                                    <div class="profile-info-row">
						                                 <div class="profile-info-name">公司名 </div>
						                                  <div class="profile-info-value">
							                               <input id="admin_company"  ng-model="user.admin_company"/>
						                                  </div>
					                                     </div>
					                                    <div class="profile-info-row">
						                                 <div class="profile-info-name">电话 </div>
						                                 <div class="profile-info-value">
							                              <input id="admin_phone" ng-model="user.admin_phone"/>
						                                 </div>
					                                    </div>
					                                     <div class="profile-info-row">
						                                   <div class="profile-info-name">E-mail </div>
						                                   <div class="profile-info-value">
							                                 <input id="admin_email" ng-model="user.admin_email"/>
						                                   </div>
					                                      </div>
					                                      <div class="profile-info-row">
                                                             <div class="profile-info-name"><input type="submit" value="修改" ng-click="submit()"/></div>
					                                         <div class="profile-info-value"><input type="button" onclick="back()" value="返回" /></div>
					                                      </div>		   					  
				                                      </div>
				                                    </div>
				                                   </div>
				                                  </div>
											</div>
					  
				     </div><!-- cols-12 -->
				    </div><!-- row -->
				   </div><!-- page -->
				</div><!-- main-inner -->
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
		</div><!-- /.main-container -->
		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script> 
		<script src="assets/js/angular.js"></script>       
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
<!-- 		<script src="assets/js/bootstrap-table.js"></script> -->
<!-- 		<script src="assets/js/bootstrap-table-zh-CN.js"></script> -->

		<!-- page specific plugin scripts -->
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
		<script src="assets/js/ajaxfileupload.js"></script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
     function back(){
       location.href="basic.jsp";
     } 
		</script>
	 	<script src="assets/js/angular-route.js"></script>
		<script type="text/javascript">
		var img;
		 var adminapp = angular.module('adminApp', ['ngRoute']);
		adminapp.controller('adminAppCtrl', ['$scope','$http',function($scope, $http){
		   $scope.user={
			     admin_username:"",
			     admin_password:"",
			     admin_company:"",
			     admin_phone:"",
			     admin_email:"",
			     admin_imgName:""
			   }; 	
				 $http.post("user_showUser.action").success( function(response) {
				  console.log("开始执行");
				  var admin = JSON.parse(response.DataJson);
              		$scope.user.admin_username=admin.name; 
              		$scope.user.admin_password = admin.password;
              		$scope.user.admin_company = admin.company;
              		$scope.user.admin_phone = admin.telephone;
              		$scope.user.admin_email = admin.email;
              		$scope.user.admin_imgName = admin.imgName;
              		img = admin.imgName;
              		//console.log(admin.imgName);
            	});
				 $scope.submit=function(){
				 	/* console.log($scope.user.admin_username);
				 	console.log($scope.user.admin_imgName); */
				 	console.log(img);
				 	$scope.user.admin_imgName = img;
		        		 $http({
                           method:'POST',
                           url:"user_update.action",
                           data:{
                        	   	userJSONStr:JSON.stringify($scope.user)
                        	   }})
                           .success(function (data) {
                             console.log("修改成功"+data);	
                             window.location.href="basic.jsp";
	                       })
                           .error(function (data) {
                             alert("修改失败");
	                       });
		        };
		        $("#admin_imgName").change(function(){
		           imgChange();
		        });
      }]);
       function imgChange(){ 
		         $.ajaxFileUpload({
			       url:'user_upload.action',
			       type:'post',
			       secureuri:false,
			       cache:false,
			       fileElementId:'admin_imgName',
			       dataType:'json',
			       contentType:false,
                   processData:false,
			       async:false,
			       success:function(data){
				     console.log("上传成功!");
				     console.log(data);
				     console.log("执行inittable之前");
// 				     $table.bootstrapTable('refresh');
                     window.location.reload();
		    	     console.log("支持inittable之后!");
			       },
			       error:function(){
				     console.log("服务器响应失败!");
			       }
		         });
		         $("#admin_imgName").change(function(){
		           imgChange();
		         })
		        }
		</script>
  </body>
</html>