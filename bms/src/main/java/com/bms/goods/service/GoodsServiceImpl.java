package com.bms.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bms.goods.dao.GoodsDAO;
import com.bms.goods.dto.GoodsDTO;
import com.bms.goods.dto.ImageFileDTO;

@Service("goodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDAO goodsDAO;
	
	
	public Map<String,List<GoodsDTO>> listGoods() throws Exception {
		
		Map<String,List<GoodsDTO>> goodsMap = new HashMap<String,List<GoodsDTO>>();
		
		goodsMap.put("bestseller"   , goodsDAO.selectGoodsList("bestseller"));
		goodsMap.put("newbook"      , goodsDAO.selectGoodsList("newbook"));
		goodsMap.put("steadyseller" , goodsDAO.selectGoodsList("steadyseller"));
		goodsMap.put("etc", goodsDAO.selectGoodsList("etc"));
		
		return goodsMap;
		
	}
	
	
	public Map<String,Object> goodsDetail(String goodsId) throws Exception {
		
		Map<String,Object> goodsMap = new HashMap<String,Object>();
		
		goodsMap.put("GoodsDTO"   ,  goodsDAO.selectGoodsDetail(goodsId));
		goodsMap.put("imageList" , goodsDAO.selectGoodsDetailImage(goodsId));
		
		return goodsMap;
		
	}
	
	
	
	public List<String> keywordSearch(String keyword) throws Exception {
		return goodsDAO.selectKeywordSearch(keyword);
	}
	
	
	public List<GoodsDTO> searchGoods(String searchWord) throws Exception{
		return goodsDAO.selectGoodsBySearchWord(searchWord);
	}


	@Override
	public List<GoodsDTO> goodsSort(String sort) throws Exception {
		
		List<GoodsDTO> goodsList = new ArrayList<GoodsDTO>();
		
		goodsList = goodsDAO.selectGoodsSort(sort);
		
		
		return goodsList;
	}
	
	@Override
	public List<GoodsDTO> goodsStatus(String status) throws Exception {
		
		List<GoodsDTO> goodsList = new ArrayList<GoodsDTO>();
		
		goodsList = goodsDAO.selectGoodsList(status);
		
		
		return goodsList;
	}
	
}
