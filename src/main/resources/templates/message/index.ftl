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
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 消息模板</a></div>
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
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
			  </div>
			  <div class="panel-body">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
                  <th>消息描述</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
                
              </tbody>
            </table>
          </div>
			  </div>
			</div>
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
			    queryPage(${RequestParameters.pageno})
            });
            
            function toUpdate(id,pageno){
	            window.location.href="${APP_PATH}/message/toUpdate?id="+id;
	        }
            var obj = {"pagesize":5};
            function queryPage(pageno){
            	obj.pageno=pageno;
            	var loadingIndex=-1;
            	$.ajax({
            		type : "get",
            		url : "${APP_PATH}/message/queryPage",
            		data : obj,
            		beforeSend:function(){
	            		loadingIndex = layer.msg('查询中', {icon: 16});
	            	},
            		success : function(result){
         				layer.close(loadingIndex);
         				var page=result.data;
         				var datas = page.datas;
         				
         				var content='';
         				$.each(datas,function(i,n){
         					content+='<tr>';
 	            			content+='  <td>'+(i+1)+'</td>';
 	            			content+='  <td>'+n.content+'</td>';
 	            			content+='  <td>';
 	            			content+='	  <button type="button" onclick="toUpdate('+n.id+')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
 	            			content+='  </td>';
 	            			content+='</tr>';
         				})
         				$("tbody").html(content);	
            		}
            	});
            }
            
        </script>
  </body>
</html>
