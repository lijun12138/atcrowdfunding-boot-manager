package com.atguigu.atcrowdfunding.manager.interceptor;

import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.atguigu.atcrowdfunding.common.util.Const;

//权限拦截器，用于权限的控制
public class AuthInterceptor extends HandlerInterceptorAdapter {

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// System.out.println("AuthInterceptor 被创建了");
		// 通过request拿到请求路径
		String servletPath = request.getServletPath();
		// 截取字符串，从/开始
		String str1 = servletPath.substring(servletPath.indexOf("/") + 1);
		// 创建一个字符串，用来接收新的截取的字符创
		String str2 = "";
		// 这两个判断的目的是为了拿到模块名，用于判断
		if (str1.indexOf("/") >= 0) {
			str2 = str1.substring(0, str1.indexOf("/"));
		}
		if (str2.indexOf(".") >= 0) {
			str2 = str2.substring(0, str2.indexOf("."));
		}

		/*
		 * List<Permission> allPermission = permissionService.queryAll(); Set<String>
		 * allPermissionUrl = new HashSet<>(); for (Permission permission :
		 * allPermission) { if(permission.getUrl()!=null) {
		 * allPermissionUrl.add("/"+permission.getUrl()); } }
		 */
		// 通过request拿到session对象再拿到ServletContext对象
		ServletContext application = request.getSession().getServletContext();
		// 在application域中拿到所有的权限地址
		Set<String> allPermissionUrl = (Set<String>) application.getAttribute(Const.ALL_PERMISSION_URI);
		// 判断当前的模块地址是否在所有权限地址中，不在就放行，不进行拦截
		if (allPermissionUrl != null && allPermissionUrl.contains(str2)) {
			// 拿到session对象
			HttpSession session = request.getSession();
			// 在session域中拿到已经登录的用户已有的权限的地址
			Set<String> authUris = (Set<String>) session.getAttribute(Const.LOGIN_AUTH_PERMISSION_URI);
			// 如果用户拥有此模块对应的权限就放行
			if (authUris.contains(str2)) {
				return true;
			} else {
				// 未拥有就会跳转到一个权限不足的提示页面
				response.sendRedirect(request.getContextPath() + "/refuse");
				return false;
			}
		} else {
			return true;
		}

	}
}
