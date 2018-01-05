package com.atguigu.atcrowdfunding.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.atguigu.atcrowdfunding.common.bean.User;
import com.atguigu.atcrowdfunding.common.util.Page;

@FeignClient("atcrowdfunding-manager-service")
public interface UserService {

	@RequestMapping("/user/queryPage")
	List<User> queryPage(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/user/addUser")
	Integer addUser(@RequestBody User user);

	@RequestMapping("/user/checkUser")
	User checkUser(@RequestBody User user);

	@RequestMapping("/user/queryUserById")
	User queryUserById(@RequestBody Integer id);

	@RequestMapping("/user/updateUser")
	Integer updateUser(@RequestBody User user);

	@RequestMapping("/user/deleteById")
	Integer deleteById(@RequestBody Integer id);

	@RequestMapping("/user/deleteBatch")
	Integer deleteBatch(@RequestBody Integer[] ids);

	@RequestMapping("/user/queryRoleByUserid")
	List<Integer> queryRoleByUserid(@RequestBody Integer userid);

	@RequestMapping("/user/addRoleById")
	Integer addRoleById(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/user/removeRoleById")
	Integer removeRoleById(@RequestBody Map<String, Object> paramMap);

	@RequestMapping("/user/count")
	Integer count(@RequestBody Map<String, Object> paramMap);

}
