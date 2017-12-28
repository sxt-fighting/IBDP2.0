<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>IBDP</title>
    <sx:head />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset="utf-8">
		<title>Search Results - Ace Admin</title>

		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css">

		<!-- page specific plugin styles -->
		<link rel="stylesheet" href="assets/css/select2.min.css">
		<link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css">

		<!-- text fonts -->
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css">

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style">

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css">
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css">

		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->
		<script src="assets/js/ace-extra.min.js"></script><style>@keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-moz-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-webkit-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-ms-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}@-o-keyframes nodeInserted{from{outline-color:#fff}to{outline-color:#000}}.ace-save-state{animation-duration:10ms;-o-animation-duration:10ms;-ms-animation-duration:10ms;-moz-animation-duration:10ms;-webkit-animation-duration:10ms;animation-delay:0s;-o-animation-delay:0s;-ms-animation-delay:0s;-moz-animation-delay:0s;-webkit-animation-delay:0s;animation-name:nodeInserted;-o-animation-name:nodeInserted;-ms-animation-name:nodeInserted;-moz-animation-name:nodeInserted;-webkit-animation-name:nodeInserted}</style>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
		<script src="assets/js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/tree.min.js"></script>
		<script src="assets/js/select2.min.js"></script>
		<script src="assets/js/jquery-ui.custom.min.js"></script>
		<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/js/holder.min.js"></script>
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script type="text/javascript">
			jQuery(function($) {
			
				//data for tree element
				var category = {
					'for-sale' : {text: 'For Sale', type: 'folder'}	,
					'vehicles' : {text: 'Vehicles', type: 'item'}	,
					'rentals' : {text: 'Rentals', type: 'item'}	,
					'real-estate' : {text: 'Real Estate', type: 'item'}	,
					'pets' : {text: 'Pets', type: 'item'}	,
					'tickets' : {text: 'Tickets', type: 'item'}
				}
				category['for-sale']['additionalParameters'] = {
					'children' : {
						'appliances' : {text: 'Appliances', type: 'item'},
						'arts-crafts' : {text: 'Arts & Crafts', type: 'item'},
						'clothing' : {text: 'Clothing', type: 'item'},
						'computers' : {text: 'Computers', type: 'item'},
						'jewelry' : {text: 'Jewelry', type: 'item'},
						'office-business' : {text: 'Office', type: 'item'},
						'sports-fitness' : {text: 'Sports & Fitness', type: 'item'}
					}
				}
				
				var dataSource1 = function(options, callback){
					var $data = null
					if(!("text" in options) && !("type" in options)){
						$data = category;//the root tree
						callback({ data: $data });
						return;
					}
					else if("type" in options && options.type == "folder") {
						if("additionalParameters" in options && "children" in options.additionalParameters)
							$data = options.additionalParameters.children || {};
						else $data = {}//no data
					}
					
					callback({ data: $data })
				}
				
				$('#cat-tree').ace_tree({
					dataSource: dataSource1,
					multiSelect: true,
					cacheItems: true,
					'open-icon' : 'ace-icon tree-minus',
					'close-icon' : 'ace-icon tree-plus',
					'itemSelect' : true,
					'folderSelect': false,
					'selected-icon' : 'ace-icon fa fa-check',
					'unselected-icon' : 'ace-icon fa fa-times',
					loadingHTML : '<div class="tree-loading"><i class="ace-icon fa fa-refresh fa-spin blue"></i></div>'
				});
				
			
				$('.tree-container').ace_scroll({size: 250, mouseWheelLock: true});
				$('#cat-tree').on('closed.fu.tree disclosedFolder.fu.tree', function() {
					$('.tree-container').ace_scroll('reset').ace_scroll('start');	
				});
				
				
				
				//select2 location element
				$('.select2').css('min-width', '150px').select2({allowClear:true});
				
				
				//jQuery ui distance slider
				$( "#slider-range" ).css('width','150px').slider({
					range: true,
					min: 0,
					max: 100,
					values: [ 17, 67 ],
					slide: function( event, ui ) {
						var val = ui.values[$(ui.handle).index()-1] + "";
			
						if( !ui.handle.firstChild ) {
							$("<div class='tooltip bottom in' style='display:none;left:-6px;top:14px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>")
							.prependTo(ui.handle);
						}
						$(ui.handle.firstChild).show().children().eq(1).text(val);
					}
				}).find('span.ui-slider-handle').on('blur', function(){
					$(this.firstChild).hide();
				});
				
			
				//this is for demo only
				$('.thumbnail').on('mouseenter', function() {
					$(this).find('.info-label').addClass('label-primary');
				}).on('mouseleave', function() {
					$(this).find('.info-label').removeClass('label-primary');
				});
				
			
				//toggle display format buttons
				$('#toggle-result-format .btn').tooltip({container: 'body'}).on('click', function(e){
					$(this).siblings().each(function() {
						$(this).removeClass($(this).attr('data-class')).addClass('btn-grey');
					});
					$(this).removeClass('btn-grey').addClass($(this).attr('data-class'));
				});
				
				////////////////////
				//show different search page
				$('#toggle-result-page .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					$('.search-page').parent().addClass('hide');
					$('#search-page-'+which).parent().removeClass('hide');
				});
			});
		</script>
		
		
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
		 <%@include file="./template.jsp" %>
		 <%@include file="./top_menu.jsp" %>
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
								<div class="hr hr-18 hr-double dotted"></div>
								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">水务大数据分析</h4>
										<div class="" style="float:right">
											<ul class="breadcrumb">
												<li>
													<i class="ace-icon fa fa-home home-icon"></i>
													<a href="#">Home</a>
												</li>
					
												<li>
													<a href="./instance.jsp">应用实例</a>
												</li>
												<li class="active">水务大数据分析</li>
											</ul>
										</div>
										
    
										
										
										
											 
										</div>
										<div class="widget-body">
										<div class="widget-main">
										
        <div class="row" style="width: 100%;margin:0 auto">
            
            <div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>

			<div id="sidebar" class="sidebar                  responsive                    ace-save-state" data-sidebar="true" data-sidebar-scroll="true" data-sidebar-hover="true">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="ace-icon fa fa-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="ace-icon fa fa-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="ace-icon fa fa-users"></i>
						</button>

						<button class="btn btn-danger">
							<i class="ace-icon fa fa-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active open">
						<a href="./waterquality.jsp">
							<i class="">**</i>
							<span class="menu-text"> **分析类目清单**** </span>
						</a>

					</li>
					<li class="">
						<a href="#">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> pearson相关性分析 </span>
						</a>

					</li>

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-desktop"></i>
							<span class="menu-text">周期性分析</span>

						</a>

					</li>


					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 文本分析 </span>

						</a>

					</li>
					
					<li class="">
						<a href="#">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 数据处理  </span>
						</a>

					
					</li>
					

					<li class="">
						<a href="#">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text"> More Pages </span>
						</a>

					</li>

					
					

					<li class="">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-tag"></i>
							<span class="menu-text"> More Pages </span>

						</a>

					</li>

					
				</ul><!-- /.nav-list -->

				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i id="sidebar-toggle-icon" class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>
			</div>

			<div class="main-content">
				<div class="main-content-inner">
					

					<div class="page-content">
						<div class="ace-settings-container" id="ace-settings-container">
							

							<div class="ace-settings-box clearfix" id="ace-settings-box">
								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<div class="pull-left">
											<select id="skin-colorpicker" class="hide">
												<option data-skin="no-skin" value="#438EB9">#438EB9</option>
												<option data-skin="skin-1" value="#222A2D">#222A2D</option>
												<option data-skin="skin-2" value="#C6487E">#C6487E</option>
												<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
											</select><div class="dropdown dropdown-colorpicker">		<a data-toggle="dropdown" class="dropdown-toggle"><span class="btn-colorpicker" style="background-color:#438EB9"></span></a><ul class="dropdown-menu dropdown-caret"><li><a class="colorpick-btn selected" style="background-color:#438EB9;" data-color="#438EB9"></a></li><li><a class="colorpick-btn" style="background-color:#222A2D;" data-color="#222A2D"></a></li><li><a class="colorpick-btn" style="background-color:#C6487E;" data-color="#C6487E"></a></li><li><a class="colorpick-btn" style="background-color:#D0D0D0;" data-color="#D0D0D0"></a></li></ul></div>
										</div>
										<span>&nbsp; Choose Skin</span>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-navbar" autocomplete="off">
										<label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-sidebar" autocomplete="off">
										<label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-breadcrumbs" autocomplete="off">
										<label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" autocomplete="off">
										<label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2 ace-save-state" id="ace-settings-add-container" autocomplete="off">
										<label class="lbl" for="ace-settings-add-container">
											Inside
											<b>.container</b>
										</label>
									</div>
								</div><!-- /.pull-left -->

								<div class="pull-left width-50">
									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" autocomplete="off">
										<label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" autocomplete="off">
										<label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
									</div>

									<div class="ace-settings-item">
										<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" autocomplete="off">
										<label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
									</div>
								</div><!-- /.pull-left -->
							</div><!-- /.ace-settings-box -->
						</div><!-- /.ace-settings-container -->

						

						<div class="row">
							<div class="col-xs-12">
								

								<div>
									<div class="row search-page" id="search-page-1">
										<div class="col-xs-12">
											<div class="row">
												

												<div class="col-xs-12 col-sm-9" style="width:100%">
													<div class="row">
														<div class="search-area well col-xs-12">
															<div class="pull-left">
																<b class="text-primary">About 水务数据分析</b>

																&nbsp;
																<div id="toggle-result-format" class="btn-group btn-overlap" data-toggle="buttons">
																	<label title="" class="btn btn-lg btn-white btn-success active" data-class="btn-success" aria-pressed="true" data-original-title="Thumbnail view">
																		<input type="radio" value="2" autocomplete="off">
																		<i class="icon-only ace-icon fa fa-th"></i>
																	</label>

																	<label title="" class="btn btn-lg btn-white btn-grey" data-class="btn-primary" data-original-title="List view">
																		<input type="radio" value="1" checked="" autocomplete="off">
																		<i class="icon-only ace-icon fa fa-list"></i>
																	</label>

																	<label title="" class="btn btn-lg btn-white btn-grey" data-class="btn-warning" data-original-title="Map view">
																		<input type="radio" value="3" autocomplete="off">
																		<i class="icon-only ace-icon fa fa-crosshairs"></i>
																	</label>
																</div>
															</div>

															<div class="pull-right">
																<b class="text-primary">Order</b>

															</div>
														</div>
													</div>
												<div class="row">
														<div class="col-xs-12">
															<div class="media search-media">
																<div class="media-left">
																	<a href="#">
																		<img class="media-object" data-src="holder.js/72x72" alt="72x72" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2272%22%20height%3D%2272%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2072%2072%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1603029d2e7%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1603029d2e7%22%3E%3Crect%20width%3D%2272%22%20height%3D%2272%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2217.46875%22%20y%3D%2240.5%22%3E72x72%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 72px; height: 72px;">
																	</a>
																</div>

																<div class="media-body">
																	<div>
																		<h5 class="media-heading">
																			<a href="#" class="blue">有效的数据采集是基础</a>
																		</h5>
																	</div>
																	<p>大数据处理、挖掘模型等技术相对通用，但产生智慧的基础数据，却需要一点一滴地积累。当前建设智慧水务，积累有效的“海量数据”已成为当务之急；而水表遍布千家万户，水表流量数据中蕴含着社会生产生活各方面的丰富信息，是行业天然的数据价值源泉....</p>
																	<p>本实例所用数据为：</p>
																	<ul class="list-unstyled spaced2" style="margin-left: 30px;">
																		<li>
																			<i class="ace-icon fa fa-check green"></i>
																			实验室检测数据：针对四种不同类型水的实验室检验报告，主要的数据属性：时间、采样地点、样品类型、检测指标、检测值。主要特点：周期性采样，月报、年报等方式；
																		</li>
																		<li>
																			<i class="ace-icon fa fa-check green"></i>
																			电话投诉数据：居民通过电话口头描述水质问题，主要数据属性：时间、位置、水质感官描述（颜色、味道），数据多以文字方式展现；
																		</li>
																		<li>
																			<i class="ace-icon fa fa-check green"></i>
																			在线监测数据：针对管网水进行的实时仪器监测，得到各指标的在线连续监测数据，主要数据属性：时间、地点，数据具有很好的实时性，并且与管网关联密切；
																		</li>
				
																		
																	</ul>

																	<div class="search-actions text-center">
																		
																		<div class="action-buttons bigger-125" style="margin-top:80%">
																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-heart red"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>
																		</div>
																		
																	</div>
																</div>
															</div>

															<div class="media search-media disabled">
																<div class="media-left">
																	<a href="#">
																		<img class="media-object" data-src="holder.js/72x72" alt="72x72" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2272%22%20height%3D%2272%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2072%2072%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1603029d2e8%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1603029d2e8%22%3E%3Crect%20width%3D%2272%22%20height%3D%2272%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2217.46875%22%20y%3D%2240.5%22%3E72x72%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 72px; height: 72px;">
																	</a>
																</div>

																<div class="media-body">
																	<div>
																		<h5 class="media-heading">
																			<a href="#" class="blue">有价值的数据分析是关键</a>
																		</h5>
																	</div>
																	<p>结合当下流行的大数据分析等技术(Hadoop、HDFS、Hive、Sqoop、R语言与RServer、Weka学习库等等)，以及机器学习等方法，推动水务迈入大数据时代，水务数据迈入智能化....</p>

																	<div class="search-actions text-center">
																		
																		<div class="action-buttons bigger-125" style="margin-top:20%">
																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-heart red"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>
																		</div>
																		
																	</div>
																</div>
															</div>

															<div class="media search-media">
																<div class="media-left">
																	<a href="#">
																		<img class="media-object" data-src="holder.js/72x72" alt="72x72" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2272%22%20height%3D%2272%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2072%2072%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1603029d2ea%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1603029d2ea%22%3E%3Crect%20width%3D%2272%22%20height%3D%2272%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2217.46875%22%20y%3D%2240.5%22%3E72x72%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 72px; height: 72px;">
																	</a>
																</div>

																<div class="media-body">
																	<div>
																		<h5 class="media-heading">
																			<a href="#" class="blue">智慧水务数据延伸服务一体化</a>
																		</h5>
																	</div>
																	<p>把水务信息与数十个关于住房地点、房龄、气候和入住率的数据点整合到一起进行分析、预测，为用户提供水务互联网服务（如：给用户提供个性化用水报告、为节水行为打分、提示花园灌溉许可日期和许可量），也可大大节省用水量....</p>

																	<div class="search-actions text-center">
																		
																		<div class="action-buttons bigger-125" style="margin-top:20%">
																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-heart red"></i>
																			</a>

																			<a href="#">
																				<i class="ace-icon fa fa-star orange2"></i>
																			</a>
																		</div>
																		
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="space-12"></div>
													<div id="dataTables-ModelLibrary_wrapper" class="dataTables_wrapper form-inline" role="grid">
															<div class="row" style="background-color:#6fb3e0;height:40px">
																&nbsp;&nbsp;&nbsp;&nbsp;平台对水质数据所作分析列表
															</div>
															<div class="row">
															<table class="table table-striped table-bordered" style="font-size:14px">
															<thead>
																<tr>
																	<th class="center">#</th>
																	<th>项目名称</th>
																	<th class="hidden-xs">项目介绍</th>
																	<th class="hidden-480">数据集</th>
																	<th>模型和算法</th>
																	<th>查看结果</th>
																</tr>
															</thead>

															<tbody>
																<tr>
																	<td class="center">1</td>

																	<td>
																		<a href="#">水质指标相关性分析</a>
																	</td>
																	<td class="hidden-xs">针对某水厂水质检测数据，对各指标进行相关性分析...</td>
																	<td class="hidden-480"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#2015yishuichang" >2015yishuichang.csv</button></td>
																	<td>Pearson</td>
																	<td><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#2015yishuichangjieguo" >2015yishuichang.png</button></td>
																</tr>

																<tr>
																	<td class="center">2</td>

																	<td>
																		<a href="#">水质指标周期性分析</a>
																	</td>
																	<td class="hidden-xs">针对某水厂水质检测数据，对单指标进行周期性分析...</td>
																	<td class="hidden-480"><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#2015yishuichangZQX" >zhouqixingceshi.csv</button></td>
																	<td>Pearson</td>
																	<td><button type="button" class="btn btn-sm btn-link btn-addon" data-toggle="modal" data-target="#2015yishuichangZQXjieguo" >zhouqixingceshi.png</button></td>
																</tr>

																<tr>
																	<td class="center">3</td>
																	<td>Hosting</td>
																	<td class="hidden-xs"> 1 year basic hosting </td>
																	<td class="hidden-480"> 10% </td>
																	<td>$90</td>
																	<td>$10</td>
																</tr>

																<tr>
																	<td class="center">4</td>
																	<td>Design</td>
																	<td class="hidden-xs"> Theme customization </td>
																	<td class="hidden-480"> 50% </td>
																	<td>$250</td>
																	<td>$10</td>
																</tr>
															</tbody>
														</table>
														</div>
														
														<div class="modal fade" id="2015yishuichang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div style="text-align:center;background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
																	<label style="padding: 5px;float:center;font-size:18px">数据集介绍~水质检测指标相关性分析 </label>
																	<button class="btn btn-sm pull-right" style="width:50px;padding: 9.5px;" data-dismiss="modal"><i class="ace-icon glyphicon glyphicon-remove"></i></button>
																</div>
														        <div class="modal-content">
														            <div class="col-sm-12">
																		<h3>包含的属性有：</h3>
																		<div>
																			<table class="table table-bordered" style="font-size:14px">
									  											<thead>
									                                               	<tr><th>属性</th><th>取值介绍</th></tr>
																				</thead>
																				<tbody>
																				    <tr>
																				      <td>id</td><td>唯一标识一行数据的凭证，可按照时间作为索引。</td>
																				   </tr>
																				    <tr>
																				      <td>x0137</td><td>pH取值，限值：0~14，若超出则可能数据采集器出故障</td>
																				    </tr>
																				    <tr>
																				      <td>x0205</td><td>总硬度值</td>
																				    </tr>
																				    <tr>
																				      <td>x0207</td><td>氯化物，单位：μg/L</td>
																				     </tr>
																				 </tbody>
																			 </table>
																		</div>
																	</div>
																	
																		<div class="col-sm-12">
																			
																			<h3>数据示例</h3>
									  											<table class="table table-bordered" style="font-size:14px">
									  											<thead>
									                                               	<tr>
									                                                	<th>id</th><th>指标1</th><th>指标2</th><th>指标3</th><th>指标4</th>
									   												</tr>
																				</thead>
																				<tbody>
																				    <tr>
																				      <td>2012-01-02</td><td>0.5</td><td>4</td><td>43</td><td>0.6</td>												      
																				    </tr>
																				    <tr>
																				      <td>2012-02-02</td><td>0.6</td><td>8</td> <td>38</td><td>0.8</td>												      
																				    </tr>
																				    <tr>
																				      <td>2012-03-02</td><td>0.4</td><td>7</td><td>64</td><td>0.5</td>											      
																				    </tr>
																				    <tr>
																				      <td>2012-04-02</td><td>0.8</td><td>7</td><td>54</td><td>0.2</td>												      
																				    </tr>
																				 </tbody>
																			</table>
																		</div>
																	<div class="col-sm-12">
																		<p><font color="red" size="3">注意：数据集中请不要包含空值，可使用本平台“缺失值处理”函数对所有列进行空值处理。</font></p>
																		</div>
																	<div class="modal-footer">
                        												
                    												</div>		
																			
																</div>
														    </div>
														</div>
														<div class="modal fade" id="2015yishuichang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div class="modal-content">
														            
																	<div class="modal-footer">
                        											</div>		
																			
																</div>
														    </div>
														</div>
														<div class="modal fade" id="2015yishuichangjieguo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div style="text-align:center;background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
																	<label style="padding: 5px;float:center;font-size:18px">指标相关性结果展示 </label>
																	<button class="btn btn-sm pull-right" style="width:50px;padding: 9.5px;" data-dismiss="modal"><i class="ace-icon glyphicon glyphicon-remove"></i></button>
																</div>
														        <div class="modal-content">
														            	<div style="width:100%;">
  	
  	
																		  	<div id="showPicture" style="width:100%;margin:20px auto;display: flex;
																		  justify-content: center;
																		  align-items: center;  ">
																											
																		  		<img src="/user/2015yishuichang.png" />
																		 	 </div>
																		  	
																		</div>	
																	<div class="modal-footer">
                        											</div>		
																			
																</div>
														    </div>
														</div>
														<div class="modal fade" id="2015yishuichang" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
														    <div class="modal-dialog" style="width: 65%">
														        <div class="modal-content">
														            
																	<div class="modal-footer">
                        											</div>		
																			
																</div>
														    </div>
														</div>
														</div>
													<div class="space-12"></div>
													<div class="widget-box">
														<div class="widget-header widget-header-blue widget-header-flat">
															<h4 class="widget-title lighter">水务大数据分析</h4>
														</div>
													<br>
													<div class="row" style="margin-left: 1px; margin-right: 1px;">
														<div class="col-xs-6 col-sm-4 col-md-3">
															<div class="thumbnail search-thumbnail">
																<span class="search-promotion label label-success arrowed-in arrowed-in-right">C</span>

																<img class="media-object bigger-150" style="height: 200px; width: 100%; display: block;" src="./img/xiangguanxing.png" data-holder-rendered="true">
																<div class="caption">
																	<div class="clearfix">
																		<span class="pull-right label label-grey info-label">Correlation</span>

																		<div class="pull-left bigger-110">
																			<i class="ace-icon fa fa-star orange2"></i>

																			<i class="ace-icon fa fa-star orange2"></i>

																			<i class="ace-icon fa fa-star orange2"></i>

																			<i class="ace-icon fa fa-star-half-o orange2"></i>

																			<i class="ace-icon fa fa-star light-grey"></i>
																		</div>
																	</div>

																	<h3 class="search-title">
																		相关性分析
																	</h3>
																	<p>对检测到的水质指标进行相关性分析，发现相关程度较高的指标，...</p>
																</div>
																
															</div>
														</div>

														<div class="col-xs-6 col-sm-4 col-md-3">
															<div class="thumbnail search-thumbnail">
															<span class="search-promotion label label-success arrowed-in arrowed-in-right">P</span>
																<img class="media-object" src="./img/zhouqixing.png" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
																<div class="caption">
																	<div class="clearfix">
																		<span class="pull-right label label-grey info-label">Periodic</span>
																	</div>

																	<h3 class="search-title">
																		周期性分析
																	</h3>
																	<p>找出单指标变化规律，对其本身或与其相关性较高的指标进行预测...</p>
																</div>
																
															</div>
														</div>

														<div class="col-xs-6 col-sm-4 col-md-3">
															<div class="thumbnail search-thumbnail">
																<span class="search-promotion label label-success arrowed-in arrowed-in-right">F</span>
																<img class="media-object" src="./img/wenbenfenxi.png" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
																<div class="caption">
																	<div class="clearfix">
																		<span class="pull-right label label-grey info-label">fileAnalysis</span>
																	</div>

																	<h3 class="search-title">
																		投诉文本分析
																	</h3>
																	<p>对居民投诉信息，进行文本分析，旨在生成报表、投诉自动识别与应答...</p>
																</div>
																
															</div>
														</div>

														<div class="col-xs-6 col-sm-4 col-md-3">
															<div class="thumbnail search-thumbnail">
															<span class="search-promotion label label-success arrowed-in arrowed-in-right">S</span>
																<img class="media-object" data-src="holder.js/100px200?theme=gray" alt="100%x200" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%22194%22%20height%3D%22200%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%20194%20200%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1603029d2e3%20text%20%7B%20fill%3A%23AAAAAA%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A10pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1603029d2e3%22%3E%3Crect%20width%3D%22194%22%20height%3D%22200%22%20fill%3D%22%23EEEEEE%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2271.0546875%22%20y%3D%22104.5%22%3E194x200%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="height: 200px; width: 100%; display: block;">
																<div class="caption">
																	<div class="clearfix">
																		<span class="pull-right label label-grey info-label">Istanbul</span>
																	</div>

																	<h3 class="search-title">
																		Other Analysis
																	</h3>
																	<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam ...</p>
																</div>
																
															</div>
														</div>
													</div>
													<div style="margin-left: 65%">
														<h5 class="media-heading"><i class="ace-icon fa fa-hand-o-right"></i><i class="ace-icon fa fa-hand-o-right"></i><i class="ace-icon fa fa-hand-o-right"></i>
															<a href="http://211.87.227.91:18080/waterCC" class="blue">———点击此处查看详情——————</a>
														</h5>
													</div>
													<br>
													</div>

													
												</div>
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

			

			
		</div>
        </div>
    
										
										
										
											 
										</div>
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
		</div>
	
	
  </body>
</html>
