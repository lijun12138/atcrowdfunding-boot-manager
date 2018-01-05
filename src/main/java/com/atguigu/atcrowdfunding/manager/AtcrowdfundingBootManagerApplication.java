package com.atguigu.atcrowdfunding.manager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.web.client.RestTemplate;

@EnableFeignClients
@EnableDiscoveryClient
@SpringBootApplication
@ServletComponentScan
public class AtcrowdfundingBootManagerApplication {

	@Bean
	@LoadBalanced//不加会报，因为自带负载均衡，Ribbon Caused by: java.net.UnknownHostException: atcrowdfunding-activiti-service
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}
	
	public static void main(String[] args) {
		SpringApplication.run(AtcrowdfundingBootManagerApplication.class, args);
	}
}
