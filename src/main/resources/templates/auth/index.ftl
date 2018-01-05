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
          <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 实名认证审核</a></div>
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
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input id="queryText" class="form-control has-success" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
                  <th>流程名称</th>
                  <th>流程版本</th>
                  <th>任务名称</th>
                  <th>申请会员</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              
              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
				     	<div id="Pagination" class="pagination"></div>
					 </td>
				 </tr>

			  </tfoot>
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
	<script src="${APP_PATH }/jquery/pagination/jquery.pagination.js"></script>
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
			    queryPage(0);
			    
            });
            
            
            
            function queryPage(pageno){
            	var loadingIndex=-1;
            	var queryText = $("#queryText").val().trim();
            	var obj = {pageno:pageno+1,pagesize:10};
            	loadingIndex = layer.msg('查询中', {icon: 16});
            	if(queryText!=null){
            		obj.queryText=queryText;	
            	}else{
            		obj.queryText="";	
            	}
            	
			    $.ajax({
			    	type : "post",
			    	url : "${APP_PATH}/auth/queryTask",
			    	data : obj,
			    	success : function(result){
			    		layer.close(loadingIndex);
			    		if(result.success){
			    			var page=result.data;
            				var datas=page.datas;
            				var content = "";
            				$.each(datas,function(i,n){
	            				content+=' <tr>';
								content+='   <td>'+(i+1)+'</td>';
								content+='   <td>'+n.pdname+'</td>';
								content+='   <td>'+n.pdversion+'</td>';
								content+='   <td>'+n.taskname+'</td>';
								content+='   <td>'+n.loginacct+'</td>';
								content+='   <td>';
								content+=' 	  <button type="button" onclick="window.location.href=\'/auth/detail?memberid='+n.memberid+'&taskid='+n.taskid+'\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-eye-open"></i></button>';
								content+='   </td>';
								content+=' </tr>';
            				})
							$("tbody").html(content);
            				
							var num_entries = page.totalcount;
							
	            			// 创建分页
	            			$("#Pagination").pagination(num_entries, {
	            				num_edge_entries: 1, //边缘页数
	            				num_display_entries: 3, //主体页数
	            				callback: queryPage,
	            				items_per_page:page.pagesize, //每页显示1项
	            				current_page:(page.pageno-1), //当前页,索引从0开始
	            				prev_text : "上一页",
	            				next_text : "下一页"
	            			});
			    		}else{
			    			layer.msg(result.message, {time:1000, icon:5, shift:6});
			    		}
			    	}
			    })
		    }
        </script>
  </body>
</html>
