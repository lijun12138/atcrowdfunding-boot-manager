package com.atguigu.atcrowdfunding.manager.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.common.util.Const;
import com.atguigu.atcrowdfunding.manager.service.ManagerService;

//此控制器是用于处理一些公共请求
@Controller
public class ManagerController extends BaseController {

	@Autowired
	private ManagerService managerService;

	// 跳转到首页，没有业务逻辑
	@RequestMapping("/index")
	public String index() {
		return "index";
	}

	// 跳转到登录页面，没有业务逻辑
	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	// 用于跳转到一个错误页面，没有业务逻辑
	@RequestMapping("/refuse")
	public String refuse() {
		return "refuse/refuse";
	}

	@Controller
	@RequestMapping("/login")
	public class AuthCodeController {

		private char[] codeSequence = { 'A', '1', 'B', 'C', '2', 'D', '3', 'E', '4', 'F', '5', 'G', '6', 'H', '7', 'I',
				'8', 'J', 'K', '9', 'L', '1', 'M', '2', 'N', 'P', '3', 'Q', '4', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y',
				'Z' };

		@ResponseBody
		@RequestMapping("/code")
		public void getCode(HttpServletResponse response, HttpSession session) throws IOException {
			int width = 63;
			int height = 37;
			Random random = new Random();
			// 设置response头信息
			// 禁止缓存
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);

			// 生成缓冲区image类
			BufferedImage image = new BufferedImage(width, height, 1);
			// 产生image类的Graphics用于绘制操作
			Graphics g = image.getGraphics();
			// Graphics类的样式
			g.setColor(this.getColor(200, 250));
			g.setFont(new Font("Times New Roman", 0, 28));
			g.fillRect(0, 0, width, height);
			// 绘制干扰线
			for (int i = 0; i < 40; i++) {
				g.setColor(this.getColor(130, 200));
				int x = random.nextInt(width);
				int y = random.nextInt(height);
				int x1 = random.nextInt(12);
				int y1 = random.nextInt(12);
				g.drawLine(x, y, x + x1, y + y1);
			}

			// 绘制字符
			String strCode = "";
			for (int i = 0; i < 4; i++) {
				String rand = String.valueOf(codeSequence[random.nextInt(codeSequence.length)]);
				strCode = strCode + rand;
				g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
				g.drawString(rand, 13 * i + 6, 28);
			}
			// 将字符保存到session中用于前端的验证
			session.setAttribute("authCode", strCode.toLowerCase());
			g.dispose();

			ImageIO.write(image, "JPEG", response.getOutputStream());
			response.getOutputStream().flush();
		}

		public Color getColor(int fc, int bc) {
			Random random = new Random();
			if (fc > 255)
				fc = 255;
			if (bc > 255)
				bc = 255;
			int r = fc + random.nextInt(bc - fc);
			int g = fc + random.nextInt(bc - fc);
			int b = fc + random.nextInt(bc - fc);
			return new Color(r, g, b);
		}

	}

	// 此方法是用于处理登录请求
	@ResponseBody // 启用底层消息转换器:HttpMessageConverter 将对象(Map,Entity)转换为JSON字符串.使用Jackson组件.
	@RequestMapping("/doLogin")
	public Object doLogin(String loginacct, String userpswd, HttpSession session, String code) {
		start();
		// 获取session域中的验证码
		String sessionCode = (String) session.getAttribute("authCode");
		// 移除session域中的验证码
		session.removeAttribute("authCode");

		try {
			if (code.equals(sessionCode)) {
				// 将接收到的参数存储到map集合中保存
				Map<String, Object> map = new HashMap<>();
				map.put("loginacct", loginacct);
				map.put("userpswd", userpswd);
				// 调用业务层获取一个User对象
				User user = managerService.queryUserByParam(map);
				// 判断返回的User对象是否是空
				if (user != null) {
					// 查询数据库拿到用户拥有的权限
					List<Permission> selfPermissionList = managerService.querySelfPermission(user.getId());

					Map<Integer, Permission> permissionMap = new HashMap<>();
					Set<String> selfPermissionUrl = new HashSet<>();
					Permission parent = null;
					// 将用户拥有的权限封装到一个Set集合中
					for (Permission permission : selfPermissionList) {
						// 将数据库查询到的所有权限封装到一个Map集合中
						permissionMap.put(permission.getId(), permission);
						if (permission.getUrl() != null) {
							selfPermissionUrl.add(permission.getUrl());
						}
					}
					for (Permission permission : selfPermissionList) {
						if (permission.getPid() == 0) {// 判断这个许可是否是根节点
							parent = permission;
						} else {
							// 通过当前节点的pid在Map集合中找到对应的父元素，将本节点作为父元素的子元素
							permissionMap.get(permission.getPid()).getChildren().add(permission);
						}
					}
					// 不为空表示表示登录成功，将sresult中的的状态设置成true，在jsp页面上进行判断
					success();
					// 将查询到的已登录的用户的权限许可放入session域中
					session.setAttribute(Const.LOGIN_AUTH_PERMISSION_URI, selfPermissionUrl);
					// 将查询到的根元素放入session域中，供jsp页面使用
					session.setAttribute(Const.LOGIN_ROOT_PERMISSION, parent);
					// 将登录的对象放到session域中
					session.setAttribute(Const.LOGIN_USER, user);
				} else {
					// 为空表示表示登录失败，将result中的的状态设置成false，在jsp页面上进行判断
					fail();
					// 将错误消息放在AjaxResult对象中
					message("用户名或密码不正确！");
				}
			} else {
				fail();
				// 将错误消息放在AjaxResult对象中
				message("验证码不正确！");
			}

		} catch (Exception e) {
			e.printStackTrace();
			// 发生了异常，将result中的的状态设置成false，在jsp页面上进行判断
			fail();
			message("发生异常了，你个傻吊");
		}
		return end();
	}

	// 跳转到main页面，没有业务逻辑
	@RequestMapping("/main")
	public String loginsuccess() {
		return "main";
	}

	// 注销功能
	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		// 清除session域中的数据
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/login";
	}
}
