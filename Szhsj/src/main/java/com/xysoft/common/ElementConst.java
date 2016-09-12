package com.xysoft.common;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import com.xysoft.util.FileUtil;

public class ElementConst {
	/**
	 * 语言国际化.
	 */
	public static final String Lang_English = "en";
	public static final String Land_Chinese = "zh";
	
	public static final String Ext_Image = "image";
	public static final String Ext_File = "file";
	public static final String Ext_Flash = "flash";
	public static final String Ext_Media = "media";
	
	/**
	 * 文件保存位置.
	 */
	public static final String File_Target_Dir = "resource";
	
	public static final String File_Save_Dir = "common";
	
	public static final String File_Temp_Dir = "temp";
	
	/**
	 * 服务器地址.
	 */
	public static String Szhsj_Host = "";
	
	public static String Szhsj_Interface = "";
	
	public static String Service_Address = "http://127.0.0.1:8080";
	
	public static final String Default_HomeDir = "front/home/";
	
	public static final String Default_ListDir = "front/list/";
	
	public static final String Default_DetailDir = "front/detail/";
	
	public static final String Default_HomeTmp = "2c958da346862c52014686333e6c0001";
	
	public static final String Default_ListTmp = "2c958da346862c52014686333e6c0003";
	
	public static final String Default_DetailTmp = "2c958da346862c52014686333e6c0005";
	
	public static final String Default_SourceHome = "/template/front/home/";
	
	public static final String Default_SourceList = "/template/front/list/";
	
	public static final String Default_SourceDetail = "/template/front/detail/";
	
	
	//集成菜单集合
	public static final String[] Defalut_Plug_Menu = new String[]{"菜单颜色", "页面版权", "电话", "会员资料", "导航", "分享", "首页", "相册", "邮箱", "购物", "会员卡", "活动", "新浪微博", "腾讯微博", "腾讯空间", "音乐", "视频", "推荐", "其它"}; 
	//集成菜单logo地址集合
	public static final String[] Defalut_Plug_Menu_Logo = new String[]{"", "", "../template/front/home/images/plugmenu1.png", "../template/front/home/images/plugmenu2.png", 
																		"../template/front/home/images/plugmenu3.png", "../template/front/home/images/plugmenu5.png", 
																		"../template/front/home/images/plugmenu6.png", "../template/front/home/images/plugmenu7.png", 
																		"../template/front/home/images/plugmenu8.png", "../template/front/home/images/plugmenu9.png", 
																		"../template/front/home/images/plugmenu10.png", "../template/front/home/images/plugmenu11.png", 
																		"../template/front/home/images/plugmenu12.png", "../template/front/home/images/plugmenu13.png", 
																		"../template/front/home/images/plugmenu14.png", "../template/front/home/images/plugmenu16.png", 
																		"../template/front/home/images/plugmenu17.png", "../template/front/home/images/plugmenu18.png", 
																		"../template/front/home/images/plugmenu19.png"};
	static {
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(FileUtil.getRoot() + "/key.properties");
			Properties props = new Properties();
			props.load(fis);
			Service_Address = props.getProperty("service_address");
			Szhsj_Interface = props.getProperty("szhsj_interface");
			Szhsj_Host = props.getProperty("szhsj_host");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}
}
  