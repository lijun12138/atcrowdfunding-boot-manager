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
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
				  <li><a href="#">首页</a></li>
				  <li><a href="#">数据列表</a></li>
				  <li class="active">分配角色</li>
				</ol>
			<div class="panel panel-default">
			  <div class="panel-body">
				<form role="form" class="form-inline">
				  <div class="form-group">
					<label for="exampleInputPassword1">未分配角色列表</label><br>
					<select id="unAssignRole" class="form-control" multiple size="10" style="width:300px;overflow-y:auto;">
						<#list unAssignRole as role>
							<option id="${role.id }" value="${role.name }">${role.name }</option>
						</#list>
                    </select>
				  </div>
				  <div class="form-group">
                        <ul>
                            <li onclick="addRole()" class="btn btn-default glyphicon glyphicon-chevron-right"></li>
                            <br>
                            <li onclick="removeRole()" class="btn btn-default glyphicon glyphicon-chevron-left" style="margin-top:20px;"></li>
                        </ul>
				  </div>
				  <div class="form-group" style="margin-left:40px;">
					<label for="exampleInputPassword1">已分配角色列表</label><br>
					<select id="assignRole" class="form-control" multiple size="10" style="width:300px;overflow-y:auto;">
						<#list assignRole as role>
							<option id="${role.id }" value="${role.name }">${role.name }</option>
						</#list>
                    </select>
				  </div>
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
            
            function addRole(){
            	var selected = $("#unAssignRole :selected");
            	var userid="${RequestParameters.userid}";
            	var dataList = {};
            	dataList.userid=userid;
            	if(selected.length>0){
            		$.each(selected,function(i,n){
	            		dataList["idList["+i+"]"]=n.id;
            		})
            		$.ajax({
                		type:'post',
                		url:"${APP_PATH}/user/doAddRole",
                		data : dataList,
                		success : function(result){
                			if(result.success){
                				$("#assignRole").append(selected.clone());
                        		selected.remove();
                			}else{
                				layer.msg(result.message, {time:1000, icon:5, shift:6});
                			}
                		}
                	})
            	}else{
            		layer.msg("至少选择一个！", {time:1000, icon:5, shift:6});
            	}
            }
            
            function removeRole(){
            	var selected = $("#assignRole :selected");
            		var userid="${RequestParameters.userid}";
                	var dataList = {};
                	dataList.userid=userid;
                	if(selected.length>0){
                		$.each(selected,function(i,n){
    	            		dataList["idList["+i+"]"]=n.id;
                		})
                		$.ajax({
                    		type:'post',
                    		url:"${APP_PATH}/user/doRemoveRole",
                    		data : dataList,
                    		success : function(result){
                    			if(result.success){
                    				$("#unAssignRole").append(selected.clone());
                            		selected.remove();
                    			}else{
                    				layer.msg(result.message, {time:1000, icon:5, shift:6});
                    			}
                    		}
                    	})
                	}else{
                		layer.msg("至少选择一个！", {time:1000, icon:5, shift:6});
                	}
            }
        </script>
  </body>
</html>
