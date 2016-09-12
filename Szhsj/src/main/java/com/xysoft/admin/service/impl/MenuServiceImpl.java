package com.xysoft.admin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.xysoft.admin.service.MenuService;
import com.xysoft.dao.MenuDao;
import com.xysoft.entity.Menu;
import com.xysoft.util.JsonUtil;
import com.xysoft.util.NullUtils;

@Component
public class MenuServiceImpl implements MenuService {
	@Resource
	private MenuDao menuDao;
	
	@Transactional(readOnly = true)
	public String getMenus() {
		List<Menu> menus = this.menuDao.getMenus();
		Map<String, List<Menu>> maps = new HashMap<String, List<Menu>>();
		for (Menu menu : menus) {
			List<Menu> hms = null;
			if (maps.containsKey(menu.getParentId())) {
				hms = maps.get(menu.getParentId());
			} else {
				hms = new ArrayList<Menu>();
			}
			hms.add(menu);
			maps.put(menu.getParentId(), hms);
		}
		List<Menu> hms = new ArrayList<Menu>(); 
		for (Menu menu : menus) {
			if (NullUtils.isEmpty(menu.getParentId())) {
				Menu hm = rebuildMenu(hms, maps, menu);
				if (hm.getChildren().size() == 0) continue;
				hms.add(hm);
			}
		}
		return JsonUtil.toString(hms);
	}
	
	/**
	 * 递归查找子分类节点.
	 */
	private Menu rebuildMenu(List<Menu> hms, Map<String, List<Menu>> maps, Menu menu) {
		if (!maps.containsKey(menu.getId())) return menu;
		List<Menu> lst = maps.get(menu.getId()); 
		for (Menu ls : lst) {
			menu.getChildren().add(rebuildMenu(hms, maps, ls));
		}
		return menu;
	}
	

}
