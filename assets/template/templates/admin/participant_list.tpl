<script type="text/javascript">
    Ext.onReady(function() {

        var windowW = Ext.getBody().getViewSize().width;
        var panelW = windowW - 100;

        var windowH = Ext.getBody().getViewSize().height;
        var panelH = windowH - 140;

        Ext.define('GridModel', {
            extend: 'Ext.data.Model',
            fields: ['insured_id', 'user_id', 'country_id', 'birthdate', 'firstname', 'lastname', 'address', 'phone_number', 'city', 'province', 'dateregistered', 'email', 'country_name', 'zipcode'],
            idProperty: 'id'
        });

        var storeGrid = Ext.create('Ext.data.Store', {
            pageSize: 100,
            model: 'GridModel',
            proxy: {
                type: 'ajax',
                url: SITE_URL + '/backend/ext_get_all/participant',
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

        var smGridSupplier = Ext.create('Ext.selection.CheckboxModel', {
            allowDeselect: true,
            mode: 'MULTI',
            listeners: {
                deselect: function(model, record, index) {
                    var selectedLen = smGridSupplier.getSelection().length;
                    if (selectedLen == 0) {
                        Ext.getCmp('GridSupplierID').queryById('btnEdit').setDisabled(true);
                        Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(true);
                    }
                },
                select: function(model, record, index) {
                    Ext.getCmp('GridSupplierID').queryById('btnEdit').setDisabled(false);
                    Ext.getCmp('GridSupplierID').queryById('btnDelete').setDisabled(false);
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
            id: 'gridOrder',
            title: 'Daftar Peserta',
            store: storeGrid,
            selModel: smGridSupplier,
            loadMask: true,
            columns: [{
                    header: 'insured_id',
                    dataIndex: 'insured_id',
                    hidden: true
                },
                {
                    header: 'first name',
                    dataIndex: 'firstname',
                    minWidth: 150
                },
                {
                    header: 'last name',
                    dataIndex: 'lastname',
                    minWidth: 150
                },
                {
                    header: 'phone umber',
                    dataIndex: 'phone_number',
                    minWidth: 150
                },
                {
                    header: 'date registered',
                    dataIndex: 'dateregistered',
                    minWidth: 150
                },
                {
                    header: 'email',
                    dataIndex: 'email',
                    minWidth: 150
                },
                {
                    header: 'city',
                    dataIndex: 'city',
                    minWidth: 150
                },
                {
                    header: 'country name',
                    dataIndex: 'country_name',
                    minWidth: 150
                },
                {
                    header: 'zip code',
                    dataIndex: 'zipcode',
                    minWidth: 150
                }
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
                            fieldLabel: 'Tgl Terdaftar',
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
                            text: 'Ekspor Data',
                            listeners: {
                                click: function(component) {
                                    if (Ext.getCmp('startdate').getSubmitValue() == '' && Ext.getCmp('enddate').getSubmitValue() == '') {
                                        Ext.Msg.alert('Failure', 'Harap pilih periode terlebih dahulu');
                                    } else {
                                        window.location = SITE_URL + "/admin_panel/ekspor_participant/"+Ext.getCmp('startdate').getSubmitValue() + '/' + Ext.getCmp('enddate').getSubmitValue();
                                    }

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
                                                    url: SITE_URL + '/admin_panel/delete_insured',
                                                    method: 'POST',
                                                    params: {
                                                        insured_id: selectedRecord.data.insured_id
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
                }
            },
            height: panelH,
            autoWidth: true,
            // minHeight:500,
            renderTo: 'content_div'
        });

    });
</script>