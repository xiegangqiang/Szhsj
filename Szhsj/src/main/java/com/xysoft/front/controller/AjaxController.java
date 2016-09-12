package com.xysoft.front.controller;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xysoft.admin.service.UploadService;
import com.xysoft.front.service.FrontService;

@Controller
public class AjaxController {
	@Resource
	private FrontService frontService;
	@Resource
	private UploadService uploadService;

	@RequestMapping(value = "/send.ajx")
	public String send(HttpServletResponse response, HttpServletRequest request, String wxMarkcode, String touser, String template_id, 
			String url, String first, String remark, String keyword1, String keyword2, String keyword3, String keyword4, String keyword5) throws Exception {
		String res = this.frontService.sendTemplateMsg(wxMarkcode, touser, template_id, url, first, remark, keyword1, keyword2, keyword3, keyword4, keyword5);
		response.getWriter().write(res);
		return null;
	}

}























