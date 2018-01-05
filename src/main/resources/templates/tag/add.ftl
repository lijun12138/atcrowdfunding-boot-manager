<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH }/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH }/css/main.css">
	<link rel="stylesheet" href="${APP_PATH }/css/doc.min.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	</style>
  </head>

  <body>

   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
           <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 许可维护</a></div>
        </div>
    		 <#include "common/userinfo.ftl">
        </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
      
       <div class="col-sm-3 col-md-2 sidebar">
			<div class="tree">
				<#include "common/menu.ftl">
			</div>
        </div>
        <script type="text/javascript">
		</script>
		
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="#">数据列表</a></li>
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form id="addForm">
				  <div class="form-group">
					<label for="exampleInputPassword1">标签名称</label>
					<input type="text"  class="form-control" id="fname" placeholder="请输入标签名称">
				  </div>
					<label for="exampleInputPassword1">图标icon</label>
					<p class="help-block label label-warning">请在？中查找图标对应的代码</p>
					<div class="form-group has-success has-feedback">
						<select class="form-control" id="ficon" >
			                <option value="glyphicon glyphicon-th-large">glyphicon glyphicon-th-large</option>
			                <option value="glyphicon glyphicon-tag">glyphicon glyphicon-tag</option>
			            </select>
					</div>
				  <button onclick="doAdd()" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
				  <button type="reset" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
				</form>
			  </div>
			</div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
			<h4 class="modal-title" id="myModalLabel">帮助</h4>
		  </div>
		  <div class="modal-body">
			<div class="bs-callout bs-callout-info">
				<h4>图标对应代码</h4>
				<p>
				<span class="glyphicon glyphicon-th-large">glyphicon glyphicon-th-large</span>
				<span class="glyphicon glyphicon-tag">glyphicon glyphicon-tag</span>
				</p>
			  </div>
			
		  <!--
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
		</div>
	  </div>
	</div>
    <script src="${APP_PATH }/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH }/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH }/script/docs.min.js"></script>
	<script src="${APP_PATH }/jquery/layer/layer.js"></script>
	<script src="${APP_PATH }/script/menu.js"></script>
        <script type="text/javascript">
            $(function () {
			    $(".list-group-item").click(function(){
				    if ( $(this).find("ul") ) {
						$(this).toggleClass("tree-closed");
						if ( $(this).hasClass("tree-closed") ) {
							$("ul", this).hide("fast");
						} else {
							$("ul", this).show("fast");
						}
					}
				});
            });
            
            function doAdd(){
            	var loadingIndex=-1;
            	$.ajax({
            		type : "post",
            		data : {
            			name : $("#fname").val().trim(),
            			icon : $("#ficon").val(),
            			pid : "${RequestParameters.pid}"
            		},
            		url : "${APP_PATH}/tag/doAdd",
            		beforeSend : function(){
            			var name= $("#fname").val();
            			if(name.trim()==""){
            				layer.msg("权限名不能为空！", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
            				name.focus();
                			return false;
            			}
                		loadingIndex = layer.msg('添加中', {icon: 16});
            		},
            		success : function(result){
            			layer.close(loadingIndex);
            			if(result.success){
            				window.location.href = "${APP_PATH}/tag/index"
            			}else{
            				layer.msg(result.message, {time:1000, icon:5, shift:6});
            			}
            				
            		}
            	})
            }
            
            
        </script>
  </body>
</html>
