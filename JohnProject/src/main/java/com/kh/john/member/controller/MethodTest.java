package com.kh.john.member.controller;

import java.sql.Date;

//이게 되나 실험해보는 메소드
public class MethodTest {
	public static void main(String[] args) {
		String[] license1= {"가","나"};
		String[] license2= {"다","라"};
		String[] license3= {"마","바"};
		
		String[][] licenseArr=new String[3][3];
		licenseArr[0][0]="1";
		licenseArr[1][0]="2";
		licenseArr[2][0]="3";
		for(int i=0; i<3; i++) {
			for(int j=1; j<3; j++) {
				if(i==0) {
					licenseArr[i][j]=license1[j-1];
				}else if(i==1) {
					licenseArr[i][j]=license2[j-1];
				}else {
					licenseArr[i][j]=license3[j-1];
				}
			}
		}
		for(int i=0; i<3; i++) {
			for(int j=0; j<3; j++) {
				System.out.print(licenseArr[i][j]);
			}
			System.out.println("");
		}
	}

}
