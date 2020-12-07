package com.kh.john.exboard.socket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

@Configuration
public class MyServerContainerConfigurer {
	// 파일 업로드용
	@Bean
	public ServletServerContainerFactoryBean createWebSocketContainer() {
		ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
		container.setMaxTextMessageBufferSize(1024 * 1024 * 64);
		container.setMaxBinaryMessageBufferSize(1024 * 1024 * 64);
		return container;
	}
}