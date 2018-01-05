package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Param;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.ParamService;

@Controller
@RequestMapping("/param")
public class ParamController extends BaseController{

	@Autowired
	private ParamService paramService;

	@RequestMapping("/index")
	public String index() {
		return "param/index";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Param params = paramService.queryRoleById(id);
		map.put("params", params);
		return "param/update";
	}

	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(Param param) {

		start();
		try {
			Integer i = paramService.updateRole(param);
			if (i >= 0) {
				success();
			} else {
				fail();
				message("修改失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/queryPage")
	public Object queryPage(@RequestParam(value = "pageno", required = false, defaultValue = "1") Integer pageno,
			@RequestParam(value = "pagesize", required = false, defaultValue = "1") Integer pagesize,
			String queryText) {
		if (queryText != null) {
			if (queryText.contains("%")) {
				queryText = queryText.replaceAll("%", "\\\\%");
			}
		}

		start();
		try {
			Map<String, Object> paramMap = new HashMap<>();
			Page<Param> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			paramMap.put("pagesize", page.getPagesize());
			paramMap.put("startindex", startindex);
			paramMap.put("queryText", queryText);

			List<Param> datas = paramService.queryPage(paramMap);
			page.setDatas(datas);

			Integer totalcount = paramService.count(paramMap);
			page.setTotalcount(totalcount);
			success();
			data(page);
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

}
