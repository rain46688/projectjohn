package com.kh.john.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.exception.ExceptionUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

public class TestHandler {

	@ExceptionHandler(IOException.class)
	@ResponseStatus(HttpStatus.SERVICE_UNAVAILABLE)   //(1)
	public Object exceptionHandler(IOException e, HttpServletRequest request) {
	    if (StringUtils.containsIgnoreCase(ExceptionUtils.getRootCauseMessage(e), "Broken pipe")) {   //(2)
	        return null;        //(2)	socket is closed, cannot return any response    
	    } else {
	        return new HttpEntity<>(e.getMessage());  //(3)
	    }
	}
}
