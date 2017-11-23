<%@page import="com.sdu.entity.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>basic</title>
    <sx:head />
    <script type="text/javascript" src="jquery-3.2.1.min.js"></script>
  </head>
  <body>
<div class="col-xs-12">
<% Admin user = (Admin)session.getAttribute("user");
%>
<div class="col-xs-12 col-sm-3 center">
								               <div>
												<span class="profile-picture">
													<img id="avatar" class="editable img-responsive" alt="用户头像" src="img/head.png" />
												</span>

												<div class="space-4"></div>

												<div class="width-80 label label-info label-xlg arrowed-in arrowed-in-right">
													<div class="inline position-relative">
										
															<i class="ace-icon fa fa-circle light-green"></i>
															&nbsp;
															<span class="white"><%=user.getName() %></span>
														

													</div>
												</div>
											</div>
											</div>
											<div class="col-xs-12 col-sm-9 center">
											<div class="profile-user-info profile-user-info-striped">
												<div class="profile-info-row">
													<div class="profile-info-name"> 用户名</div>

													<div class="profile-info-value">
														<span class="editable" id="username"><%=user.getName() %></span>
													</div>
					
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> 公司 </div>

													<div class="profile-info-value">
														<span class="editable" id="company"><%=user.getCompany() %></span>
													</div>
													<div class="hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-success">
																<i class="ace-icon fa fa-check bigger-120"></i>
															</button>

															<button class="btn btn-xs btn-info">
																<i class="ace-icon fa fa-pencil bigger-120"></i>
															</button>
															</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> 邮箱 </div>

													<div class="profile-info-value">
														<span class="editable" id="email"><%=user.getEmail() %></span>
													</div>
													<div class="hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-success">
																<i class="ace-icon fa fa-check bigger-120"></i>
															</button>

															<button class="btn btn-xs btn-info">
																<i class="ace-icon fa fa-pencil bigger-120"></i>
															</button>
															</div>
												</div>

												<div class="profile-info-row">
													<div class="profile-info-name"> 电话 </div>

													<div class="profile-info-value">
														<span class="editable" id="phone"><%=user.getTelephone() %></span>
													</div>
													<div class="hidden-sm hidden-xs btn-group">
													<button class="btn btn-xs btn-success">
																<i class="ace-icon fa fa-check bigger-120"></i>
															</button>

															<button class="btn btn-xs btn-info">
																<i class="ace-icon fa fa-pencil bigger-120"></i>
															</button>
															</div>
												</div>

											</div>
											</div>

</div>

</body>
</html>