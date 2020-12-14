package com.kh.john.exboard.socket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

import lombok.extern.slf4j.Slf4j;

@Configuration
@Slf4j
public class MyServerContainerConfigurer {
	// 파일 업로드용
	@Bean
	public ServletServerContainerFactoryBean createWebSocketContainer() {
		log.debug(" === ServletServerContainerFactoryBean 실행 <웹소켓 파일 전송용> === ");
		ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
		// 웹소켓을 통해서 파일을 서버로 전송할때 바이너리 형식으로 서버에 보내는데 그 버퍼의 사이즈 값을 정해주는것
		// 이게 없으면 안됨!
		container.setMaxTextMessageBufferSize(1024 * 1024 * 64);
		container.setMaxBinaryMessageBufferSize(1024 * 1024 * 64);
		return container;
	}
}