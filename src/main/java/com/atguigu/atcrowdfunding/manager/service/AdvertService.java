package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Advertisement;

@FeignClient("atcrowdfunding-manager-service")
public interface AdvertService {
	
	@RequestMapping("/act/queryPage")
	List<Advertisement> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/act/addAdvert")
	Integer addAdvert(@RequestBody Advertisement advert);

	@RequestMapping("/act/queryRoleById")
	Advertisement queryRoleById(@RequestBody Integer id);

	@RequestMapping("/act/updateRole")
	Integer updateRole(@RequestBody Advertisement advert);

	@RequestMapping("/act/deleteById")
	Integer deleteById(@RequestBody Integer id);

	@RequestMapping("/act/deleteBatch")
	Integer deleteBatch(@RequestBody Integer[] id);

	@RequestMapping("/act/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
