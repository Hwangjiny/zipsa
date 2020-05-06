package com.sesoc.project;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.project.dao.CatDAO;
import com.sesoc.project.vo.BoardVO;
import com.sesoc.project.vo.CatVO;



@Controller
public class CatController {
	
	@Autowired
	private CatDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "insertCat", method = {RequestMethod.GET, RequestMethod.POST})
	public ArrayList<CatVO> myL(String userid, String catname, String cat_birth, CatVO vo) {
		vo.setCat_birth(cat_birth);
		vo.setCatname(catname);
		vo.setUserid(userid);
		dao.insertCat(vo);
		
		ArrayList<CatVO> list = dao.getList(userid);
		return list;
	}
	
	@RequestMapping(value = "/catRead", method = RequestMethod.GET)
	public String read(CatVO vo, int cat_no, Model model) {
		CatVO result = dao.read(cat_no);
		model.addAttribute("list", result);
		
		return "/member/catRead"; 
	}
	
	@RequestMapping(value = "/catDelete", method = RequestMethod.GET)
	public String read(CatVO vo, HttpSession session) {
		dao.delete(vo, session);
		return "redirect:/userInfo"; 
	}
	
	
	@RequestMapping(value = "/updateCat", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateCat(CatVO vo) {
		dao.updateCat(vo);
		
		return "redirect:/userInfo"; 
		
	}

}
