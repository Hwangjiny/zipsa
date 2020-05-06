package com.sesoc.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.project.dao.MemberDAO;

@Controller
public class HomeController {
	
	@Autowired
	MemberDAO dao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {	
		return "/index";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {	
		return "/index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {	
		return "/login";
	}
	
	@RequestMapping(value = "myLocation", method = RequestMethod.GET)
	public String myLocation() {	
		return "/myLocation";
	}
	
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String board() {	
		return "/board";
	}
	
	@RequestMapping(value = "3d", method = RequestMethod.GET)
	public String threed() {	
		return "/3d";
	}
	
	@RequestMapping(value = "qa", method = RequestMethod.GET)
	public String qa() {	
		return "/qa";
	}
	
	@RequestMapping(value = "products", method = RequestMethod.GET)
	public String products(HttpSession session, Model model) {
		String userid = (String)session.getAttribute("userid");
		dao.getMember(userid, model);
		
		return "/products";
	}
	
	@RequestMapping(value = "member/signupForm", method = RequestMethod.GET)
	public String signupForm() {	
		return "/member/signupForm";
	}
	
	@RequestMapping(value = "voice", method = RequestMethod.GET)
	public String voice() {	
		return "/voice";
	}
	
	@RequestMapping(value="make3DRoom", method = RequestMethod.GET)
	public Object make3DRoom2() {
		
		return "make3DRoom";
	}
	
}
