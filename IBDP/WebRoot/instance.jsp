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
  <body ng-app="" class="no-skin">
		 <%@include file="template.jsp" %>
		 <%@include file="top_menu.jsp" %>
					<div class="main-container ace-save-state" id="main-container">
 			

			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>


			<div class="main-content">
				<div class="main-content-inner">
					

					<div class="page-content" style="width: 90%;margin:0 auto;">
					<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								

								<div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->

									
			 <div class="col-xs-6 col-sm-4 col-md-3">
			  <div class="thumbnail search-thumbnail" onclick="viewInstance('waterquality.jsp')">
				<%-- <span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span> --%>
					<img class="media-object" src="img/1.jpg" style="width:233px;height:200px;" />
						<div class="caption">
						 <div class="clearfix">
						  <span class="pull-right label label-grey info-label">山大</span>
							<div class="pull-left bigger-110">
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star-half-o orange2"></i>
								<i class="ace-icon fa fa-star light-grey"></i>
							</div>
						</div>
						<h3 class="search-title">
						 <a href="#" class="blue">水务大数据</a>
						</h3>
						<p>水质数据分析--初探与实现</p>
					 </div>
			   </div>
			 </div>
			 
			 <div class="col-xs-6 col-sm-4 col-md-3">
			  <div class="thumbnail search-thumbnail" onclick="viewInstance('http://211.87.227.91:18080/HeatData/heatdata/history.action')">
				<%-- <span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span> --%>
					<img class="media-object" src="img/2.jpg" style="width:233px;height:200px;" />
						<div class="caption">
						 <div class="clearfix">
						  <span class="pull-right label label-grey info-label">山大</span>
							<div class="pull-left bigger-110">
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star-half-o orange2"></i>
								<i class="ace-icon fa fa-star light-grey"></i>
							</div>
						</div>
						<h3 class="search-title">
						 <a href="#" class="blue">济南市热力大数据分析平台</a>
						</h3>
						<p>济南市热力大数据分析平台</p>
					 </div>
			   </div>
			 </div>
			  <div class="col-xs-6 col-sm-4 col-md-3">
			  <div class="thumbnail search-thumbnail" onclick="viewInstance('http://211.87.227.91:18080/Longda/longda/forecast.action')">
				<%-- <span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span> --%>
					<img class="media-object" src="img/3.jpg" style="width:233px;height:200px;" />
						<div class="caption">
						 <div class="clearfix">
						  <span class="pull-right label label-grey info-label">龙大</span>
							<div class="pull-left bigger-110">
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star-half-o orange2"></i>
								<i class="ace-icon fa fa-star light-grey"></i>
							</div>
						</div>
						<h3 class="search-title">
						 <a href="#" class="blue">龙大数据分析平台</a>
						</h3>
						<p>龙大数据分析平台</p>
					 </div>
			   </div>
			 </div>
			  <div class="col-xs-6 col-sm-4 col-md-3">
			  <div class="thumbnail search-thumbnail" onclick="viewInstance('http://211.87.227.91:18080/HDFS/')">
				<%-- <span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span> --%>
					<img class="media-object" src="img/4.jpg" style="width:233px;height:200px;" />
						<div class="caption">
						 <div class="clearfix">
						  <span class="pull-right label label-grey info-label">山大</span>
							<div class="pull-left bigger-110">
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star-half-o orange2"></i>
								<i class="ace-icon fa fa-star light-grey"></i>
							</div>
						</div>
						<h3 class="search-title">
						 <a href="#" class="blue">工业视频</a>
						</h3>
						<p>工业视频</p>
					 </div>
			   </div>
			 </div>
			 
			
			<%--  <div class="col-xs-6 col-sm-4 col-md-3">
			  <div class="thumbnail search-thumbnail">
				<span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span>
					<img class="media-object" src="img/3.jpg" style="width:257px;height:200px;" />
						<div class="caption">
						 <div class="clearfix">
						  <span class="pull-right label label-grey info-label">山大</span>
							<div class="pull-left bigger-110">
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star orange2"></i>
								<i class="ace-icon fa fa-star-half-o orange2"></i>
								<i class="ace-icon fa fa-star light-grey"></i>
							</div>
						</div>
						<h3 class="search-title">
						 <a href="#" class="blue">项目A</a>
						</h3>
						<p>训练模型</p>
					 </div>
			   </div>
			 </div> --%>
			
			
								


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
		<!-- bootstrap-table.min.js -->
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
 
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script>
		var viewInstance=function(url){
			//console.log('url==='+url);
			window.open(url);
		};
		
</script>

	</body>
	
</html>
