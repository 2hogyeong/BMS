package com.bms.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bms.admin.notice.dto.NoticeDTO;

@Repository
public class AdminNoticeDAOImpl implements AdminNoticeDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public void insertNotice(NoticeDTO ndto) throws Exception {
		sqlSession.insert("mapper.notice.insertNotice", ndto);
	}

	@Override
	public NoticeDTO getOneNotice(int num) throws Exception {
		return sqlSession.selectOne("mapper.notice.getOneNotice", num);
	}

	@Override
	public List<NoticeDTO> getAllNotice() throws Exception {
		return sqlSession.selectList("mapper.notice.getAllNotice");
	}

	@Override
	public void increaseReadCount(int num) throws Exception {
		sqlSession.update("mapper.notice.updateReadCount", num);
	}

	@Override
	public void updateNotice(NoticeDTO ndto) throws Exception {
		sqlSession.update("mapper.notice.updateNotice", ndto);
	}

	@Override
	public void deleteNotice(int num) throws Exception {
		sqlSession.delete("mapper.notice.deleteNotice", num);
	}

}
