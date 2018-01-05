package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Type;

@FeignClient("atcrowdfunding-manager-service")
public interface ProjectTypeService {
	
	@RequestMapping("/projectType/queryPage")
	List<Type> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/projectType/checkType")
	Type checkType(@RequestBody Type type);

	@RequestMapping("/projectType/addType")
	Integer addType(@RequestBody Type type);

	@RequestMapping("/projectType/queryRoleById")
	Type queryRoleById(@RequestBody Integer id);

	@RequestMapping("/projectType/updateRole")
	Integer updateRole(@RequestBody Type type);

	@RequestMapping("/projectType/deleteById")
	Integer deleteById(@RequestBody Integer id);

	@RequestMapping("/projectType/deleteBatch")
	Integer deleteBatch(@RequestBody Integer[] id);

	@RequestMapping("/projectType/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
