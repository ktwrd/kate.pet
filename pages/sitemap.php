<?php
header("Content-Type: text/plain");
foreach (getAllBlogPosts() as $b)
{
    echo "https://kate.pet/blog/" . $b['id'] . "\n";
}

$filenameExclude = array(
    'sitemap',
    'error',
    'since'
);
foreach (scandir(K_WEB_ROOT . "/pages/") as $p)
{
    if (str_ends_with($p, '.php')) {
        $pn = pathinfo($p)['filename'];
        if (!in_array($pn, $filenameExclude)) {
            echo "https://kate.pet/p/" . $pn . "\n";
        }
    }
}