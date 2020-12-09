package com.kh.john.exboard.model.vo;

import com.kh.john.member.model.vo.Expert;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ExpertBoardListVo extends Expert {

	private String usid;
	private String memName;
	private String memNickname;
	private String profilePic;
}
