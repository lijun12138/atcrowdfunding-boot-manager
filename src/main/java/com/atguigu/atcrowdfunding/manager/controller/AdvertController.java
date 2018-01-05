package com.atguigu.atcrowdfunding.manager.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Advertisement;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.AdvertService;

@Controller
@RequestMapping("advert")
public class AdvertController extends BaseController{

	@Autowired
	private AdvertService advertService;

	@RequestMapping("/index")
	public String index() {
		return "advert/index";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "advert/add";
	}

	@ResponseBody
	@RequestMapping("/doBatchDelete")
	public Object doBatchDelete(Integer[] id) {
		start();
		try {
			Integer i = advertService.deleteBatch(id);
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
	
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Advertisement advert = advertService.queryRoleById(id);
		map.put("advert", advert);
		return "advert/update";
	}

	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = advertService.deleteById(id);
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
	public Object doUpdate(Advertisement advert) {

		start();
		try {
			Integer i = advertService.updateRole(advert);
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
	@RequestMapping("/doAdd")
	public Object doAdd(Advertisement advert,HttpServletRequest request,HttpSession session) {
		start();
		
		try {
			MultipartHttpServletRequest mtsr = (MultipartHttpServletRequest) request;
			
			MultipartFile mfile = mtsr.getFile("advpic");
			
			
			String name = mfile.getOriginalFilename();
			String extname = name.substring(name.indexOf("."));
			
			String iconpath = UUID.randomUUID().toString()+extname;
			
			String realpath = "E:/distributedServer/resources/atcrowdfunding/pic/adv/" + iconpath;
			
			mfile.transferTo(new File(realpath));
			
			advert.setIconpath(iconpath);
			Integer i = advertService.addAdvert(advert);
			if (i >= 0) {
				success();
			} else {
				fail();
				message("添加失败");
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
			Page<Advertisement> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			paramMap.put("pagesize", page.getPagesize());
			paramMap.put("startindex", startindex);
			paramMap.put("queryText", queryText);

			List<Advertisement> datas = advertService.queryPage(paramMap);
			page.setDatas(datas);

			Integer totalcount = advertService.count(paramMap);
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
