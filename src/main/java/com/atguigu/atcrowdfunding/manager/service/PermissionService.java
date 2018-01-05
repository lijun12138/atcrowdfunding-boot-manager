package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Permission;

@FeignClient("atcrowdfunding-manager-service")
public interface PermissionService {

	@RequestMapping("/permission/queryAll")
	List<Permission> queryAll();

	@RequestMapping("/permission/addPermission")
	Integer addPermission(@RequestBody Permission permission);

	@RequestMapping("/permission/queryPermissionById")
	Permission queryPermissionById(@RequestBody Integer id);

	@RequestMapping("/permission/updatePermission")
	Integer updatePermission(@RequestBody Permission permission);

	@RequestMapping("/permission/deleteById")
	Integer deleteById(@RequestBody Integer id);

}
