package com.kh.john.member.controller;

import java.util.Scanner;
import java.util.UUID;

public class UuidGenerator {
	public String generateUuid(int length) {
		String uuid=UUID.randomUUID().toString().replaceAll("-", "");
		uuid=uuid.substring(0,length);
		return uuid;
	}
}
