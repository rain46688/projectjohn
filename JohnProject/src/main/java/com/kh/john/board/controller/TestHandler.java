package com.kh.john.board.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class TestHandler {

	@ExceptionHandler(IOException.class)
	public Object exceptionHandler(IOException e, HttpServletRequest request) {
	    if (e.getMessage().contains("Broken pipe")) {   //(2)
	        return null;        //(2)	socket is closed, cannot return any response   
	    } else {
	        return new HttpEntity<>(e.getMessage());  //(3)
	    }
	}
}
