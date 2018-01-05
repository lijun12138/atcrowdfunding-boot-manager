package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.AccountTypeCert;
import com.atguigu.atcrowdfunding.common.bean.Cert;
import com.atguigu.atcrowdfunding.manager.service.CertService;
import com.atguigu.atcrowdfunding.manager.service.TypeService;

@Controller
@RequestMapping("/type")
public class TypeController extends BaseController {

	@Autowired
	private CertService certService;

	@Autowired
	private TypeService typeService;

	@ResponseBody
	@RequestMapping("/update")
	public Object update(AccountTypeCert atc, boolean checked) {
		start();

		try {
			int i = 0;
			if (checked) {
				i = typeService.insert(atc);
			}else{
				i = typeService.delete(atc);
			}
			if (i > 0) {
				success();
			} else {
				fail();
				message("添加失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		return end();
	}

	@RequestMapping("/index")
	public String index(Map<String, Object> map) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("startindex", 0);
		paramMap.put("pagesize", 10);
		paramMap.put("queryText", "");
		List<Cert> certs = certService.queryList(paramMap);
		map.put("certs", certs);

		List<AccountTypeCert> map2 = typeService.queryList();
		map.put("map2", map2);

		return "type/index";
	}
}
