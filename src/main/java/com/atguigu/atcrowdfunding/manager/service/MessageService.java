package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Message;

@FeignClient("atcrowdfunding-manager-service")
public interface MessageService {
	
	@RequestMapping("/message/queryPage")
	List<Message> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/message/queryMessageById")
	Message queryMessageById(@RequestBody Integer id);

	@RequestMapping("/message/updateMessage")
	Integer updateMessage(@RequestBody Message message);

	@RequestMapping("/message/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
