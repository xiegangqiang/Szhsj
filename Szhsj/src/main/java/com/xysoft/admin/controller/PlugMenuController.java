package com.xysoft.admin.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xysoft.admin.service.PlugMenuService;
import com.xysoft.entity.PlugMenu;
import com.xysoft.support.BaseController;
import com.xysoft.support.PageParam;

@Controller
@RequestMapping(value = "/admin/plugMenu.do")
public class PlugMenuController extends BaseController {
	@Resource
	private PlugMenuService plugMenuService;
	
	@RequestMapping(params = "list")
	public String list(HttpServletResponse response, HttpServletRequest request, 
			PageParam page, @RequestParam(defaultValue = "") String name, String wx) 
			throws IOException {
		String res = this.plugMenuService.getPlugMenus(page, name, wx);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request, 
			PlugMenu param) throws IOException {
		String res = this.plugMenuService.savePlugMenu(param);
		response.getWriter().print(res);
		return null;
	}
	
}
