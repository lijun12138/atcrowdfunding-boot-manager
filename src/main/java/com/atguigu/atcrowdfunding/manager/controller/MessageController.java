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
import com.atguigu.atcrowdfunding.common.bean.Message;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController extends BaseController{

	@Autowired
	private MessageService messageService;
	@RequestMapping("/index")
	public String index() {
		return "message/index";
	}
	
	@RequestMapping("/toUpdate")
	public String toUpdate(Integer id, Map<String, Object> map) {
		Message message = messageService.queryMessageById(id);
		map.put("message", message);
		return "message/update";
	}
	
	@ResponseBody
	@RequestMapping("/doUpdate")
	public Object doUpdate(Message message) {

		start();
		try {
			Integer i = messageService.updateMessage(message);
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
			@RequestParam(value = "pagesize", required = false, defaultValue = "1") Integer pagesize
			) {

		start();
		try {

			Page<Message> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("pagesize", page.getPagesize());
			paramMap.put("startindex", startindex);

			List<Message> datas = messageService.queryPage(paramMap);
			page.setDatas(datas);

			Integer totalcount = messageService.count(paramMap);
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
