Ext.ClassManager.addNameAlternateMappings({
	
});

Ext.ClassManager.addNameAliasMappings({
});

/**
 * 布局实现类.
 */
Ext.Loader.loadScript("../app/layout/MainPanel.js");
Ext.Loader.loadScript("../app/layout/LeftPanel.js");

/**
 * 扩展组件.
 */
Ext.Loader.loadScript("../common/extjs/sysutils.js");
Ext.Loader.loadScript("../common/extjs/actiontextcolumn.js");
Ext.Loader.loadScript("../common/extjs/kindeditor.js");
/**
 * 功能实现.
 */
Ext.Loader.loadScript("../app/system/wx/Wx.js");
Ext.Loader.loadScript("../app/system/diymen/Diymen.js");
Ext.Loader.loadScript("../app/system/website/Website.js");
Ext.Loader.loadScript("../app/system/plugMenu/PlugMenu.js");
Ext.Loader.loadScript("../app/system/wxUser/WxUser.js");
Ext.Loader.loadScript("../app/system/intelligent/Intelligent.js");
