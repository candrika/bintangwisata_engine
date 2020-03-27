 <script type="text/javascript" src="{$assets_url}js/jquery-1.11.1.min.js"></script>
 <script type="text/javascript" src="{$base_url}assets/libs/pickadate.js/lib/picker.js"></script>
<script type="text/javascript" src="{$base_url}assets/libs/pickadate.js/lib/picker.date.js"></script>
<script type="text/javascript" src="{$base_url}assets/libs/pickadate.js/lib/picker.time.js"></script>
<script type="text/javascript" src="{$base_url}assets/libs/pickadate.js/lib/legacy.js"></script>
<link rel="stylesheet" type="text/css" href="{$base_url}assets/libs/pickadate.js/lib/themes/default.css">
<link rel="stylesheet" type="text/css" href="{$base_url}assets/libs/pickadate.js/lib/themes/default.date.css">



 <script type="text/javascript">


               jQuery(document).ready(function($) {
            $('#datepicker').pickadate({
              selectYears: true,
              selectMonths: true
            });

        });
          </script>

    <input id="datepicker"
          name=""
          type="text"
          placeholder="Try me">