<?php /* Smarty version Smarty-3.1.15, created on 2020-03-26 00:56:27
         compiled from "C:\xampp\htdocs\bintangw\assets\template\templates\shcedule_list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:1220882555e7bebf6411f44-99789501%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '8ef512650aae657af868ec8d4846880cd840082b' => 
    array (
      0 => 'C:\\xampp\\htdocs\\bintangw\\assets\\template\\templates\\shcedule_list.tpl',
      1 => 1585180583,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '1220882555e7bebf6411f44-99789501',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5e7bebf66e4a65_56346482',
  'variables' => 
  array (
    'data' => 0,
    'p' => 0,
    'site_url' => 0,
    'base_url' => 0,
    'i' => 0,
    'segment' => 0,
    'flight' => 0,
    'datetime' => 0,
    'date' => 0,
    'datetime1' => 0,
    'date1' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5e7bebf66e4a65_56346482')) {function content_5e7bebf66e4a65_56346482($_smarty_tpl) {?><style type="text/css">
#time{
    overflow: hidden;
    float: right;
    position: relative;
    left: 241px;
    top: -79px;
    margin-bottom: -37px;
}
#baggage{
    position: relative;
    width: 39px;
    left: 431px;
    top: -80px;
    margin-bottom: -20px;
}
#flight_logo{
    top: -36px;
    position: relative;
    /* top: 1px; */
    left: 10px;
}
#circle-hole{
    width: 12px;
    position: relative;
    top: -109px;
    float: right;
    left: 41px;
}
.form-group{
    margin-bottom: -77px;
}
.vertical-line{
    border: 1px solid;
    top: -144px;
    position: relative;
    height: 45px;
    width: 0;
    left: 200.5px;
    border-color: #e44d29;
    margin-bottom: -29px;
}
#circle-solid{
    width: 12px;
    position: relative;
    top: -111px;
    float: right;
    left: 41px;
    margin-bottom: -79px;
}
</style>
<section id="content" class="gray-area" style="margin-top:1%;">
            <div class="container">
                <div id="main">
                    <div class="booking-section travelo-box">
                       <!--  <nav style="margin-bottom: 40px;">
                                    <ol class="cd-multi-steps text-bottom count">
                                      <li class="visited"><a href="#0">Pilih Destinasi</a></li>
                                      <li class="current" ><a href="#0">Isi Form Pemesanan</a></li>
                                      <li class="current" ><a href="#0">Isi Form Pemesanan</a></li>
                                      <li><em>Pembayaran</em></li>
                                    </ol>
                                  </nav> -->
                        <div class="tab-content" style="width: 884px;/* width: 116px; */float: right;">
                            <div id="booking">
    
                                <div class="booking-history">
                                <!-- <?php if ($_smarty_tpl->tpl_vars['data']->value==true) {?> -->
                                    <?php if (isset($_smarty_tpl->tpl_vars['i'])) {$_smarty_tpl->tpl_vars['i'] = clone $_smarty_tpl->tpl_vars['i'];
$_smarty_tpl->tpl_vars['i']->value = 0; $_smarty_tpl->tpl_vars['i']->nocache = null; $_smarty_tpl->tpl_vars['i']->scope = 0;
} else $_smarty_tpl->tpl_vars['i'] = new Smarty_variable(0, null, 0);?>
                                    <?php  $_smarty_tpl->tpl_vars['p'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['p']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['data']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['p']->key => $_smarty_tpl->tpl_vars['p']->value) {
$_smarty_tpl->tpl_vars['p']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['p']->key;
?>
                                    <!-- <?php echo $_smarty_tpl->tpl_vars['p']->value->sumPrice;?>
 -->
                                        <div class="booking-info clearfix">
                                            <div class="date" id="<?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartDate;?>
"><input type="hidden" value="<?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartDate;?>
" id="dateInput">
                                                <label class="month"><?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartMonth;?>
</label>
                                                <label class="date"><?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartDate;?>
</label>
                                                <label class="day"><?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartDay;?>
</label>
                                            </div>
                                            <h4 class="box-title"><i class="icon soap-icon-plane-right takeoff-effect yellow-color circle"></i><a href="<?php echo $_smarty_tpl->tpl_vars['site_url']->value;?>
/order/order_info_page/" target="_parent">
                                                <?php echo $_smarty_tpl->tpl_vars['p']->value->jiOrigin;?>
<img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/search/to.png" alt="" style="width: 27px;";/> <?php echo $_smarty_tpl->tpl_vars['p']->value->jiDestination;?>


                                            </a> <small>
                                                <?php echo $_smarty_tpl->tpl_vars['p']->value->jiDepartTime;?>
<img src="" alt="" style="width: 12px;";/> <?php echo $_smarty_tpl->tpl_vars['p']->value->jiArrivalTime;?>
 
                                            </small><br><small>
                                            <!-- No Polis: <?php echo $_smarty_tpl->tpl_vars['p']->value->journeyReference;?>
 -->
                                        </small>
                                           <div class="box-title" id="time"><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/image/clock.png" alt="" style="width: 27px;";/>&nbsp;<a href=""><?php echo $_smarty_tpl->tpl_vars['p']->value->selisih;?>
</a></div>
                                            <div class="box-title" id="baggage"><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/image/bagasi.png" alt="" style="width: 27px;";/>&nbsp;<a href=""></a></div>
                                            <div class="form-group">
                                             <label>
                                             <a id="show_reg_form"><span class="skin-color" onclick="myFunction()">Detail</span></a>

                                             <div class="wrapper-collapse animate-fadeInUp">
                                                <div class="wrapper-detail">

                                             </label>
                                             </div>
                                          </div>
                                            <div id="wrapper-flight-details_<?php echo $_smarty_tpl->tpl_vars['i']->value++;?>
" /*style="display:none"*/>
                                                <div class="tixpoint-flight-details">
                                                    <div class="row">
                                                        <?php  $_smarty_tpl->tpl_vars['segment'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['segment']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['p']->value->segment; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['segment']->key => $_smarty_tpl->tpl_vars['segment']->value) {
$_smarty_tpl->tpl_vars['segment']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['segment']->key;
?>
                                                            <?php  $_smarty_tpl->tpl_vars['flight'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['flight']->_loop = false;
 $_smarty_tpl->tpl_vars['k'] = new Smarty_Variable;
 $_from = $_smarty_tpl->tpl_vars['segment']->value->flightDetail; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['flight']->key => $_smarty_tpl->tpl_vars['flight']->value) {
$_smarty_tpl->tpl_vars['flight']->_loop = true;
 $_smarty_tpl->tpl_vars['k']->value = $_smarty_tpl->tpl_vars['flight']->key;
?>
                                                                <div class="box-title" id="flight_logo"><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/maskapai/<?php echo $_smarty_tpl->tpl_vars['flight']->value->airlineCode;?>
.png">&nbsp;&nbsp;<?php echo $_smarty_tpl->tpl_vars['flight']->value->airlineCode;?>
&nbsp;<?php echo $_smarty_tpl->tpl_vars['flight']->value->flightNumber;?>

                                                                </div>
                                                                <div><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/circelawal.png"id="circle-hole"></div>
                                                                <div style="    position: relative;top: -113px;left: 221px;font-size: 11px;"><?php if (isset($_smarty_tpl->tpl_vars["datetime"])) {$_smarty_tpl->tpl_vars["datetime"] = clone $_smarty_tpl->tpl_vars["datetime"];
$_smarty_tpl->tpl_vars["datetime"]->value = explode("T",$_smarty_tpl->tpl_vars['flight']->value->fdDepartTime); $_smarty_tpl->tpl_vars["datetime"]->nocache = null; $_smarty_tpl->tpl_vars["datetime"]->scope = 0;
} else $_smarty_tpl->tpl_vars["datetime"] = new Smarty_variable(explode("T",$_smarty_tpl->tpl_vars['flight']->value->fdDepartTime), null, 0);?><?php echo $_smarty_tpl->tpl_vars['datetime']->value[1];?>
<br><?php if (isset($_smarty_tpl->tpl_vars["date"])) {$_smarty_tpl->tpl_vars["date"] = clone $_smarty_tpl->tpl_vars["date"];
$_smarty_tpl->tpl_vars["date"]->value = explode("-",$_smarty_tpl->tpl_vars['datetime']->value[0]); $_smarty_tpl->tpl_vars["date"]->nocache = null; $_smarty_tpl->tpl_vars["date"]->scope = 0;
} else $_smarty_tpl->tpl_vars["date"] = new Smarty_variable(explode("-",$_smarty_tpl->tpl_vars['datetime']->value[0]), null, 0);?><?php echo $_smarty_tpl->tpl_vars['date']->value[2];?>
-<?php echo $_smarty_tpl->tpl_vars['date']->value[1];?>
-<?php echo $_smarty_tpl->tpl_vars['date']->value[0];?>
</div>
                                                                <!-- /<div><?php echo $_smarty_tpl->tpl_vars['flight']->value->fdDestination;?>
</div> -->
                                                                <hr class="vertical-line">
                                                                <div><img src="<?php echo $_smarty_tpl->tpl_vars['base_url']->value;?>
/assets/img/circelakhir.png"id="circle-solid"></div>
                                                                <div style="    position: relative;top: -113px;left: 221px;font-size: 11px;"><?php if (isset($_smarty_tpl->tpl_vars["datetime1"])) {$_smarty_tpl->tpl_vars["datetime1"] = clone $_smarty_tpl->tpl_vars["datetime1"];
$_smarty_tpl->tpl_vars["datetime1"]->value = explode("T",$_smarty_tpl->tpl_vars['flight']->value->fdArrivalTime); $_smarty_tpl->tpl_vars["datetime1"]->nocache = null; $_smarty_tpl->tpl_vars["datetime1"]->scope = 0;
} else $_smarty_tpl->tpl_vars["datetime1"] = new Smarty_variable(explode("T",$_smarty_tpl->tpl_vars['flight']->value->fdArrivalTime), null, 0);?><?php echo $_smarty_tpl->tpl_vars['datetime1']->value[1];?>
<br><?php if (isset($_smarty_tpl->tpl_vars["date1"])) {$_smarty_tpl->tpl_vars["date1"] = clone $_smarty_tpl->tpl_vars["date1"];
$_smarty_tpl->tpl_vars["date1"]->value = explode("-",$_smarty_tpl->tpl_vars['datetime1']->value[0]); $_smarty_tpl->tpl_vars["date1"]->nocache = null; $_smarty_tpl->tpl_vars["date1"]->scope = 0;
} else $_smarty_tpl->tpl_vars["date1"] = new Smarty_variable(explode("-",$_smarty_tpl->tpl_vars['datetime1']->value[0]), null, 0);?><?php echo $_smarty_tpl->tpl_vars['date1']->value[2];?>
-<?php echo $_smarty_tpl->tpl_vars['date1']->value[1];?>
-<?php echo $_smarty_tpl->tpl_vars['date1']->value[0];?>
</div>
                                                                
                                                                <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                            </div>
                                            </h4>
                                            <dl class="info">
                                                <dt style="margin-left: 12px;text-align: center;font-size: 22pt;">Harga</dt>
                                                <dd style="margin-left: 15px;text-align: center;font-size: 15pt;">Rp.&nbsp;<?php echo $_smarty_tpl->tpl_vars['p']->value->sumPrice;?>
</dd>
                                                <button class="btn-mini status">Pilih</button>
                                                
                                            </dl>
                                        </div>
                                    <?php } ?>
                                <!-- <?php }?> -->
                                 
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
<script type="text/javascript">
    $("#wrapper-flight-details").hide();
    
    function myFunction() {
      var x = document.getElementById("wrapper-flight-details");
      
       if (x.style.display === "none") {
         x.style.display = "block";
       } else {
         x.style.display = "none";
       }
    }
</script><?php }} ?>
