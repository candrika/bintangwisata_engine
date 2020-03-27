<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
    <!-- // <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
    <script src="{$base_url}assets/libs/popper.min.js"></script>
    <script src="{$base_url}assets/libs/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote-bs4.js"></script>
<style type="text/css">
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){ background-color: #f2f2f2; }

#customers tr:hover { background-color: #ddd; }

#customers th {
	 font-weight: bold;
    padding-top: 6px;
    padding-bottom: 6px;
    text-align: center;
    background-color: #ffae44;
    color: white;
}

textarea {
    background-color: #FFF;
}
</style>

<section id="content"  style="background-color:#FFF;">
<div class="container">
	<!-- <center><h2> <i class="soap-icon-insurance circle"></i> {$title}</h2></center> -->
	<div class="col-sm-10 col-md-8 col-lg-10 no-float no-padding center-block block">
		<!-- <form class="login-form" id="form_claim"> -->

			<div class="col-md-14 no-float no-padding center-block">
                <div class="intro text-center block">
                    <h2>{$title}</h2>
                   
                </div>
                <form class="contact-form" action="{$site_url}/news/save" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="news_id" {if $d eq true } value="{$d.news_id}" {/if}>
                    <div class="row form-group">
                        <div class="col-xs-14">
                            <label>Judul Berita</label>
                            <input type="text" name="news_title" class="input-text full-width" {if $d eq true } value="{$d.news_title}" {/if}>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-xs-14">
                            <label>Keywords</label>
                            <input type="text" name="news_keyword" class="input-text full-width" {if $d eq true } value="{$d.news_keyword}" {/if}>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-xs-14">
                            <label>Gambar Berita</label>
                            <input type="file" name="news_image" class="input-text full-width">
                            {if $d eq true } <img src="{$base_url}upload/{$d.news_image}" width="200"> {/if}
                             
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-xs-14">
                            <label>Isi Berita Pendek</label>
<textarea rows="7" type="text" name="news_desc" class="input-text full-width" style="background-color: #f5f5f5;">{if $d eq true } {$d.news_desc}{/if}</textarea>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label>Isi Berita Panjang</label>
                        <textarea  id="summernote" name="news_content" rows="6" class="input-text full-width" placeholder="write news here"> {if $d eq true } {$d.news_content} {/if}</textarea>
                       <!-- <div class="col-xs-15"> -->
                      <!--   <textarea id="froala-editor" rows="25">Initialize the Froala WYSIWYG HTML Editor on a textarea.</textarea> -->
                    <!-- </div> -->
                    </div>
                    <button type="submit" class="row btn-large full-width">Terbitkan</button>
                </form>
            </div>

			<span id="loadingBtn" style="display:none;"><center><h1>Sedang Memproses...</h1></center></span>

			<!-- <button id="btnSubmitClaim" class="btn-large full-width yellow" style="display:block;">
			    Terbitkan
			    <i class="soap-icon-check circle"></i>
			</button> -->
		<br>

	<!-- </form> -->

	</div> 
</div> 
<center><h3><span id="msg"></h3></center>


<script type="text/javascript">
  $(function() {

      $('#summernote').summernote({
          height: 300,                 // set editor height
          minHeight: null,             // set minimum height of editor
          maxHeight: null,             // set maximum height of editor
        });
  	// $.FroalaEditor.DefineIcon('imageInfo', { NAME: 'info' });
   //  $.FroalaEditor.RegisterCommand('imageInfo', {
   //    title: 'Info',
   //    focus: false,
   //    undo: false,
   //    refreshAfterCallback: false,
   //    callback: function () {
   //      var $img = this.image.get();
   //      alert($img.attr('src'));
   //    }
   //  });

   //  $('textarea#froala-editor').froalaEditor({
   //    heightMin: 500,
   //    heightMax: 1200,
   //    imageEditButtons: ['imageDisplay', 'imageAlign', 'imageInfo', 'imageRemove']
   //  });
  });
</script>