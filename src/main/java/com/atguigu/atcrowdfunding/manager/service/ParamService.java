package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Param;

@FeignClient("atcrowdfunding-manager-service")
public interface ParamService {

	@RequestMapping("/param/queryPage")
	List<Param> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/param/queryRoleById")
	Param queryRoleById(@RequestBody Integer id);

	@RequestMapping("/param/updateRole")
	Integer updateRole(@RequestBody Param param);

	@RequestMapping("/param/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
