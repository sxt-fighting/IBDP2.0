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
		<link rel="stylesheet" href="assets/css/dropzone.css">
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
<style type="text/css">
	.modal-chat {
        width: 58.333%;
        height:78.333%;
        overflow:scroll;
        overflow-x:auto;
        overflow-y:auto 
    }
</style>
	
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
										<h4 class="widget-title lighter">文件管理</h4>
										
									</div>
									<div class="widget-body" >
										<div class="widget-main">
										
        <div class="row" style="width: 100%;margin:0 auto" >
            <div class="col-sm-3"  >
                <div class="panel panel-primary ">
                    <div class="panel-heading">
                        <h3 class="panel-title">目录</h3>
                    </div>
                    <div class="panel-body right_centent" style="">
                        <div id="left-tree"></div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9" >
                <div class="panel panel-primary ">
                    <div class="panel-heading" style="text-align: c">
                        <h3 class="panel-title">文件</h3>
                    </div>
                <div class="panel-body right_centent">
                <div style="border: 1px solid;border-color: rgba(175,175,175,0.16);width: 100%;text-align: center;margin:0 auto;padding: 10px 30px">
											 <div id="toolbar" class="row"  >
											  <div class="btn-group" >
												<button id="uploadButton" data-toggle="dropdown" class="btn btn-primary btn-white dropdown-toggle" aria-expanded="false">
													<i class="fa  fa-cloud-upload"></i> 上传
													<i class="ace-icon fa fa-angle-down icon-on-right"></i>
												</button>
												<ul class="dropdown-menu">
													<li>
														<a href="javascript:void(0)" onclick="uploadFile()">上传文件
 														  <!--<input title="点击选择文件"  id="upload" multiple="" accept="*/*" type="file" name="uploadFile" style="position:absolute;opacity:0;top:0;left:0;width:100%;height:30px"> -->
 														 <!-- 	<button onclick=""></button> -->
 														 	
														</a>
													</li>

													<li class="divider"></li>

													<li>
														<a href="#">上传文件夹
														<span>
 														  <input title="点击选择文件夹"   id="dialog" multiple="" type="file" name="uploadFolder" webkitdirectory style="position:absolute;opacity:0;top:46px ;left:0;width:100%;height:30px;">
 														</span>
														</a>
													</li>
												</ul>
											</div>
											 <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    											<div class="modal-dialog">
        											<div class="modal-content">
           												<div class="modal-header" >
                											<h5 class="modal-title">选择文件</h5>
            											</div>
            											<div id="drop_content" class="modal-body">
            												
            											</div>
            											<div class="modal-footer">
            												<button onclick="hideModal()">关闭</button>
            											</div>
        											</div>
    											</div>
											</div>
											 <button id="download" class="btn  btn-white btn-info"  onclick="downClick()">
											            <i class="fa fa-cloud-download"></i> 下载
											   			
											  </button>   
											 <button id="new" class="btn btn-white btn-info" data-toggle="modal" data-target="#newDir">
											            <i class="fa  fa-folder"></i> 新建文件夹
											 </button>
											 <!-- 模态框 -->
											 <div class="modal fade" id="newDir" tabindex="-1">
											 	<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																				&times;
																</button>
																<h4 class="modal-title" id="myModalLabel">
																	输入新建文件夹的名字
																</h4>
														</div>
													<div class="modal-body">
														<input id="newDirName" type="text" style="width:200px"/>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
														<button type="button" class="btn btn-primary" onclick="addNode()">添加</button>
													</div>
													</div><!-- /.modal-content -->
											 	</div>
											 </div>
   											 <button id="remove" class="btn btn-white btn-danger" >
											            <i class="glyphicon glyphicon-trash"></i> 删除
											        </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											        <button class="btn btn-minier btn-primary">全部文件</button>
											        <button class="btn btn-minier btn-success">文档</button>
											        <button class="btn btn-minier btn-success">图片</button>
											        <button class="btn btn-minier btn-success">视频</button>
											        <button class="btn btn-minier btn-purple">SQL</button>
											        <button class="btn btn-minier btn-purple">CSV</button>
											        <button class="btn btn-minier btn-purple">XLS</button>
											        
											        
										     </div>
										    
											 	<table id="project-table" 
										  		  data-toolbar="#toolbar"
										           
										         >
												</table><!-- data-page-size="5" data-search="true" data-show-refresh="true" data-show-pagination-switch="true" data-pagination="true" data-page-list="[3, 5, 10, ALL]" data-show-toggle="true" data-url="/examples/bootstrap_table/data" -->
											</div>
                </div>
                <!--编辑操作权限 end-->
                </div>
            </div>
        </div>
    
										
										
										
											 
										</div>
									</div>

								</div>
								


								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
						<div class="modal fade " id="viewFileModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
								         aria-hidden="true">
								         
								          <div class="modal-dialog" style=" height:700px;width: 65%;">
								            <div style="text-align:center;background-color: #F5F5F5 ;height:40px;color: #1d6fa6;font-size: large">
													<label style="padding: 5px;float:center;font-size:18px">文件内容预览 </label>
													<button class="btn btn-sm pull-right" style="width:50px;padding: 9.5px;" data-dismiss="modal"><i class="ace-icon glyphicon glyphicon-remove"></i></button>
													</div>
								            <div id="modalcon"  class="modal-content" style="height: 700px;overflow:scroll;overflow-x:auto;overflow-y:auto ">
								              
								            </div>
								         <!--  <div class="modal-footer">
												<button type="button" class="btn btn-sm btn-info" ng-click="saveModelInfo()" data-dismiss="modal">确定</button>
												<button type="button" class="btn  btn-sm btn-default" ng-click="cancel_newModel()" data-dismiss="modal">关闭</button>
											</div> --> 
								        </div>
								         
								        
								    </div>

						
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
		<!-- bootstrap-treeview.min.js -->
		<script src="assets/js/bootstrap-treeview.js"></script>
        <script src="assets/js/ajaxfileupload.js"></script>
		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>
		<script src="assets/js/dropzone.js"></script>
		<script type="text/javascript">
		var $table = $('#project-table'),
	        $remove = $('#remove'),
	       
	        selections = [];
	    var project_id,datafile_type;
	    function addNode(){
	    	var parentNode = $('#left-tree').treeview('getSelected');
	    	console.log("111:"+$('#newDirName').val());
	    	 var node = {
                     text:$('#newDirName').val(),
                     id:"",
                     project_id:project_id,
                     datafile_type:$('#newDirName').val()
                 };
	    	$('#left-tree').treeview('addNode', [node, parentNode]);
	    	alert("添加成功!如果不为其上传文件，下次刷新文件夹就会消失!");
	    	$('#newDir').modal('hide');
	    	$('#newDirName').val("");
	    }
        $(function(){
    /*     var treeStr=[
                {
                    "text":"全部文件",
                    "nodes":[
                    {
                        "text":"水质分析项目",
                        "nodes":[
                        {
                            "text":"分析数据",
                            "nodes":[]
                        },
                        {
                            "text":"结果集",
                            "nodes":[]
                        }
                        ]
                    },
                    {
                        "text":"济南冬季供暖项目",
                        "nodes":[
                        {
                            "text":"分析数据",
                            "nodes":[]
                        },
                        {
                            "text":"结果集",
                            "nodes":[]
                        }
                        ]
                    }
                    ]
                }]; */
            
            onLoad();
            BindEvent();
            //获取树数据
            function getTree(){
                var tree;
                // var tree=[
                // {
                //     "text":"根目录",
                //     "nodes":[
                //     {
                //         "text":"一级目录A",
                //         "nodes":[
                //         {
                //             "text":"二级目录A",
                //             "nodes":[
                //             {
                //                 "text":"三级目录B"
                //             }
                //             ]
                //         },
                //         {
                //             "text":"二级目录B",
                //             "nodes":[]
                //         }
                //         ]
                //     },
                //     {
                //         "text":"一级目录B",
                //         "nodes":[]
                //     }
                //     ]
                // }];
                // var tree=[{"text":"根目录","id":"592ffe4d43d8b70638878989","nodes":[{"text":"一级目录A","id":"592ffe4d43d8b7063887898a","nodes":[{"text":"二级目录A","id":"592ffe4d43d8b7063887898c","nodes":[{"text":"三级目录A","id":"592ffe4d43d8b7063887898e","nodes":[]}]},{"text":"二级目录B","id":"592ffe4d43d8b7063887898d","nodes":[]}]},{"text":"一级目录B","id":"592ffe4d43d8b7063887898b","nodes":[]}]}];
                return tree;   
            }
             //页面加载
             function onLoad()
             {
            	 $("#uploadButton").hide();
                 $("#new").hide();
     	      	 $.ajax({
            		 type:"post",
            		 url:"DataFile_getTree.action",
            		 success:function(data,status){
            			 var treeStr = [{
            				 "text":data.text,"nodes":JSON.parse(data.nodes),"height":1,
            				 "state":{selected:true}
            			 }];
            			//var treeStr=data;
            			 $('#left-tree').treeview({
                             data: treeStr,
                             levels: 3,
                             onNodeSelected:function(event, node){
                            	 //console.log('node=='+JSON.stringify(node));
                                // $('#editName').val(node.text);
                                //console.log(node.level);
                                if(node.level==1){
                                	project_id = -1;
                                	datafile_type="null";
                                	$("#uploadButton").hide();
                //                	$("#download").show();
                                	$("#new").hide();
                                }else if(node.level ==2){
                                	project_id = node.project_id;
                                	datafile_type = "null";
                                	$("#uploadButton").show();
                   //             	$("#download").show();
                                	$("#new").show();
                                }else if(node.level ==3){
                                	project_id = node.project_id;
                                	datafile_type = node.datafile_type;
                                	$("#uploadButton").show();
                  //              	$("#download").show();
                                	$("#new").hide();
                                }
                                //销毁是为了清除offset的数据
                               $table.bootstrapTable('destroy');
                                initTable(); 
                              //  initTable();
                              //有表的时候initTable是不会有什么效果的。
                             },
                             showCheckbox:false//是否显示多选
                             // collapseIcon:'ace-icon tree-plus'
                             
                         }); 
            		 }
            	 });
     	      	Dropzone.autoDiscover = false;
     	    	/* $('#dropz').dropzone({
     	            url:"DataFile_saveDataFile.action",
     	             type:'post',
     	            data:{
     					project_id:project_id,
     					datafile_type:datafile_type
     				},
     				dataType:'json',
     	            maxFiles: 10,
     	            maxFilesize:10240, 
     	        });*/
             }
             //事件注册
             function BindEvent()
             {
                
            /*-----页面pannel内容区高度自适应 start-----*/
            $(window).resize(function () {
                setCenterHeight();
            });
            setCenterHeight();  
            function setCenterHeight() {
                var height = $(window).height();
                var centerHight = height - 240;
                $(".right_centent").height(centerHight).css("overflow", "auto");
            }
             }
            /*-----页面pannel内容区高度自适应 end-----*/
        });
    </script>
		<script>
	    //------列表中的删除不是顶部的删除
	      
        function del(did){
     	   $.post("DataFile_delDataFile.action",
     			   {
     			     did:did,
     			    
     			   },
     			   function(data,status){
     				  $table.bootstrapTable('refresh');
     			   });
        }
	    
    function download(did){
        	console.log("开始下载");
        	window.open("<%=request.getContextPath()%>/DataFile_downloadFile.action?did="+did);
        	
        	/* .setTimeout("window.close()", 2000);  */ 
      	/*    $.post("DataFile_downloadFile.action",
      			   {
      			     did:did,
      			   },
      			 function(data,status){
      				  console.log("success");
      			   }); */
      	}
		/* var data = [
            {
                
                "name": "水质分析文件.csv",
                "size":"37MB",
                "createtime":"2017-10-28 15:00:56"
            },
            {
                
                "name": "煤矿数据.sql",
                "size":"319MB",
                "createtime":"2017-10-31 15:00:56"
            },
             {
                
                "name": "水质result.jpg",
                "size":"976KB",
                "createtime":"2017-10-31 15:00:56"
            }
        ]; */
        
     //查看数据
     function viewdata(did){
        	console.log("查看数据");
        	  
        	$("#viewFileModal").modal({
				remote:"<%=request.getContextPath()%>/readFileToShow.action?did="+did 
			});
        	
	    //	var url = "${pageContext.request.contextPath}/datashow/readFileToShow.action";
			//var params = {
			//	'rowid':rowId
			//};
			//$.post(url, params, callback);
	}
        //开始任务
        function executeTask(did){
        	$.post("<%=request.getContextPath()%>/DataFile_executeTask.action",
        	{
        		did:did,
  //      		project_id:project_id,
        	},function(data){
        		//alert("开始执行!");
        	});
        }
    function initTable() {
        $table.bootstrapTable({
        	  url: "<%=request.getContextPath()%>/DataFile_showAllDataFiles.action", // 获取表格数据的url
        	 // data:data,
              cache: false, // 设置为 false 禁用 AJAX 数据缓存， 默认为true
              striped: true,  //表格显示条纹，默认为false
              pagination: true, // 在表格底部显示分页组件，默认false
 //             pageList: [10, 20], // 设置页面可以显示的数据条数
              pageSize: 10, // 页面数据条数
              pageNumber: 1, // 首页页码
              sidePagination: 'server', // 设置为服务器端分页
              //对后台返回的数据进行处理
              responseHandler:function(res) {
            	  console.log("到了前台");
            	  console.log('DataJson'+JSON.stringify(res.DataJson));
            	 
                   return JSON.parse(res.DataJson) ; //数据
                    
              },
              queryParams: function (params) { // 请求服务器数据时发送的参数，可以在这里添加额外的查询参数，返回false则终止请求

                  return {
                      pageSize: params.limit, // 每页要显示的数据条数
                      offset: params.offset, // 每页显示数据的开始行号
                      sort: params.sort, // 要排序的字段
                      sortOrder: params.order, // 排序规则
                      project_id:project_id,
                      datafile_type:datafile_type
                      //dataId:$("#dataId").val() // 额外添加的参数
                      
                  }
              },
              sortName: 'id', // 要排序的字段
              sortOrder: 'desc', // 排qweqwe weqweqweweqeeqweqweqw序规则
   		
            height: 650,
            columns: [
                    {
              checkbox: true, // 显示一个勾选框
              align: 'center' // 居中显示
          }, {
              field: 'name', // 返回json数据中的name
              title: '文件名', // 表格表头显示文字
              width: 500,
              align: 'center', // 左右居中
              valign: 'middle' // 上下居中
          }, /* {
              field: 'projectName', // 返回json数据中的name
              title: '项目名称', // 表格表头显示文字
              width: 200,
              align: 'center', // 左右居中
              valign: 'middle' // 上下居中
          },{
              field: 'type', // 返回json数据中的name
              title: '类型', // 表格表头显示文字
              align: 'center', // 左右居中
              valign: 'middle' // 上下居中
          } ,*/{
              field: 'size',
              title: '大小',
              width: 100,
              align: 'left',
              valign: 'middle'
          }, {
              field: 'uploadDate',
              title: '修改日期时间',
              align: 'center',
              valign: 'middle'
          },
           {
              title: '操作',
              align: 'center',
              valign: 'middle',
              width: 260, // 定义列的宽度，单位为像素px
              formatter: function (value, row, index) {
            	 // console.log(row.name);
            	//  console.log(row.id);
            	//  console.log(row.localpath);
                   return '<button class="btn btn-xs btn-info btn-sm" data-toggle="tooltip" data-placement="bottom" title="预览" onclick="viewdata(\'' + row.id + '\')"><i class="ace-icon fa fa-search-plus bigger-120"></i></button>'
                   			+'<button class="btn btn-xs btn-success btn-sm" title="下载" onclick="download(\'' + row.id + '\')"><i class="ace-icon fa fa-download bigger-120"></i></button>'
              				 +'<button class="btn btn-xs btn-warning btn-sm" title="开始任务" onclick="executeTask(\'' + row.id + '\')"><i class="ace-icon fa fa-caret-square-o-right bigger-120"></i></button>'
              				+'<button class="btn btn-xs btn-danger btn-sm" title="删除" onclick="del(\'' + row.id + '\')"><i class="ace-icon fa fa-trash-o bigger-120"></i></button>';
              }
          }
            ],
            /* data:data */
        });
  		
  		
		
       
        $remove.click(function () {
            var ids = getIdSelections();
            console.log(typeof(ids));
            //alert("ids=="+ids);
            $table.bootstrapTable('remove', {
                field: 'name',
                values: ids
            });
            $.post("DataFile_delDataFiles.action",{
            	//ids以字符串的形式传给后台
            	ids:JSON.stringify(ids)
            },function(data,status){
				  $table.bootstrapTable('refresh');
			   });
            //$remove.prop('disabled', true);
        });
        
       
    }
    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id;
        });
    }
    
   
    $(function () {
    	$("#viewFileModal").on('hidden.bs.modal', function () {
        	 $(this).removeData("bs.modal");
			  // 执行一些动作...
			});
    	/* var data=[];
    	$.ajax({
    	    url:'getList.Action',
    	    type:'POST', //GET
    	    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
    	    success:function(data,textStatus,jqXHR){
    	        console.log(data)
    	        console.log(textStatus)
    	        console.log(jqXHR)
    	    },
    	    error:function(xhr,textStatus){
    	        console.log('错误')
    	        console.log(xhr)
    	        console.log(textStatus)
    	    },
    	    complete:function(){
    	        console.log('结束')
    	    }
    	}); */
       initTable();
       
    });
    //下载
    function downClick(){
    	var ids =  getIdSelections();
    	for(var i = 0;i<ids.length;i++){
    		download(ids[i]);
    	}
    }
    function uploadFile(){
    	console.log("uploadFile中project_id:"+project_id);
    	console.log("uploadFile中的datafile_type"+datafile_type);
    	/*  $('#dropz').dropzone({
	            url:"DataFile_saveDataFile.action?project_id="+project_id+"&datafile_type="+datafile_type,
	            type:'post',
	            paramName:'uploadFile',
	            maxFiles: 10,
	            maxFilesize:10240,
	     }); */
	     $('#drop_content').append("<div id='dropz' class='dropzone'></div>")
    	 var myDropzone = new Dropzone("#dropz", {
	            url:"DataFile_saveDataFile.action?project_id="+project_id+"&datafile_type="+datafile_type,
	            type:'post',
	            paramName:'uploadFile',
	            maxFiles: 10,
	            maxFilesize:10240,
	     });
    	$('#uploadModal').modal();
    	
    }
    function hideModal(){
    	$('#dropz').remove();
    	$('#uploadModal').modal("hide");
    	$table.bootstrapTable('refresh');
    }
    //上传
    /* $("#upload").change(function(){
    	fileChange();
	});
    function fileChange(){
    	console.log("执行了ajax");
		$.ajaxFileUpload({
			url:'DataFile_saveDataFile.action',
			type:'post',
			data:{
				project_id:project_id,
				datafile_type:datafile_type
			},
			secureuri:false,
			cache:false,
			fileElementId:'upload',
			dataType:'json',
			contentType:false,
            processData:false,
			async:false,
			success:function(data){
 				console.log("上传成功!");
				console.log(data);
				console.log("执行inittable之前"); 
				 $table.bootstrapTable('refresh');
 		    	console.log("支持inittable之后!"); 
			},
			error:function(){
				console.log("服务器响应失败!");
			}
		});
		$("#upload").change(function(){
	    	fileChange();
		});
		
    } */
</script>
</body>	
</html>
