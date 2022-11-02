package com.bms.admin.notice.dao;

import java.util.List;


import com.bms.admin.notice.dto.NoticeDTO;

public interface AdminNoticeDAO {
	public void insertNotice(NoticeDTO ndto) throws Exception;
	public NoticeDTO getOneNotice(int num) throws Exception;
	public List<NoticeDTO> getAllNotice() throws Exception;
	public void increaseReadCount(int num) throws Exception;
	public void updateNotice(NoticeDTO ndto) throws Exception;
	public void deleteNotice(int num) throws Exception;
}
