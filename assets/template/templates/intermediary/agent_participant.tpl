<!-- <div class="modal" id="test">xxxx</div> -->
<div class="flight-list listing-style3 flight" style="font-size: 12px;">
	<div class="row" style="padding: 15px;">
                        <div class="col-sm-8 col-xs-12">
                            <!-- <h5>9 Columns</h5> -->
                             <button type="submit" class="btn-small sky-blue1" id="agent_participant_register">Pendaftaran Peserta Baru</button>
                        </div>
<!--                         <div class="col-sm-4 col-xs-12">
                           <div>
                                <h4>Pencarian</h4>
                                <form method="post">
                                    <div class="with-icon full-width">
                                        <input type="text" class="input-text full-width" placeholder="Cari nomor order atau nama..." style="margin-bottom: 0px;" id="search"> 
                                        <button class="icon green-bg white-color" id="click"><i class="soap-icon-search"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div> -->
                    </div>
 	<div class="row"> 
 		<div class=" table-responsive">
 		<table class="table table table-bordered details-wrapper" widht="20%" font="10px" id="sub_agent_list" style="border-radius=50%" id="tables">
			<thead class="thead">
				<td>Participant First Name</td>
				<td>Participant Last Name</td>
				<td>HandPhone No</td>
				<!-- <td>Phone No</td> -->
				<td>Email</td>
				<!-- <td>Agent Name</td> -->
				<td>Action</td>
			</thead>
			{foreach from=$agen_participant item=d}

				<tbody>
					<tr>	
						<td>{$d.firstname}</td>
						<td>{$d.lastname}</td>		
						<td>{$d.phone_number}</td>		
						<!-- <td>{$d.phone_number1}</td>		 -->
						<td>{$d.email}</td>		
						<!-- <td>{$d.intermediary_agent_name}</td>		 -->
						<td><a href="{$site_url}/intermediary/edit_agen_participant/{$d.insured_id}">Edit</a></td>		
					</tr>
				</tbody>
			{/foreach}
		</table>                    
 	</div>
 	</div>


</div>
<script type="text/javascript">
	jQuery(document).ready(function($){
		// $('#sub_agent_list').datatable();

		$('#agent_participant_register').on('click',function(){
			var x = document.getElementById("snackbar");
			x.className = "show";
			window.location = SITE_URL + '/intermediary/agen_participant_register';

		});

		// $("#tables").DataTable();

		// $('#click').on('click',function(e){
		// 	alert('xxxxxxxx');
		// 	$('.tab-pane fade').add('.active in');
		// 	e.preventDefault();
		// 	$.ajax({
		// 		method:'POST',
		// 		url:SITE_URL + 'intermediary/profile_intermediary',
		// 		data:{
		// 			params:$('#search').val()
		// 		},success:function (data) {
		// 			// body...
		// 		},failure:function(data){

		// 		}
		// 	})
		// })
	})
</script>