Ext.define('GridItemGridDetailImportModel', {
    extend: 'Ext.data.Model',
    fields: ['sku_no', 'nameinventory', 'invno', 'hpp', 'notes', 'idinventory', 'cost', 'stock_one', 'uom_one', 'stock_two', 'uom_two', 'stock_tre', 'uom_tre', 'warehouse_code', 'no_batch', 'received_date', 'ratio_two', 'ratio_tre'],
    // ],
    idProperty: 'id'
});

var storeGridItemGridDetailImport = Ext.create('Ext.data.Store', {
    pageSize: 100,
    model: 'GridItemGridDetailImportModel',
    //remoteSort: true,
    // autoload:true,
    proxy: {
        type: 'ajax',
        // url: SITE_URL + 'backend/ext_get_all/InventoryAll/inventory/',
        url: SITE_URL + 'inventory/get_detail_item',
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
            header: 'idinventory',
            dataIndex: 'idinventory',
            hidden: true
        },
        {
            header: 'No SKU',
            dataIndex: 'sku_no',
            minWidth: 220,
            hidden: true,
        },
        {
            header: 'No Barang',
            dataIndex: 'invno',
            minWidth: 120
        },
        {
            header: 'Stock',
            xtype: 'numbercolumn',
            minWidth: 120,
            align: 'right',
            dataIndex: 'stock_one',
        },
        {
            header: 'Satuan',
            dataIndex: 'uom_one',
            // dataIndex: 'satuan_pertama',
            minWidth: 100
        },
        {
            header: 'Ratio #2',
            xtype: 'numbercolumn',
            minWidth: 120,
            align: 'right',
            dataIndex: 'ratio_two',
        },
        {
            header: 'Stock #2',
            xtype: 'numbercolumn',
            minWidth: 120,
            align: 'right',
            dataIndex: 'stock_two',
        }
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

            // var formAgama = Ext.create('formAgama');
            //            var formItemGridDetailInventory = Ext.getCmp('formItemGridDetailInventory');
            //            wItemGridDetailInventory.show();
            //
            //            formItemGridDetailInventory.getForm().load({
            //                url: SITE_URL + 'backend/loadFormData/ItemGridDetailInventory/1/setup',
            //                params: {
            //                    extraparams: 'a.idtax:' + record.data.idtax
            //                },
            //                success: function(form, action) {
            //                    // Ext.Msg.alert("Load failed", action.result.errorMessage);
            //                },
            //                failure: function(form, action) {
            //                    Ext.Msg.alert("Load failed", action.result.errorMessage);
            //                }
            //            })
            //
            ////            
            ////            Ext.getCmp('kddaerahS').setReadOnly(true);
            //            Ext.getCmp('statusformItemGridDetailInventory').setValue('edit');
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
    height: sizeH - 100,
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