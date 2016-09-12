Ext.define('SystemApp.App', {
    extend: 'Ext.container.Viewport',
    
    initComponent: function(){
        
        Ext.define('Menu', {
            extend: 'Ext.data.Model',
            fields: ['name', 'namespace', 'img']
        });

        Ext.apply(this, {
            layout: {
                type: 'border'
            },
            items: [this.createFeedPanel(), this.createFeedInfo()]
        });
        
        //初始化界面
        //this.onMenuSelect(this, "模版管理", 'wxUser');
        this.callParent(arguments);
    },
    
    createFeedPanel: function(){
        this.leftPanel = Ext.create('widget.layout.leftpanel', {
            region: 'west',
            collapsible: true,
            width: 225,
            split: true,
            minWidth: 175,
            id: 'LeftPanel.View',
            listeners: {
                scope: this,
                menuselect: this.onMenuSelect
            },
            tbar: [{ 
            	xtype: 'button', 
            	text: '微信公众号', 
            	iconCls: 'icon-weixin', 
            	height:65,  
            	scale: 'large', 
            	width:100, 
            	iconAlign: 'top',
            	scope: this,
            	handler: function() {
            		Ext.getCmp('MainPanel.View').removeAll();
            		this.onMenuSelect(this, "微信公众号", 'wx');
            		Ext.getCmp('LeftPanel.View').initAndLoadView('/admin/menu.do?tree');
            	}
            }, { 
            	xtype: 'button', 
            	text: '更多帮助', 
            	iconCls: 'icon-help', 
            	height:65,  
            	scale: 'large', 
            	width:100, 
            	iconAlign: 'top'
            	
            }]
        });
        
        return this.leftPanel;
    },
    
    createFeedInfo: function(){
        this.mainPanel = Ext.create('widget.layout.mainpanel', {
        	id: 'MainPanel.View',
            region: 'center',
            minWidth: 300
        });
        return this.mainPanel;
    },
    
    onMenuSelect: function(menu, name, nspace){
        this.mainPanel.addPanel(name, nspace);
    }
});
