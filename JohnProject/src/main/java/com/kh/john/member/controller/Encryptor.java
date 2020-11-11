package com.kh.john.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Encryptor {
	//예전 아이디를 암호화 하세요^^
	//중복인 아이디는 안될 수도 있습니다^^
	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
		Scanner sc=new Scanner(System.in);
		AES256Util aes=new AES256Util();
		BCryptPasswordEncoder bcrypt=new BCryptPasswordEncoder();

		System.out.print("암호화 대상 입력(양방향): ");
		String idStr=sc.nextLine();
		String id=aes.encrypt(idStr);
		System.out.println("결과: "+id);
		
		System.out.print("암호화 대상 입력(단방향): ");
		String pwStr=sc.nextLine();
		String pw=bcrypt.encode(pwStr);
		System.out.println("결과: "+pw);
		
		System.out.print("복호화 대상 입력(양방향): ");
		String idEn=sc.nextLine();
		String idDe=aes.decrypt(idEn);
		System.out.println("결과: "+idDe);
	}

}
