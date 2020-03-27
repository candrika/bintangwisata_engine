<section id="content"  style="background-color:#FFF;">
    <div class="container">
        <div class="col-sm-10 col-md-8 col-lg-10 no-float no-padding center-block block">
            <h1>{$title_msg}</h1>
            <div class="row">

                <div class="col-md-9">
                     {if $type eq 'notice'}
                          <div class="alert alert-notice">
                               {$content_msg}
                               <!--  <span class="close"></span>
                                <button onclick="goBack()">Go Back</button> -->
                            </div>
                    {else if $type eq 'success'}
                            <div class="alert alert-success">
                               {$content_msg}
                                <!-- <span class="close"></span> -->
                            </div>
                    {else}
                            <div class="alert alert-info" style="font-weight:bold;">
                               {$content_msg}
                                <!-- <span class="close"></span> -->
                            </div>
                    {/if}
                  
                </div>
            </div>
        </div>
</div>
</section>