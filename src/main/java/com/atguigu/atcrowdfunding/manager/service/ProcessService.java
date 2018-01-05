package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient("atcrowdfunding-activiti-service")
public interface ProcessService {

	@RequestMapping("/act/queryList")
	public List<Map<String, Object>> queryList(@RequestBody Map<String,Object> paramMap);
/*	@RequestMapping("/act/queryList/{startindex}/{pagesize}")
	public List<Map<String, Object>> queryList(@PathVariable("startindex") Integer startindex,
			@PathVariable("pagesize") Integer pagesize);
*/
	@RequestMapping("/act/count")
	public int count(@RequestBody Map<String,Object> paramMap);
	
	@RequestMapping("/act/delete/{id}")
	public void delete(@PathVariable("id") String id );

}
