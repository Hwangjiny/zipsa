package com.sesoc.project;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sesoc.project.dao.PageNavigator;
import com.sesoc.project.dao.QnaBoardDAO;
import com.sesoc.project.vo.QnaBoardVO;
import com.sesoc.project.vo.QnaReplyVO;

@Controller
public class QnaBoardController {

	@Autowired
	private QnaBoardDAO dao;
	
	//게시글 출력
	@RequestMapping(value = "qnaboard/qnaboardList", method = RequestMethod.GET)
	public String boardList(Model model,
		@RequestParam(name = "currentPage", defaultValue = "1") int currentPage,
		@RequestParam(name = "searchItem", defaultValue = "userid") String searchItem,
		@RequestParam(name = "searchKeyword", defaultValue = "") String searchKeyword
		)
	{
		PageNavigator navi = dao.getNavi(currentPage, searchItem, searchKeyword);
		ArrayList<QnaBoardVO> list = dao.qnaboardList(navi, searchItem, searchKeyword);
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("searchKeyword", searchKeyword);
		return "/qnaboard/qnaboardList";
	}
	//쓰는 폼으로 이동
	@RequestMapping(value = "qnaboard/qnaboardWriteForm", method = RequestMethod.GET)
	public String goboard() {
	
		return "/qnaboard/qnaboardWriteForm";
	}
	//게시글 등록
	@RequestMapping(value = "qnaboard/write", method = {RequestMethod.GET, RequestMethod.POST})
	public String write(QnaBoardVO vo, HttpSession session, RedirectAttributes rttr, MultipartFile uploadFile) {
		boolean result = false;
		if(dao.write(vo, session, uploadFile)==1) result = true;
		rttr.addFlashAttribute("writeResult", result);
		return "redirect:/qnaboard/qnaboardList"; 
	}
	
	//게시글 불러오기
	@RequestMapping(value = "/qnaboard/read", method = RequestMethod.GET)
	public String read(QnaBoardVO vo, int boardnum, RedirectAttributes rttr, Model model) {
		dao.update(vo);
		QnaBoardVO result = dao.read(boardnum);
		ArrayList<QnaReplyVO> replyList = dao.replyList(boardnum);
		model.addAttribute("read", result);
		model.addAttribute("replyList", replyList);
		return "/qnaboard/qnaboardRead"; 
	}

	//삭제
	@RequestMapping(value = "/qnaboard/delete", method = RequestMethod.GET)
	public String read(RedirectAttributes rttr, QnaBoardVO vo, HttpSession session) {
		boolean result = false;
		if(dao.delete(vo, session)==1) result = true;
		rttr.addFlashAttribute("delResult", result);
		return "redirect:/qnaboard/qnaboardList"; 
	}
	
	//첨부파일삭제버튼
	@RequestMapping(value = "/qnaboard/deleteFile", method = RequestMethod.GET)
	public String deleteFile(RedirectAttributes rttr, QnaBoardVO vo, HttpSession session) {
		dao.deleteFile(vo, session);
		rttr.addAttribute("boardnum", vo.getBoardnum());
		return "redirect:/qnaboard/qnaboardUpdate";
	}
	
	// update 이동
	@RequestMapping(value = "qnaboard/qnaboardUpdate", method = {RequestMethod.GET, RequestMethod.POST})
	public String boardUpdateMove(int boardnum, HttpSession session, RedirectAttributes rttr, Model model) {
		QnaBoardVO result = dao.read(boardnum);
		model.addAttribute("read", result);
		return "qnaboard/qnaboardUpdate";
	}

	
	//update
	@RequestMapping(value = "/qnaboard/update", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateboard(RedirectAttributes rttr, QnaBoardVO vo, HttpSession session, MultipartFile uploadFile) {
		boolean result = false;
		if(dao.qnaupdateboard(vo, session, uploadFile)!=0) result = true;
		rttr.addFlashAttribute("upResult", result);
		
		rttr.addAttribute("boardnum", vo.getBoardnum());
		return "redirect:/qnaboard/upread";
	}
	
	//조회수 증가 막기
	@RequestMapping(value = "/qnaboard/upread", method = RequestMethod.GET)
	public String upread(int boardnum, HttpSession session, RedirectAttributes rttr, Model model) {
		QnaBoardVO result = dao.read(boardnum);
		model.addAttribute("read", result);
		return "/qnaboard/qnaboardRead"; 
	}
			
	//댓글 입력
	@RequestMapping(value = "qnaboard/replyWrite", method = RequestMethod.POST) 
	public String replyWrite(QnaReplyVO vo, HttpSession session) 
	{
		dao.replyWrite(vo, session);
		return "redirect:/qnaboard/read?boardnum=" +vo.getBoardnum();
	}
	
	//댓글 삭제
	
	@RequestMapping(value = "qnaboard/replyDelete", method = RequestMethod.GET) 
	public String replyDelete(QnaReplyVO vo, HttpSession session, RedirectAttributes rttr) 
	{
		boolean result = false;
		if(dao.replyDelete(vo, session)==1) result = true;
		rttr.addFlashAttribute("replyDelete", result);
		return "redirect:/qnaboard/read?boardnum=" +vo.getBoardnum();
	}
	
	@RequestMapping(value = "qnaboard/download", method = RequestMethod.GET) 
	public void download(int boardnum, HttpServletResponse response)
	{
		dao.download(boardnum, response);
	}
	


	
	
	
	
	
	
}
