package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Cert;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.CertService;

@Controller
@RequestMapping("/cert")
public class CertController extends BaseController {

	@Autowired
	private CertService certService;

	@RequestMapping("index")
	public String index() {
		return "cert/index";
	}
	@RequestMapping("toAdd")
	public String toAdd() {
		return "cert/add";
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(@RequestParam("id") Integer id ) {
		start();
		try {
			Integer i = certService.delete(id);
			if(i>0) {
				success();
			}else {
				fail();
				message("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		
		return end();
	}
	
	@RequestMapping("toUpdate")
	public String toUpdate(Integer id,Map<String ,Object> map) {
		Cert cert = certService.queryById(id);
		map.put("cert", cert);
		return "cert/update";
	}

	
	@ResponseBody
	@RequestMapping("/update")
	public Object update(Cert cert) {
		start();
		try {
			Integer i = certService.update(cert);
			if(i>0) {
				success();
			}else {
				fail();
				message("更新失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		
		return end();
		
	}
	
	
	@ResponseBody
	@RequestMapping("/checkCert")
	public Object checkCert(String name) {
		start();
		try {
			Map<String ,Object> paramMap = new HashMap<>();
			paramMap.put("name", name);
			
			Cert cert = certService.checkCert(paramMap);
			if(cert!=null) {
				fail();
				message("资质名已存在");
			}else {
				success();
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		return end();
	}
	@ResponseBody
	@RequestMapping("/doAdd")
	public Object doAdd(String name) {
		start();
		
		try {
			Map<String ,Object> paramMap = new HashMap<>();
			paramMap.put("name", name);
			Integer i =certService.add(paramMap);
			if(i>0) {
				success();
			}else {
				fail();
				message("添加失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		return end();
	}
	@ResponseBody
	@RequestMapping("/queryPage")
	public Object queryPage(@RequestParam(value = "pageno", required = false, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = false, defaultValue = "1") Integer pagesize,
			String queryText) {
		
		start();
		
		try {
			if(queryText==null) {
				queryText = "";
			}
			Map<String,Object> paramMap = new HashMap<>();
			Page<Object> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			
			paramMap.put("startindex", startindex);
			paramMap.put("pagesize", pagesize);
			paramMap.put("queryText", queryText);
			Object data = certService.queryList(paramMap);
			
			Integer count = certService.count(paramMap);
			page.setTotalcount(count);
			
			page.setDatas(data);
			data(page);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		
		return end();

	}

}
