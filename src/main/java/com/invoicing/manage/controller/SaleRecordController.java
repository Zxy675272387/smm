package com.invoicing.manage.controller; 

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.invoicing.manage.comment.entity.ErrorResponseEntity;
import com.invoicing.manage.comment.entity.ResponseEntity;
import com.invoicing.manage.comment.entity.SuccessResponseEntity;
import com.invoicing.manage.entity.SaleRecordEntity;
import com.invoicing.manage.request.SaleRecordRequestEntity;
import com.invoicing.manage.service.SaleRecordService;
import com.invoicing.manage.comment.entity.PageInfo;

import javax.servlet.http.HttpServletRequest;

/** 
 * 类名: SaleRecordController   
 * 类描述: TODO.  销售记录
 */
@Controller
@RequestMapping("/invoicing/sale/record")
public class SaleRecordController {
	private static Logger logger=LoggerFactory.getLogger(SaleRecordController.class);
	
	@Autowired
	private SaleRecordService saleRecordService;
	
	
	
	/**
	 * goToSaleRecordList 销售记录列表页
	 * @return 返回类型为 ModelAndView
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/page/list", method = RequestMethod.GET)
	public ModelAndView goToSaleRecordList(ModelMap modelMap){
		String url="/sale/record/sale_record_list";
		Map<String,Object> params=new HashMap<String,Object>();
		modelMap.put("total",saleRecordService.getTotal(params));
		return new ModelAndView(url,modelMap);
	}
		
	/**
	 * getSaleRecordEntityList 获取销售记录列表
	 * @param saleRecordRequestEntity
	 * @return 返回类型为 ResponseEntity
	 * @exception
	 * @since JDK 1.7
	 */
	
	@RequestMapping(value = "/page/list", method = RequestMethod.POST)
	@ResponseBody
	 public ResponseEntity getSaleRecordList(SaleRecordRequestEntity saleRecordRequestEntity,HttpServletRequest httpServletRequest){
		logger.debug("method [getSaleRecordEntityList] 查询销售记录列表，请求参数："+JSON.toJSONString(saleRecordRequestEntity));
		PageInfo<SaleRecordEntity> pageInfo=new PageInfo<SaleRecordEntity>();
		pageInfo.setPageNo(saleRecordRequestEntity.getPageNo());
		pageInfo.setPageSize(saleRecordRequestEntity.getPageSize());
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("goodsName", saleRecordRequestEntity.getGoodsName());
		httpServletRequest.setAttribute(String.valueOf(saleRecordService.getTotal(params)),"total");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("total",String.valueOf(saleRecordService.getTotal(params)));
		System.out.println("enter");
		System.out.println(saleRecordService.getTotal(params));
		PageInfo<SaleRecordEntity> saleRecordList = saleRecordService.getList(pageInfo, params);
		logger.debug("method [getSaleRecordEntityList] 查询销售记录列表，返回结果为："+JSON.toJSONString(saleRecordList));
		return new SuccessResponseEntity(saleRecordList);
		
	}
	/**
	 * goToSaleRecordList 销售记录列表页
	 * @return 返回类型为 ModelAndView
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/page/list/top", method = RequestMethod.GET)
	public ModelAndView goToSaleRecordListTop(){
		String url="/sale/sale_record_list_top";
		return new ModelAndView(url);
	}

	/**
	 * getSaleRecordEntityList 获取销售记录列表
	 * @param saleRecordRequestEntity
	 * @return 返回类型为 ResponseEntity
	 * @exception
	 * @since JDK 1.7
	 */

