package com.xysoft.front.controller;

import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.xysoft.front.service.FrontService;
import com.xysoft.util.RequestUtil;

@Controller
public class FrontController {
	@Resource
	private FrontService frontService;
	
	@RequestMapping(value = "/test.jhtml")
	public ModelAndView test(HttpServletResponse response, HttpServletRequest request, 
			String imagemes) throws Exception {
		Map<String, Object> model = this.frontService.test();
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model));
	}
	
	@ExceptionHandler({Exception.class})   
    public ModelAndView exception(Exception e, HttpServletResponse response, 
    		HttpServletRequest request) throws Exception {   
		e.printStackTrace();
		Map<String, Object> model = this.frontService.error();
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model)); 
    } 
	
	@RequestMapping(value = "/index.jhtml")
	public ModelAndView index(HttpServletResponse response, HttpServletRequest request, 
			String wx) throws Exception {
		Map<String, Object> model = this.frontService.index(wx);
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model));
	}
	
	@RequestMapping(value = "/list.jhtml")
	public ModelAndView list(HttpServletResponse response, HttpServletRequest request, 
			String classify, @RequestParam(defaultValue = "1") Integer page) throws Exception {
		Map<String, Object> model = this.frontService.list(classify, page);
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model));
	}
	
	@RequestMapping(value = "/detail.jhtml")
	public ModelAndView detail(HttpServletResponse response, HttpServletRequest request, 
			String imagemes, String userid, String wx, String wxMarkcode, Integer tag, String title) throws Exception {
		Map<String, Object> model = this.frontService.detail(imagemes, userid, wx, wxMarkcode, tag, title);
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model));
	}
	
	@RequestMapping(value = "/document.jhtml")
	public ModelAndView document(HttpServletResponse response, HttpServletRequest request, String businessCode, String id) throws Exception {
		Map<String, Object> model = this.frontService.document(businessCode, id);
		return new ModelAndView(model.get("model").toString(), RequestUtil.initFrontMap(model));
	}
	
}
