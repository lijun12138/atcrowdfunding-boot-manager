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
import com.atguigu.atcrowdfunding.common.bean.Type;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.ProjectTypeService;

@Controller
@RequestMapping("/projectType")
public class ProjectTypeController extends BaseController{

	@Autowired
	private ProjectTypeService projectTypeService;

	@RequestMapping("/index")
	public String index() {
		return "projectType/index";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "projectType/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Type type = projectTypeService.queryRoleById(id);
		map.put("type", type);
		return "projectType/update";
	}

	@ResponseBody
	@RequestMapping("/doBatchDelete")
	public Object doBatchDelete(Integer[] id) {
		start();
		try {
			Integer i = projectTypeService.deleteBatch(id);
			if(i>0) {
				success();
			}else {
				fail();
				message("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("删除失败");
		}
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(Type type) {

		start();
		try {
			Integer i = projectTypeService.updateRole(type);
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
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = projectTypeService.deleteById(id);
			if(i>0) {
				success();
			}else {
				fail();
				message("删除失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("删除失败");
		}
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/checkType")
	public Object checkType(Type type) {
		start();
		try {
			Type type2 = projectTypeService.checkType(type);
			if (type2 == null) {
				success();
			} else {
				fail();
				message("分类已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了，你别乱搞");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/doAdd")
	public Object doAdd(Type type) {

		start();
		try {
			Type type2 = projectTypeService.checkType(type);
			if (type2 == null) {
				Integer i = projectTypeService.addType(type);
				if (i >= 0) {
					success();
				} else {
					fail();
					message("添加失败");
				}
			} else {
				fail();
				message("分类已存在");
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
			Page<Type> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			paramMap.put("pagesize", page.getPagesize());
			paramMap.put("startindex", startindex);
			paramMap.put("queryText", queryText);
			
			List<Type> datas = projectTypeService.queryPage(paramMap);
			page.setDatas(datas);
			
			Integer totalcount = projectTypeService.count(paramMap);
			page.setTotalcount(totalcount);
			paramMap.put("pageno", pageno);
			paramMap.put("pagesize", pagesize);
			paramMap.put("queryText", queryText);
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
