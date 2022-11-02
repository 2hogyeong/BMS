package com.bms.admin.notice.service;

import java.util.List;

import com.bms.admin.notice.dto.NoticeDTO;

public interface AdminNoticeService {  

	public void insertNotice(NoticeDTO ndto) throws Exception;
	public List<NoticeDTO> allNotice() throws Exception;
	public NoticeDTO getOneNotice(int num) throws Exception;
	public NoticeDTO oneNotice(int num) throws Exception;
	public void updateNotice(NoticeDTO ndto) throws Exception;
	public void deleteNotice(int num) throws Exception;
	
}
