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
	<form class="form-horizontal" role="form" action="Probility" name="ProbilityForm" id="ProbilityForm" method="post" enctype="multipart/form-data" >
	<legend ><center><h2>概率分布</h2></center></legend>
				<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="P_type" id="P_typeL">选择概率分布</label>

										<div class="col-sm-9">
											
											<select name="P_type" id="P_type" class="col-sm-6">
 											 <option value="norm"  selected="selected">正态分布</option>
 											 <option value="binom">二项分布</option>
 											 <option value="pois">泊松分布</option>
 											 </select>
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="number" id="numberL">服从分布的随机数个数 </label>

										<div class="col-sm-9">
											<input type="text" id="number" name="number" placeholder=""  class="col-xs-10 col-sm-5" required="true"/>
											
										</div>
							</div>
							<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="mean" id="meanL">分布均值 </label>

										<div class="col-sm-9">
											<input type="text" id="mean" name="mean" placeholder="默认设置为0"  class="col-xs-10 col-sm-5"/>
											
										</div>
							</div>
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="sd" id="sdL">分布标准差 </label>

								<div class="col-sm-9">
								<input type="text" id="sd" name="sd" placeholder="默认设置为1"  class="col-xs-10 col-sm-5" />
								
								</div>
							</div>
						
									
										<div class="col-md-offset-3 col-md-9">
											<button  class="btn btn-info" id="RgBtn"  type="submit" value="提交">
												<i class="ace-icon fa fa-check bigger-110"></i>
												Submit
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" value="重置">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												Reset
											</button>
										</div>
								</form>
								<div class="col-sm-12">
										<h3 class="header blue lighter smaller">
											<i class="ace-icon fa fa-list smaller-90"></i>
											概率分布
										</h3>

										<div id="accordion" class="accordion-style2">
											<div class="group">
												<h3 class="accordion-header">概率分布</h3>
												<div>
												<img src="img/probility.png" alt="图片加载失败"/>
												
												</div>
											</div>
											
												<div class="group">
												<h3 class="accordion-header">概率分布结果</h3>

												<div>
													<p>
														分布结果主要包括了按照所选分布类型和要求所得到的样本点
													</p>
													
													
												</div>
											</div>
										</div><!-- #accordion -->
									</div><!-- ./span -->
							
 </div>
 
<script type="text/javascript">
jQuery(function($) {
			//console.log("aaaaaaaaa");
				jQuery(function($) {

//jquery accordion
				$( "#accordion" ).accordion({
					collapsible: true ,
					heightStyle: "content",
					animate: 250,
					header: ".accordion-header"
				}).sortable({
					axis: "y",
					handle: ".accordion-header",
					stop: function( event, ui ) {
						// IE doesn't register the blur when sorting
						// so trigger focusout handlers to remove .ui-state-focus
						ui.item.children( ".accordion-header" ).triggerHandler( "focusout" );
					}
				});

});
			});

 
</script>
<script type="text/javascript">
		jQuery(function($) {
				$("#P_type").change(function(){
    				var selectedValue=$(this).val();
    if(selectedValue=="binom"){
      $("#sdL").show();
             $("#sd").show();
        $("#numberL").html("模拟样本数");
         $("#meanL").html("实验次数");
          $("#sdL").html("成功概率");
    }
     if(selectedValue=="pois"){
            $("#sdL").hide();
             $("#sd").hide();
              $("#numberL").html("模拟样本数");
             $("#meanL").html("lambda");
        }
        if(selectedValue=="norm"){
        $("#sdL").show();
             $("#sd").show();
        $("#numberL").html("服从分布的随机数个数");
         $("#meanL").html("分布均值");
          $("#sdL").html("分布标准差");
    }
				});
				});	
			
</script>

</body>
</html>