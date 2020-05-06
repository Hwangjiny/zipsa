package com.sesoc.project;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.project.dao.HospitalDAO;
import com.sesoc.project.vo.HospitalVO;



@Controller
public class HospitalController {
	
	@Autowired
	private HospitalDAO dao;
	
	@RequestMapping(value = "/roadView", method = RequestMethod.GET)
	public String roadView(String xx, String yy, Model model)
	{
		model.addAttribute("xx",xx);
		model.addAttribute("yy",yy);
		return "/roadView";
	}
	
	@ResponseBody
	@RequestMapping(value = "/myL", method = RequestMethod.GET)
	public ArrayList<String> myL(HospitalVO vo, Model model) {
		ArrayList<String> list = new ArrayList<>();
		ArrayList<HospitalVO> list1 = dao.hoList(vo);
		list.add(list1.get(0).getId());
		list.add(list1.get(0).getPhone());
		list.add(list1.get(0).getLocation());
		
		list.add(list1.get(1).getId());
		list.add(list1.get(1).getPhone());
		list.add(list1.get(1).getLocation());
		
		list.add(list1.get(2).getId());
		list.add(list1.get(2).getPhone());
		list.add(list1.get(2).getLocation());
		
		list.add(list1.get(0).getXValue());
		list.add(list1.get(0).getYValue());
		list.add(list1.get(1).getXValue());
		list.add(list1.get(1).getYValue());
		list.add(list1.get(2).getXValue());
		list.add(list1.get(2).getYValue());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/check", method = {RequestMethod.GET, RequestMethod.POST})
	public ArrayList<String> check(String start, String end, RedirectAttributes rttr) {
		ArrayList<String> list = new ArrayList<>();
		list.add(start);
		list.add(end);
		return list;
	}

}
