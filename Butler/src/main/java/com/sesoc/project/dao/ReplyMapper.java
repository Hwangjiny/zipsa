package com.sesoc.project.dao;

import java.util.ArrayList;

import com.sesoc.project.vo.ReplyVO;





public interface ReplyMapper {
	public void replyWrite(ReplyVO vo);
	public ArrayList<ReplyVO> replyList(int boardnum);
	public int replyDelete(ReplyVO vo);

}
