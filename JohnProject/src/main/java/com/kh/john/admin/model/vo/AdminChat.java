package com.kh.john.admin.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

import lombok.Data;

@Data
@JsonAutoDetect(fieldVisibility = Visibility.ANY)
public class AdminChat {

	private int adminUsid;
	private int adminChatMemUsid;
	private String adminChatContent;
	private Date adminChatDate;
	private String adminChatFile;
}

