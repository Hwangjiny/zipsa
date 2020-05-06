package com.sesoc.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sesoc.project.vo.HospitalVO;



@Repository
public class HospitalDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ArrayList<HospitalVO> hoList(HospitalVO vo)
	{
		ArrayList<HospitalVO> list = null;
				
		try
		{
			HospitalMapper mapper = sqlSession.getMapper(HospitalMapper.class);
			list = mapper.hoList(vo);
					
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	

}
