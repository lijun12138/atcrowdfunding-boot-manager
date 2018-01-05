package com.atguigu.atcrowdfunding.manager.interceptor;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.common.util.Const;

//登录拦截器，用于验证是否登录
public class LoginInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// System.out.println("LoginInterceptor 被创建了");
		// 创建不被拦截的白名单
		Set<String> whiteList = new HashSet<>();
		whiteList.add("/login");
		whiteList.add("/doLogin");
		whiteList.add("/login/code");
		
		whiteList.add("/index");
		// String requestURI = request.getRequestURI();
		// System.out.println(requestURI);
		// 获取到当前的请求路径，如果在白名单中就放行
		String servletPath = request.getServletPath();
		if (whiteList.contains(servletPath)) {
			return true;
		}
		// 1.拿到session对象
		HttpSession session = request.getSession();
		// 2.拿到session域中的登录用户
		User loginUser = (User) session.getAttribute(Const.LOGIN_USER);
		// 3.判断是否登录
		if (loginUser == null) {// 说明未登录
			response.sendRedirect(request.getContextPath() + "/login");
			return false;// 不放行
		} else {// 说明已登录,放行
			return true;
		}
	}

}
