Ext.define('SystemApp.View.PlugMenu', {
    extend: 'Ext.panel.Panel',
    xtype: 'plugMenu',
    
    initComponent: function() {
    	
    	Ext.apply(this, {
            layout: 'border',
            items: [this.createGrid()/*,
            		this.createGrid1()*/]
            
        });
    	this.createEditWindows();
    	this.createEditWindows1();
    	//this.createImageUpload();
        this.callParent(arguments);
    },

    /*createGrid1: function() {
    	var store = Ext.create('Ext.data.Store', {
    		pageSize: 25,
    	    fields:['name', 'value1', 'value2', 'level', 'visible'],
    	    proxy: {
    	        type: 'ajax',
    	        url: '/admin/plugMenu.do?list', 
    	        reader: {
    	            type: 'json',
    	            root: 'datas',
    	            totalProperty: 'total'
    	        }
    	    },
            autoLoad: true
    	});    	    	
    	
    	this.grid1 = Ext.create('Ext.grid.Panel', {
    	    store: store,
    	    region: 'north',
    	    height: 180,
    	    columns: [{
    	    	text: '名称',  
    	    	dataIndex: 'name',
    	    	flex: 0.25
    	    }, {
    	    	text: '链接及活动',
    	    	dataIndex: 'value1',
    	    	flex: 0.25
    	    }, {
    	    	text: '等级排序',
    	    	dataIndex: 'level',
    	    	flex: 0.25
    	    }, {
    	    	text: '是否显示',
    	    	dataIndex: 'visible',
    	    	flex: 0.15,
    	    	renderer: function(v) {
                	if (v) return "<font color=green>显示</font>";
                	else return "<font color=red>隐藏</font>";
                }
    	    }, {
            	xtype: 'actiontextcolumn',
            	text: '主要操作',
            	flex: 0.09,
                items : [{  
                    text : "编辑",
                    cls: 'icon-edit', 
                    scope: this,
                    handler: this.editGrid1
                }]  
            }
    	    ]
    	});
    	return this.grid1;
    },*/
    
    createGrid: function() {
    	var store = Ext.create('Ext.data.Store', {
    		pageSize: 25,
    	    fields:['name', 'value1', 'value2', 'level', 'visible'],
    	    proxy: {
    	        type: 'ajax',
    	        url: '/admin/plugMenu.do?list', 
    	        reader: {
    	            type: 'json',
    	            root: 'datas',
    	            totalProperty: 'total'
    	        }
    	    },
            autoLoad: true
    	});    	    	
    	
    	this.grid = Ext.create('Ext.grid.Panel', {
    	    store: store,
    	    region: 'center',
    	    dockedItems: [{
    	        xtype: 'pagingtoolbar',
    	        store: store,
    	        dock: 'bottom',
    	        displayInfo: true
    	    }],
    	    columns: [{
    	    	text: '名称',  
    	    	dataIndex: 'name',
    	    	id: 'id_name',
    	    	flex: 0.25
    	    }, {
    	    	text: '链接及活动',
    	    	dataIndex: 'value1',
    	    	flex: 0.25
    	    }, {
    	    	text: '等级排序',
    	    	dataIndex: 'level',
    	    	flex: 0.25
    	    }, {
    	    	text: '是否显示',
    	    	dataIndex: 'visible',
    	    	flex: 0.15,
    	    	renderer: function(v) {
                	if (v) return "<font color=green>显示</font>";
                	else return "<font color=red>隐藏</font>";
                }
    	    }, {
            	xtype: 'actiontextcolumn',
            	text: '主要操作',
            	flex: 0.09,
                items : [{  
                    text : "编辑",
                    cls: 'icon-edit', 
                    scope: this,
                    handler: this.editGrid
                }]  
            }
    	    ],
            tbar: [{ 
            	xtype: 'button', 
            	text: '刷新',
            	iconCls: 'icon-refresh',
            	scope: this,
            	handler: this.refreshGird
            }, /*{ 
            	xtype: 'button', 
            	text: '添加',
            	iconCls: 'icon-add',
            	scope: this,
            	handler: this.addGrid
            },*/ '->' ,{
            	xtype: 'textfield',
            	width: 180,
            	id: 'PlugMenu.SearchName'
            },{ 
            	xtype: 'button', 
            	text: '搜索',
            	iconCls: 'icon-search',
            	scope: this,
            	handler: this.searchGrid
            }]
    	});
    	return this.grid;
    },
    
    refreshGird: function() {
    	this.grid.getStore().reload();
    },
    
    searchGrid: function() {
    	var store = this.grid.getStore();
    	store.currentPage = 1;
    	store.proxy.extraParams = {
			name: Ext.getCmp('PlugMenu.SearchName').getValue()
		};
		store.load();
    },
    
    createEditWindows: function() {
    	var enabled = Ext.create('Ext.data.Store', {
    	    fields: ['text', 'value'],
    	    data : [{
    	    	"text":"显示", "value": true
    	    },{
    	    	"text":"隐藏", "value": false
    	    }]
    	});
    	
    	this.editWin = Ext.create('Ext.window.Window', {
    	    title: '编辑信息',
    	    height: 500,
    	    width: 700,
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
    	        	xtype: 'textfield',
    	            name: 'name',
    	            fieldLabel: '名称',
    				readOnly: true
    	        }, {
    	        	xtype: 'textfield',
    	            name: 'value1',
    	            fieldLabel: '链接及活动'
    	        }, {
    	        	xtype: 'numberfield',
    	            name: 'level',
    	            fieldLabel: '等级排序'
    	        }, {
    	        	xtype: 'combo',
    	        	name: 'visible',
    	        	fieldLabel: '是否显示',
    	        	store: enabled,
    	            queryMode: 'local',
    	            valueField: 'value',
    	            displayField: 'text',
    	            editable: false,
    	            allowBlank: false
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
    
    createEditWindows1: function() {
    	var enabled = Ext.create('Ext.data.Store', {
    	    fields: ['text', 'value'],
    	    data : [{
    	    	"text":"显示", "value": true
    	    },{
    	    	"text":"隐藏", "value": false
    	    }]
    	});
    	
    	var colorShowId = '';
    	var colorWin = new Ext.Window( {  
            border :0,  
            frame:false,  
            closeAction :'hide',  
            closable :true,  
            resizable :false,  
            width :200,  
            height :165,  
            items : [   
                      {  
                          xtype:'colorpicker',  
                          listeners: {  
                                select: function(picker, selColor) {
                                      var color = '#' + selColor;  
                                    // alert(colorShowId+','+color);  
                                        Ext.getDom(colorShowId).style.background = color;
                                        Ext.getCmp('value2').setValue(color);
                                        colorWin.hide();   
                                }  
                            }  
                      }  
             ]  
        }) ;  
    	
    	this.editWin1 = Ext.create('Ext.window.Window', {
    	    title: '编辑信息',
    	    height: 200,
    	    width: 400,
    	    layout: 'border',
    	    modal: true,
//    	    closeAction: 'hide',
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
    	        	xtype: 'textfield',
    	            name: 'name',
    	            fieldLabel: '名称',
    				readOnly: true
    	        }, {
    	        	xtype: 'container',
    	        	layout: 'column',
    	        	id: 'Color_Container',
    	            items: [
    	            {
    	        		xtype: 'textfield',
        	            name: 'value2',
        	            id: 'value2',
        	            fieldLabel: '颜色',
        	            readOnly: true,
        	            columnWidth: 0.6
    	        	}, {
    	        		xtype: 'button',
    	        		text: '获取颜色',
    	        		id: 'colButton',
    	        		columnWidth: 0.4,
    	        		style:'background:red',
    	        		scope: this,
    	        		handler: function(){
    						showColor('colButton');
    	        		}
    	        	}]
    	        }, {
    	        	xtype: 'combo',
    	        	name: 'visible',
    	        	fieldLabel: '是否显示',
    	        	store: enabled,
    	            queryMode: 'local',
    	            valueField: 'value',
    	            displayField: 'text',
    	            editable: false,
    	            allowBlank: false
    	         }],
    	        buttons: [{ 
    	        	text: '确定',
    	        	scope: this,
    	        	handler: this.submitFormData1
    	        }, { 
    	        	text: '取消',
    	        	scope: this,
    	        	handler: function() {
    	        		this.editWin1.hide();
    	        	}
    	        }]
    	    }]
    	});
    	function showColor(id) {  
            colorShowId = id;  
            var colorText = Ext.getCmp(id);  
            colorWin.x = colorText.getPosition()[0] + colorText.getWidth();  
            colorWin.y = colorText.getPosition()[1];  
            colorWin.show();  
        }
    },
           
   /* editGrid1: function(grid, rowIndex, colIndex) {
    	var form = this.editWin1.down('form');
    	this.editWin1.show();
    	var rec = grid.getStore().getAt(rowIndex);
    	form.loadRecord(rec);
    },*/
    
    editGrid: function(grid, rowIndex, colIndex) {
    	var getN = this.grid.getStore().getAt(rowIndex);
    	if(getN.get('name') == '菜单颜色'){
    		var form = this.editWin1.down('form');
    		this.editWin1.show();
    		var rec = grid.getStore().getAt(rowIndex);
    		form.loadRecord(rec);
    	}
    	else{
    		var form = this.editWin.down('form');
    		this.editWin.show();
    		var rec = grid.getStore().getAt(rowIndex);
    		form.loadRecord(rec);
    	}
    },
    
    submitFormData1: function() {
    	var grid  = this.grid;
    	var form = this.editWin1.down('form');
    	//alert(form.getChildByElement('value2'));
    	var win = this.editWin1;
    	form.submit({
    		url: '/admin/plugMenu.do?save',
    	    success: function(form, action) {
    	       win.hide();
    	       Ext.Msg.alert('提示', action.result.title);
    	       grid.getStore().reload();
    	    },
    	    failure: function(form, action) {
    	    	Ext.Msg.alert('提示', '操作异常');
    	    }
    	});
    	
    	grid.getStore();
    	var col = '';
    	var i;
    	var count = 0;
    	for(i = 0;i < grid.getStore().getCount();i++)
		{	
   			col = grid.getStore().getAt(i).data.visible;
   			if(col == true)
   				count++;
		}
		if(count >= 6){
			alert('除颜色和页面版权外，最多只能选择显示四项！请注意选择。');}
    },
    
    submitFormData: function() {
    	var grid  = this.grid;
    	var form = this.editWin.down('form');
    	var win = this.editWin;
    	form.submit({
    		url: '/admin/plugMenu.do?save',
    	    success: function(form, action) {
    	       win.hide();
    	       Ext.Msg.alert('提示', action.result.title);
    	       grid.getStore().reload();
    	    },
    	    failure: function(form, action) {
    	    	Ext.Msg.alert('提示', '操作异常');
    	    }
    	});
    	
    	grid.getStore();
    	var col = '';
    	var i;
    	var count = 0;
    	for(i=0;i<grid.getStore().getCount();i++)
		{	
   			col=grid.getStore().getAt(i).data.visible;
   			if(col == true)
   				count++;
		}
		if(count >= 6){
			alert('除颜色和页面版权外，最多只能选择显示四项！请注意选择。');}
    },
    
    onDestroy: function(){
    	this.editWin.close();
    	this.editWin1.close();
    	//this.uploadImageWin.close();
        this.callParent(arguments);
    }
    
})