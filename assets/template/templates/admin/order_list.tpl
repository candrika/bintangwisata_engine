
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
    fields: ['order_id','startdate','import_id','enddate','order_date','payment_date','payment_channel_id','payment_amount','datein','depart_name','dest_name','category','type','currency_name','region_name','region_name_detail','birthdate','firstname','lastname','address','phone_number','city','province','dateregistered','order_no','email','country_name','zipcode','gender','status','total_amount','total_perluasan','total_premi','other_fee','no_reference','policy_no','policy_no_star','subtotal_premi','payment_fee'],
    idProperty: 'id'
});

var storeGrid = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModel',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/order',
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
                payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status'],
                startdate: Ext.getCmp('startdate').getSubmitValue(),
                enddate: Ext.getCmp('enddate').getSubmitValue(),
            }
        }
    },
});

// storeGrid.on('beforeload', function(store, operation, eOpts) {
//     operation.params = {
//         'startdate': Ext.getCmp('startdate').getValue(),
//         'enddate': Ext.getCmp('enddate').getValue(),
//     };
// });

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
            Ext.getCmp('btnResendPolicy').hide();
            if(record.data.status!='Awaiting Payment' && record.data.status!='Payment Confirmed'){
                 // Ext.getCmp('btnPublishPolicy').setDisabled(false);
                 Ext.getCmp('btnConfirmPayment').setDisabled(true);
            } else {
                 Ext.getCmp('btnPublishPolicy').setDisabled(true);
                 Ext.getCmp('btnConfirmPayment').setDisabled(false);
            }

            if(record.data.policy_no!='' && record.data.policy_no!=null){
                 Ext.getCmp('btnResendPolicy').show();
                 Ext.getCmp('btnPublishPolicy').hide();
            } else {
                Ext.getCmp('btnPublishPolicy').show();
                 // Ext.getCmp('btnPublishPolicy').setDisabled(false);
            }
            // console.log(record)
           
            // Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(false);

            if(record.data.status=='Paid'){
                Ext.getCmp('btnPublishPolicy').setDisabled(false);
            }
        }
    }
});

Ext.define('MY.searchGridSupplier', {
    extend: 'Ext.ux.form.SearchField',
    alias: 'widget.searchGridSupplier',
    store: storeGrid,
    width: 180
});