	@RequestMapping(value = "/page/list/top", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity getSaleRecordListTop(SaleRecordRequestEntity saleRecordRequestEntity,HttpServletRequest requst){
		logger.debug("method [getSaleRecordEntityList] 查询销售记录列表，请求参数："+JSON.toJSONString(saleRecordRequestEntity));
		String remark4 = requst.getParameter("remark4");
		PageInfo<SaleRecordEntity> pageInfo=new PageInfo<SaleRecordEntity>();
		pageInfo.setPageNo(saleRecordRequestEntity.getPageNo());
		pageInfo.setPageSize(saleRecordRequestEntity.getPageSize());
		Map<String,Object> params=new HashMap<>(1);
		params.put("remark4", remark4);
		System.out.println(remark4);
		PageInfo<SaleRecordEntity> saleRecordList = saleRecordService.getListTop(params, pageInfo);
		logger.debug("method [getSaleRecordEntityList] 查询销售记录列表，返回结果为："+JSON.toJSONString(saleRecordList));
		return new SuccessResponseEntity(saleRecordList);

	}
	
	/**
	 * goToSaleRecordAdd 销售记录添加页
	 * @return 返回类型为 ModelAndView
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView goToSaleRecordAdd(){
		String url="/sale/record/sale_record_add";
		return new ModelAndView(url);
	}
	
	/**
	 * addSaleRecordEntity 新建销售记录
	 * @param brandEntity
	 * @return 返回类型为 ResponseEntity
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addSaleRecord(SaleRecordEntity brandEntity){
		try {
			logger.debug("新建销售记录，传入参数为："+JSON.toJSONString(brandEntity));
			Date date = new Date(System.currentTimeMillis());
			brandEntity.setUpdateTime(date);
			brandEntity.setCreateTime(date);
			int result = saleRecordService.insertSelective(brandEntity);
			logger.debug("新建销售记录，返回结果为："+JSON.toJSONString(result));
			return new SuccessResponseEntity();
		} catch (Exception e) {
			logger.info("销售记录添加异常，{}",e);
			return new ErrorResponseEntity();
		}
		
		
	}
	
	/**
	 * goToSaleRecordUpdate 销售记录编辑页
	 * @return 返回类型为 ModelAndView
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public ModelAndView goToSaleRecordUpdate(@RequestParam Long id,ModelMap modelMap){
		String url="/sale/record/sale_record_update";
		SaleRecordEntity brandEntity=saleRecordService.selectByPrimaryKey(id);
		if(null!=brandEntity){
			modelMap.put("brand", brandEntity);
		}
		return new ModelAndView(url,modelMap);
	}
	/**
	 * goToSaleRecordUpdate 销售记录编辑页
	 * @return 返回类型为 ModelAndView
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/update/top", method = RequestMethod.GET)
	public ModelAndView goToSaleRecordUpdateTop(@RequestParam Long id,ModelMap modelMap){
		String url="/sale/sale_record_update_top";
		SaleRecordEntity brandEntity=saleRecordService.selectByPrimaryKey(id);
		if(null!=brandEntity){
			modelMap.put("brand", brandEntity);
		}
		return new ModelAndView(url,modelMap);
	}
	
	/**
	 * updateSaleRecordEntity 修改销售记录
	 * @param brandEntity
	 * @return 返回类型为 ResponseEntity
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity updateSaleRecord(SaleRecordEntity brandEntity){
		try {
			logger.debug("编辑销售记录，传入参数为："+JSON.toJSONString(brandEntity));
			Date date = new Date(System.currentTimeMillis());
			brandEntity.setUpdateTime(date);
			System.out.println("enter");
			int result = saleRecordService.updateByPrimaryKeySelective(brandEntity);
			logger.debug("编辑销售记录，返回结果为："+JSON.toJSONString(result));
			return new SuccessResponseEntity();
		} catch (Exception e) {
			logger.info("销售记录编辑异常，{}",e);
			return new ErrorResponseEntity();
		}
		
	}
	
	/**
	 * delSaleRecordEntity 删除销售记录
	 * @param id
	 * @return 返回类型为 ResponseEntity
	 * @exception
	 * @since JDK 1.7
	 */
	@RequestMapping(value = "/del", method = {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ResponseEntity delSaleRecord(@RequestParam Long id){
		try {
			if(null!=String.valueOf(id)){
				logger.debug("删除销售记录，传入参数为："+id);
				int result = saleRecordService.deleteByPrimaryKey(id);
				logger.debug("删除销售记录，返回结果为："+JSON.toJSONString(result));
			}
			return new SuccessResponseEntity();
		} catch (Exception e) {
			logger.info("销售记录删除异常，{}",e);
			return new ErrorResponseEntity();
		}
	}
	
	
	
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity getRoleList(){
		Map<String,Object> queryMap=new HashMap<String,Object>();
		List<SaleRecordEntity> saleRecordList=saleRecordService.getList(queryMap);
		ResponseEntity res=new ResponseEntity();
		if(saleRecordList.size()>0){
			res.setData(saleRecordList);
			logger.info("method [getRoleList],返回结果：{}",res);
		}
		return res;
		
	}
	

}
