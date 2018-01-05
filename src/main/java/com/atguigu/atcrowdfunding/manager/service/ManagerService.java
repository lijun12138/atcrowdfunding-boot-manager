package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Permission;
import com.atguigu.atcrowdfunding.common.bean.User;

@FeignClient("atcrowdfunding-manager-service")
public interface ManagerService {

	@RequestMapping("/user/queryUserByParam")
	User queryUserByParam(@RequestBody Map<String, Object> map);

	@RequestMapping("/user/querySelfPermission")
	List<Permission> querySelfPermission(@RequestBody Integer id);

}
