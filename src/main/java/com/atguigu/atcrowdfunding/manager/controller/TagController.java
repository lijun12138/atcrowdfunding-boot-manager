package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Tag;
import com.atguigu.atcrowdfunding.manager.service.TagService;

@Controller
@RequestMapping("/tag")
public class TagController extends BaseController{

	@Autowired
	private TagService tagService;

	@RequestMapping("/index")
	public String index() {
		return "tag/index";
	}

	@RequestMapping("/toAdd")
	public String toAdd() {
		return "tag/add";
	}

	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Tag tag = tagService.queryTagById(id);
		map.put("tag", tag);
		return "tag/update";
	}

	@ResponseBody
	@RequestMapping("/doDelete")
	public Object doDelete(Integer id) {
		start();
		try {
			Integer i = tagService.deleteById(id);
			if (i > 0) {
				success();
			} else {
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
	public Object doUpdate(Tag tag) {

		start();
		try {
			Integer i = tagService.updateTag(tag);
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
	public Object doAdd(Tag tag) {
		start();
		try {
			Integer i = tagService.addTag(tag);
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
	@RequestMapping("loadData")
	public Object loadData() {
		List<Tag> tagList = tagService.queryAllTag();

		Map<Integer, Tag> tagMap = new HashMap<>();
		Tag parent = null;
		for (Tag tag : tagList) {
			tagMap.put(tag.getId(), tag);
		}

		for (Tag children : tagList) {
			if (children.getPid() == 0) {
				parent = children;
			} else {
				Tag father = tagMap.get(children.getPid());
				father.getChildren().add(children);
			}
		}
		return parent;
	}

}
