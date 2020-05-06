package com.sesoc.project;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.project.dao.MemberDAO;
import com.sesoc.project.scheduler.SmsScheduler;
import com.sesoc.project.vo.MemberVO;

@Controller
public class SmsController {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private SmsScheduler test;
	
	
	@RequestMapping(value="/smsOk", method=RequestMethod.GET)
	public String smsOk(HttpSession session, RedirectAttributes rttr, Model model) {
		String userid = (String)session.getAttribute("userid");
		boolean result = false;
		
		if(dao.smsOk(userid) > 0) result = true;
		rttr.addFlashAttribute("smsYesresult", result);
		
		//SMS 수신가입확인메세지 전송
		MemberVO temp = dao.getMember(userid, model);
		String phone = temp.getPhone();
		phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
		test.smsSend(phone, temp.getUsername() + "様, " + temp.getLogindate() + "予防接種通知サービス申請が完了しました。- 執事の条件");
		
		return "redirect:/products";
	}
	
	@RequestMapping(value="/smsNo", method=RequestMethod.GET)
	public String smsNo(HttpSession session, RedirectAttributes rttr, Model model) {
		String userid = (String)session.getAttribute("userid");
		boolean result = false;
		
		if(dao.smsNo(userid) > 0) result = true;
		rttr.addFlashAttribute("smsNoresult", result);
		
		//SMS 수신해지확인메세지 전송
		MemberVO temp = dao.getMember(userid, model);
		String phone = temp.getPhone();
		phone = phone.replaceAll("-", ""); //String phone에서 "-"문자열 삭제
		test.smsSend(phone, temp.getUsername() + "様, " + temp.getLogindate() + "予防接種通知サービスが解除されました。- 執事の条件");
		
		return "redirect:/products";
	}
}
