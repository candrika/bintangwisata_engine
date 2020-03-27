<script type="text/javascript">
    Ext.onReady(function() {

        var windowW = Ext.getBody().getViewSize().width;
        var panelW = windowW - 100;

        var windowH = Ext.getBody().getViewSize().height;
        var panelH = windowH - 140;

        
        ////WINDOW IMPORT
        Ext.define('GridItemGridDetailImportModel', {
            extend: 'Ext.data.Model',
            fields: ['order_id','startdate','import_id','enddate','order_date','payment_date','payment_channel_id','payment_amount','datein','depart_name','dest_name','category','type','currency_name','region_name','region_name_detail','birthdate','firstname','lastname','address','phone_number','city','province','dateregistered','order_no','email','country_name','zipcode','gender','status','total_amount','total_perluasan','total_premi','other_fee','no_reference','policy_no','policy_no_star','subtotal_premi','payment_fee'],
            idProperty: 'id'
        });

        var storeGridItemGridDetailImport = Ext.create('Ext.data.Store', {
            pageSize: 100,
            model: 'GridItemGridDetailImportModel',
            //remoteSort: true,
            // autoload:true,
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
                property: 'received_date',
                direction: 'ASC'
            }]
        });

        // storeGridItemGridDetailImport.on('beforeload',function(store, operation,eOpts){
        //         operation.params={
        //                     'extraparams': 'b.namesupplier:'+Ext.getCmp('supplierPurchase').getValue()
        //                   };
        //               });

        Ext.define('MY.searchGridItemGridDetailImport', {
            extend: 'Ext.ux.form.SearchField',
            alias: 'widget.searchGridItemGridDetailImport',
            store: storeGridItemGridDetailImport,
            width: 180
        });

        var smGridItemGridDetailImport = Ext.create('Ext.selection.CheckboxModel', {
            allowDeselect: true,
            mode: 'SINGLE',
            listeners: {
                deselect: function(model, record, index) {
                    var selectedLen = smGridItemGridDetailImport.getSelection().length;
                    if (selectedLen == 0) {
                        console.log(selectedLen);
                        Ext.getCmp('btnDeleteItemGridDetailInventory').disable();
                    }
                },
                select: function(model, record, index) {
                    Ext.getCmp('btnDeleteItemGridDetailInventory').enable();
                }
            }
        });

        Ext.define('GridItemGridDetailImport', {
            itemId: 'GridItemGridDetailImport',
            id: 'GridItemGridDetailImport',
            extend: 'Ext.grid.Panel',
            alias: 'widget.GridItemGridDetailImport',
            store: storeGridItemGridDetailImport,
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
                { header: 'status',  dataIndex: 'status', minWidth: 150 }
            ],
            dockedItems: [{
                xtype: 'toolbar',
                dock: 'top',
                items: [
                    '->',
                    'Pencarian: ', ' ',
                    {
                        xtype: 'searchGridItemGridDetailImport',
                        text: 'Left Button'
                    }

                ]
            }, {
                xtype: 'pagingtoolbar',
                store: storeGridItemGridDetailImport, // same store GridPanel is using
                dock: 'bottom',
                displayInfo: true
                    // pageSize:20
            }],
            listeners: {
                render: {
                    scope: this,
                    fn: function(grid) {
                        //                storeGridItemGridDetailImport.load();

                    }
                },
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
            }
        });

        Ext.define('windowGridDetailImport', {
            extend: 'Ext.window.Window',
            alias: 'widget.windowGridDetailImport',
            id: 'windowGridDetailImport',
            title: 'Import Data',
            header: {
                titlePosition: 2,
                titleAlign: 'center'
            },
            closable: true,
            autoDestroy: false,
            closeAction: 'hide',
            modal: true,
            width: panelW - 100,
            height: panelH - 100,
            layout: 'fit',
            border: false,
            items: [{
                xtype: 'GridItemGridDetailImport'
            }],
            listeners: {
                'close': function(win) {
                    // load_tmp_sales_return()
                },
                'hide': function(win) {
                    // load_tmp_sales_return()
                }
            }
        });

        var windowGridDetailImport = Ext.create('windowGridDetailImport');
        //END WINDOW IMPORT

        var formImportOrder = Ext.create('Ext.form.Panel', {
                id: 'formImportOrder',
                autoWidth: true,
                autoHeight: true,
                url: SITE_URL + '/import_order/process',
                bodyStyle: 'padding:5px',
                labelAlign: 'top',
                autoScroll: true,
                fieldDefaults: {
                    msgTarget: 'side',
                    blankText: 'Tidak Boleh Kosong',
                    labelWidth: 150
                    // width: 400
                },
                items: [
                {
                    xtype: 'filefield',
                    fieldLabel: 'File xlsx',
                    name: 'filexlsx',
                    // id: 'filexlsxImportPerencanaanXlsx',
                    anchor: '50%'
                },
                {
                    xtype:'button',
                    text: 'Download file template',
                    handler: function() {
                       window.location = "{$base_url}/assets/template_batch_order_jasindo.xlsx";
                    }
                },
                 Ext.panel.Panel({
                    // title:'Informasi',
                    html: '<br>Petunjuk Import Data Order:<br><li>Isi sesuai urutan kolom yang telah disediakan</li><li>Format tangal dd.mm.yyy (tanggal.bulan.tahun). Contoh 01.05.2015</li>'
                })],
                buttons: [
               '->',
                {
                    text: 'Batal',
                    handler: function() {
                        var win = Ext.getCmp('windowPopupImportOrder');
                        Ext.getCmp('formImportOrder').getForm().reset();
                        win.hide();
                    }
                }, {
                    text: 'Import',
                    handler: function() {
                        var msg = Ext.MessageBox.wait('Sedang memproses...');
                        var form = this.up('form').getForm();
                        if (form.isValid()) {
                                form.submit({
                                    success: function(form, action) {
                                        // msg.hide();
                                        var win = Ext.getCmp('windowPopupImportOrder');
                                        Ext.getCmp('formImportOrder').getForm().reset();
                                        Ext.Msg.alert('Import Data Order', action.result.message);
                                        win.hide();
                                        Ext.getCmp('gridOrder').getStore().load();
                                    },
                                    failure: function(form, action) {
                                        Ext.Msg.alert('Import Data Gagal', action.result ? action.result.message : 'No response');
                                        // msg.hide();
                        //                            storeGridSetupTax.load();
                                    }

                                });
                            } else {
                                Ext.Msg.alert("Error!", "Your form is invalid!");
                            }
                    }
                }]
        });

        var winImportOrder = Ext.create('widget.window', {
            id: 'windowPopupImportOrder',
            title: 'Import Data Order',
            header: {
                titlePosition: 2,
                titleAlign: 'center'
            },
            closable: true,
            closeAction: 'hide',
            autoWidth: true,
            modal:true,
            autoHeight: true,
            layout: 'fit',
            border: false,
            items: [formImportOrder]
        })

        Ext.define('GridModel', {
            extend: 'Ext.data.Model',
            fields: ['import_id','import_no','userin','datein','email','total_order','total_insured'],
            idProperty: 'id'
        });

        var storeGrid = Ext.create('Ext.data.Store', {
            pageSize: 100,
            model: 'GridModel',
            proxy: {
                type: 'ajax',
                url: SITE_URL + '/backend/ext_get_all/import_data',
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
                            startdate: Ext.getCmp('startdate').getSubmitValue(),
                            enddate: Ext.getCmp('enddate').getSubmitValue(),
                            // payment_status: Ext.getCmp('rg_payment_status').getValue()['payment_status']
                        }
                    }
            },
        });

        // var smGridSupplier = Ext.create('Ext.selection.CheckboxModel', {
        //     allowDeselect: true,
        //     mode: 'MULTI',
        //     listeners: {
        //         deselect: function(model, record, index) {
        //             var selectedLen = smGridSupplier.getSelection().length;
        //             if (selectedLen == 0) {
        //                 Ext.getCmp('GridSupplierID').queryById('btnEdit').setDisabled(true);
        //                 Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(true);
        //             }
        //         },
        //         select: function(model, record, index) {
        //             Ext.getCmp('GridSupplierID').queryById('btnEdit').setDisabled(false);
        //             Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(false);
        //         }
        //     }
        // });

        Ext.define('MY.searchGridSupplier', {
            extend: 'Ext.ux.form.SearchField',
            alias: 'widget.searchGridSupplier',
            store: storeGrid,
            width: 180
        });



        Ext.create('Ext.grid.Panel', {
            id: 'gridOrder',
            title: 'Import Data',
            store: storeGrid,
            // selModel: smGridSupplier,
            loadMask: true,
            columns: [{
                    header: 'No Import',
                    dataIndex: 'import_id',
                    minWidth: 150
                },
                {
                    header: 'import No',
                    dataIndex: 'import_no',
                    minWidth: 150,
                    hidden:true
                },
                {
                    header: 'Operator',
                    dataIndex: 'email',
                    minWidth: 150
                },
                {
                    header: 'Total Tertanggung',
                    dataIndex: 'total_insured',
                    minWidth: 150
                },
                {
                    header: 'Date Import',
                    dataIndex: 'datein',
                    flex:1,
                    minWidth: 150
                }
                // {
                //     header: 'Status',
                //     flex:1,
                //     dataIndex: 'status',
                //     minWidth: 150
                // }
            ],
            dockedItems: [{
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [{
                            itemId: 'btnAdd',
                            hidden: true,
                            text: 'Add',
                            iconCls: 'add-icon',
                            handler: function() {}
                        },
                        {
                            xtype: 'datefield',
                            id: 'startdate',
                            format: 'd-m-Y',
                            // value: datenow(),
                            fieldLabel: 'Tgl Import',
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
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [{
                            text: 'Import Data',
                            listeners: {
                                click: function(component) {
                                   winImportOrder.show();

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
                                        async: false,
                                        msg: 'Sistem akan menghapus semua data yang terkait dengan data peserta; pemesanan, klaim dan invoice. Pilih OK untuk melanjutkan menghapus data',
                                        buttons: Ext.MessageBox.OKCANCEL,
                                        icon: Ext.MessageBox.WARNING,
                                        fn: function(btn) {
                                            if (btn == 'ok') {
                                                // alert(Ext.getCmp('rg_payment_status').getValue()['payment_status'])
                                                Ext.Ajax.request({
                                                    url: SITE_URL + '/admin_panel/delete_import',
                                                    method: 'POST',
                                                    params: {
                                                        import_id: selectedRecord.data.import_id
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
                        }
                    ]
                },
                {
                    xtype: 'pagingtoolbar',
                    store: storeGrid, // same store GridPanel is using
                    dock: 'bottom',
                    displayInfo: true
                    // pageSize:20
                }
            ],
            listeners: {
                render: {
                    scope: this,
                    fn: function(grid) {
                        storeGrid.load();
                    }
                },
                itemdblclick: function(dv, record, item, index, e) {

                  windowGridDetailImport.show();

                  storeGridItemGridDetailImport.on('beforeload', function(store, operation, eOpts) {
                    operation.params = {
                      'import_id': record.data.import_id
                    };
                  });

                  storeGridItemGridDetailImport.load();
                }
            },
            height: panelH,
            autoWidth: true,
            // minHeight:500,
            renderTo: 'content_div'
        });

    });
</script>