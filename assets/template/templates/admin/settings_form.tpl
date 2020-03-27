
<script type="text/javascript">

Ext.onReady(function() {

var myMask = new Ext.LoadMask(Ext.getBody(), { msg:"Please wait..."} );
Ext.Ajax.on('beforerequest', myMask.show, myMask);
Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
Ext.Ajax.on('requestexception', myMask.hide, myMask);

var windowW = Ext.getBody().getViewSize().width;
var panelW = windowW - 100;

var windowH = Ext.getBody().getViewSize().height;
var panelH = windowH - 140;


 Ext.tip.QuickTipManager.init();

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
    title: 'Kode Voucher',
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

//////

var gridImageSliderConfig = Ext.create('Ext.grid.Panel', {
// Ext.define('gridImageSliderConfig', {
    // title: 'Jenis Simpanan',
    // itemId: 'gridImageSliderConfig',
    id: 'gridImageSliderConfig',
    // extend: 'Ext.grid.Panel',
    // alias: 'widget.gridImageSliderConfig',
    id:'gridImageSliderConfig',
    title: 'Image Slider',
    store: storegridVoucherPromo,
    // selModel: smgridImageSliderConfig,
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
            //             storegridImageSliderConfig.load();
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
                windowImageSliderConfig.show();

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
                //             storegridImageSliderConfig.load();
                //             // var d = Ext.decode(form.responseText);
                //             // Ext.Msg.alert('Informasi', 'Polis telah berhasil diterbitkan');
                //         },
                //         failure: function(form, action) {
                //             storegridImageSliderConfig.load();
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
//end slide show config

//start product config
var gridProductConfig = Ext.create('Ext.grid.Panel', {
// Ext.define('gridProductConfig', {
    // title: 'Jenis Simpanan',
    // itemId: 'gridProductConfig',
    id: 'gridProductConfig',
    // extend: 'Ext.grid.Panel',
    // alias: 'widget.gridProductConfig',
    id:'gridProductConfig',
    title: 'Produk',
    store: storegridVoucherPromo,
    // selModel: smgridProductConfig,
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
            //             storegridProductConfig.load();
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
                windowProductConfig.show();

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
                //             storegridProductConfig.load();
                //             // var d = Ext.decode(form.responseText);
                //             // Ext.Msg.alert('Informasi', 'Polis telah berhasil diterbitkan');
                //         },
                //         failure: function(form, action) {
                //             storegridProductConfig.load();
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
//end product config

var formCustomer = Ext.create('Ext.form.Panel', {
    title:'Pengaturan',
    width: panelW-200,
    height: panelH,
    // frame: true,
    // renderTo: 'content_div',
    url: SITE_URL + '/admin_panel/setting_save',
    // baseParams: { idmenu: 24 },
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
        labelWidth: 200,
        anchor: '100%',
        width: 380
    },
    items: [
        { xtype: 'hiddenfield', name: 'settingsid', allowBlank: false },
        { xtype: 'textfield', name: 'site_title', fieldLabel: 'Site Title', allowBlank: false },
        { xtype: 'textarea', name: 'site_description', fieldLabel: 'Site Description', allowBlank: false},
        { xtype: 'textarea', name: 'site_keywords', fieldLabel: 'Site Keywords' },
        { xtype: 'textfield', name: 'rate_usd', fieldLabel: 'Rate USD', maxLength: 11 },
        { xtype: 'textfield', name: 'email_inbox', fieldLabel: 'Inbox Email Address', allowBlank: false, maxLength: 50 },               
        { xtype: 'textfield', name: 'materai_fee', fieldLabel: 'Materai Fee (IDR)', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'policy_fee_domestic', fieldLabel: 'Policy Fee Domestic (IDR)', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'policy_fee_international', fieldLabel: 'Policy Fee International (IDR)', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'cs_email1', fieldLabel: 'Customer Service Email', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'cs_phone1', fieldLabel: 'Customer Service Phone', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'company_address', fieldLabel: 'Company Address', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'min_age_extra_premi', fieldLabel: 'Min Age - Extra Premium', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'max_age_extra_premi', fieldLabel: 'Max Age - Extra Premium', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'percent_extra_premi', fieldLabel: 'Percentage - Extra Premium', allowBlank: false, maxLength: 50 },
        { xtype: 'textfield', name: 'sender_mail_address', fieldLabel: 'Sender Mail Address', allowBlank: false, maxLength: 50 }
    ],
    buttons: [
    {
        text: 'Save',
        handler: function() {
            if (formCustomer.isValid()) {
                formCustomer.submit({
                    success: function(form, action) {
                        Ext.Msg.alert('Success', 'Pengaturan berhasil disimpan');
                        FormCustomer.hide();
                        storeGridCustomer.load();
                    },
                    failure: function(form, action) {
                        Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                    }
                });
            } else {
                Ext.Msg.alert("Error!", "Your form is invalid!");
            }
        }
    }]
});

formCustomer.getForm().load({
    url: SITE_URL + '/backend/load_form/settings',
    // params: {
    //     extraparams: 'idunit:' + record.get('idunit') + ',' + 'idinventory:' + idinventoryInv
    // },
    success: function(form, action) {
        var obj = Ext.decode(action.response.responseText);
        // Ext.getCmp('idinventoryAccInventory').setValue(obj.data.idinventory);
    },
    failure: function(form, action) {
        // Ext.Msg.alert("Load failed", action.result.errorMessage);
    }
});


Ext.define('TabPanelAdmin', {
    extend: 'Ext.tab.Panel',
    renderTo: 'content_div',
    alias: 'widget.TabPanelAdmin',
    activeTab: 0,
    autoScroll: true,
    plain: true,
    defaults: {
        autoScroll: true
    },
    items: [
       formCustomer,gridVoucherPromo,gridImageSliderConfig,gridProductConfig
    ],
     listeners: {
        render: function() {
            // setHeaderLoanSummary();

            this.items.each(function(i) {
                i.tab.on('click', function() {
                    // alert('s')
                });
            });
        }
    }
});

Ext.create('TabPanelAdmin');

});
</script>
