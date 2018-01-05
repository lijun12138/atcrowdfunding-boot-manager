<ul style="padding-left:0px;" class="list-group">
	<#list rootPermission.children as permission>
		<#if permission.children?size == 0 >
			<li class="list-group-item tree-closed">
				<a href="${APP_PATH }/${permission.url}"><i class="${permission.icon }"></i> ${permission.name }</a> 				
			</li>
		<#else>
			<li class="list-group-item tree-closed">
				<span><i class="${permission.icon }"></i> ${permission.name } <span class="badge" style="float:right">${permission.children?size }</span></span> 
				<ul style="margin-top:10px;display:none;">
				<#list permission.children as childPermission >
					<li style="height:30px;">
						<a href="${APP_PATH }/${childPermission.url}/index"><i class="${childPermission.icon }"></i> ${childPermission.name }</a> 
					</li>
				</#list>
				</ul>
			</li>
		</#if>
	</#list>
</ul>
