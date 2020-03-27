
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
    fields: [ 'invoice_id','id_xd','order_id','user_id','xendit_fee_amount','sni_fee_amount','received_amount','status','amount','order_no','other_fee','total_ex_premi','total_perluasan','total_premi','subtotal_premi','payment_fee','total_amount','payment_type'],
    idProperty: 'id'
});

var storeGrid = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModel',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/invoice',
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
                payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status']
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
            if(record.data.status!='Awaiting Payment' && record.data.status!='Payment Confirmed'){
                 // Ext.getCmp('btnPublishPolicy').setDisabled(false);
                 Ext.getCmp('btnConfirmPayment').setDisabled(true);
            } else {
                 // Ext.getCmp('btnPublishPolicy').setDisabled(true);
                 Ext.getCmp('btnConfirmPayment').setDisabled(false);
            }

            if(record.data.policy_no!='' && record.data.policy_no!=null){
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

var PaymentForm = Ext.create('Ext.form.Panel', {
            // title: appname,
        bodyPadding: 5,
        url: SITE_URL + '/admin_panel/withdraw_save',
        width: 550,
        id: 'PaymentForm',
        layout: 'anchor',
        defaults: {
            anchor: '100%',
            labelWidth:200
        },
        defaultType: 'textfield',
        items: [{
                    xtype: 'hiddenfield',
                    name: 'withdraw_id',
                    id: 'withdraw_id'
                },
                {
                    xtype: 'textfield',
                    id: 'available_balance',
                    name: 'available_balance',
                    fieldLabel: 'Saldo Tersedia',
                    readOnly:true,
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    id: 'amount_withdraw',
                    name: 'amount_withdraw',
                    value:0,
                    fieldLabel: 'Jumlah Penarikan',
                    allowBlank: false
                },
                // {
                //     xtype: 'datefield',
                //     id: 'date_payment',
                //     name: 'date_payment',
                //     format: 'd/m/Y',
                //     fieldLabel: 'Tanggal Pembayaran',
                //     allowBlank: false
                // },
                {
                    xtype: 'textfield',
                    value:'116.000.583.2580',
                    readOnly:true,
                    name: 'no_account',
                    fieldLabel: 'No Akun Tujuan',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    readOnly:true,
                    value:'PT ASURANSI JASA INDONESIA',
                    name: 'account_name',
                    fieldLabel: 'Nama Rekening Tujuan',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    value:'Bank Mandiri',
                    readOnly:true,
                    name: 'bank_name',
                    fieldLabel: 'Nama Bank Pengirim',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    value:'Cab. S. Parman. Wisma Barito Pasific, Jl. Let. Jend. S. Parman Kav. 62-63 Slipi Jakarta Barat',
                    readOnly:true,
                    name: 'branch_name',
                    fieldLabel: 'Cabang',
                    allowBlank: false
                },
                {
                    xtype: 'textarea',
                    id: 'notes',
                    name: 'notes',
                    fieldLabel: 'Keterangan'
                }
            ]

            // Reset and Submit buttons
            ,
        buttons: [{
            text: 'Batal',
                    handler: function() {
                        Ext.getCmp('windowPayment').hide();
                    }
                }, {
                    text: 'Kirim',
                    handler: function() {

                        if(Ext.getCmp('amount_withdraw').getValue()*1 <= 0){
                            Ext.Msg.alert("Error!", "Jumlah penarikan tidak boleh kosong");
                        } else
                        if(Ext.getCmp('avail_withdraw').getValue()*1 < Ext.getCmp('amount_withdraw').getValue()*1){
                                Ext.Msg.alert("Error!", "Saldo penarikan yang tersedia tidak mencukupi");
                        } else if (PaymentForm.isValid()) {
                            PaymentForm.submit({
                                success: function(form, action) {
                                    Ext.Msg.alert('Success', action.result.message);
                                    Ext.getCmp('windowPayment').hide();
                                    Ext.getCmp('gridHistory').getStore().load();
                                    Ext.getCmp('PaymentForm').getForm.reset();
                                    get_summary();
                                },
                                failure: function(form, action) {
                                    Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                    PaymentForm.getForm.reset();
                                    get_summary();
                                }
                            });
                        } else {
                            Ext.Msg.alert("Error!", "Your form is invalid!");
                        }
                    }
                }]

        // ,
        // renderTo: Ext.getBody()
});

// var windowPayment = Ext.define('FormPayment', {
var windowPayment = Ext.create('widget.window', {
    id: 'windowPayment',
    // extend: 'Ext.window.Window',
    // alias: 'widget.FormPayment',
    title: 'Konfirmasi Pembayaran',
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
    items: [PaymentForm],
    listeners: {
        'show': function(FormPayment) {
            // Ext.getCmp('comboxsuppliertype').store.load();
            // FormPayment.getForm().findField('statusFormPayment').setValue(FormPayment.statusform);
        },
        'hide': function() {
            // FormPayment.getForm().reset();
        }

    }
});

Ext.create('Ext.grid.Panel', {
    id:'gridOrder',
    title: 'Daftar Invoice',
    store: storeGrid,
    selModel: smGridSupplier,
    loadMask: true,
    columns: [{
            header: 'ID Invoice',
            dataIndex: 'invoice_id',
            minWidth: 150
            // hidden: true
        },
        { header: 'order_id',  dataIndex: 'order_id',hidden:true},        
        { header: 'Order No',  dataIndex: 'order_no', minWidth: 150 },
        { header: 'Tipe',  dataIndex: 'payment_type', minWidth: 150 },
        { header: 'Premi',  dataIndex: 'total_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Premi Perluasan',  dataIndex: 'total_perluasan', minWidth: 150, xtype:'numbercolumn', align:'right' },        
        { header: 'Total Premi',  dataIndex: 'subtotal_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Biaya Lain',  dataIndex: 'other_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Biaya Transaksi',  dataIndex: 'payment_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Total Pembayaran',  dataIndex: 'total_amount', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Status',  dataIndex: 'status', minWidth: 150,hidden:true }
    ],
    dockedItems: [
    {
        xtype: 'toolbar',
        dock: 'top',
        items: [{
            xtype:'textfield',
            readOnly:true,
            labelWidth:150,
            fieldStyle: 'text-align: right;',
            fieldLabel:'Total Belum Terbayar',
            id:'total_amount_unpaid'
            // id:''
            // value:21000
        },{
            xtype:'textfield',
            readOnly:true,
            labelWidth:150,
            fieldStyle: 'text-align: right;',
            fieldLabel:'Total Terbayar',
            id:'total_amount'
        },
        '->',
        {
            xtype:'textfield',
            readOnly:true,
            labelWidth:150,
            fieldStyle: 'text-align: right;',
            fieldLabel:'Saldo Untuk Penarikan',
            id:'avail_withdraw'
        },
        {
        text: 'Tarik Dana',
        hidden:true,
            handler: function() {
                windowPayment.show();

                Ext.getCmp('available_balance').setValue(Ext.getCmp('avail_withdraw').getValue());
            }
        }]
    },
  
    {
        xtype: 'toolbar',
        dock: 'top',
        items: [
            {
                xtype: 'radiogroup',
                fieldLabel: 'Status Bayar',
                id:'rg_payment_status',
                items: [
                    { boxLabel: 'Pending', name: 'payment_status', inputValue: 'PENDING', checked: true , width:100},
                    { boxLabel: 'Completed', name: 'payment_status', inputValue: 'COMPLETED' , width:150 }
                ],
                listeners: {
                change: function (field, newValue, oldValue) {
                        storeGrid.load();
                        get_summary();
                    }
                }
            },
            '->',
            {
                id: 'btnConfirmPayment',
                hidden:true,
                text: 'Konfirmasi Pembayaran',
                // iconCls: 'add-icon',
                handler: function() {
                    PaymentForm.getForm().reset();
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (datlength == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        console.log(selectedRecord.datorder_id);

                        //cek pembayaran
                        PaymentForm.getForm().load({
                            url: SITE_URL + '/backend/load_form/payment',
                            params: {
                                key: 'order_id',
                                value:selectedRecord.data.order_id
                            },
                            success: function(form, action) {
                                var obj = Ext.decode(action.response.responseText); 
                                console.log(obj);
                                Ext.getCmp('payment_channel_id').setValue(obj.data.payment_channel_id*1);
                                Ext.getCmp('status').setValue(obj.data.status*1);
                                
                                // Ext.getCmp('comboxStatusMember').setValue(obj.datstatus*1);
                                // formdeliveryOrderGrid.getForm().findField("id_member_type").setValue(obj.datid_member_type);
                                // formdeliveryOrderGrid.getForm().findField("marital_status").setValue(obj.datmarital_status*1);
                                // Ext.Msg.alert("Load failed", action.result.errorMessage);
                            },
                            failure: function(form, action) {
                                Ext.Msg.alert("Load failed", action.result.errorMessage);
                            }
                        });

                        // Ext.Ajax.request({
                        //     url: SITE_URL + '/admin_panel/get_payment/',
                        //     method: 'GET',
                        //     params: {
                        //         order_id: selectedRecord.datorder_id
                        //     },
                        //     success: function(form, action) {
                        //         var d = Ext.decode(form.responseText);
                        //         // Ext.Msg.alert('Informasi', d.message);
                        //         // storeGrid.load();
                        //     },
                        //     failure: function(form, action) {
                        //         Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                        //         Ext.MessageBox.hide();
                        //     }
                        // });

                        windowPayment.show();
                    }
                }
            },
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

                get_summary();
            }
        } ,
        itemdblclick: function(dv, record, item, index, e) {
                Ext.create('Ext.window.Window', {
                    title: 'Pratinjau Order Nomor: '+record.datorder_no,
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
                            window.open(SITE_URL + 'purchase/print_invoice/' + selectedRecord.datgoods_receipt_id + '/print', '_blank');
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

//riwayat history

Ext.define('GridModelWithdraw', {
    extend: 'Ext.data.Model',
    fields: ['withdraw_id','available_balance','no_ref','amount_withdraw','balance','date_trx','no_account','account_name','bank_name','notes','status','date_settled','username'],
    idProperty: 'id'
});

var storeGridWithdraw = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModelWithdraw',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/withdraw',
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
                payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status']
            }
        }
    },
});

Ext.create('Ext.grid.Panel', {
    id:'gridHistory',
    title: 'Riwayat Penarikan',
    store: storeGridWithdraw,
    // selModel: smGridSupplier,
    loadMask: true,
    columns: [{
            header: 'withdraw_id',
            dataIndex: 'withdraw_id',
            minWidth: 150,
            hidden: true
        },
        { header: 'Waktu',  dataIndex: 'date_trx', minWidth: 150 },
        { header: 'Jumlah Penarikan',  dataIndex: 'amount_withdraw', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Sisa Saldo',  dataIndex: 'available_balance', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Nomor Akun Tujuan',  dataIndex: 'no_account', minWidth: 150 },
        { header: 'Bank Tujuan',  dataIndex: 'bank_name', minWidth: 150 },
        { header: 'Keterangan',  dataIndex: 'notes', minWidth: 150 },
        { header: 'Operator',  dataIndex: 'username', minWidth: 150 },
        { header: 'Status',  dataIndex: 'status', minWidth: 150,
            renderer: function(value) {
                if(value==1){
                    return 'Processing';
                } else if(value==2){
                    return 'Completed';
                } else {
                    return 'Failed';
                }  
            }
         },
        { header: 'Tanggal Settlement',  dataIndex: 'date_settled', minWidth: 150 },
        { header: 'No Referensi',  dataIndex: 'no_ref', minWidth: 150 },
    ],
    dockedItems: [
    
    {
        xtype: 'toolbar',
        dock: 'top',
        items: [
            {
                xtype:'textfield',
                readOnly:true,
                labelWidth:150,
                fieldStyle: 'text-align: right;',
                fieldLabel:'Total Penarikan Dana',
                id:'total_withdraw'
                // id:''
                // value:21000
            }
        ]
    },
    {
        xtype: 'pagingtoolbar',
        store: storeGridWithdraw, // same store GridPanel is using
        dock: 'bottom',
        displayInfo: true
        // pageSize:20
    }],
    listeners: {
        render: {
            scope: this,
            fn: function(grid) {
                storeGridWithdraw.load();
            }
        } ,
        itemdblclick: function(dv, record, item, index, e) {
              
        }
    },
    height: panelH,
    autoWidth: true,
    // minHeight:500,
    //renderTo: 'content_div2'
});


function get_summary(){
    Ext.Ajax.request({
        url: SITE_URL + '/admin_panel/get_summary_invoice/',
        method: 'GET',
        params: {
            payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status']
        },
        success: function(form, action) {
            var d = Ext.decode(form.responseText);
            Ext.getCmp('total_amount_unpaid').setValue(d.total_amount_unpaid);
            Ext.getCmp('total_amount').setValue(d.total_amount);
            Ext.getCmp('avail_withdraw').setValue(d.avail_withdraw);
//            Ext.getCmp('total_withdraw').setValue(d.totalwithdraw);
            
            // Ext.Msg.alert('Informasi', d.message);
            // storeGrid.load();
        },
        failure: function(form, action) {
            Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
            Ext.MessageBox.hide();
        }
    });
}


});


</script>
