package com.sesoc.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data

public class QnaReplyVO {
	private int replynum;
	private int boardnum;
	private String userid;
	private String replytext;
	private String inputdate;
}
