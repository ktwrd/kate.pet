<?php

$smarty->assign('page_body', formatMarkdown(file_get_contents(K_WEB_ROOT . '/pages/about.md')));
