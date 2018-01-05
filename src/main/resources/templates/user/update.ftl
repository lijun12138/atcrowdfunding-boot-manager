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
           <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 用户维护</a></div>
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
					<label for="exampleInputPassword1">登陆账号</label>
					<input type="text" onchange="checkUser()" class="form-control" id="floginacct" value="${user.loginacct }">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">用户名称</label>
					<input type="text" class="form-control" id="fusername" value="${user.username }">
				  </div>
				  <div class="form-group">
					<label for="exampleInputEmail1">邮箱地址</label>
					<input type="email" class="form-control" id="femail" value="${user.email }">
					<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为： xxxx@xxxx.com</p>
				  </div>
				  <button type="button" onclick="doUpdate(${user.id})" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
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
            
            function checkUser(){
           		var loginacct= $("#floginacct").val();
           		$.ajax({
    				type : "post",
    				url : "${APP_PATH}/user/checkUser",
    				data : {
    					loginacct : loginacct
    				},
    				success : function(result){
    					if(!result.success){
    						layer.msg(result.message, {time:1000, icon:5, shift:6}); //弹出时间，图标，特效
        					floginacct.focus();
        					return false;
    					}
    				}
           		});
           	}
            
            function doUpdate(id){
            	var loadingIndex = -1;
            	$.ajax({
            		type : "post",
            		data : {
            			id : id,
            			loginacct : $("#floginacct").val(),
            			username : $("#fusername").val(),
            			email : $("#femail").val()
            		},
            		url : "${APP_PATH}/user/doUpdate",
            		beforeSend : function(){
            			var loginacct= $("#floginacct").val();
            			var username= $("#fusername").val();
            			var email= $("#femail").val();
            			var loginacctRest = /^[a-z0-9_-]{3,16}$/;
            			if(!loginacctRest.test(loginacct.trim())){
            				layer.msg("用户账号为小写字母、下划线或数字组合的3~16位用户账号", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
            				loginacct.focus();
                			return false;
            			}
            			
                		if(username.trim()==""){
//                 			alert("用户名称不能为空！");
                			layer.msg("用户名称不能为空！", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
                			username.focus();
                			return false;
                		}
                		var emailRet = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
                		if(!emailRet.test(email.trim())){
//                 			alert("邮箱格式不正确，你个煞笔不要乱输，心里没点b数");
                			layer.msg("邮箱格式不正确，你个煞笔不要乱输，心里没点b数", {time:2000, icon:5, shift:6}); //弹出时间，图标，特效
                			femail.focus();
                			return false;
                		}
                		loadingIndex = layer.msg('更新中', {icon: 16});
            		},
            		success : function(result){
            			layer.close(loadingIndex);
            			if(result.success){
            				window.location.href = "${APP_PATH}/user/index?pageno="+${RequestParameters.pageno};
            			}else{
            				layer.msg(result.message, {time:1000, icon:5, shift:6});
            			}
            				
            		}
            	})
            }
        </script>
  </body>
</html>
