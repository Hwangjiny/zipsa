package com.sesoc.project.dao;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.project.vo.BoardVO;
import com.sesoc.project.vo.CatVO;

@Repository
public class CatDAO {

	@Autowired
	private SqlSession sqlSession;

	public ArrayList<CatVO> getList(String userid) {
		ArrayList<CatVO> result = null;
		try {
			CatMapper mapper = sqlSession.getMapper(CatMapper.class);
			result = mapper.getList(userid);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void insertCat(CatVO vo)
	{
		try
		{
			CatMapper mapper = sqlSession.getMapper(CatMapper.class);
			mapper.insertCat(vo);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CatVO read(int cat_no)
	{
		CatVO result = null;
		try 
		{
			CatMapper mapper = sqlSession.getMapper(CatMapper.class);
			result = mapper.read(cat_no);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}
	
	public void delete(CatVO vo, HttpSession session)
	{
		String userid = (String)session.getAttribute("userid");
		vo.setUserid(userid);
		
		try 
		{
			CatMapper mapper = sqlSession.getMapper(CatMapper.class);
			mapper.delete(vo);
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}
	
	public void updateCat(CatVO vo)
	{
		try
		{
			CatMapper mapper = sqlSession.getMapper(CatMapper.class);
			mapper.updateCat(vo);
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
