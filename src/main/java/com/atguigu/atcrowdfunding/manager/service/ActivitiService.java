package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient("atcrowdfunding-activiti-service")
public interface ActivitiService {

	@RequestMapping("act/queryData")
	List<Map<String, Object>> queryData(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("act/complete")
	void complete(Map<String, Object> variable);


}
