package com.sesoc.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;

import com.sesoc.project.vo.QnaBoardVO;
public interface QnaBoardMapper 
{
	public ArrayList<QnaBoardVO> qnaboardList(HashMap<String, String> map, RowBounds rb);
	public int write(QnaBoardVO vo);
	public QnaBoardVO read(int boardnum);
	public void update(QnaBoardVO vo);
	public int delete(QnaBoardVO vo);
	public int qnaupdateboard(QnaBoardVO vo);
	public void deleteFile(QnaBoardVO vo);
	public int getTotal(HashMap<String, String> map);
}
