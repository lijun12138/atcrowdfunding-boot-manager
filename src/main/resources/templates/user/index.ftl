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
  <button id="query"  type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>
<button type="button" onclick="deleteBatch()" class="btn btn-danger" style="float:right;margin-left:10px;"><i class=" glyphicon glyphicon-remove"></i> 删除</button>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/user/toAdd'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
				  <th width="30"><input id="checkAllBox" type="checkbox"></th>
                  <th>账号 </th>
                  <th>名称</th>
                  <th>邮箱地址</th>
                  <th width="100">操作</th>
                </tr>
              </thead>
              <tbody>
              
              </tbody>
			  <tfoot>
			  <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
						
							<div id="Pagination" class="pagination"></div>
						</ul>
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
	<script src="${APP_PATH }/jquery/pagination/jquery.pagination.js"></script>
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
			    <#if RequestParameters.pageno ==null>
	    			queryPage(0);
		    	<#else>
			    	queryPage(${RequestParameters.pageno}-1);
			    </#if>
// 			    alert("加载完页面立即发起一个异步请求");
            });

            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit";
            });
            
            $("#checkAllBox").click(function(){
            	var checked = this.checked;
            	$.each($(".checked"),function(i,n){
            			n.checked=checked;
            			});
            });
            
            function deleteBatch(){
            	var ids = '';//id=&id=&id=
            	$.each($(".checked"),function(i,n){
            		if(n.checked){
            			if(i>0){
            				ids+='&id=';
            			}
            			ids+=n.id;
            		}
            	});
            	
            	if(ids==''){
            		layer.msg("至少选中一个！", {time:1000, icon:5, shift:6});
            		return false;
            	}
            	
            	layer.confirm("确定要删除选中的账号吗？",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
     			    	type : "get",
     			    	url : "${APP_PATH}/user/doBatchDelete?id="+ids,
     			    	success : function(result){
     			    		if(result.success){
     			    			window.location.href="${APP_PATH}/user/index";
     			    		}else{
     			    			layer.msg("删除失败！", {time:1000, icon:5, shift:6});
     			    		}
     			    	}
	     			    });
	    			}, function(cindex){
	    			    layer.close(cindex);
	    			});
            }
            
            function pageChange(pageno){
                //window.location.href="${APP_PATH }/user/queryPage.do?pageno="+pageno;
                queryPage(pageno);
      		}
            
            function toUpdate(id,pageno){
            	window.location.href="${APP_PATH}/user/toUpdate.htm?id="+id+"&pageno="+pageno;
            }
            
            function doDelete(id,username){
            	layer.confirm("确定要删除"+username+"吗？",  {icon: 3, title:'提示'}, function(cindex){
    			    layer.close(cindex);
    			    $.ajax({
     			    	type : "get",
     			    	url : "${APP_PATH}/user/doDelete?id="+id,
     			    	success : function(result){
     			    		if(result.success){
     			    			window.location.href="${APP_PATH}/user/index";
     			    		}else{
     			    			layer.msg("删除失败！", {time:1000, icon:5, shift:6});
     			    		}
     			    	}
	     			    });
	    			}, function(cindex){
	    			    layer.close(cindex);
	    			});
            }
            
            function toAssignRole(id){
            	window.location.href="${APP_PATH }/user/assignRole?userid="+id;
            }
            var obj = {pagesize:5};
            $("#query").click(function(){
            	var queryText = $("#queryText").val().trim();
            	obj.queryText = queryText;
            	queryPage(0);
            });
            
            function queryPage (pageno){
            	
            	obj.pageno=pageno+1;
            	var loadingIndex=-1;
            	$.ajax({
	            	type : "get",
	            	url : "${APP_PATH}/user/queryPage",
	            	data : obj,
	            	beforeSend:function(){
	            		loadingIndex = layer.msg('查询中', {icon: 16});
	            	},
	            	success : function(result){
	            		layer.close(loadingIndex);
	            		var page = result.data;
	            		var datas = page.datas;
	            		var content = '';
	            		$.each(datas,function(i,n){
	            			content+='<tr>';
	            			content+='  <td>'+(i+1)+'</td>';
	            			content+='  <td><input id="'+n.id+'" class="checked" type="checkbox"></td>';
	            			content+='  <td>'+n.loginacct+'</td>';
	            			content+='  <td>'+n.username+'</td>';
	            			content+='  <td>'+n.email+'</td>';
	            			content+='  <td>';
	            			content+='	  <button type="button" onclick=toAssignRole('+n.id+') class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-check"></i></button>';
	            			content+='	  <button type="button" onclick="toUpdate('+n.id+','+page.pageno+')" class="btn btn-primary btn-xs"><i class=" glyphicon glyphicon-pencil"></i></button>';
	            			content+='	  <button type="button" onclick="doDelete('+n.id+',\''+n.username+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
	            			content+='  </td>';
	            			content+='</tr>';
	            		});
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
	            	},
	            	error : function(){
            			layer.msg("查询数据错误", {time:1000, icon:5, shift:6});
            		}

	            });
            	
		    }
            
            
        </script>
  </body>
</html>
