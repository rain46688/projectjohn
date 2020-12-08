package com.kh.john.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class RoomDate {
	int boardId;
	Date date;
}
