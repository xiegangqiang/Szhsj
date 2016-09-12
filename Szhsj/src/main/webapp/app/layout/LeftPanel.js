Ext.define('SystemApp.View.Layout.LeftPanel', {
    extend: 'Ext.panel.Panel',
    alias: 'widget.layout.leftpanel',
    animCollapse: true,
    layout: 'fit',
    title: '菜单导航',

    initComponent: function(){
        Ext.apply(this, {
			layout: {
				type: 'accordion',
				titleCollapse: true,
				animate: true
			},
            items: []
        });
        
        
        this.addEvents(
            'menuselect'
        );
        this.callParent(arguments);
        
        this.createView();
    },

    createView: function(){
    	this.initAndLoadView('/admin/menu.do?tree');
    },

    onSelectionChange: function(obj, record){
        if (record) {
            this.loadFeed(record);
        }
    },

    onLoadClick: function(){
        this.loadFeed(this.menu.activeFeed);
    },

    loadFeed: function(rec){
        if (rec) {
            this.fireEvent('menuselect', this, rec.get('name'), rec.get('namespace'));
        }
    },
    
    initAndLoadView: function(url) {
		var menuDatas = [];
    	Ext.Ajax.request({
    	    url: url,
    	    async :  false,
    	    success: function(response) {
    	    	var res = Ext.decode(response.responseText);
    	    	menuDatas = res;
    	    }
    	});
    	
    	var view = [];
    	for (var i = 0; i < menuDatas.length; i++) {
    		view.push({
    			xtype: 'panel',
    			title: menuDatas[i].name,
    			autoScroll: true,
    			items: [{
    				xtype: 'dataview',
    				autoScroll: true,
    				store: Ext.create('Ext.data.Store', {
    	                model: 'Menu',
    	                data: menuDatas[i].children
    	            }),
    	            cls: 'feed-list',
    	            itemSelector: '.feed-list-item',
    	            overItemCls: 'feed-list-item-hover',
    	            tpl: '<tpl for="."><div class="feed-list-item"><img src="{img}"/><span>{name}</span></div></tpl>',
//    	            listeners: {
//    	                mode: 'SINGLE',
    	                listeners: {
    	                    scope: this,
    	                    itemclick: this.onSelectionChange
    	                }
//    	            }
    			}]
    		});
    	}
    	this.removeAll();
    	this.add(view);
    }

});
