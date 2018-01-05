package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.manager.service.PermissionService;

@Controller
@RequestMapping("/permission")
public class PermissionController extends BaseController{

	@Autowired
	private PermissionService permissionService;

	@RequestMapping("/index")
	public String index() {
		return "permission/index";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "permission/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Permission permission = permissionService.queryPermissionById(id);
		map.put("permission", permission);
		return "permission/update";
	}

	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = permissionService.deleteById(id);
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
	@RequestMapping("/doUpdate")
	public Object doUpdate(Permission permission) {

		start();
		try {
			Integer i = permissionService.updatePermission(permission);
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
	@RequestMapping("/doAdd")
	public Object doAdd(Permission permission) {

		start();
		try {
			Integer i = permissionService.addPermission(permission);
			if (i >= 0) {
				success();
			} else {
				fail();
				message("添加失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/loadData")
	public Object loadData() {
		List<Permission> allPermission = permissionService.queryAll();
		Permission parent = null;
		Map<Integer, Permission> permissionMap = new HashMap<>();
		for (Permission permission : allPermission) {
			permissionMap.put(permission.getId(), permission);
		}

		for (Permission permission : allPermission) {
			if (permission.getPid() == 0) {
				parent = permission;
			} else {
				Permission permission2 = permissionMap.get(permission.getPid());
				permission2.getChildren().add(permission);
			}
		}
		return parent;
	}

}
