package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Cert;

@FeignClient("atcrowdfunding-manager-service")
public interface CertService {

	@RequestMapping("/cert/queryList")
	public List<Cert> queryList(@RequestBody Map<String ,Object> paramMap);

	@RequestMapping("/cert/count")
	public Integer count (@RequestBody Map<String ,Object> paramMap);

	@RequestMapping("/cert/add")
	public Integer add(@RequestBody Map<String ,Object> paramMap);
	
	@RequestMapping("/cert/checkCert")
	public Cert checkCert(@RequestBody Map<String, Object> paramMap);
	
	@RequestMapping("/cert/queryById/{id}")
	public Cert queryById(@PathVariable("id") Integer id);
	
	@RequestMapping("/cert/update")
	public Integer update(@RequestBody Cert cert);
	
	@RequestMapping("/cert/update/{id}")
	public Integer delete(@PathVariable("id") Integer id);

}
