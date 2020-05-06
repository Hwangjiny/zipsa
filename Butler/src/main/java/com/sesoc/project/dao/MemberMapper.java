package com.sesoc.project.dao;

import java.util.ArrayList;

import com.sesoc.project.vo.MemberVO;

public interface MemberMapper {

	public int signup(MemberVO vo);
	
	public int login(MemberVO vo);
	
	public int checkid(String userid);
	
	public MemberVO getMember(String userid);

	public int smsOk(String userid);

	public ArrayList<String> smsOkList();

	public int smsNo(String userid);

	public String getPhone(String userid);
}
