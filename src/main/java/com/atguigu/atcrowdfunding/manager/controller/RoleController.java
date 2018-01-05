package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.common.bean.Role;
import com.atguigu.atcrowdfunding.common.util.Data;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.PermissionService;
import com.atguigu.atcrowdfunding.manager.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController extends BaseController{

	@Autowired
	private RoleService roleService;

	@Autowired
	private PermissionService permissionService;

	@RequestMapping("/index")
	public String index() {
		return "role/index";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "role/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Role role = roleService.queryRoleById(id);
		map.put("role", role);
		return "role/update";
	}
	@RequestMapping("/toAssignPermission")
	public String AssignPermission(Integer id) {
		return "role/assignPermission";
	}

	@ResponseBody
	@RequestMapping("/doAssignPermission")
	public Object doAssignPermission(Data data,Integer roleid) {
		start();
		try {
			roleService.deleteRolePermissionByid(roleid);
			Map<String,Object> paramMap = new HashMap<>();
			paramMap.put("roleid", roleid);
			paramMap.put("idList", data.getIdList());
			Integer i = roleService.addRolePermission(paramMap);
			if(i>0) {
				success();
			}else {
				fail();
				message("添加失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("添加失败！发生异常了");
		}
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/loadData")
	public Object loadData(Integer id) {

		List<Permission> allPermission = permissionService.queryAll();
		List<Integer> permissionIds = roleService.querySelfPermissionByRoleid(id);
		
		Permission parent = null;
		Map<Integer, Permission> permissionMap = new HashMap<>();
		for (Permission permission : allPermission) {
			permissionMap.put(permission.getId(), permission);
			if(permissionIds.contains(permission.getId())) {
				permission.setChecked(true);
			}
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

	@ResponseBody
	@RequestMapping("/doBatchDelete")
	public Object doBatchDelete(Integer[] id) {
		start();
		try {
			Integer i = roleService.deleteBatch(id);
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
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = roleService.deleteById(id);
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
	public Object doUpdate(Role role) {

		start();
		try {
			Role role2 = roleService.checkRole(role);
			if (role2 == null) {
				Integer i = roleService.updateRole(role);
				if (i >= 0) {
					success();
				} else {
					fail();
					message("修改失败");
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
	@RequestMapping("/doAdd")
	public Object doAdd(Role role) {

		start();
		try {
			Role role2 = roleService.checkRole(role);
			if (role2 == null) {
				Integer i = roleService.addRole(role);
				if (i >= 0) {
					success();
				} else {
					fail();
					message("添加失败");
				}
			} else {
				fail();
				message("角色已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/checkRole")
	public Object checkRole(Role role) {
		start();
		try {
			Role role2 = roleService.checkRole(role);
			if (role2 == null) {
				success();
			} else {
				fail();
				message("角色已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

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
			
			Map<String, Object> paramMap = new HashMap<>();
			Page<Role> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			paramMap.put("pagesize", page.getPagesize());
			paramMap.put("startindex", startindex);
			paramMap.put("queryText", queryText);
			
			List<Role> datas = roleService.queryPage(paramMap);
			page.setDatas(datas);
			
			Integer totalcount = roleService.count(paramMap);
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
