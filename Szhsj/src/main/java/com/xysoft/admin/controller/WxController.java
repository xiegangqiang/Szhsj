package com.xysoft.admin.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xysoft.admin.service.WxService;
import com.xysoft.entity.Wx;
import com.xysoft.support.BaseController;

@Controller
@RequestMapping(value = "/admin/wx.do")
public class WxController extends BaseController {
	@Resource
	private WxService wxService;
	
	@RequestMapping(params = "list")
	public String list(HttpServletResponse response, HttpServletRequest request) 
			throws IOException {
		String res = this.wxService.getWxs();
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "authority")
	public String authority(HttpServletResponse response, HttpServletRequest request, 
			String wxid) throws IOException {
		String res = this.wxService.getAuthorityByWx(wxid);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "save")
	public String save(HttpServletResponse response, HttpServletRequest request, 
			Wx param, @RequestParam(defaultValue = "false") Boolean flag) throws IOException {
		String res = this.wxService.saveWx(param, flag);
		response.getWriter().print(res);
		return null;
	}
	
	@RequestMapping(params = "delete")
	public String delete(HttpServletResponse response, HttpServletRequest request, 
			String id) throws IOException {
		String res = this.wxService.deleteWx(id);
		response.getWriter().print(res);
		return null;
	}
	
}
