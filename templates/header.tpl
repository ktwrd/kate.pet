<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta name="description" content="{$description|default:"kate's personal homepage"}" />
        <meta name="theme-color" content="{$metaColor|default:"#000000"}" />
        <meta name="name" content="{$title|default:"kate's homepage"}" />
        <meta name="robots" content="follow, index" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="{$title|default:"kate's homepage"}" />
        <meta name="twitter:creator" content="@seedvevo" />
        
        <meta property="og:description" content="{$description|default:"kate's personal homepage"}" />
        <meta property="og:title" content="{$title|default:"kate's homepage"}" />
        <meta property="og:type" content="website" />

        {if isset($_META)}
            {if isset($_META['image'])}
                <meta property="og:image" content="{$_META['image']}" />
            {/if}
        {/if}

        <link rel="icon" href="/favicon.png" type="image/png" />
        
        <link rel="stylesheet" href="/highlight/styles/vs2015.css">
        <script src="/highlight/highlight.min.js"></script>

        <link rel="stylesheet" type="text/css" href="/css/style.css" />
        <title>{$title|default:"kate's homepage"}</title>

        <script type="text/javascript" src="/js/old-redirect-transform.js"></script>
    </head>
    <body>
        <a rel="me" href="https://dariox.club/@kate" style="display: none">Mastodon</a>
        <main>
            <div class="navbar">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-auto navbar-items">
                        <span class="text">
                            <img src="/img/homepage-txt-alt.png" class="fixed homepage-txt" alt="kate's website!"/>
                        </span>
                        {foreach $navbarData as $item}
                            <a href="{$item['link']}">
                                <img src="{$item['img']}" class="fixed" alt="{$item['alt']}" {if $pageName == $item['pagename']} current {/if} />
                            </a>
                        {/foreach}
                        {* <a href="/">
                            <img src="/img/btn-home.png" class="fixed" alt="homepage" {if $pageName == 'home'} current {/if} />
                        </a>
                        <a href="/p/portfolio">
                            <img src="/img/btn-portfolio.png" class="fixed" alt="portfolio" v-bind:current="$route.path == '/portfolio'" {if $pageName == 'portfolio'} current {/if} />
                        </a>
                        <a href="/p/links">
                            <img src="/img/btn-links.png" class="fixed" alt="various links" v-bind:current="$route.path == '/links'" {if $pageName == 'links'} current {/if} />
                        </a>
                        <a href="/p/blog">
                            <img src="/img/btn-blog.png" class="fixed" alt="blog" {if $pageName == 'blog'} current {/if} />
                        </a>
                        <a href="/p/since">
                            <img src="/img/btn-since.png" class="fixed" alt="time since" {if $pageName == 'since'} current {/if} />
                        </a> *}
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            {* <div class="toolbar">
                <a href="/">
                    <img src="/img/btn-home.png" class="fixed" alt="homepage" {if $pageName == 'home'} current {/if} />
                </a>
                <a href="/p/portfolio">
                    <img src="/img/btn-portfolio.png" class="fixed" alt="portfolio" v-bind:current="$route.path == '/portfolio'" {if $pageName == 'portfolio'} current {/if} />
                </a>
                <a href="/p/links">
                    <img src="/img/btn-links.png" class="fixed" alt="various links" v-bind:current="$route.path == '/links'" {if $pageName == 'links'} current {/if} />
                </a>
                <a href="/p/blog">
                    <img src="/img/btn-blog.png" class="fixed" alt="blog" {if $pageName == 'blog'} current {/if} />
                </a>
                <a href="/p/since">
                    <img src="/img/btn-since.png" class="fixed" alt="time since" {if $pageName == 'since'} current {/if} />
                </a>
            </div> *}
            <div class="container" {if isset($pageName)} pageName="{$pageName}" {/if}>
            {if isset($js_required)}
                <h1 aria-label="js-required" class="center">Javascript is required for this page.</h1>
                <script type="text/javascript">
                    document.querySelector('[aria-label=js-required]').remove()
                </script>
            {/if}