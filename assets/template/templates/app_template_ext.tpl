<!DOCTYPE html>
<html>
<head>
  <title>{$site_title}</title>
  <script type="text/javascript">
  var SITE_URL = '{$site_url}';
  </script>
  <script src='{$base_url}/assets/js/ext/ext-all.js'></script>
  <script src='{$base_url}/assets/js/ext/ext-theme-neptune.js'></script>
  <script src='{$base_url}/assets/js/SearchField4.js'></script>
  <link href="{$base_url}/assets/js/ext/resources/css/ext-all-neptune.css" rel="stylesheet">
</head>
   <body >
      {include file="$content_tpl"}
      <div id="content_div"></div>
   </body>
</html>