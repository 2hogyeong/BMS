package com.bms.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bms.admin.notice.dto.NoticeDTO;
import com.bms.admin.notice.service.AdminNoticeService;
import com.bms.common.util.CommonUtil;
import com.bms.goods.dto.GoodsDTO;
import com.bms.goods.service.GoodsService;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController {
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private AdminNoticeService noticeService;

	@RequestMapping(value= "/")
	public ModelAndView home() throws Exception{
		return new ModelAndView("redirect:/main/main.do");
	}
	
	
	@RequestMapping(value= "/main/main.do")
	public ModelAndView main(HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/main");
		
		HttpSession session = request.getSession();
		session.setAttribute("side_menu", "user");
		
		Map<String,List<GoodsDTO>> goodsMap = goodsService.listGoods();
		mv.addObject("goodsMap", goodsMap);
		
		return mv;
		
	}
	
	@RequestMapping(value="/main/selectStatus.do")
	public ModelAndView selectStatus(HttpServletRequest request, @RequestParam("status") String status ) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/selectStatus");
		
		HttpSession session = request.getSession();
		session.setAttribute("sede_menu", "user");
		
		Map<String,List<GoodsDTO>> goodsMap = new HashMap<String, List<GoodsDTO>>();
		goodsMap.put(status, goodsService.goodsStatus(status));
		mv.addObject("goodsMap", goodsMap);
		mv.addObject("status", status);
		
		return mv;
	}
	
	@RequestMapping(value="/main/selectSort.do")
	public ModelAndView selectSort(HttpServletRequest request, @RequestParam("sort") String sort ) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/selectSort");
		
		HttpSession session = request.getSession();
		session.setAttribute("sede_menu", "user");
		
		Map<String,List<GoodsDTO>> goodsMap = new HashMap<String, List<GoodsDTO>>();
		goodsMap.put(sort, goodsService.goodsSort(sort));
		mv.addObject("goodsMap", goodsMap);
		mv.addObject("sort", sort);
		
		return mv;
	}
	
	@RequestMapping(value="/main/noticeMain.do")
	public ModelAndView noticeMain() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/noticeMain");
		
		List<NoticeDTO> noticeList = noticeService.allNotice();
				
		mv.addObject("NoticeList", noticeList);
		
		return mv;
	}
	
	@RequestMapping(value="/main/noticeInfo.do")
	public ModelAndView noticeInfo(@RequestParam("num") int num ) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/main/noticeInfo");
		
		mv.addObject("ndto", noticeService.getOneNotice(num));
		
		return mv;
	}
	
}
