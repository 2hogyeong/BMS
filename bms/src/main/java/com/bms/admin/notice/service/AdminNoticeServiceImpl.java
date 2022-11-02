package com.bms.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bms.admin.notice.dao.AdminNoticeDAO;
import com.bms.admin.notice.dto.NoticeDTO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Autowired
	private AdminNoticeDAO noticeDAO;

	@Override
	public void insertNotice(NoticeDTO ndto) throws Exception {
		noticeDAO.insertNotice(ndto);
	}

	@Override
	public List<NoticeDTO> allNotice() throws Exception {
		return noticeDAO.getAllNotice();
	}

	@Override
	public NoticeDTO getOneNotice(int num) throws Exception {
		noticeDAO.increaseReadCount(num);
		return noticeDAO.getOneNotice(num);
	}

	@Override
	public NoticeDTO oneNotice(int num) throws Exception {
		return noticeDAO.getOneNotice(num);
	}

	@Override
	public void updateNotice(NoticeDTO ndto) throws Exception {
		noticeDAO.updateNotice(ndto);
	}

	@Override
	public void deleteNotice(int num) throws Exception {
		noticeDAO.deleteNotice(num);
	}

}
