<script type="text/javascript">
    Ext.onReady(function() {

        var myMask = new Ext.LoadMask(Ext.getBody(), {
            msg: "Please wait..."
        });
        Ext.Ajax.on('beforerequest', myMask.show, myMask);
        Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
        Ext.Ajax.on('requestexception', myMask.hide, myMask);

        var windowW = Ext.getBody().getViewSize().width;
        var panelW = windowW - 100;

        var windowH = Ext.getBody().getViewSize().height;
        var panelH = windowH - 140;

        Ext.define('GridModel', {
            extend: 'Ext.data.Model',
            fields: ['user_id', 'username','password', 'email', 'firstname', 'lastname', 'address', 'dateregistered', 'user_type_name', 'city', 'province', 'zipcode'],
            idProperty: 'id'
        });

        var storeGrid = Ext.create('Ext.data.Store', {
            pageSize: 100,
            model: 'GridModel',
            proxy: {
                type: 'ajax',
                url: SITE_URL + '/backend/ext_get_all/user',
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
                    if (record.data.policy_no != '') {
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
            // title: appname,
            bodyPadding: 5,
            url: SITE_URL + '/admin_panel/user_save',
            width: 350,
            id: 'loginid',
            layout: 'anchor',
            defaults: {
                anchor: '100%'
            },
            defaultType: 'textfield',
            items: [{
                        xtype: 'hiddenfield',
                        name: 'user_id',
                        id: 'user_id'
                    },
                    {
                        xtype: 'textfield',
                        id: 'firstname',
                        name: 'firstname',
                        fieldLabel: 'firstname',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        id: 'lastname',
                        name: 'lastname',
                        fieldLabel: 'lastname',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'username',
                        fieldLabel: 'username',
                        allowBlank: false
                    },
                    {
                        xtype: 'textfield',
                        name: 'email',
                        fieldLabel: 'email',
                        allowBlank: false
                    },
                    // { inputType: 'password', name: 'password', fieldLabel: 'password', allowBlank: false },

                    {
                        fieldLabel: 'Password',
                        name: 'password',
                        allowBlank: false,
                        inputType: 'password'
                    },
                    {
                        xtype: 'textarea',
                        id: 'address',
                        name: 'address',
                        fieldLabel: 'address'
                    },
                    {
                        xtype: 'textfield',
                        name: 'city',
                        fieldLabel: 'city'
                    },
                    {
                        xtype: 'textfield',
                        name: 'province',
                        fieldLabel: 'province'
                    },
                    {
                        xtype: 'textfield',
                        name: 'zipcode',
                        fieldLabel: 'zipcode'
                    },
                    {
                        xtype: 'textfield',
                        name: 'city',
                        fieldLabel: 'city'
                    }
                ]

                // Reset and Submit buttons
                ,
            buttons: [{
                text: 'Batal',
                        handler: function() {
                            Ext.getCmp('windowUser').hide();
                        }
                    }, {
                        text: 'Kirim',
                        handler: function() {
                            if (loginform.isValid()) {
                                loginform.submit({
                                    success: function(form, action) {
                                        Ext.Msg.alert('Success', action.result.message);
                                        Ext.getCmp('windowUser').hide();
                                        storeGrid.load();
                                        loginform.getForm.reset();
                                    },
                                    failure: function(form, action) {
                                        Ext.Msg.alert('Failed', action.result ? action.result.message : 'No response');
                                        loginform.getForm.reset();
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

        // var windowUser = Ext.define('FormUser', {
        var windowUser = Ext.create('widget.window', {
            id: 'windowUser',
            // extend: 'Ext.window.Window',
            // alias: 'widget.FormUser',
            title: 'User Form',
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
            items: [loginform],
            listeners: {
                'show': function(FormUser) {
                    // Ext.getCmp('comboxsuppliertype').store.load();
                    // FormUser.getForm().findField('statusFormUser').setValue(FormUser.statusform);
                },
                'hide': function() {
                    // FormUser.getForm().reset();
                }

            }
        });


        Ext.create('Ext.grid.Panel', {
            id: 'gridOrder',
            title: 'Pengelolaan User',
            store: storeGrid,
            selModel: smGridSupplier,
            loadMask: true,
            columns: [{
                    header: 'user_id',
                    dataIndex: 'user_id',
                    hidden: true
                },
                {
                    header: 'email',
                    dataIndex: 'email',
                    minWidth: 150,
                    flex: 1
                },
                // { header: 'news Content',  dataIndex: 'news_content', minWidth: 150 },
                // { header: 'Berita Singkat',  dataIndex: 'news_desc', minWidth: 150 },
                {
                    header: 'username',
                    dataIndex: 'username',
                    minWidth: 200
                },
                {
                    header: 'firstname',
                    dataIndex: 'firstname',
                    minWidth: 200
                },
                {
                    header: 'lastname',
                    dataIndex: 'lastname',
                    minWidth: 150
                },
                {
                    header: 'address',
                    dataIndex: 'address',
                    minWidth: 150
                },
                {
                    header: 'city',
                    dataIndex: 'city',
                    minWidth: 150
                },
                {
                    header: 'province',
                    dataIndex: 'province',
                    minWidth: 150
                },
                {
                    header: 'zipcode',
                    dataIndex: 'zipcode',
                    minWidth: 150
                },
                {
                    header: 'dateregistered',
                    dataIndex: 'dateregistered',
                    minWidth: 150
                }
            ],
            dockedItems: [{
                    xtype: 'toolbar',
                    dock: 'top',
                    items: [{
                            text: 'Tambah User',
                            handler: function() {
                                windowUser.show();

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
                                    loginform.getForm().load({
                                        url: SITE_URL + '/backend/load_form/users',
                                        params: {
                                            key: 'user_id',
                                            value:selectedRecord.data.user_id
                                        },
                                        success: function(form, action) {
                                            var obj = Ext.decode(action.response.responseText); 
                                            // console.log(obj);
                                            // Ext.getCmp('comboxStatusMember').setValue(obj.data.status*1);
                                            // formdeliveryOrderGrid.getForm().findField("id_member_type").setValue(obj.data.id_member_type);
                                            // formdeliveryOrderGrid.getForm().findField("marital_status").setValue(obj.data.marital_status*1);
                                            // Ext.Msg.alert("Load failed", action.result.errorMessage);
                                        },
                                        failure: function(form, action) {
                                            Ext.Msg.alert("Load failed", action.result.errorMessage);
                                        }
                                    })
                                    windowUser.show();
                                    // window.location = "{$site_url}/admin_panel/news_edit/"+selectedRecord.data.news_id;
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
                                   Ext.Msg.show({
                                       title: 'Confirm',
                                       msg: 'Delete Selected ?',
                                       buttons: Ext.Msg.YESNO,
                                       fn: function(btn) {
                                           if (btn == 'yes') {
                                               // var grid = Ext.ComponentQuery.query('GridHistoryPembayaranSiswa')[0];
                                               var sm = grid.getSelectionModel();
                                               selected = [];
                                               Ext.each(sm.getSelection(), function(item) {
                                                   selected.push(item.data[Object.keys(item.data)[0]]);
                                               });
                                               Ext.Ajax.request({
                                                   url: SITE_URL + '/backend/ext_delete/user',
                                                   method: 'POST',
                                                   params: { postdata: Ext.encode(selected) }
                                               });
                                               storeGrid.load();
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
                    // Ext.create('Ext.window.Window', {
                    //     title: 'Pratinjau Order Nomor: '+record.data.order_no,
                    //     modal: true,
                    //     width: panelW - 100,
                    //     height: panelH - 50,
                    //     items: [{
                    //         xtype: 'component',
                    //         html: '<iframe src="' + SITE_URL + '/order/form/' + record.data.order_id + '/preview"  style="position: absolute; border: 0; top:0; left:0; right:0; bottom:0; width:100%; height:100%;"></iframe>',
                    //     }],
                    //     buttons: [{
                    //         hidden:true,
                    //         text: 'Print',
                    //         iconCls: 'print-icon',
                    //         handler: function() {
                    //             window.open(SITE_URL + 'purchase/print_invoice/' + selectedRecord.data.goods_receipt_id + '/print', '_blank');
                    //         }
                    //     }]
                    // }).show();
                }
            },
            height: panelH,
            autoWidth: true,
            // minHeight:500,
            renderTo: 'content_div'
        });

    });
</script>