package com.xysoft.admin.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xysoft.admin.service.WebsiteService;
import com.xysoft.support.BaseController;

@Controller
@RequestMapping(value = "/admin/website.do")
public class WebsiteController extends BaseController {
	@Resource
	private WebsiteService websiteService;
	
	@RequestMapping(params = "list")
	public String list(HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		String res = this.websiteService.getWebsites();
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "info")
	public String info(HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		String res = this.websiteService.getModel();
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "choose")
	public String choose(HttpServletResponse response, HttpServletRequest request, 
			String name, String val) throws IOException {
		String res = this.websiteService.saveModelInfo(name, val);
		response.getWriter().print(res);
		return null;
	}
}
