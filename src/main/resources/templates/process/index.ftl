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
  <button id="query" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
</form>

<button type="button" id="uploadBtn" class="btn btn-primary" style="float:right;" ><i class="glyphicon glyphicon-upload"></i> 上传流程定义文件</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr >
                  <th width="30">#</th>
                  <th>流程名称</th>
                  <th>流程版本</th>
                  <th>流程key</th>
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
 <form id="procDefForm" style="display:none;" action="/process/upload" method="post" enctype="multipart/form-data">
        <input type="file" id="procDefFile" name="procDefFile">
    </form>

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
				
				queryPage(0);
            });
            
            $("#uploadBtn").click(function(){
            	$("#procDefFile").click();
            });
            
            $("#procDefFile").change(function(event){
        		
        		var loadingIndex = -1 ;
                var options = {
             	resetForm: true,
				url:"${APP_PATH}/process/upload",
				beforeSubmit : function(){
					loadingIndex = layer.msg('正在上传...', {icon: 6});
					// 获取当前选择的文件 event.target.files
					var files = event.target.files, file;
					if (files && files.length > 0) {
						file = files[0]; 
					}
					// 判断上传文件的大小 file.size ，单位字节Byte
					if(file.size>50000){
						layer.msg("文件不得大于50k", {time:1000, icon:6,shift:6});
						return false;
					}
					// 判断上传文件的类型 file.type
					if(file.name.substring(file.name.indexOf("."))!=".bpmn"){
						layer.msg("文件类型不正确", {time:1000, icon:6,shift:6});
						return false;
					}
					// 本地生成上传文件后的临时文件地址
					var URL = window.URL || window.webkitURL;
					var imgURL = URL.createObjectURL(file);
       				return true ;
				},
				success : function(result){
					layer.close(loadingIndex);
					if(result.success){
						layer.msg(result.message, {time:1000, icon:6,shift:6});
						queryPage(0);
					}else{
						layer.msg(result.message, {time:1000, icon:5, shift:6});
					}	
    			}	
    		};            
            $("#procDefForm").ajaxSubmit(options);           
        });

            
            $("#query").click(function(){
            	queryPage(0);
            })
            
            
            function deleteProcDef(id, name) {
                layer.confirm("删除流程定义信息["+name+"]，是否继续？",  {icon: 3, title:'提示'}, function(cindex){
                    $.ajax({
                        type : "POST",
                        url  : "${APP_PATH}/process/delete",
                        data : {
                            "id" : id  //流程部署id.
                        },
                        success : function(result) {
                            if ( result.success ) {
                                layer.msg("流程定义信息删除成功", {time:1500, icon:6}, function(){
                                    queryPage(0);
                                });
                            } else {
                                layer.msg("流程定义信息删除失败", {time:1500, icon:5, shift:6});
                            }
                        }
                    });
                    layer.close(cindex);
                }, function(cindex){
                    layer.close(cindex);
                });
            }

            
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
            		url : "${APP_PATH}/process/queryList",
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
								content+='   <td>'+n.name+'</td>';
								content+='   <td>'+n.version+'</td>';
								content+='   <td>'+n.key+'</td>';
								content+='   <td>';
								content+=' 	  <button type="button" onclick="window.location.href=\'${APP_PATH}/process/view?id='+n.id+'\'" class="btn btn-success btn-xs"><i class=" glyphicon glyphicon-eye-open"></i></button>';
								content+=' 	  <button type="button" onclick="deleteProcDef('+n.deployid+', \''+n.name+'\')" class="btn btn-danger btn-xs"><i class=" glyphicon glyphicon-remove"></i></button>';
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