var StarForm = Ext.create('Ext.form.Panel', {
            // title: appname,
        bodyPadding: 5,
        url: SITE_URL + '/admin_panel/save_star',
        width: 550,
        id: 'StarForm',
        layout: 'anchor',
        defaults: {
            anchor: '100%',
            labelWidth:200
        },
        defaultType: 'textfield',
        items: [{
                    xtype: 'hiddenfield',
                    name: 'order_id',
                    id: 'order_id_star'
                },
                {
                    xtype: 'textfield',
                    id: 'policy_no_star',
                    name: 'policy_no_star',
                    fieldLabel: 'No Polis Star',
                    allowBlank: false
                }
                ],
        buttons: [{
            text: 'Batal',
                    handler: function() {
                        Ext.getCmp('windowStar').hide();
                    }
                }, {
                    text: 'Simpan',
                    handler: function() {
                        if (StarForm.isValid()) {
                            StarForm.submit({
                                success: function(form, action) {
                                    Ext.Msg.alert('Success', action.result.message);
                                    Ext.getCmp('windowStar').hide();
                                    storeGrid.load();
                                    // Ext.getCmp('StarForm').getForm.reset();
                                },
                                failure: function(form, action) {
                                    Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                    StarForm.getForm.reset();
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


var PaymentForm = Ext.create('Ext.form.Panel', {
            // title: appname,
        bodyPadding: 5,
        url: SITE_URL + '/admin_panel/payment_save',
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
                    name: 'payment_id',
                    id: 'payment_id'
                },
                {
                    xtype: 'hiddenfield',
                    name: 'order_id',
                    id: 'order_id'
                },
                Ext.define('comboxPaymentChannel', {
                    extend: 'Ext.form.ComboBox',
                    labelWidth:200,
                    alias: 'widget.comboxPaymentChannel',
                    fieldLabel: 'Channel Pembayaran',
                    displayField: 'text',
                    valueField: 'value',
                    name: 'payment_channel_id',
                    id: 'payment_channel_id',
                    editable: false,
                    triggerAction: 'all',
                    // store: storeProductGrade
                    store: new Ext.data.ArrayStore({
                        fields: ['value', 'text'],
                        data: [
                            [1, 'ATM Transfer'],
                            [2, 'Internet Banking'],
                            [3, 'Setor'],
                            [4, 'Lainnya']
                        ]
                    })
                }),
                {
                    xtype: 'textfield',
                    readOnly:true,
                    id: 'amount',
                    name: 'amount',
                    fieldLabel: 'Jumlah Pembayaran',
                    allowBlank: false
                },
                {
                    xtype: 'datefield',
                    id: 'date_payment',
                    name: 'date_payment',
                    format: 'd/m/Y',
                    fieldLabel: 'Tanggal Pembayaran',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    name: 'dest_bank',
                    fieldLabel: 'Bank Tujuan',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    name: 'account_name',
                    fieldLabel: 'Nama Rekening Pengirim',
                    allowBlank: false
                },
                {
                    xtype: 'textfield',
                    name: 'bank_name',
                    fieldLabel: 'Nama Bank Pengirim',
                    allowBlank: false
                },
                {
                    fieldLabel: 'No Order',
                    readOnly:true,
                    xtype: 'textfield',
                    name: 'no_order',
                    id: 'no_order',
                    allowBlank: false
                },
                {
                    xtype: 'textarea',
                    id: 'notes',
                    name: 'notes',
                    fieldLabel: 'Keterangan'
                },
                {
                    xtype: 'filefield',
                    emptyText: 'Format file (pdf,gif,jpg,png)',
                    fieldLabel: 'Bukti Transaksi',
                    name: 'file_doc',
                    buttonText: 'Pilih File',
                    // buttonConfig: {
                    //     iconCls: 'laporan-icon'
                    // }
                },
                Ext.define('comboxPaymentStatus', {
                    extend: 'Ext.form.ComboBox',
                    labelWidth:200,
                    alias: 'widget.comboxPaymentStatus',
                    fieldLabel: 'Status',
                    displayField: 'text',
                    valueField: 'value',
                    allowBlank:false,
                    name: 'status',
                    id: 'status',
                    editable: false,
                    triggerAction: 'all',
                    // store: storeProductGrade
                    store: new Ext.data.ArrayStore({
                        fields: ['value', 'text'],
                        data: [
                            [1, 'Confirmed'],
                            [2, 'Paid']
                        ]
                    })
                }),
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
                        if (PaymentForm.isValid()) {
                            PaymentForm.submit({
                                success: function(form, action) {
                                    Ext.Msg.alert('Success', action.result.message);
                                    Ext.getCmp('windowPayment').hide();
                                    storeGrid.load();
                                    // Ext.getCmp('PaymentForm').getForm.reset();
                                },
                                failure: function(form, action) {
                                    Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                    PaymentForm.getForm.reset();
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

var windowStar = Ext.create('widget.window', {
    id: 'windowStar',
    // extend: 'Ext.window.Window',
    // alias: 'widget.FormPayment',
    title: 'No Polis Star',
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
    items: [StarForm],
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
    title: 'Daftar Pemesanan',
    store: storeGrid,
    selModel: smGridSupplier,
    loadMask: true,
    columns: [{
            header: 'order_id',
            dataIndex: 'order_id',
            hidden: true
        },
        { header: 'Order No',  dataIndex: 'order_no', minWidth: 150 },
        // { header: 'Reference No',  dataIndex: 'no_reference', minWidth: 150 },
        { header: 'No Import',  dataIndex: 'import_id', minWidth: 150 },
        { header: 'No Polis',  dataIndex: 'policy_no', minWidth: 150 },
        { header: 'No Polis Star',  dataIndex: 'policy_no_star', minWidth: 150 },
        { header: 'Nama Depan',  dataIndex: 'firstname', minWidth: 150 },
        { header: 'Nama Belakang',  dataIndex: 'lastname', minWidth: 150 },
        { header: 'Tgl Mulai',  dataIndex: 'startdate', minWidth: 150 },
        { header: 'Tgl AKhir',  dataIndex: 'enddate', minWidth: 150 },
        { header: 'Tgl Pesan',  dataIndex: 'order_date', minWidth: 150 },
        { header: 'Kategori',  dataIndex: 'category', minWidth: 150 },
        { header: 'Tipe',  dataIndex: 'type', minWidth: 150 },
        { header: 'region_name_detail',  dataIndex: 'region_name_detail', minWidth: 150 },
        // { header: 'Premi',  dataIndex: 'total_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Premi Perluasan',  dataIndex: 'total_perluasan', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Biaya Lain',  dataIndex: 'other_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Total Premi',  dataIndex: 'total_amount', minWidth: 150, xtype:'numbercolumn', align:'right' },

        { header: 'Premi',  dataIndex: 'total_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Premi Perluasan',  dataIndex: 'total_perluasan', minWidth: 150, xtype:'numbercolumn', align:'right' },        
        { header: 'Total Premi',  dataIndex: 'subtotal_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Biaya Lain',  dataIndex: 'other_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Biaya Transaksi',  dataIndex: 'payment_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'Total Pembayaran',  dataIndex: 'total_amount', minWidth: 150, xtype:'numbercolumn', align:'right' },
        { header: 'status',  dataIndex: 'status', minWidth: 150, hidden:true }
    ],
    dockedItems: [
    {
        xtype: 'toolbar',
        dock: 'top',
        items: [{
                xtype: 'datefield',
                id: 'startdate',
                format: 'd-m-Y',
                // value: datenow(),
                fieldLabel: 'Tanggal Pemesanan',
            },
            ' to ',
            {
                xtype: 'datefield',
                id: 'enddate',
                format: 'd-m-Y',
                // value: datenow(),
                hideLabel: true
                // fieldLabel: 'Date Order',
            },
            {
                text: 'Cari',
                handler: function() {
                    storeGrid.load();
                }
            }
        ]
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
                    { boxLabel: 'Unpaid', name: 'payment_status', inputValue: 1, checked: true , width:100},
                    { boxLabel: 'Paid', name: 'payment_status', inputValue: 2 , width:100 }
                ],
                listeners: {
                change: function (field, newValue, oldValue) {
                        storeGrid.load();
                    }
                }
            },'->',
            {
                text: 'Ekspor Data',
                listeners: {
                    click: function (component) {
                        if(Ext.getCmp('startdate').getSubmitValue()=='' && Ext.getCmp('enddate').getSubmitValue()==''){
                            Ext.Msg.alert('Failure', 'Harap pilih periode terlebih dahulu');
                        } else {
                            window.location = SITE_URL + "/admin_panel/ekspor_order/" + Ext.getCmp('rg_payment_status').getValue()['payment_status'] + '/' + Ext.getCmp('startdate').getSubmitValue() + '/' + Ext.getCmp('enddate').getSubmitValue();
                        }
                        
                    }
                }
            },
            {
                text: 'No Polis Star',
                handler: function() {
                    PaymentForm.getForm().reset();
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        windowStar.show();
                        Ext.getCmp('policy_no_star').setValue(null);
                        Ext.getCmp('order_id_star').setValue(selectedRecord.data.order_id);

                        Ext.Ajax.request({
                            url: SITE_URL + '/admin_panel/get_star/',
                            method: 'GET',
                            params: {
                                order_id: selectedRecord.data.order_id
                            },
                            success: function(form, action) {
                                var d = Ext.decode(form.responseText);
                                Ext.getCmp('policy_no_star').setValue(d.policy_no_star);
                                // Ext.Msg.alert('Informasi', d.message);
                                // storeGrid.load();
                            },
                            failure: function(form, action) {
                                Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                Ext.MessageBox.hide();
                            }
                        });
                        
                    }
                }
            },
            {
                id: 'btnConfirmPayment',
                // hidden:true,
                text: 'Konfirmasi Pembayaran',
                // iconCls: 'add-icon',
                handler: function() {
                    PaymentForm.getForm().reset();
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        console.log(selectedRecord.data);
                        
                        Ext.getCmp('amount').setValue(selectedRecord.data.total_amount);
                        Ext.getCmp('no_order').setValue(selectedRecord.data.order_no);
                        Ext.getCmp('order_id').setValue(selectedRecord.data.order_id);

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
                                
                                // Ext.getCmp('comboxStatusMember').setValue(obj.data.status*1);
                                // formdeliveryOrderGrid.getForm().findField("id_member_type").setValue(obj.data.id_member_type);
                                // formdeliveryOrderGrid.getForm().findField("marital_status").setValue(obj.data.marital_status*1);
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
                        //         order_id: selectedRecord.data.order_id
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
            {
                id: 'btnPublishPolicy',
                text: 'Terbitkan Polis',
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
                            title: 'Penerbitan Polis',
                            async:false,
                            msg: 'Apakah anda yakin untuk menerbitkan untuk pemesanan terpilih?',
                            buttons: Ext.MessageBox.OKCANCEL,
                            icon: Ext.MessageBox.WARNING,
                            fn: function(btn){
                                if(btn == 'ok'){
                                    // alert(Ext.getCmp('rg_payment_status').getValue()['payment_status'])
                                   Ext.Ajax.request({
                                        url: SITE_URL + '/admin_panel/create_policy/'+selectedRecord.data.order_id,
                                        method: 'GET',
                                        // params: {
                                        //     postdata: Ext.encode(selected),
                                        //     idmenu: 24
                                        // },
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

                    // return false;

                  
                   
                }
            },
            {
                id: 'btnResendPolicy',
                hidden:true,
                text: 'Kirim Ulang Polis',
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
                            title: 'Penerbitan Polis',
                            async:false,
                            msg: 'Apakah anda yakin untuk menerbitkan untuk pemesanan terpilih?',
                            buttons: Ext.MessageBox.OKCANCEL,
                            icon: Ext.MessageBox.WARNING,
                            fn: function(btn){
                                if(btn == 'ok'){
                                    // alert(Ext.getCmp('rg_payment_status').getValue()['payment_status'])
                                   Ext.Ajax.request({
                                        url: SITE_URL + '/admin_panel/create_policy/'+selectedRecord.data.order_id,
                                        method: 'GET',
                                        // params: {
                                        //     postdata: Ext.encode(selected),
                                        //     idmenu: 24
                                        // },
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

                    // return false;

                  
                   
                }
            },
            {
                text: 'Hapus',
                handler: function() {
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        // console.log(selectedRecord.data.order_id);

                        Ext.MessageBox.show({
                            title: 'Menghapus Data',
                            async:false,
                            msg: 'Pilih OK untuk melanjutkan menghapus data',
                            buttons: Ext.MessageBox.OKCANCEL,
                            icon: Ext.MessageBox.WARNING,
                            fn: function(btn){
                                if(btn == 'ok'){
                                    // alert(Ext.getCmp('rg_payment_status').getValue()['payment_status'])
                                   Ext.Ajax.request({
                                        url: SITE_URL + '/admin_panel/delete_order',
                                        method: 'POST',
                                        params: {
                                            order_id: selectedRecord.data.order_id
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
            'Pencarian: ',
            ' ',
            {
                xtype: 'searchGridSupplier',
                text: 'Left Button',
            },
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
