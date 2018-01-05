package com.atguigu.atcrowdfunding.manager.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.atguigu.atcrowdfunding.common.BaseController;
import com.atguigu.atcrowdfunding.common.util.Page;
import com.atguigu.atcrowdfunding.manager.service.ProcessService;

@Controller
@RequestMapping("/process")
public class ProcessController extends BaseController {

	@Autowired
	private ProcessService processService;

	@Autowired
	private RestTemplate restTemplate;

	@RequestMapping("/view")
	public String view(String id,Map<String,Object> map) {
		map.put("id", id);
		
		return "process/view";
	}
	
	@RequestMapping("/index")
	public String process() {
		return "process/index";
	}

	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(String id) {
		start();
		try {
			processService.delete(id);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			fail();
		}
		
		return end();
	}
	
	@ResponseBody
	@RequestMapping("/loadImg")
	public void loadImg(String id ,HttpServletResponse response) throws IOException {
		//创建一个请求头的对象
		HttpHeaders headers = new HttpHeaders();
		//设置请求中的后缀名
		headers.setContentType(MediaType.IMAGE_PNG);
		//调用远程服务的url
		String url = "http://atcrowdfunding-activiti-service/act/loadImg/"+id;
		//通过restTemplate的exchage()的到目标图片的字节数组
		// url ： 远程服务端的地址
		//method ： 发起请求的方式
		// responseType ： 返回值的类型
		ResponseEntity<byte[]> responseEntity = restTemplate.exchange(url, HttpMethod.POST, new HttpEntity<byte[]>(headers), byte[].class);
		//将ResponseEntity中的字节数组拿到
		byte[] body = responseEntity.getBody();
		
		//通过创建一个放在内存中的字节数组输入流将拿到的字节数组放在输入流中
		ByteArrayInputStream inputStream = new ByteArrayInputStream(body);
		//通过HttpServletResponse拿到响应的输出流
		ServletOutputStream outputStream = response.getOutputStream();
		//定义一个标志
		int i = -1;
		//调用输出流中的read方法，当返回值为-1时，文件读取完成
		while((i=inputStream.read())!=-1) {
			//一边读，一边向浏览器输出响应流
			outputStream.write(i);
		}
	}
	
	@ResponseBody
	@RequestMapping("/upload")
	public Object upload(HttpServletRequest request) {
		start();
		
		try {
			//将HttpServletRequest对象转换为一个MultipartHttpServletRequest对象，用来获取上传的文件
			MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
			//MultipartHttpServletRequest对象通过表单中的name属性值获取对应的文件
			MultipartFile file = mulRequest.getFile("procDefFile");
			//根据获取到的文件获得全文件名
			String originalFilename = file.getOriginalFilename();
			//拿到后缀名
			String mime = originalFilename.substring(originalFilename.lastIndexOf("."));
			//通过UUID获取一个随机的字符串
			String uuid = UUID.randomUUID().toString();
			//根据这个字符串和后缀名生成一个新的临时File对象
			//File tempFile = new File(randomUUID+mime);
			File tempFile = File.createTempFile(uuid, mime);
			//将拿到的临时文件写到我们生成的临时文件中
			file.transferTo(tempFile);
			//将临时文件封装到FileSystemResource对象中保存
			FileSystemResource resours= new FileSystemResource(tempFile);
			//生成一个MultiValueMap集合来保存我们要传递的文件
			MultiValueMap<String, Object> param = new LinkedMultiValueMap<>();
			param.add("pdfile", resours);
			
			//在SpringCould中服务器之间传递文件通过RestTemplate的postForObject方法进行传递，
			//url：要传递的服务器在注册中心中注册的名字和映射地址
			//request ： 我们需要传递的文件的容器
			//responseType ： 远程服务器给我们的响应类型，获取到的类型就是响应类型
			//Object... uriVariables ： 可变参数，在我们要传递的参数可以是任意个
			String response = restTemplate.postForObject("http://atcrowdfunding-activiti-service/act/deploy", param, String.class);
			//删除传递的临时文件，节省空间
			tempFile.delete();
			message(response);
			success();
		} catch (Exception e) {
			e.printStackTrace();
			fail();
			message("发生异常了。。。");
		}
		return end();
	}

	@ResponseBody
	@RequestMapping("/queryList")
	public Object qeuryList(Integer pageno, Integer pagesize, String queryText) {
		start();
		try {
			Page<Object> page = new Page<>(pageno, pagesize);
			Integer startindex = page.startindex();
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("startindex", startindex);
			paramMap.put("pagesize", pagesize);
			paramMap.put("queryText", queryText);

			// List<Map<String,Object>> pdList =
			// processService.queryList(startindex,pagesize);
			List<Map<String, Object>> pdList = processService.queryList(paramMap);

			Integer count = processService.count(paramMap);
			page.setTotalcount(count);
			page.setDatas(pdList);
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
