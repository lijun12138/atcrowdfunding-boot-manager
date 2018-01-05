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
				  <li class="active">修改</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form">
				  <div class="form-group">
					<label for="exampleInputPassword1">许可名称</label>
					<input type="text" class="form-control" id="fname" value="${permission.name }">
				  </div>
				  <label for="exampleInputPassword1">图标icon</label>
					<p class="help-block label label-warning">请在？中查找图标对应的代码</p>
					<div class="form-group has-success has-feedback">
						<select class="form-control" id="ficon" >
			                <option value="glyphicon glyphicon-th-list">glyphicon glyphicon-th-list</option>
			                <option value="glyphicon glyphicon-dashboard">glyphicon glyphicon-dashboard</option>
			                <option value="glyphicon glyphicon glyphicon-tasks">glyphicon glyphicon glyphicon-tasks</option>
			                <option value="glyphicon glyphicon-user">glyphicon glyphicon-user</option>
			                <option value="glyphicon glyphicon-king">glyphicon glyphicon-king</option>
			                <option value="glyphicon glyphicon-lock">glyphicon glyphicon-lock</option>
			                <option value="glyphicon glyphicon-ok">glyphicon glyphicon-ok</option>
			                <option value="glyphicon glyphicon-check">glyphicon glyphicon-check</option>
			                <option value="glyphicon glyphicon-th-large">glyphicon glyphicon-th-large</option>
			                <option value="glyphicon glyphicon-picture">glyphicon glyphicon-picture</option>
			                <option value="glyphicon glyphicon-equalizer">glyphicon glyphicon-equalizer</option>
			                <option value="glyphicon glyphicon-random">glyphicon glyphicon-random</option>
			                <option value="glyphicon glyphicon-hdd">glyphicon glyphicon-hdd</option>
			                <option value="glyphicon glyphicon-comment">glyphicon glyphicon-comment</option>
			                <option value="glyphicon glyphicon-list">glyphicon glyphicon-list</option>
			                <option value="glyphicon glyphicon-tags">glyphicon glyphicon-tags</option>
			                <option value="glyphicon glyphicon-list-alt">glyphicon glyphicon-list-alt</option>
			            </select>
					</div>
				  <div class="form-group">
					<label for="exampleInputEmail1">url</label>
					<input type="text" class="form-control" id="furl" value="${permission.url }">
				  </div>
				  <button type="button" onclick="doUpdate(${permission.id})" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
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
				<h4>图标代码</h4>
				<p>
				<span class="glyphicon glyphicon-dashboard">glyphicon glyphicon-dashboard</span>
				<span class="glyphicon glyphicon glyphicon-tasks">glyphicon glyphicon glyphicon-tasks</span>
				<span class="glyphicon glyphicon-user">glyphicon glyphicon-user</span>
				<span class="glyphicon glyphicon-king">glyphicon glyphicon-king</span>
				<span class="glyphicon glyphicon-lock">glyphicon glyphicon-lock</span>
				<span class="glyphicon glyphicon-ok">glyphicon glyphicon-ok</span>
				<span class="glyphicon glyphicon-check">glyphicon glyphicon-check</span>
				<span class="glyphicon glyphicon-th-large">glyphicon glyphicon-th-large</span>
				<span class="glyphicon glyphicon-picture">glyphicon glyphicon-picture</span>
				<span class="glyphicon glyphicon-equalizer">glyphicon glyphicon-equalizer</span>
				<span class="glyphicon glyphicon-random">glyphicon glyphicon-random</span>
				<span class="glyphicon glyphicon-hdd">glyphicon glyphicon-hdd</span>
				<span class="glyphicon glyphicon-comment">glyphicon glyphicon-comment</span>
				<span class="glyphicon glyphicon-list">glyphicon glyphicon-list</span>
				<span class="glyphicon glyphicon-tags">glyphicon glyphicon-tags</span>
				<span class="glyphicon glyphicon-list-alt">glyphicon glyphicon-list-alt</span>
				</p>
			  </div>
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
            
            
            function doUpdate(id){
            	var loadingIndex = -1;
            	$.ajax({
            		type : "post",
            		data : {
            			id : id,
            			name : $("#fname").val(),
            			icon : $("#ficon").val(),
            			url : $("#furl").val()
            		},
            		url : "${APP_PATH}/permission/doUpdate",
            		beforeSend : function(){
            			var name= $("#fname").val();
            			var url= $("#furl").val();
            			if(name.trim()==""){
            				layer.msg("不能为空！", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
            				name.focus();
                			return false;
            			}
            			
                		if(url.trim()==""){
//                 			alert("用户名称不能为空！");
                			layer.msg("url不能为空！", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
                			url.focus();
                			return false;
                		}
                		loadingIndex = layer.msg('更新中', {icon: 16});
            		},
            		success : function(result){
            			layer.close(loadingIndex);
            			if(result.success){
            				window.location.href = "${APP_PATH}/permission/index";
            			}else{
            				layer.msg(result.message, {time:1000, icon:5, shift:6});
            			}
            				
            		}
            	})
            }
        </script>
  </body>
</html>
