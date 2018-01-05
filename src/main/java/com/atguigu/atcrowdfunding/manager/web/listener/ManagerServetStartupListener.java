package com.atguigu.atcrowdfunding.manager.web.listener;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.beans.factory.annotation.Autowired;

import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.common.util.Const;
import com.atguigu.atcrowdfunding.manager.service.PermissionService;

@WebListener
public class ManagerServetStartupListener implements ServletContextListener {

	@Autowired
	private PermissionService permissionService;
	
	public ManagerServetStartupListener() {
		System.out.println("ManagerServetStartupListener...");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// System.out.println("StartSystenListener 的 contextInitialized
		// ：将contextPath放在application域中供jsp使用");
		// 拿到ServletContext对象
		ServletContext application = sce.getServletContext();
		// 通过ServletContext对象拿到上下文路径
		String contextPath = application.getContextPath();
		// 把上下文路径放到application域中
		application.setAttribute(Const.APP_PATH, contextPath);

		// 通过代理对象查询数据库，拿到所有的许可
		List<Permission> allPermission = permissionService.queryAll();
		// 创建一个无序不可重复的Set集合用于接收所有许可中的url
		Set<String> allPermissionUrl = new HashSet<>();
		// 遍历，将所有的url放入Set集合
		for (Permission permission : allPermission) {
			if (permission.getUrl() != null) {
				allPermissionUrl.add(permission.getUrl());
			}
		}
		// 将保存有所有的url的Set集合放入application域中
		application.setAttribute(Const.ALL_PERMISSION_URI, allPermissionUrl);

		// 加载广告信息

		// 加载热点项目信息

		// 加载分类项目信息
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}

}
