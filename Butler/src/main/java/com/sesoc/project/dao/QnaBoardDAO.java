package com.sesoc.project.dao;

import java.awt.image.MultiPixelPackedSampleModel;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.project.vo.QnaBoardVO;
import com.sesoc.project.vo.QnaReplyVO;



@Repository
public class QnaBoardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final int countPerPage = 10;
	private final int pagePerGroup = 5;
	
	//게시판 리스트
	public ArrayList<QnaBoardVO> qnaboardList(PageNavigator navi, String searchItem, String searchKeyword)
	{
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		ArrayList<QnaBoardVO> list = null;
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		try 
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			list = mapper.qnaboardList(map, rb);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int write(QnaBoardVO vo, HttpSession session, MultipartFile uploadFile)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		int result = 0;
		
		if(!uploadFile.isEmpty())
		{
			//저장용 파일명
			String savedFilename = UUID.randomUUID().toString();
			//원본파일명
			String originalFilename = uploadFile.getOriginalFilename();
			vo.setSavedFileName(savedFilename);
			vo.setOriginalFileName(originalFilename);
			try 
			{
				uploadFile.transferTo(new File("C:/test/"+savedFilename));
				QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
				result = mapper.write(vo);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		if(uploadFile.isEmpty())
		{
			try 
			{
				QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
				result = mapper.write(vo);
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	public void update(QnaBoardVO vo)
	{
		try 
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			mapper.update(vo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
				
	}
	
	public QnaBoardVO read(int boardnum)
	{
		QnaBoardVO result = null;
		try 
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			result = mapper.read(boardnum);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int delete(QnaBoardVO vo, HttpSession session)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		
		int result = 0;
		try 
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			QnaBoardVO temp = mapper.read(vo.getBoardnum());
			result = mapper.delete(vo);
			
			File file = new File("C:/test/"+temp.getSavedFileName());
			if(file.exists()) file.delete();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int qnaupdateboard(QnaBoardVO vo, HttpSession session, MultipartFile uploadFile)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		int result = 0;
		
		try 
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			//새로운 첨부파일이 있을 경우
			if(!uploadFile.isEmpty())
			{
				QnaBoardVO temp = mapper.read(vo.getBoardnum());
				File oldFile = new File("C:/test/"+temp.getSavedFileName());
				if(oldFile.exists()) oldFile.delete();
			
				String savedFilename = UUID.randomUUID().toString();
				String originalFilename = uploadFile.getOriginalFilename();
				vo.setSavedFileName(savedFilename);
				vo.setOriginalFileName(originalFilename);
				
				uploadFile.transferTo(new File("C:/test/"+savedFilename));
				
			}
			result = mapper.qnaupdateboard(vo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	

	public void replyWrite(QnaReplyVO vo, HttpSession session)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		try
		{
			QnaReplyMapper mapper = sqlSession.getMapper(QnaReplyMapper.class);
			mapper.replyWrite(vo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<QnaReplyVO> replyList(int boardnum)
	{
		ArrayList<QnaReplyVO> replyList = null;
		try
		{
			QnaReplyMapper mapper = sqlSession.getMapper(QnaReplyMapper.class);
			replyList = mapper.replyList(boardnum);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return replyList;
	}
	
	public int replyDelete(QnaReplyVO vo, HttpSession session)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		int result = 0;
		try
		{
			QnaReplyMapper mapper = sqlSession.getMapper(QnaReplyMapper.class);
			result = mapper.replyDelete(vo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
	public void deleteFile(QnaBoardVO vo, HttpSession session)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		try
		{
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			QnaBoardVO temp = mapper.read(vo.getBoardnum());
			mapper.deleteFile(vo);
			File file  = new File("C:/test/"+temp.getSavedFileName());
			if(file.exists()) file.delete();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

	public void download(int boardnum, HttpServletResponse response) {
		try {
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			QnaBoardVO temp = mapper.read(boardnum);
			File file = new File("C:/test/"+temp.getSavedFileName());
			String originalFilename = temp.getOriginalFileName();
			response.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(originalFilename, "UTF-8"));
			response.setContentLength((int)file.length());
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
	public PageNavigator getNavi(int currentPage, String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		int totalRecordsCount = 0;
		
		try {
			QnaBoardMapper mapper = sqlSession.getMapper(QnaBoardMapper.class);
			totalRecordsCount = mapper.getTotal(map);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		return navi;
		
	}
	
}