package com.bms.admin.notice.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bms.admin.notice.dto.NoticeDTO;
import com.bms.admin.notice.service.AdminNoticeService;

@Controller
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService noticeService;
	
	@RequestMapping(value="/admin/notice/adminNoticeMain.do")
	public ModelAndView adminNoticeMain() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeMain");
		
		List<NoticeDTO> noticeList = noticeService.allNotice();
		
		mv.addObject("NoticeList", noticeList);
		
		return mv;
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeInfo.do")
	public ModelAndView adminNoticeMain(@RequestParam("num") int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeInfo");
		
		mv.addObject("ndto", noticeService.getOneNotice(num));
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeWrite.do")
	public ModelAndView adminNoticeWrite() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeWritePro.do")
	public ModelAndView adminNoticeWritePro(NoticeDTO ndto) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin/notice/adminNoticeMain.do");
		
		noticeService.insertNotice(ndto);
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeUpdate.do")
	public ModelAndView adminNoticeUpdate(@RequestParam("num") int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/notice/adminNoticeUpdate");
		
		mv.addObject("ndto", noticeService.oneNotice(num));
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeUpdatePro.do")
	public ModelAndView adminNoticeUpdatePro(NoticeDTO ndto) throws Exception {
		ModelAndView mv = new ModelAndView();
		noticeService.updateNotice(ndto);
		mv.setViewName("redirect:/admin/notice/adminNoticeMain.do");
		
		return mv;
	}
	
	@RequestMapping(value="/admin/notice/adminNoticeDelete.do")
	public ModelAndView adminNoticeDelete(@RequestParam("num") int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/admin/notice/adminNoticeMain.do");
		noticeService.deleteNotice(num);
		
		return mv;
	}
}
