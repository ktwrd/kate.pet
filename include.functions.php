<?php
use Smarty\Smarty;
require_once(K_WEB_ROOT . '/include.markdown.php');
class JsonUtil {
    /**
     * From https://stackoverflow.com/a/10252511/319266
     * @return array|false
     */
    public static function load($filename) {
        $contents = @file_get_contents($filename);
        if ($contents === false) {
            return false;
        }
        return json_decode($contents, true);
    }
}
function createSmarty()
{
    $smarty = new Smarty();
    $smarty->setTemplateDir(K_WEB_ROOT . '/templates');
    $smarty->setCompileDir('/tmp/smarty_compile');
    $smarty->setCacheDir('/tmp/smarty_cache');

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
function show_not_found($smarty) {
    $pagesAvailable = array(
        '404/1.tpl',
    );
    $chosen = array_rand($pagesAvailable, 1);
    $smarty->display($pagesAvailable[$chosen]);
}

function generate_navbar_data() {
    $data = array(
        array(
            'link' => '/',
            'alt' => 'homepage',
            'pagename' => 'home',
            'icon_url' => '/img/icon_home_32x.png'
        ),
        array(
            'link' => '/p/portfolio',
            'alt' => 'portfolio',
            'pagename' => 'portfolio',
            'icon_url' => '/img/icon_portfolio_32x.png'
        ),
        array(
            'link' => '/p/links',
            'alt' => 'various links',
            'pagename' => 'links',
            'icon_url' => '/img/icon_links_32x.png'
        ),
        array(
            'link' => '/p/blog',
            'alt' => 'blog',
            'pagename' => 'blog',
            'icon_url' => '/img/icon_blog_32x.png'
        ),
        array(
            'link' => '/p/since',
            'alt' => 'time since',
            'pagename' => 'since',
            'icon_url' => '/img/icon_since_32x.png'
        )
    );
    return $data;
}
require_once(K_WEB_ROOT . '/include.blog.php');