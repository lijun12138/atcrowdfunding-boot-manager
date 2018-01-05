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
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
    
    input[type=checkbox] {
        width:18px;
        height:18px;        
    }
	</style>
  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 分类管理</a></div>
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
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据矩阵</h3>
			  </div>
			  <div class="panel-body">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th>名称</th>
                  <th >商业公司</th>
                  <th >个体工商户</th>
                  <th >个人经营</th>
                  <th >政府及非营利组织</th>
                </tr>
              </thead>
              <tbody>
                	<#list certs as cert>
	                	<tr>
		                  <td>${cert.name}</td>
		                  <td><input type="checkbox" certid="${cert.id}" accttype="0"></td>
		                  <td><input type="checkbox" certid="${cert.id}" accttype="1"></td>
		                  <td><input type="checkbox" certid="${cert.id}" accttype="2"></td>
		                  <td><input type="checkbox" certid="${cert.id}" accttype="3"></td>
	                	</tr>
	                </#list>
               
              </tbody>
            </table>
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
            
            $(":checkbox").change(function(){
            	var obj = {};
            	obj.certid = $(this).attr("certid");
            	obj.accttype = $(this).attr("accttype");
            	obj.checked = this.checked;
            	$.ajax({
            		type: "post",
            		url : "${APP_PATH}/type/update",
            		data : obj,
            		success : function(result){
            			if(!result.success){
            				layer.msg(result.message, {time:1000, icon:5, shift:6});
            			}
            		}
            	})
            });
            
            
            <#list map2 as map>
				$(":checkbox[certid='${map.certid}'][accttype='${map.accttype}']")[0].checked = true;
            </#list>
        </script>
  </body>
</html>
