package com.sesoc.project.dao;

import java.util.ArrayList;

import com.sesoc.project.vo.QnaReplyVO;

public interface QnaReplyMapper {
	public void replyWrite(QnaReplyVO vo);
	public ArrayList<QnaReplyVO> replyList(int boardnum);
	public int replyDelete(QnaReplyVO vo);

}
