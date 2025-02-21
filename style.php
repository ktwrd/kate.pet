<?php
require 'vendor/autoload.php';
use MatthiasMullie\Minify;
$sourcePath = 'css/style.css';
$minifier = new Minify\CSS($sourcePath);
$seconds_to_cache = 3600;
$ts = gmdate("D, d M Y H:i:s", time() + $seconds_to_cache) . " GMT";
header("Expires: $ts");
header("Pragma: cache");
header("Cache-Control: max-age=$seconds_to_cache");
header('Content-type: text/css; charset=UTF-8');

// NOTE update this when CSS styles have been changed.
header('Last-Modified: Fri, 21 2 2025 03:40:00 GMT');
echo $minifier->minify();