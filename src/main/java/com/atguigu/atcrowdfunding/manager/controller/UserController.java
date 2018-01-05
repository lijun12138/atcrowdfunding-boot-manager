package com.atguigu.atcrowdfunding.manager.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Role;
import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.common.util.Data;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.RoleService;
import com.atguigu.atcrowdfunding.manager.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

	@Autowired
	private UserService userService;

	@Autowired
	private RoleService roleService;

	@RequestMapping("/index")
	public String index() {
		return "user/index";
	}

	@ResponseBody
	@RequestMapping("/doAddRole")
	public Object doAddRole(Data data, Integer userid) {
		start();
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userid", userid);
			paramMap.put("idList", data.getIdList());
			Integer id = userService.addRoleById(paramMap);
			if (id > 0) {
				success();
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("添加失败");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/doRemoveRole")
	public Object doRemoveRole(Data data, Integer userid) {
		start();
		try {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("userid", userid);
			paramMap.put("idList", data.getIdList());
			Integer id = userService.removeRoleById(paramMap);
			if (id > 0) {
				success();
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("移除失败");
		}
		return end();
	}

	@RequestMapping("/assignRole")
	public String assignRole(Integer userid, Map<String, Object> map) {
		List<Integer> ids = userService.queryRoleByUserid(userid);
		List<Role> roles = roleService.queryAllRole();
		List<Role> assignRole = new ArrayList<>();
		List<Role> unAssignRole = new ArrayList<>();
		for (Role role : roles) {
			if (ids.contains(role.getId())) {
				assignRole.add(role);
			} else {
				unAssignRole.add(role);
			}
		}
		map.put("assignRole", assignRole);
		map.put("unAssignRole", unAssignRole);
		return "user/assignRole";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "user/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		User user = userService.queryUserById(id);
		map.put("user", user);
		return "user/update";
	}

	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = userService.deleteById(id);
			if (i > 0) {
				success();
			} else {
				fail();
				message("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("删除失败");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/doBatchDelete")
	public Object doBatchDelete(Integer[] id) {
		start();
		try {
			Integer i = userService.deleteBatch(id);
			if (i > 0) {
				success();
			} else {
				fail();
				message("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("删除失败");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/doAdd")
	public Object doAdd(User user) {

		start();
		try {
			User user2 = userService.checkUser(user);
			if (user2 == null) {
				Integer i = userService.addUser(user);
				if (i >= 0) {
					success();
				} else {
					fail();
					message("添加失败");
				}
			} else {
				fail();
				message("用户已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(User user) {

		start();
		try {
			Integer i = userService.updateUser(user);
			if (i >= 0) {
				success();
			} else {
				fail();
				message("修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/checkUser")
	public Object checkUser(User user) {
		start();
		try {
			User user2 = userService.checkUser(user);
			if (user2 == null) {
				success();
			} else {
				fail();
				message("用户已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	// 带条件的异步请求
	@ResponseBody
	@RequestMapping("/queryPage")
	public Object queryPage(@RequestParam(value = "pageno", required = false, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = false, defaultValue = "1") Integer pagesize,
			String queryText) {
		if (queryText != null) {
			if (queryText.contains("%")) {
				queryText = queryText.replaceAll("%", "\\\\%");
			}
		}

		start();
		try {
			Page<User> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("pagesize", pagesize);
			paramMap.put("startindex", startindex);
			paramMap.put("queryText", queryText);

			List<User> datas = userService.queryPage(paramMap);
			page.setDatas(datas);

			Integer totalcount = userService.count(paramMap);
			page.setTotalcount(totalcount);
			success();
			data(page);
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

}
