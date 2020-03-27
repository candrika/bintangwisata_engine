<div class="row">
    <p>&nbsp;</p>
<div id="content_div2"></div>   
</div>
<script type="text/javascript">

Ext.onReady(function() {

var myMask = new Ext.LoadMask(Ext.getBody(), { msg:"Please wait..."} );
Ext.Ajax.on('beforerequest', myMask.show, myMask);
Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
Ext.Ajax.on('requestexception', myMask.hide, myMask);

var windowW = Ext.getBody().getViewSize().width; 

var windowH = Ext.getBody().getViewSize().height;
var panelH = windowH - 00;

Ext.define('GridModel', {
    extend: 'Ext.data.Model',
    fields: ['claim_id','order_id','no_claim','diajukan_oleh','hub_insured','alamat_pemohon','notlp_pemohon','nama_bank','no_rek','nama_rek','claim_type','claim_status','claim_type_name','claim_status_name','datein','no_claim_star','ready_to_star','notes_admin'],
    idProperty: 'id'
});

var StarForm = Ext.create('Ext.form.Panel', {
            // title: appname,
        bodyPadding: 5,
        url: SITE_URL + '/admin_panel/save_star_claim',
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
                    name: 'claim_id',
                    id: 'claim_id_star'
                },
                {
                    xtype: 'textfield',
                    id: 'no_claim_star',
                    name: 'no_claim_star',
                    fieldLabel: 'No Klaim Star',
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
                                    Ext.getCmp('StarForm').getForm().reset();
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

var windowStar = Ext.create('widget.window', {
    id: 'windowStar',
    // extend: 'Ext.window.Window',
    // alias: 'widget.FormPayment',
    title: 'No Klaim Star',
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

var storeGrid = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridModel',
    proxy: {
        type: 'ajax',
        url: SITE_URL + '/backend/ext_get_all/claim',
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
                 'extraparams': 'claim_status:' + Ext.getCmp('rg_claim_status').getValue()['claim_status'],
                startdate: Ext.getCmp('startdate').getSubmitValue(),
                enddate: Ext.getCmp('enddate').getSubmitValue(),
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

var loginform = Ext.create('Ext.form.Panel', {                    
        bodyPadding: 5,
        width: 350,
        // id:'loginid',
        layout: 'anchor',
        defaults: {
            anchor: '100%'
        },
        defaultType: 'textarea',
        items: [{
            fieldLabel: 'Catatan',
            height: 300,
            name: 'notes_admin',
            id:'notes_admin',
            allowBlank: false
        }]
        ,buttons: [
        {
            text: 'Batal',
            handler: function() {
                Ext.getCmp('windowUpdateClaim').hide();
            }
        },{
            text: 'Simpan',
            // disabled: true,
            handler: function() {
               Ext.MessageBox.show({
                        title: 'Ubah Status Klaim',
                        msg: 'Apakah anda yakin untuk mengubah status untuk klaim terpilih?',
                        buttons: Ext.MessageBox.OKCANCEL,
                        icon: Ext.MessageBox.WARNING,
                        fn: function(btn){
                            if(btn == 'ok'){
                               Ext.Ajax.request({
                                    url: SITE_URL + '/admin_panel/claim_update/',
                                    method: 'POST',
                                    params: {
                                        claim_id: Ext.getCmp('claim_id').getValue(),
                                        claim_status: Ext.getCmp('claim_status').getValue(),
                                        notes_admin: Ext.getCmp('notes_admin').getValue()
                                    },
                                    success: function(form, action) {
                                        var d = Ext.decode(form.responseText);
                                        Ext.Msg.alert('Informasi', d.message);

                                        Ext.getCmp('windowUpdateClaim').hide();
                                        Ext.getCmp('windowPopup').hide();
                                        
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
        }]
    });

var  windowUpdateClaim = Ext.create('Ext.Window', {
    id:'windowUpdateClaim',
    title: 'Ubah Status Klaim',
    width: 800,
    height: 400,
    plain: true,
    closable:false,
    // headerPosition: 'left',
    layout: 'fit',
    items:[loginform]
});

Ext.create('Ext.grid.Panel', {
    id:'gridOrder',
    title: 'Daftar Klaim',
    store: storeGrid,
    selModel: smGridSupplier,
    loadMask: true,
    columns: [{
            header: 'claim_id',
            dataIndex: 'claim_id',
            hidden: true
        },
        { header: 'No Klaim',  dataIndex: 'no_claim', minWidth: 150 },
        { header: 'No Klaim Star',  dataIndex: 'no_claim_star', minWidth: 150 },
        { header: 'Diajukan Oleh',  dataIndex: 'diajukan_oleh', minWidth: 150, flex:1 },
        { header: 'Tgl Klaim',  dataIndex: 'datein', minWidth: 150 },        
        { header: 'Tipe Klaim',  dataIndex: 'claim_type_name', minWidth: 150 },
        { header: 'Status Klaim',  dataIndex: 'claim_status_name', minWidth: 150 },
        { header: 'Siap Input Star',  dataIndex: 'ready_to_star', minWidth: 150,
            renderer: function(value) {
              if(value*1==1){
                return 'Sudah Siap';
              } else {
                return 'Belum Siap';
              }
            }
        },
        // { header: 'region_name_detail',  dataIndex: 'region_name_detail', minWidth: 150 },
        // { header: 'Premi',  dataIndex: 'total_premi', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Premi Perluasan',  dataIndex: 'total_perluasan', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Biaya Lain',  dataIndex: 'other_fee', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'Total Premi',  dataIndex: 'total_amount', minWidth: 150, xtype:'numbercolumn', align:'right' },
        // { header: 'status',  dataIndex: 'status', minWidth: 150 }
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
                fieldLabel: 'Periode',
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
            }, {
                        xtype:'hiddenfield',
                        name:'claim_id',
                        id:'claim_id'
                    },
        ]
    },{
        xtype: 'toolbar',
        dock: 'top',
        items: [
            {
                xtype: 'radiogroup',
                fieldLabel: 'Status Klaim',
                id:'rg_claim_status',
                items: [
                    { boxLabel: 'Open', name: 'claim_status', inputValue: 1, checked: true , width:70},
                    { boxLabel: 'Settle', name: 'claim_status', inputValue: 2 , width:70 },
                    { boxLabel: 'Accepted/Paid', name: 'claim_status', inputValue: 3, width:120},
                    { boxLabel: 'Rejected', name: 'claim_status', inputValue: 4 , width:80 }
                ],
                listeners: {
                change: function (field, newValue, oldValue) {
                        storeGrid.load();
                    }
                }
            },
           '->',
            {
                text: 'Ekspor Data',
                hidden:true,
                listeners: {
                    click: function (component) {
                        if(Ext.getCmp('startdate').getSubmitValue()=='' && Ext.getCmp('enddate').getSubmitValue()==''){
                            Ext.Msg.alert('Failure', 'Harap pilih periode terlebih dahulu');
                        } else {
                            window.location = SITE_URL + "/admin_panel/ekspor_klaim/" + Ext.getCmp('rg_claim_status').getValue()['claim_status'] + '/' + Ext.getCmp('startdate').getSubmitValue() + '/' + Ext.getCmp('enddate').getSubmitValue();
                        }
                        
                    }
                }
            },
            {
                id: 'btnPublishPolicy',
                hidden:true,
                text: 'Terbitkan Polis',
                iconCls: 'add-icon',
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
                                        url: SITE_URL + '/user_panel/view_claim/'+selectedRecord.data.order_id,
                                        method: 'GET',
                                        // params: {
                                        //     postdata: Ext.encode(selected),
                                        //     idmenu: 24
                                        // },
                                        success: function(form, action) {
                                            var d = Ext.decode(form.responseText);
                                            Ext.Msg.alert('Informasi', 'Polis telah berhasil diterbitkan');
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
                text: 'No Klaim Star',
                handler: function() {
                    Ext.getCmp('StarForm').getForm().reset();
                    // var grid = Ext.ComponentQuery.query('gridOrder')[0];
                    var grid = Ext.getCmp('gridOrder');
                    var selectedRecord = grid.getSelectionModel().getSelection()[0];
                    var data = grid.getSelectionModel().getSelection();
                    if (data.length == 0) {
                        Ext.Msg.alert('Failure', 'Pilih datanya terlebih dahulu!');
                    } else {
                        windowStar.show();
                        Ext.getCmp('no_claim_star').setValue(null);
                        Ext.getCmp('claim_id_star').setValue(selectedRecord.data.claim_id);

                        Ext.Ajax.request({
                            url: SITE_URL + '/admin_panel/get_star_claim/',
                            method: 'GET',
                            params: {
                                claim_id: selectedRecord.data.claim_id
                            },
                            success: function(form, action) {
                                var d = Ext.decode(form.responseText);
                                Ext.getCmp('no_claim_star').setValue(d.no_claim_star);
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
                                        url: SITE_URL + '/admin_panel/delete_claim',
                                        method: 'POST',
                                        params: {
                                            claim_id: selectedRecord.data.claim_id
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
            Ext.getCmp('claim_id').setValue(record.data.claim_id);
            
            if (!Ext.isDefined(Ext.getCmp('windowPopup'))) {

                Ext.create('Ext.window.Window', {
                    id:'windowPopup',
                    title: 'Pratinjau Klaim: '+record.data.no_claim,
                    modal: true,
                    width: panelW - 100,
                    height: panelH - 50,
                    items: [
                    
                    {
                        xtype: 'component',
                        html: '<iframe src="' + SITE_URL + '/user_panel/view_claim/' + record.data.claim_id + '/preview"  style="position: absolute; border: 0; top:0; left:0; right:0; bottom:0; width:100%; height:100%;"></iframe>',
                    }],
                    buttons: [
                    {
                        xtype:'hiddenfield',
                        name:'claim_status',
                        id:'claim_status'
                    },
                    {
                        xtype:'checkbox',
                        labelWidth:160,
                        id:'ready_to_star',
                        name:'ready_to_star',
                        fieldLabel:'Siap Dientri Pada Star',
                        value:1,
                        listeners: {
                            change: function(checkbox, newValue, oldValue, eOpts) {
                               console.log(newValue)
                               Ext.Ajax.request({
                                        url: SITE_URL + '/admin_panel/claim_update_star/',
                                        method: 'POST',
                                        params: {
                                            claim_id: Ext.getCmp('claim_id').getValue(),
                                            ready_to_star: newValue
                                        },
                                        success: function(form, action) {
                                            var d = Ext.decode(form.responseText);
                                            // Ext.Msg.alert('Informasi', d.message);

                                            storeGrid.load();
                                        },
                                        failure: function(form, action) {
                                            Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                            Ext.MessageBox.hide();
                                        }
                                    });
                            }
                        }
                    },'->',
                    {
                        text: 'Ubah Status',
                        id:'btnStatus',
                            menu      : [
                                { 
                                    text: 'Settle',
                                    handler: function() {
                                         windowUpdateClaim.show();
                                        // update_status(2,Ext.getCmp('claim_id').getValue());
                                        Ext.getCmp('notes_admin').setValue(record.data.notes_admin);
                                        Ext.getCmp('claim_status').setValue(2);
                                    } 
                                },
                                { 
                                    text: 'Accepted / Paid',
                                    handler: function() {
                                         windowUpdateClaim.show();
                                        // update_status(3,Ext.getCmp('claim_id').getValue());
                                        Ext.getCmp('notes_admin').setValue(record.data.notes_admin);
                                        Ext.getCmp('claim_status').setValue(3);
                                    }  
                                },
                                { 
                                    text: 'Rejected',
                                    handler: function() {
                                         windowUpdateClaim.show();
                                        // update_status(4,Ext.getCmp('claim_id').getValue());
                                        Ext.getCmp('notes_admin').setValue(record.data.notes_admin);
                                        Ext.getCmp('claim_status').setValue(4);
                                    }  
                                }
                            ]

                        // iconCls: 'print-icon',
                        // handler: function() {

                        // }
                    },{
                        hidden:true,
                        text: 'Print',
                        iconCls: 'print-icon',
                        handler: function() {
                            window.open(SITE_URL + 'user_panel/view_claim/' + selectedRecord.data.claim_id + '/print', '_blank');
                        }
                    }]
                }).show();
                        
                if(record.data.ready_to_star*1==0){
                    Ext.getCmp('ready_to_star').setValue(false);  
                } else {
                    Ext.getCmp('ready_to_star').setValue(true);  
                }
                
                

                if(record.data.claim_status*1==2){
                    Ext.getCmp('ready_to_star').setReadOnly(false);
                } else {
                    Ext.getCmp('ready_to_star').setReadOnly(true);
                }   

            } else {
                Ext.getCmp('windowPopup').show();
            }

              

                

                if(record.data.claim_status*1==3 || record.data.claim_status*1==4){
                    //accepted / rejected
                    // Ext.getCmp('btnStatus').disable();
                } else {
                     // Ext.getCmp('btnStatus').enable();
                }
        }
    },

    height: panelH,
    width: panelW,
    // minHeight:500,
    renderTo: 'content_div2'
});



function update_status(stat_num,claim_id){


        windowUpdateClaim.show();
    }
});
</script>
