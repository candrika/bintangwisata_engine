<link id="main-style" rel="stylesheet" href="{$base_url}assets/expresstable/style.css">

<section id="content" class="gray-area ">



<div class="container  pricing-table white box" style="padding:25px;">

                <h1>Internasional</h1>
                <h3>Regional 1</h3>
                <div class="row block">
                        <table id="box-table-b" summary="Most Favorit Movies" style="width:95%">
                            <thead>
                                <tr>
                                    <th scope="col" colspan="1">Jangka Waktu Pertanggungan</th>
                                    <th scope="col" colspan="3">Gold</th>
                                    <th scope="col" colspan="3">Platinum</th>
                                    <th scope="col" colspan="3">Diamond</th>
                                </tr>
                                <tr>
                                    <th scope="col"> </th>
                                    <th scope="col">Single</th>
                                    <th scope="col">Duo</th>
                                    <th scope="col">Family</th>

                                    <!-- <th scope="col"> </th> -->
                                    <th scope="col">Single</th>
                                    <th scope="col">Duo</th>
                                    <th scope="col">Family</th>

                                    <!-- <th scope="col"> </th> -->
                                    <th scope="col">Single</th>
                                    <th scope="col">Duo</th>
                                    <th scope="col">Family</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr> 
                                    <td>1-4 Hari</td>
                                     {foreach $satu as $p}
                                            <td>{$p.price}</td>
                                    {/foreach}
                                </tr>
                            </tbody>
                        </table>
                </div>

                <h3>Regional 2</h3>
                <div class="row block">
                    
                </div>

                <h3>Regional 3</h3>
                <div class="row block">
                  
                </div>

                <h1>Domestik</h1>
                <div class="row block">
                   
                </div>
            </div>
        </section>