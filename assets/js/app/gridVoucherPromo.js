
    
    var windowW = Ext.getBody().getViewSize().width;
    var panelW = windowW - 100;

    var windowH = Ext.getBody().getViewSize().height;
    var panelH = windowH - 140;
//start VoucherPromo

////////////////////////////////////////
Ext.define('gridModelVoucherPromo', {
    extend: 'Ext.data.Model',
    fields: ['message_id','message_title','message_content','fullname','status_name','status','source','message_content_reply','email','email_user','email_user_reply','datein'],
    idProperty: 'id'
});

var storegridVoucherPromo = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'gridModelVoucherPromo',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/Inbox',
        actionMethods: 'POST',
        reader: {
            root: 'rows',
            totalProperty: 'results'
        },
        //simpleSortMode: true
    },
    sorters: [{
        property: 'namesupplier',
        direction: 'ASC'
    }],
    listeners: {
        'beforeload': function(store, operation, eOpts) {
            operation.params = {
                inbox:'out'
                // message_status: Ext.getCmp('rg_message_status_out').getValue()['message_status']
            }
        }
    },
});

var FormVoucherPromo = Ext.create('Ext.form.Panel', {
    autoWidth: true,
    autoHeight: true,
    url: SITE_URL + '/backend/post_reply',
    baseParams: { idmenu: 24 },
    bodyStyle: 'padding:5px',
    labelAlign: 'top',
    autoScroll: true,
    // layout: 'hbox',
    defaults: {
        padding: '5 10 5 5',
    },
    fieldDefaults: {
        msgTarget: 'side',
        blankText: 'is required',
        labelWidth: 140,
        anchor: '100%',
        width: 450
    },
    items: [
        { xtype: 'hiddenfield', name: 'message_id', id:'message_id', allowBlank: false },
        { xtype: 'displayfield', id: 'email', name: 'email', fieldLabel: 'Email Pengirim', readOnly: true },
        { xtype: 'displayfield', id: 'message_title', name: 'message_title', fieldLabel: 'Subjek', readOnly: true },
        { xtype: 'displayfield', id: 'message_content_reply', name: 'message_content_reply', fieldLabel: 'Pesan', readOnly: true },
        { xtype: 'displayfield', id: 'datein',name: 'datein', fieldLabel: 'Date and Time', allowBlank: false }
    ],
    buttons: [{
        text: 'Close',
        handler: function() {
            Ext.getCmp('windowVoucherPromo').hide();
        }
    }]
});

// var windowVoucherPromo = Ext.define('FormVoucherPromo', {
var windowVoucherPromo = Ext.create('widget.window', {
    id:'windowVoucherPromo',
    // extend: 'Ext.window.Window',
    // alias: 'widget.FormVoucherPromo',
    title: 'Message',
    header: {
        titlePosition: 2,
        titleAlign: 'center'
    },
    modal: true,
    closable: true,
    closeAction: 'hide',
    // width: panelW/2,
    // height: panelH-100,
    layout: 'fit',
    border: false,
    items: [FormVoucherPromo],
    listeners: {
        'show': function(FormVoucherPromo) {
            // Ext.getCmp('comboxsuppliertype').store.load();
            // FormVoucherPromo.getForm().findField('statusFormVoucherPromo').setValue(FormVoucherPromo.statusform);
        },
        'hide': function() {
            // FormVoucherPromo.getForm().reset();
        }

    }
});



var smgridVoucherPromo = Ext.create('Ext.selection.CheckboxModel', {
    allowDeselect: true,
    mode: 'MULTI',
    listeners: {
        deselect: function(model, record, index) {
            var selectedLen = smgridVoucherPromo.getSelection().length;
            console.log(selectedLen)
            if (selectedLen == 0) {
                // Ext.getCmp('GridSupplierID').queryById('btnEdit').setDisabled(true);
                // Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(true);
            }
        },
        select: function(model, record, index) {
            if(record.data.policy_no!=''){
                 // Ext.getCmp('btnPublishPolicy').setDisabled(true);
            } else {
                 // Ext.getCmp('btnPublishPolicy').setDisabled(false);
            }
            // console.log(record)
           
            // Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(false);
        }
    }
});

