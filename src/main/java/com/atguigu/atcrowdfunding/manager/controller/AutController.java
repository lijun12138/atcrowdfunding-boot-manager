package com.atguigu.atcrowdfunding.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.bean.Cert;
import com.atguigu.atcrowdfunding.common.bean.Member;
import com.atguigu.atcrowdfunding.common.bean.MemberCert;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.ActivitiService;
import com.atguigu.atcrowdfunding.manager.service.MemberService;

@Controller
@RequestMapping("/auth")
public class AutController extends BaseController {

	@Autowired
	private ActivitiService activitiService;

	@Autowired
	private MemberService memberService;

	
	@ResponseBody
	@RequestMapping("/refuse")
	public Object refuse(HttpSession session,String taskid,Member member) {
		start();
		
		try {
			Map<String,Object> variable = new HashMap<>();
			variable.put("memberid", member.getId());
			variable.put("taskid", taskid);
			variable.put("flag", false);
			variable.put("email", member.getEmail());
			activitiService.complete(variable);
			
			member.setAuthstatus("0");
			memberService.update(member);
			
			success();
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		
		return end();
	}
	@ResponseBody
	@RequestMapping("/pass")
	public Object pass(HttpSession session,String taskid ,Member member) {
		start();
		
		try {
			Map<String,Object> variable = new HashMap<>();
			variable.put("memberid", member.getId());
			variable.put("taskid", taskid);
			variable.put("flag", true);
			variable.put("email", member.getEmail());
			activitiService.complete(variable);
			member.setAuthstatus("2");
			memberService.update(member);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了");
		}
		
		return end();
	}
	@RequestMapping("/detail")
	public String detail(Map<String, Object> map, Integer memberid, String taskid) {
		// 将数据保存到请求范围中，可以在freemarker页面中直接通过${}访问，也可以通过${RequestParameters["xxx"]}访问
		map.put("memberid", memberid);
		map.put("taskid", taskid);

		// 查询申请会员提交的资质文件数据
		List<MemberCert> mcfs = memberService.queryMemberCert(memberid);
		map.put("mcfs", mcfs);

		Member member = memberService.queryMember(memberid);
		map.put("member",member);
		
		List<Cert> listCert = memberService.queryCert(member.getAccttype());
		map.put("listCert",listCert);
		
		return "auth/certview";
	}

	@RequestMapping("/index")
	public String cert() {
		return "auth/index";
	}

	@ResponseBody
	@RequestMapping("/queryTask")
	public Object queryTask(Integer pageno, Integer pagesize, String queryText) {
		start();

		try {

			Page<Object> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("startindex", startindex);
			paramMap.put("pagesize", pagesize);
			paramMap.put("queryText", queryText);

			List<Map<String, Object>> list = activitiService.queryData(paramMap);
			Integer count = 0;
			for (Map<String, Object> map : list) {
				count = (Integer) map.get("count");
			}

			page.setTotalcount(count);
			page.setDatas(list);
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
