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
					

					<div class="page-content">
					<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								

								<div class="hr hr-18 hr-double dotted"></div><!--水平分割线-->

								<div class="widget-box">
									<div class="widget-header widget-header-blue widget-header-flat">
										<h4 class="widget-title lighter">项目管理</h4>
										
									</div>
									<div class="widget-body" >
										<div class="widget-main">
											 <div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 85%;text-align: center;margin:0 auto;padding: 10px 30px">
											 <div id="toolbar">
											 		<button id="new" class="btn btn-success" >
											            <i class="glyphicon glyphicon-plus"></i> 新建项目
											        </button>
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
		var data = [
            {
                
                "name": "水质分析项目",
                "detail":"用于分析检测水质的大数据文件",
                "createtime":"2017-10-28 15:00:56",
                "creator": "Administrator"
            },
             {
                
                "name": "济南热力供应项目",
                "detail":"分析济南近几年供暖情况",
                "createtime":"2017-10-26 15:00:56",
                "creator": "Administrator"
            },
            {
                
                "name": "项目A",
                "detail":"训练模型",
                "createtime":"2017-10-31 15:00:56",
                "creator": "Administrator"
            },
             {
                
                "name": "项目B",
                "detail":"测试模型",
                "createtime":"2017-10-31 15:00:56",
                "creator": "Administrator"
            },
             {
                
                "name": "项目C",
                "detail":"测试模型",
                "createtime":"2017-10-31 15:00:56",
                "creator": "Administrator"
            },
             {
                
                "name": "项目D",
                "detail":"训练模型",
                "createtime":"2017-10-27 15:15:56",
                "creator": "Administrator"
            },
             {
                "name": "项目E",
                "detail":"测试模型",
                "createtime":"2017-10-31 15:00:22",
                "creator": "Administrator"
            },
             {
                
                "name": "项目F",
                "detail":"训练模型",
                "createtime":"2017-10-31 15:35:56",
                "creator": "Administrator"
            }, {
                
                "name": "项目21",
                "detail":"训练模型",
                "createtime":"2017-10-27 15:00:56",
                "creator": "Administrator"
            }, {
                
                "name": "项目31",
                "detail":"训练模型",
                "createtime":"2017-10-27 15:41:56",
                "creator": "Administrator"
            }, {
                
                "name": "项目41",
                "detail":"训练模型",
                "createtime":"2017-10-27 15:00:56",
                "creator": "Administrator"
            }, {
                
                "name": "项目51",
                "detail":"测试模型",
                "createtime":"2017-10-31 15:00:56",
                "creator": "Administrator"
            }
        ];
    var $table = $('#project-table'),
        $remove = $('#remove'),
        $newProject = $('#new'),
        selections = [];
    function initTable() {
        $table.bootstrapTable({
           
   			height: 500,
    
            columns: [
                    {
              checkbox: true, // 显示一个勾选框
              align: 'center' // 居中显示
          }, {
              field: 'name', // 返回json数据中的name
              title: '项目名称', // 表格表头显示文字
              align: 'center', // 左右居中
              valign: 'middle' // 上下居中
          }, {
              field: 'detail',
              title: '项目介绍',
              align: 'left',
              valign: 'middle'
          }, {
              field: 'createtime',
              title: '创建时间',
              align: 'center',
              valign: 'middle'
          }, {
          	  field:'creator',
              title: '创建人',
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
                   return '<button class="btn btn-xs btn-info btn-sm" data-toggle="tooltip" data-placement="bottom" title="收藏" onclick="like(\'' + row.stdId + '\')"><i class="ace-icon fa fa-heart-o bigger-120"></i></button>'
              				 +'<button class="btn btn-xs btn-danger btn-sm" onclick="del(\'' + row.stdId + '\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>';
              }
          }
            ],
            data:data
        });
       
        $remove.click(function () {
            var ids = getIdSelections();
            alert("ids=="+ids);
            $table.bootstrapTable('remove', {
                field: 'name',
                values: ids
            });
            //$remove.prop('disabled', true);
        });
         $newProject.click(function () {
            //alert("跳转到新建项目页面");
            window.location.href="new_project.jsp"; 
        });
       
    }
    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.name
        });
    }
    
   
    $(function () {
       initTable();
    });
    
</script>

	</body>
	
</html>
