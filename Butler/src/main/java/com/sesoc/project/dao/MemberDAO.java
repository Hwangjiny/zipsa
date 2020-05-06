package com.sesoc.project.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.sesoc.project.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	public boolean signup(MemberVO vo) {
		int result = 0;
		
		try {
			MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
			result = mapper.signup(vo);			
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(result == 0) return false;
		return true;		
	}
	
	// 로그인
		public boolean login(MemberVO vo, HttpSession session) {
			int result = 0;
			
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.login(vo);			
			}catch(Exception e) {
				e.printStackTrace();
			}
			if(result == 0) return false;
			session.setAttribute("userid", vo.getUserid());
			return true;		
		}
	
		
	// 로그아웃
	public void logout(HttpSession session) {
		session.removeAttribute("userid");
	}
	
	// ID 중복 확인
		public int checkid(String userid) {
			int result = 0;
			
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.checkid(userid);			
			}catch(Exception e) {
				e.printStackTrace();
			}
					
			return result;
		}
		

		public MemberVO getMember(String userid, Model model) {
			MemberVO result = null;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.getMember(userid);
			} catch(Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("result", result);
			return result;
		}


		public int smsOk(String userid) {
			int result = 0;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.smsOk(userid);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		public ArrayList<String> smsOkList() {
			ArrayList<String> result = null;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.smsOkList();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}

		public int smsNo(String userid) {
			int result = 0;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.smsNo(userid);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		public MemberVO getInfo(HttpSession session, Model model) {
			MemberVO result = null;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				String userID = (String) session.getAttribute("userid");
				result = mapper.getMember(userID);
			} catch(Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("result", result);
			return result;
		}

		public String getPhone(String userid) {
			String result = null;
			try {
				MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
				result = mapper.getPhone(userid);
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		
}
