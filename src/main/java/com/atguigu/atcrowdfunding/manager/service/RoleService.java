package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Role;

@FeignClient("atcrowdfunding-manager-service")
public interface RoleService {

	@RequestMapping("/role/queryPage")
	List<Role> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/role/addRole")
	Integer addRole(@RequestBody Role role);

	@RequestMapping("/role/queryRoleById")
	Role queryRoleById(@RequestBody Integer id);

	@RequestMapping("/role/checkRole")
	Role checkRole(@RequestBody Role role);

	@RequestMapping("/role/updateRole")
	Integer updateRole(@RequestBody Role role);

	@RequestMapping("/role/deleteById")
	Integer deleteById(@RequestBody Integer id);

	@RequestMapping("/role/deleteBatch")
	Integer deleteBatch(@RequestBody Integer[] id);

	@RequestMapping("/role/queryAllRole")
	List<Role> queryAllRole();

	@RequestMapping("/role/querySelfPermissionByRoleid")
	List<Integer> querySelfPermissionByRoleid(@RequestBody Integer id);

	@RequestMapping("/role/addRolePermission")
	Integer addRolePermission(@RequestBody Map<String,Object> paramMap);

	@RequestMapping("/role/deleteRolePermissionByid")
	Integer deleteRolePermissionByid(@RequestBody Integer roleid);

	@RequestMapping("/role/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
