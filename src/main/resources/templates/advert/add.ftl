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
           <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 广告管理</a></div>
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
        
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="#">数据列表</a></li>
				  <li class="active">新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">表单数据<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form id="formID" method="post" enctype="multipart/form-data">
				
				  <div class="form-group">
					<label for="exampleInputPassword1">广告</label>
					<input type="text" class="form-control" id="fname" name="name" placeholder="请输入广告描述">
				  </div>
				  <div class="form-group">
					<label for="advpic">图片</label>
					<input type="file"   id="advpic" name="advpic">
					<br>
					<img src="" style="display:none;">
					<br>
					<p class="help-block label label-warning">请上传图片</p>
				  </div>
					<label for="exampleInputPassword1">状态</label>
					<select class="form-control" id="fstatus" name="status" >
		                <option value="0">草稿</option>
		                <option value="1">未审核</option>
		                <option value="2">审核完成</option>
		                <option value="3">发布</option>
		            </select>
				  <div class="form-group">
					<label for="exampleInputPassword1">链接</label>
					<input type="text"  class="form-control" id="furl" name="url" placeholder="链接地址">
				  </div>
				  <div class="form-group">
					<input type="hidden" class="form-control" id="fuserid" name="userid" value="${LOGIN_USER.id }" >
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
				<h4>测试标题1</h4>
				<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
			  </div>
			<div class="bs-callout bs-callout-info">
				<h4>测试标题2</h4>
				<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
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
	<script src="${APP_PATH }/jquery/jquery-form/jquery-form.min.js"></script>
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
            	var options = {  
            			url: "${APP_PATH}/advert/doAdd",//默认是form的action， 如果申明，则会覆盖  
        			   	beforeSubmit: function(){
                			var name= $("#fname").val();
	             			if(name.trim()==''){
	             				layer.msg("广告描述不能输入空", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
	             				name.focus();
	                 			return false;
	             			}
	
	             			var url= $("#furl").val();
	             			if(url.trim()==''){
	             				layer.msg("地址不能输入空", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
	             				url.focus();
	                 			return false;
	             			}
	             			loadingIndex = layer.msg('添加中', {icon: 16});
            			},
        			   success: function(result){
                			layer.close(loadingIndex);
	             			if(result.success){
	             				window.location.href = "${APP_PATH}/advert/index"
	             			}else{
	             				layer.msg(result.message, {time:1000, icon:5, shift:6});
	             			}      //提交后的回调函数  
        				}
           		}
            	$("#formID").ajaxSubmit(options);
            	return ;
            }
            
            $(":file").change(function(event){
                var files = event.target.files, file;
                if (files && files.length > 0) {
                    file = files[0];
                }
                var URL = window.URL || window.webkitURL;
                var imgURL = URL.createObjectURL(file);
                var imgobj = $(this).next().next();
                imgobj.attr("src", imgURL);
                imgobj.show();
            });
            
        </script>
  </body>
</html>
