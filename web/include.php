<?php
@define('K_WEB_ROOT', dirname(__FILE__));
@define('CFG_UTTERANCES_REPO', 'ktwrd/kate.pet');

if (!headers_sent())
    header('Content-type: text/html; charset=UTF-8');

date_default_timezone_set('Australia/Perth');

global $smarty;
global $kapp;
global $config;
if (file_exists(K_WEB_ROOT . '/include.config.php')) {
    require_once(K_WEB_ROOT . '/include.config.php');
}
require_once(K_WEB_ROOT . '/include.markdown.php');
require_once(K_WEB_ROOT . '/include.functions.php');

if (!isset($skipWebsite))
{
    if (!isset($smarty))
        $smarty = createSmarty();
    if (!isset($kweb))
        $kapp = createKApp();

    $base_domain = 'kate.pet';
    $smarty->assign('DOMAIN', $base_domain);

    $DOMAIN = 'http://' . $base_domain;
}

?>