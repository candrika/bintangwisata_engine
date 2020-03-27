<div class="block">
                    <div class="row">

                        <div class="col-md-12">
                            <br>
                            <h2>Selamat Datang {$data.intermediary_legal_name}</h2>
                            <!-- <img src="http://placehold.it/570x200" alt="" width="570" height="200" style="width: 100%; height: auto;"> -->
                            <div class="tab-container trans-style" style="margin-top:20px;">
                                <ul class="tabs">
                                    <li class="active"><a href="#family1" data-toggle="tab"><i class="fa fa-male"></i>Profil</a></li>
                                    <li><a href="#family2" data-toggle="tab"><i class="fa fa-male"></i>Sub Agen</a></li>
                                    <li><a href="#family3" data-toggle="tab"><i class="fa fa-heart"></i>Daftar Peserta</a></li>
                                    <li><a href="#honeymoon1" data-toggle="tab"><i class="fa fa-heart"></i>Single Order</a></li>
                                    <!-- <li><a href="#weekends1" data-toggle="tab"><i class="fa fa-smile-o"></i>Invoice</a></li> -->
                                    <!-- <li><a href="#friends1" data-toggle="tab"><i class="fa fa-user"></i>Klaim</a></li> -->
                                </ul>
                                <div class="tab-content tab-content col-sm-10">
                                    <div class="tab-pane fade in active" id="family1">
                                        <!-- <h4>Profil</h4> -->
                                        {include file="intermediary/intermediary_profile.tpl"}
                                    </div>
                                    <div class="tab-pane fade" id="family2">
                                        <!-- <h4>Sub Agent</h4> -->
                                        {include file="intermediary/subintermediary_list.tpl"}
                                    </div>
                                    <div class="tab-pane fade" id="family3">
                                        <!-- <h4>Agent Participant</h4> -->
                                        {include file="intermediary/agent_participant.tpl"}
                                        <!--  -->       
                                        </div>
                                    <div class="tab-pane fade" id="honeymoon1">
                                        <!-- <h4>Honey Moon</h4> -->
                                       {include file="intermediary/intermediary_order.tpl"}
                                    </div>
                                    <!-- <div class="tab-pane fade" id="honeymoon2"> -->
                                        <!-- <h4>Honey Moon</h4> -->
                                       <!-- {include file="intermediary/intermediary_batch_order.tpl"} -->
                                    <!-- </div> -->
                                   <!--  <div class="tab-pane fade" id="weekends1">
                                        <h4>Weekends</h4>
                                    </div> -->
                                    <div class="tab-pane fade" id="friends1">
                                        <h4>Friends</h4>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>