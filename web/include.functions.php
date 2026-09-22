<?php
use Smarty\Smarty;
class KApp {
    function __construct() {
        $this->image_preload = array();
        $this->meta = array();
        foreach (self::get_navbar_data() as $navbar_item) {
            array_push($this->image_preload, $navbar_item['icon_url']);
        }
    }
    /** @var string[] */
    public $image_preload;

    /** @var array */
    public $meta;

    public static function get_navbar_data() {
        return array(
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
    }

    public function img_preload_add(string $url) {
        array_push($this->image_preload, $url);
    }

    public function img_preload_unique() {
        $a = $this->image_preload;
        array_unique($a);
        $this->image_preload = $a;
    }
    public function meta_insert_range(array $data) {
        foreach ($data as $key=>$value) {
            $this->meta[$key] = $value;
        }
    }
}
require_once(K_WEB_ROOT . '/include.markdown.php');
class JsonUtil {
    /**
     * From https://stackoverflow.com/a/10252511/319266
     * @return array|false
     */
    public static function load(string $filename): array|false {
        $contents = @file_get_contents($filename);
        if ($contents === false) {
            return false;
        }
        return json_decode($contents, true);
    }
}
function createSmarty(): Smarty {
    $smarty = new Smarty();
    $smarty->setTemplateDir(K_WEB_ROOT . '/templates');
    $smarty->setCompileDir('/tmp/smarty_compile_kate');
    $smarty->setCacheDir('/tmp/smarty_cache_kate');

    return $smarty;
}
function createKApp(): KApp {
    return new KApp();
}
function displayBlogPostToUser(array $post): bool {
    if (isset($post) && $post != null)
    {
        if (isset($post['hide_state']))
        {
            return $post['hide_state'] == 0 || $post['hide_state'] == 2;
        }
    }
    return false;
}
function show_not_found(Smarty $smarty) {
    $pagesAvailable = array(
        '404/1.tpl',
    );
    $chosen = array_rand($pagesAvailable, 1);
    $smarty->display($pagesAvailable[$chosen]);
}

function generate_navbar_data() {
    return KApp::get_navbar_data();
}
require_once(K_WEB_ROOT . '/include.blog.php');