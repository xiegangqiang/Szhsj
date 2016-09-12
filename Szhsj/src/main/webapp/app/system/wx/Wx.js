Ext.define('SystemApp.View.Wx', {
    extend: 'Ext.panel.Panel',
    xtype: 'wx',
    
    initComponent: function() {
    	
    	Ext.apply(this, {
            layout: 'border',
            items: [this.createDataView()],
            tbar: [{ 
            	xtype: 'button', 
            	text: '刷新',
            	iconCls: 'icon-refresh',
            	scope: this,
            	handler: this.refreshView
            }, { 
            	xtype: 'button', 
            	text: '添加公众号',
            	iconCls: 'icon-add',
            	scope: this,
            	handler: this.addDataView
            }],
            dockedItems: [{
                xtype: 'toolbar',
                dock: 'bottom',
                items: [{
                	labelWidth: 65,
                	xtype: 'displayfield',
                	fieldLabel: '接口URL',
                    value: 'http://127.0.0.1:8080/coreServlet'
                }, {
                	labelWidth: 50,
                	xtype: 'displayfield',
                	style: 'margin-left:50px;',
                	fieldLabel: 'Token',
                    value: 'SZHSJ'
                }]
            }]
        });
    	this.createEditWindows();
    	this.createImageUpload();
    	this.createContextMenu();
        this.callParent(arguments);
    },
    
    
    createDataView: function() {

    	var store = Ext.create('Ext.data.Store', {
    	    fields: ['img', 'name', 'id', 'enabled', 'markcode', 'email'],
    	    proxy: {
    	        type: 'ajax',
    	        url: '/admin/wx.do?list'
    	    },
            autoLoad: true
    	});
    	
    	var imageTpl = new Ext.XTemplate(
		    '<tpl for=".">',
		        '<div style="margin-bottom: 10px;" class="thumb-wrap">',
		          '<img src="{img}" />',
		          '<span>{name}</span>',
		        '</div>',
		    '</tpl>'
		);
    	
    	this.dataview = Ext.create('Ext.view.View', {
    	    store: store,
    	    tpl: imageTpl,
    	    itemSelector: 'div.thumb-wrap',
    	    region: 'center',
    	    cls: 'wxcls',
    	    padding: '20 30',
    	    listeners: {
    	    	scope: this,
    	    	itemclick: function(fn, record, item) {
    	        	Ext.getCmp('LeftPanel.View').initAndLoadView('/admin/wx.do?authority&wxid=' + record.get('id'));
    	        	Ext.getCmp('Tab_wx').close();
    	    	},
    	    	itemcontextmenu: function(fn, record, item, index, e, eOpts) {
    	    		this.selectrecord = record;
    	    		this.contextMenu.showAt(e.getX(), e.getY());
    	            e.preventDefault();
    	    	}
    	    }
    	});
    		
    	return this.dataview;
    },
    
    refreshView: function() {
    	this.dataview.getStore().reload();
    },
    
    createEditWindows: function() {
    	
    	this.editWin = Ext.create('Ext.window.Window', {
    	    title: '编辑微信公众号信息',
    	    height: 280,
    	    width: 600,
    	    layout: 'border',
    	    modal: true,
    	    closeAction: 'hide',
    	    items: [{  
    	    	xtype: 'form',
    	    	region: 'center',
    	    	bodyPadding: 10,
    	    	autoScroll: true,
    	    	fieldDefaults: {
    	            labelWidth: 85,
    	            labelAlign: 'left',
    	            anchor: '100%'
    	        },
    	        items: [{
    	        	xtype: 'hiddenfield',
    	        	name: 'id'
    	        }, {
    	        	xtype: 'textfield',
    	            name: 'name',
    	            fieldLabel: '公众号名称',
    	            allowBlank: false
    	        }, {
        		    xtype:"container",
    	        	layout: 'vbox',
    	        	items: [{
	    	        	xtype: 'textfield',
	    	            name: 'markcode',
	    	            width: '100%',
	    	            fieldLabel: '公众号原始ID',
	    	            allowBlank: false
	    	        }, {
    	        		xtype: 'component',
    	        		width: '100%',
    	        		margin: '0 0 5 95',
						html: '<a href="https://mp.weixin.qq.com" target="view_window">如何获取?点击登陆微信公众号官方平台->设置->公众号设置</a>'
    	        	}]
    	        }, {
    	        	xtype: 'textfield',
    	            name: 'email',
    	            fieldLabel: '注册邮箱地址',
    	            allowBlank: false
    	        }, {
    	        	xtype: 'container',
    	        	layout: 'column',
    	        	style: 'margin-bottom:5px',
    	        	id: 'Wx_Container_img',
    	        	items: [{
    	        		xtype: 'textfield',
        	            name: 'img',
        	            fieldLabel: '二维码图片',
        	            columnWidth: 0.7,
        	            listeners: {
        	            	change: this.scanImage
        	            }
    	        	}, {
    	        		xtype: 'button',
    	        		text: '上传图片',
    	        		columnWidth: 0.15,
    	        		style: 'margin-left:3px',
    	        		id: 'Wx_Upload_img',
    	        		scope: this,
    	        		handler: this.uploadImage
    	        	}, {
    	        		xtype: 'button',
    	        		text: '预览图片',
    	        		columnWidth: 0.15,
    	        		scope: this,
    	        		style: 'margin-left:3px'
    	        	}]
    	        }],
    	        buttons: [{ 
    	        	text: '确定',
    	        	scope: this,
    	        	handler: this.submitFormData
    	        }, { 
    	        	text: '取消',
    	        	scope: this,
    	        	handler: function() {
    	        		this.editWin.hide();
    	        	}
    	        }]
    	    }]
    	});
    },
    
    scanImage: function(fn) {
    	var targetForm = fn.up('form').getForm();
    	Ext.getCmp('Wx_Container_' + fn.name).items.get(2).setTooltip(
        	'<img src="' + targetForm.findField(fn.name).getValue() + '"  width="100%"/>'
    	);
    },
    
    createImageUpload: function() {
    	this.uploadImageWin = Ext.create('Ext.window.Window', {
    	    title: '上传图片',
    	    height: 150,
    	    width: 400,
    	    layout: 'border',
    	    modal: true,
    	    closeAction: 'hide',
    	    items: [{  
    	    	xtype: 'form',
    	    	region: 'center',
    	    	bodyPadding: 10,
    	    	fieldDefaults: {
    	            labelWidth: 75,
    	            labelAlign: 'left',
    	            anchor: '100%'
    	        },
    	        items: [{
    	        	xtype: 'hiddenfield',
    	        	name: 'id'
    	        }, {
    	            xtype: 'filefield',
    	            name: 'upload',
    	            fieldLabel: '图片文件',
    	            msgTarget: 'side',
    	            buttonText: '选择图片...'
    	        }],
    	        buttons: [{ 
    	        	text: '确定',
    	        	scope: this,
    	        	handler: this.uploadImageForm
    	        }, { 
    	        	text: '取消',
    	        	scope: this,
    	        	handler: function() {
    	        		this.uploadImageWin.hide();
    	        	}
    	        }]
    	    }]
    	});
    },
    
    uploadImage: function(fn) {
    	var form = this.uploadImageWin.down('form');
    	this.uploadImageWin.show();
    	form.getForm().reset();
    	form.getForm().findField('id').setValue(fn.id.substr(fn.id.lastIndexOf('_') + 1));
    },
    
    uploadImageForm: function() {
    	var targetForm = this.editWin.down('form').getForm();
    	var form = this.uploadImageWin.down('form');
    	var targetName = form.getForm().findField('id').getValue();  
    	var win = this.uploadImageWin;
    	form.submit({
    		url: '/admin/upload.do?save',
    	    success: function(form, action) {
    	       targetForm.findField(targetName).setValue(action.result.msg);
    	       win.hide();
    	       Ext.Msg.alert('提示', action.result.title);
    	    },
    	    failure: function(form, action) {
    	    	Ext.Msg.alert('提示', action.result.title);
    	    }
    	});
    },
    
    addDataView: function() {
		var form = this.editWin.down('form');
    	this.editWin.show();
    	form.getForm().reset();
    },
    
    editDataView: function() {
    	var form = this.editWin.down('form');
    	this.editWin.show();
    	form.loadRecord(this.selectrecord);
    },
    
    submitFormData: function() {
    	var grid  = this.dataview;
    	var form = this.editWin.down('form');
    	var win = this.editWin;
    	form.submit({
    		url: '/admin/wx.do?save',
    	    success: function(form, action) {
    	       win.hide();
    	       Ext.Msg.alert('提示', action.result.title);
    	       grid.getStore().reload();
    	    },
    	    failure: function(form, action) {
    	    	Ext.Msg.alert('提示', action.result.title);
    	    }
    	});
    },
    
    delDataView: function() {
    	var record = this.selectrecord;
    	var grid  = this.dataview;
		Ext.MessageBox.confirm('确认', '是否删除该微信公众号信息?', function(btn) {
    		if (btn != 'yes') return;
    		Ext.Ajax.request({
        	    url: '/admin/wx.do?delete',
        	    params: {
        	        id: record.get('id')
        	    },
        	    success: function(response){
        	    	var res = Ext.decode(response.responseText);
        	    	if (res.success) {
        	    		grid.getStore().reload();
        	    	}
        	    	Ext.Msg.alert('提示', res.title);
        	    },
        	    failure: function(response) {
        	    	var res = Ext.decode(response.responseText);
        	    	Ext.Msg.alert('提示', res.title);
        	    }
        	});
		});
    },
    
    createContextMenu: function(fn, record, item) {
    	this.contextMenu = Ext.create('Ext.menu.Menu', {
    		items: [{
	            text: '编辑',
	            cls: 'icon-edit',
	            scope: this,
	            handler: this.editDataView
	        }, {
	        	text: '删除',
	            cls: 'icon-del',
	            scope: this,
	            handler: this.delDataView
	        }]
    	});
    },
    
    onDestroy: function(){
    	this.editWin.destroy();
    	this.uploadImageWin.destroy();
    	this.contextMenu.destroy();
        this.callParent(arguments);
    }
    
});