<%@page import="com.sdu.entity.Admin"%>
<%@page import="org.apache.struts2.interceptor.SessionAware"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<div id="navbar" class="navbar navbar-default ace-save-state" style="height:30px">
			<div class="navbar-container ace-save-state" id="navbar-container">

				<div class="navbar-header pull-left">
					<a href="basic.jsp" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							数据分析平台
						</small>
					</a>
				</div>

				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="grey dropdown-modal">
							
							<a data-toggle="dropdown" class="dropdown-toggle" style="width: 60px" href="#">
								<i style="line-height:45px" class="ace-icon fa fa-arrow-circle-down fa-4"></i>
								<span id="messageCount" class="badge badge-grey">0</span>
							</a>

							<ul id="uploadMessage" class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-check">
									</i>暂时没有消息
								</li>		
							</ul>
						</li>

						<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i style="line-height:45px" class="ace-icon fa fa-file-text-o "></i>
								<span class="badge badge-success">5</span>
							</a>
							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-file-text"></i>
									5条日志
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar navbar-pink">
										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
														2017年10月26日 19:57:17，退出系统
													</span>
													
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<i class="btn btn-xs btn-primary fa fa-user"></i>
												2017年10月26日 19:47:08，删除了一个模型Bob just signed up as an editor ...
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-success fa fa-shopping-cart"></i>
														2017年10月26日 19:43:46，新建了一个项目
													</span>
												</div>
											</a>
										</li>

										<li>
											<a href="#">
												<div class="clearfix">
													<span class="pull-left">
														<i class="btn btn-xs no-hover btn-info fa fa-twitter"></i>
														2017年10月26日 19:41:06，登录系统
													</span>
												</div>
											</a>
										</li>
									</ul>
								</li>

								<li class="dropdown-footer">
									<a href="#">
										查看所有操作日志
										<i class="ace-icon fa fa-arrow-right"></i>
									</a>
								</li>
							</ul>
						</li>
						<li class="light-blue dropdown-modal">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="img/head.png" alt="用户头像" />
								<span class="user-info">
									<small>Welcome,</small>
									<%
									Admin user=(Admin)session.getAttribute("user");
									if(user!=null)
									{		
									%>
									<%=user.getName() %>
									<%}else
									{
								
									} %>
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="ace-icon fa fa-cog"></i>
										设置
									</a>
								</li>

								<li>
									<sx:a href="ajaxAction?address=Profile" targets="diff" executeScripts="true">
									<i class="ace-icon fa fa-user"></i>
										个人中心
									</sx:a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="Logout">
										<i class="ace-icon fa fa-power-off"></i>
										退出登录
										
									</a>
								</li>
							</ul>
						</li>
					</ul>
				</div>
			</div><!-- /.navbar-container -->
		</div>
		<script src="assets/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
			window.setTimeout("queryUploadMessage()",100);
			window.setInterval("queryUploadMessage()",10000);
		/* queryUploadMessage(); */
	});
	function queryUploadMessage(){
		$.post("Advice_QueryNotRead.action",
		{},function(data,status){
			//console.log("进入function");
			if(data.count>0){
				//console.log("进入if");
				//console.log("upload:"+($("#dropdown_content").length<=0));
				if($("#dropdown_content").length<=0){
					$("#uploadMessage").empty();
					$("#messageCount").text(data.count);
					$("#uploadMessage").append("<li class='dropdown-header'><i class='ace-icon fa fa-check'></i>共完成"+data.count+"个任务</li>");
					$("#uploadMessage").append("<li  id='dropdown_content'  class='dropdown-content'></li>");
					$("#dropdown_content").append("<ul id='dropdown_menu' class='dropdown-menu dropdown-navbar'></ul>");
				}
				var message = JSON.parse(data.data);
				var i;
				for( i = 0;i<data.count&& i<5;i++){
					if( $("#"+message[i].a_id).length<=0){
						$("#dropdown_menu").append("<li id='"+message[i].a_id+"'><a href='datafile.jsp'><div class='clearfix'><span class='pull-left'><i class='btn btn-xs no-hover btn-pink fa fa-comment'></i>"+message[i].a_content+"</span></div></a><li>");
					}
				}
				if(i ==5 &&$("#showAllMessage").length<=0){
					$("#uploadMessage").append("<li id='showAllMessage' class='dropdown-footer'><a href='#'>查看所有消息<i class='ace-icon fa fa-arrow-right'></i></a></li>");
				}
			}
		});
	}
</script>