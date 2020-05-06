package com.sesoc.project.dao;

import java.util.ArrayList;

import com.sesoc.project.vo.CatVO;

public interface CatMapper {

	public ArrayList<CatVO> getList(String userid);
	public void insertCat(CatVO vo);
	public CatVO read(int cat_no);
	public void delete(CatVO vo);
	public void updateCat(CatVO vo);

}
