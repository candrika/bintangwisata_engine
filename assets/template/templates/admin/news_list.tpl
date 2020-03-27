
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

Ext.define('GridModel', {
    extend: 'Ext.data.Model',
    fields: ['news_id','news_title','news_content','news_desc','news_keyword','status','userin','datein','news_image','username','email'],
    idProperty: 'id'
});

var storeGrid = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModel',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/news',
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
                // payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status']
            }
        }
    },
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
    store: storeGrid,
    width: 180
});



Ext.create('Ext.grid.Panel', {
    id:'gridOrder',
    title: 'Berita',
    store: storeGrid,
    selModel: smGridSupplier,
    loadMask: true,
    columns: [{
            header: 'news_id',
            dataIndex: 'news_id',
            hidden: true
        },
        { header: 'Judul Berita',  dataIndex: 'news_title', minWidth: 250,flex:1 },
        // { header: 'news Content',  dataIndex: 'news_content', minWidth: 150 },
        // { header: 'Berita Singkat',  dataIndex: 'news_desc', minWidth: 150 },
        { header: 'Keyword',  dataIndex: 'news_keyword', minWidth: 200 },
        { header: 'Tgl Entri',  dataIndex: 'datein', minWidth: 150 },
        { header: 'Username',  dataIndex: 'username', minWidth: 150 },
        { header: 'Email',  dataIndex: 'email', minWidth: 150 }
    ],
    dockedItems: [{
        xtype: 'toolbar',
        dock: 'top',
        items: [
            // {
            //     xtype: 'radiogroup',
            //     fieldLabel: 'Status Bayar',
            //     id:'rg_payment_status',
            //     items: [
            //         { boxLabel: 'Unpaid', name: 'payment_status', inputValue: 1, checked: true , width:100},
            //         { boxLabel: 'Paid', name: 'payment_status', inputValue: 2 , width:100 }
            //     ],
            //     listeners: {
            //     change: function (field, newValue, oldValue) {
            //             storeGrid.load();
            //         }
            //     }
            // },'->',
            {
                text: 'Tambah Berita',
                handler: function() {
                   window.location = "{$site_url}/admin_panel/news_add";
                   
                }
            },
            {
                text: 'Ubah',
                // iconCls: 'add-icon',
                handler: function() {
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        window.location = "{$site_url}/admin_panel/news_edit/"+selectedRecord.data.news_id;
                    }
                   
                }
            },
            {
                text: 'Hapus',
                // iconCls: 'add-icon',
                handler: function() {
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        console.log(selectedRecord.data.order_id);

                        Ext.MessageBox.show({
                            title: 'Hapus Berita',
                            async:false,
                            msg: 'Apakah anda yakin untuk menghapus berita terpilih?',
                            buttons: Ext.MessageBox.OKCANCEL,
                            icon: Ext.MessageBox.WARNING,
                            fn: function(btn){
                                if(btn == 'ok'){
                                    // alert(Ext.getCmp('rg_payment_status').getValue()['payment_status'])
                                   Ext.Ajax.request({
                                        url: SITE_URL + '/admin_panel/news_delete/',
                                        method: 'GET',
                                        params: {
                                            news_id: selectedRecord.data.news_id
                                        },
                                        success: function(form, action) {
                                            var d = Ext.decode(form.responseText);
                                            Ext.Msg.alert('Informasi', d.message);
                                            storeGrid.load();
                                        },
                                        failure: function(form, action) {
                                            Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                            Ext.MessageBox.hide();
                                        }
                                    });
                                } else {
                                    return;
                                }
                            }
                        });
                    }
                   
                }
            },
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
        store: storeGrid, // same store GridPanel is using
        dock: 'bottom',
        displayInfo: true
        // pageSize:20
    }],
    listeners: {
        render: {
            scope: this,
            fn: function(grid) {
                storeGrid.load();
            }
        } ,
        itemdblclick: function(dv, record, item, index, e) {
                Ext.create('Ext.window.Window', {
                    title: 'Pratinjau Order Nomor: '+record.data.order_no,
                    modal: true,
                    width: panelW - 100,
                    height: panelH - 50,
                    items: [{
                        xtype: 'component',
                        html: '<iframe src="' + SITE_URL + '/order/form/' + record.data.order_id + '/preview"  style="position: absolute; border: 0; top:0; left:0; right:0; bottom:0; width:100%; height:100%;"></iframe>',
                    }],
                    buttons: [{
                        hidden:true,
                        text: 'Print',
                        iconCls: 'print-icon',
                        handler: function() {
                            window.open(SITE_URL + 'purchase/print_invoice/' + selectedRecord.data.goods_receipt_id + '/print', '_blank');
                        }
                    }]
                }).show();
        }
    },
    height: panelH,
    autoWidth: true,
    // minHeight:500,
    renderTo: 'content_div'
});

});
</script>
