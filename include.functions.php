<?php

require_once(K_WEB_ROOT . '/include.markdown.php');
function createSmarty()
{
    require_once(K_WEB_ROOT . '/smarty/libs/Smarty.class.php');

    $smarty = new Smarty();
    $smarty->setTemplateDir(K_WEB_ROOT . '/templates');
    $smarty->setCompileDir('/tmp/smarty_compile');
    $smarty->cache_dir = "/tmp/smarty_cache";

    return $smarty;
}
function displayBlogPostToUser($post)
{
    if (isset($post) && $post != null)
    {
        if (isset($post['hide_state']))
        {
            return $post['hide_state'] == 0 || $post['hide_state'] == 2;
        }
    }
    return false;
}

function generate_navbar_data() {
    $data = array(
        array(
            'link' => '/',
            'img' => '/img/btn-home.png',
            'alt' => 'homepage',
            'pagename' => 'home'
        ),
        array(
            'link' => '/p/portfolio',
            'img' => '/img/btn-portfolio.png',
            'alt' => 'portfolio',
            'pagename' => 'portfolio'
        ),
        array(
            'link' => '/p/links',
            'img' => '/img/btn-links.png',
            'alt' => 'various links',
            'pagename' => 'links'
        ),
        array(
            'link' => '/p/blog',
            'img' => '/img/btn-blog.png',
            'alt' => 'blog',
            'pagename' => 'blog'
        ),
        array(
            'link' => '/p/since',
            'img' => '/img/btn-since.png',
            'alt' => 'time since',
            'pagename' => 'since'
        )
    );
    return $data;
}
require_once(K_WEB_ROOT . '/include.blog.php');
?>