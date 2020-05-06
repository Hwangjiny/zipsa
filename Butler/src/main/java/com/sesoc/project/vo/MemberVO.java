package com.sesoc.project.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class MemberVO {
	private int member_seq;
	private String userid;
	private String userpwd;
	private String username;
	private String phone;
	private String logindate; 
	private String sms_agr;
}