Ext.define('MY.searchGridSupplier', {
    extend: 'Ext.ux.form.SearchField',
    alias: 'widget.searchGridSupplier',
    store: storegridVoucherPromo,
    width: 180
});

// var dir_sys = '{$base_url}';

// Ext.create(dir_sys+'.assets.js.app.gridVoucherPromo');

var gridVoucherPromo = Ext.create('Ext.grid.Panel', {
// Ext.define('gridVoucherPromo', {
    // title: 'Jenis Simpanan',
    // itemId: 'gridVoucherPromo',
    id: 'gridVoucherPromo',
    // extend: 'Ext.grid.Panel',
    // alias: 'widget.gridVoucherPromo',
    id:'gridVoucherPromo',
    title: 'Pesan Keluar',
    store: storegridVoucherPromo,
    selModel: smgridVoucherPromo,
    loadMask: true,
    columns: [{
            header: 'message_id',
            dataIndex: 'status',
            hidden: true
        },
        {
            header: 'status',
            dataIndex: 'status',
            hidden: true
        },
        // { header: 'Status',  dataIndex: 'status_name', minWidth: 150 },
        { header: 'Subject',  dataIndex: 'message_title', minWidth: 200},
        { header: 'To',  dataIndex: 'email_user', minWidth: 200 },
        // { header: 'Fullname',  dataIndex: 'fullname', minWidth: 200 },         
        { header: 'Message',  dataIndex: 'message_content', minWidth: 200, flex:1 },               
        { header: 'Date',  dataIndex: 'datein', minWidth: 150 },
        // { header: 'Source',  dataIndex: 'source', minWidth: 150 }
    ],
    dockedItems: [{
        xtype: 'toolbar',
        dock: 'top',
        items: [
            // {
            //     xtype: 'radiogroup',
            //     fieldLabel: 'Status',
            //     id:'rg_message_status_out',
            //     items: [
            //         { boxLabel: 'Unread', name: 'message_status', inputValue: 1, checked: true , width:100},
            //         { boxLabel: 'Readed', name: 'message_status', inputValue: 2 , width:100 },
            //         { boxLabel: 'Replied', name: 'message_status', inputValue: 3 , width:100 }
            //     ],
            //     listeners: {
            //     change: function (field, newValue, oldValue) {
            //             storegridVoucherPromo.load();
            //         }
            //     }
            // },
            '->',
            'Pencarian: ',
            ' ',
            {
                xtype: 'searchGridSupplier',
                text: 'Left Button',
            }
        ]
    },
    {
        xtype: 'pagingtoolbar',
        store: storegridVoucherPromo, // same store GridPanel is using
        dock: 'bottom',
        displayInfo: true
        // pageSize:20
    }],
    listeners: {
        render: {
            scope: this,
            fn: function(grid) {
                storegridVoucherPromo.load();
            }
        } ,
        itemdblclick: function(dv, record, item, index, e) {
                // record.data.message_id
                windowVoucherPromo.show();

                Ext.getCmp('message_id').setValue(record.data.message_id);
                Ext.getCmp('email').setValue(record.data.email_user);
                Ext.getCmp('message_title').setValue(record.data.message_title);
                Ext.getCmp('message_content_reply').setValue(record.data.message_content); 
                Ext.getCmp('datein').setValue(record.data.datein); 
                
                // if(record.data.status!='3'){
                //     Ext.Ajax.request({
                //         url: SITE_URL + '/backend/set_read/',
                //         method: 'POST',
                //         params: {
                //             message_id: record.data.message_id
                //         },
                //         success: function(form, action) {
                //             storegridVoucherPromo.load();
                //             // var d = Ext.decode(form.responseText);
                //             // Ext.Msg.alert('Informasi', 'Polis telah berhasil diterbitkan');
                //         },
                //         failure: function(form, action) {
                //             storegridVoucherPromo.load();
                //             // Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                //             // Ext.MessageBox.hide();
                //         }
                //     });
                // }
                
        }
    },
    height: panelH,
    autoWidth: true,
    // minHeight:500,
});

///////////////////////////////////////
//end VoucherPromo
