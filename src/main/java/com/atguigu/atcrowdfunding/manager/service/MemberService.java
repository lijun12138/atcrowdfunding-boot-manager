package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.Cert;
import com.atguigu.atcrowdfunding.common.bean.Member;
import com.atguigu.atcrowdfunding.common.bean.MemberCert;

@FeignClient("atcrowdfunding-member-service")
public interface MemberService {

	@RequestMapping("member/queryMemberCert")
	public List<MemberCert> queryMemberCert(@RequestBody Integer memberid);

	@RequestMapping("member/queryMember")
	public Member queryMember(@RequestBody Integer memberid);

	@RequestMapping("member/queryCert")
	public List<Cert> queryCert(@RequestBody String accttype);

	@RequestMapping("member/update")
	public void update(@RequestBody Member member);
}
