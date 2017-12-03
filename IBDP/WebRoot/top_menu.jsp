<%@page import="com.sdu.entity.Admin"%>
<%@page import="org.apache.struts2.interceptor.SessionAware"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<div id="sidebar" class="sidebar      h-sidebar                navbar-collapse collapse          ace-save-state">
				<script type="text/javascript">
					try{ace.settings.loadState('sidebar')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
				

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success">I</span>

						<span class="btn btn-info">B</span>

						<span class="btn btn-warning">D</span>

						<span class="btn btn-danger">P</span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="hover"><!-- class="active open hover" 激活状态，之后再完善-->
						<a href="basic.jsp">
							<i class="menu-icon fa fa-tachometer"></i>
							<span class="menu-text"> 首页 </span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="hover">
						<a href="datafile.jsp" >
							<i class="menu-icon fa fa-folder-open"></i>
							<span class="menu-text">
								数据
							</span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

					</li>

					<li class="hover">
						<a href="project.jsp" >
							<i class="menu-icon fa fa-list"></i>
							<span class="menu-text"> 项目 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>
						

					</li>

					<li class="hover">
						<a href="#" class="dropdown-toggle">
							<i class="menu-icon fa fa-pencil-square-o"></i>
							<span class="menu-text"> 模型 &amp; 算法 </span>

							<b class="arrow fa fa-angle-down"></b>
						</a>

						<b class="arrow"></b>

						<ul class="submenu">
							<li class="hover">
								<a href="model.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									模型库
								</a>

								<b class="arrow"></b>
							</li>

							<li class="hover">
								<a href="algorithm.jsp">
									<i class="menu-icon fa fa-caret-right"></i>
									算法库
								</a>

								<b class="arrow"></b>
							</li>
						</ul>
					</li>

					<li class="hover">
						<a href="widgets.html">
							<i class="menu-icon fa fa-list-alt"></i>
							<span class="menu-text"> 结果 
							<span class="badge badge-transparent tooltip-info" title="2 个新结果集">
									<i class="ace-icon fa fa-exclamation-triangle blue bigger-100"></i>
								</span> 
							</span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="hover">
						<a href="calendar.html">
							<i class="menu-icon fa fa-desktop"></i>

							<span class="menu-text">
								环境监测
								<!-- <span class="badge badge-transparent tooltip-error" title="2 Important Events">
									<i class="ace-icon fa fa-exclamation-triangle red bigger-130"></i>
								</span> -->
							</span>
						</a>

						<b class="arrow"></b>
					</li>

					<li class="hover">
						<a href="instance.jsp">
							<i class="menu-icon fa fa-picture-o"></i>
							<span class="menu-text"> 应用实例 </span>
						</a>

						<b class="arrow"></b>
					</li>
				</ul><!-- /.nav-list -->
			</div>
