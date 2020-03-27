
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



Ext.define('GridModelInbox', {
    extend: 'Ext.data.Model',
    fields: ['message_id','message_title','message_content','fullname','status_name','status','source','message_content_reply','email','email_user','email_user_reply','datein'],
    idProperty: 'id'
});

var storeGridInbox = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModelInbox',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/inbox',
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
                message_status: Ext.getCmp('rg_message_status').getValue()['message_status']
            }
        }
    },
});

var FormInbox = Ext.create('Ext.form.Panel', {
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
        { xtype: 'textfield', id: 'email', name: 'email', fieldLabel: 'From', readOnly: true },
        { xtype: 'textfield', id: 'message_title', name: 'message_title', fieldLabel: 'Subject', readOnly: true },
        { xtype: 'textarea', id: 'message_content_reply', name: 'message_content_reply', fieldLabel: 'Message', readOnly: true, rows:10 },
        { xtype: 'textarea', name: 'message_content', fieldLabel: 'Balasan', allowBlank: false, rows:10 }
    ],
    buttons: [{
        text: 'Batal',
        handler: function() {
            Ext.getCmp('windowInbox').hide();
        }
    }, {
        text: 'Kirim',
        handler: function() {
            if (FormInbox.isValid()) {
                FormInbox.submit({
                    success: function(form, action) {
                        Ext.Msg.alert('Success', action.result.message);
                        Ext.getCmp('windowInbox').hide();
                        storeGridInbox.load();
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

// var windowInbox = Ext.define('FormInbox', {
var windowInbox = Ext.create('widget.window', {
    id:'windowInbox',
    // extend: 'Ext.window.Window',
    // alias: 'widget.FormInbox',
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
    items: [FormInbox],
    listeners: {
        'show': function(FormInbox) {
            // Ext.getCmp('comboxsuppliertype').store.load();
            // FormInbox.getForm().findField('statusFormInbox').setValue(FormInbox.statusform);
        },
        'hide': function() {
            // FormInbox.getForm().reset();
        }

    }
});



var smGridSupplier = Ext.create('Ext.selection.CheckboxModel', {
    allowDeselect: true,
    mode: 'MULTI',
    listeners: {
        deselect: function(model, record, index) {
            var selectedLen = smGridSupplier.getSelection().length;
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
    store: storeGridInbox,
    width: 180
});



var gridInbox = Ext.create('Ext.grid.Panel', {
    id:'gridInbox',
    title: 'Pesan Masuk',
    store: storeGridInbox,
    selModel: smGridSupplier,
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
        { header: 'Status',  dataIndex: 'status_name', minWidth: 150 },
        { header: 'Subject',  dataIndex: 'message_title', minWidth: 150, flex:1},
        { header: 'From',  dataIndex: 'email', minWidth: 200 },
        { header: 'Fullname',  dataIndex: 'fullname', minWidth: 200 },         
        { header: 'Message',  dataIndex: 'message_content', minWidth: 200 },               
        { header: 'Date',  dataIndex: 'datein', minWidth: 150 },
        { header: 'Source',  dataIndex: 'source', minWidth: 150 }
    ],
    dockedItems: [{
        xtype: 'toolbar',
        dock: 'top',
        items: [
            {
                xtype: 'radiogroup',
                fieldLabel: 'Status',
                id:'rg_message_status',
                items: [
                    { boxLabel: 'Unread', name: 'message_status', inputValue: 1, checked: true , width:100},
                    { boxLabel: 'Readed', name: 'message_status', inputValue: 2 , width:100 },
                    { boxLabel: 'Replied', name: 'message_status', inputValue: 3 , width:100 }
                ],
                listeners: {
                change: function (field, newValue, oldValue) {
                        storeGridInbox.load();
                    }
                }
            },'->',
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
        store: storeGridInbox, // same store GridPanel is using
        dock: 'bottom',
        displayInfo: true
        // pageSize:20
    }],
    listeners: {
        render: {
            scope: this,
            fn: function(grid) {
                storeGridInbox.load();
            }
        } ,
        itemdblclick: function(dv, record, item, index, e) {
                // record.data.message_id
                windowInbox.show();

                Ext.getCmp('message_id').setValue(record.data.message_id);
                Ext.getCmp('email').setValue(record.data.email);
                Ext.getCmp('message_title').setValue(record.data.message_title);
                if(record.data.message_content_reply==null){
                    Ext.getCmp('message_content_reply').setValue(record.data.message_content); 
                } else {
                   Ext.getCmp('message_content_reply').setValue(record.data.message_content_reply); 
                }
                
                if(record.data.status!='3'){
                    Ext.Ajax.request({
                        url: SITE_URL + '/backend/set_read/',
                        method: 'POST',
                        params: {
                            message_id: record.data.message_id
                        },
                        success: function(form, action) {
                            storeGridInbox.load();
                            // var d = Ext.decode(form.responseText);
                            // Ext.Msg.alert('Informasi', 'Polis telah berhasil diterbitkan');
                        },
                        failure: function(form, action) {
                            storeGridInbox.load();
                            // Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                            // Ext.MessageBox.hide();
                        }
                    });
                }
                
        }
    },
    height: panelH,
    autoWidth: true,
    // minHeight:500,
    // renderTo: 'content_div'
});





Ext.Loader.loadScript({
    url: '{$base_url}/assets/js/app/gridOutbox.js',
    onLoad: function() {

        var gridOutbox = Ext.getCmp('gridOutbox');

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
		       gridInbox,gridOutbox
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
    },
    onError: function() {
        Ext.Msg.alert('Failed', 'Failed while loading file ');
    }
});    





});

function load_js_file(file){
   //  Ext.Loader.loadScript({
   //      url: '{$base_url}/assets/js/app/'+file,
   //      onLoad: function() {
   //          console.log(file+' loaded');
   //          var gridOutbox = Ext.getCmp('gridOutbox');
			// console.log(gridOutbox)
   //      },
   //      onError: function() {
   //          Ext.Msg.alert('Failed', 'Failed while loading file '+file);
   //      }
   //  });    
}

</script>
