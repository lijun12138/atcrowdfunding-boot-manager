package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.AccountTypeCert;

@FeignClient("atcrowdfunding-manager-service")
public interface TypeService {

	@RequestMapping("/type/queryList")
	List<AccountTypeCert> queryList();

	@RequestMapping("/type/insert")
	int insert(@RequestBody AccountTypeCert atc);
	
	@RequestMapping("/type/delete")
	int delete(@RequestBody AccountTypeCert atc);


}
