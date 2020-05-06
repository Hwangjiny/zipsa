package com.sesoc.project;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.project.dao.CatDAO;
import com.sesoc.project.dao.MemberDAO;
import com.sesoc.project.vo.CatVO;
import com.sesoc.project.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private CatDAO dao1;
	
	//회원가입
	@RequestMapping(value = "member/signup", method = {RequestMethod.GET, RequestMethod.POST})
	public String signup(MemberVO vo, RedirectAttributes rttr) {
		boolean result = dao.signup(vo);
		rttr.addFlashAttribute("signupResult", result);
		
		return "redirect:/member/login?userid="+vo.getUserid()+"&userpwd="+vo.getUserpwd(); 
	}
	
	//로그인
		@RequestMapping(value = "member/login", method = {RequestMethod.GET, RequestMethod.POST})
		public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) {	
			boolean result = dao.login(vo, session);
			if(result) 
				{
					
					return "redirect:/index";
				}
			rttr.addFlashAttribute("loginResult", result);
			return "redirect:/";
		}
	
	//로그아웃
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			dao.logout(session);
			
			return "/index";
		}
		
	//아이디 중복확인 화면 이동
		@RequestMapping(value = "member/idCheckForm", method = RequestMethod.GET)
		public String idCheckForm() {
			return "/member/idCheckForm";
		}
		
	//아이디 중복확인
		@RequestMapping(value = "member/checkid", method = RequestMethod.POST)
		public String checkid(String userid, RedirectAttributes rttr) {
			boolean checkResult = false;
			if(dao.checkid(userid) == 0) checkResult = true;
			rttr.addFlashAttribute("checkResult", checkResult);
			rttr.addFlashAttribute("userid", userid);
			return "redirect:/member/idCheckForm";
		}
		
		@RequestMapping(value = "userInfo", method = RequestMethod.GET)
		public String viewUserInfo(Model model, HttpSession session) {
			dao.getInfo(session, model);
			Object user = session.getAttribute("userid");
			String userid = (String)user;
			
			ArrayList<CatVO> list = dao1.getList(userid);
			model.addAttribute("list", list);
			return "member/userInfo";
		}
}
