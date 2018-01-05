package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Tag;

@FeignClient("atcrowdfunding-manager-service")
public interface TagService {
	
	@RequestMapping("/tag/queryAllTag")
	List<Tag> queryAllTag();

	@RequestMapping("/tag/addTag")
	Integer addTag(@RequestBody Tag tag);

	@RequestMapping("/tag/queryTagById")
	Tag queryTagById(@RequestBody Integer id);

	@RequestMapping("/tag/updateTag")
	Integer updateTag(@RequestBody Tag tag);

	@RequestMapping("/tag/deleteById")
	Integer deleteById(@RequestBody Integer id);

}
