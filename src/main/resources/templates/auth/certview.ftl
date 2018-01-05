<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/main.css">
	<link rel="stylesheet" href="${APP_PATH }/css/pagination.css">
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 流程管理</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        	<#include "common/userinfo.ftl">
        </div>
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
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>申请详细信息</h3>
			  </div>
			  <div class="panel-body">
			  
			  <div class="form-group">
	            <label for="exampleInputEmail1">用户账号</label>
	            <p${member.loginacct }>
	            <input type="text" value="${member.loginacct }">
	            <br>
	             <label for="exampleInputEmail1">用户电话</label>
	            <input type="text" value="${member.tel }">
	             <br>
	             <label for="exampleInputEmail1">用户真实姓名</label>
	            <input type="text" value="${member.realname }">
	             <br>
	             <label for="exampleInputEmail1">用户身份证号</label>
	            <input type="text" value="${member.cardnum }">
	          </div>
			  <#list listCert as cert>
			  
			  <div class="form-group">
	            <label for="exampleInputEmail1">${cert.name}</label>
	            <br>
	            <img src="${APP_PATH}/pic/cert/${mcfs[cert_index].iconpath}" >
	          </div>
			  
			  </#list>
			  
			  <button type="button" onclick="pass()" class="btn btn-default">审核通过</button>
	          <button type="button" onclick="refuse()"  class="btn btn-success">审核拒绝</button>
		
	
	
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
          </div>
			  </div>
			</div>
        </div>
      </div>
    </div>

    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/script/docs.min.js"></script>
	<script src="${APP_PATH }/jquery/layer/layer.js"></script>
	<script src="${APP_PATH }/jquery/pagination/jquery.pagination.js"></script>
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
            
            function pass(){
            	layer.confirm("审核通过实名认证申请，是否继续？",  {icon: 3, title:'提示'}, function(cindex){
                    $.ajax({
                        type : "POST",
                        url  : "${APP_PATH}/auth/pass",
                        data : {
                            "taskid" : "${taskid}",
                            "id" : "${memberid}",
                            "email" : "${member.email}"
                        },
                        success : function(result) {
                            if ( result.success ) {
                                layer.msg("实名认证申请审核操作成功", {time:1500, icon:6}, function(){
                                    window.location.href = "${APP_PATH}/auth/cert";
                                });
                            } else {
                                layer.msg("实名认证申请审核失败", {time:1500, icon:5, shift:6});
                            }
                        }
                    });
                    layer.close(cindex);
                }, function(cindex){
                    layer.close(cindex);
                });

            }
            
            function refuse(){
            	layer.confirm("审核拒绝实名认证申请，是否继续？",  {icon: 3, title:'提示'}, function(cindex){
                    $.ajax({
                        type : "POST",
                        url  : "${APP_PATH}/auth/refuse",
                        data : {
                            "taskid" : "${taskid}",
                            "id" : "${memberid}",
                            "email" : "${member.email}"
                        },
                        success : function(result) {
                            if ( result.success ) {
                                layer.msg("实名认证申请审核操作成功", {time:1500, icon:6}, function(){
                                    window.location.href = "${APP_PATH}/auth/cert";
                                });
                            } else {
                                layer.msg("实名认证申请审核失败", {time:1500, icon:5, shift:6});
                            }
                        }
                    });
                    layer.close(cindex);
                }, function(cindex){
                    layer.close(cindex);
                });

            }
            
        </script>
  </body>
</html>
