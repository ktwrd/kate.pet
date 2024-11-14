<!DOCTYPE html>
<html>
    <head lang="en-AU">
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
        <script type="text/javascript" src="/js/nodrag.js"></script>
        {if isset($use_jquery) || isset($use_bootstrap_js)}
            <!-- jQuery v3.7.1 -->
            <script type="text/javascript" src="/js/lib/jquery.min.js"></script>
        {/if}
        {if isset($use_bootstrap_js)}
            <!-- Boootstrap v4, Popper.JS v1.12.9 -->
            <script type="text/javascript" src="/js/lib/popper.min.js"></script>
            <script type="text/javascript" src="/js/lib/bootstrap.min.js"></script>
        {/if}
    </head>
    <body>
        <a rel="me" href="https://dariox.club/@kate" style="display: none">Mastodon</a>
        <main>
            <div class="navbar">
                <div class="row">
                    <div class="col"></div>
                    <div class="col-auto navbar-items">
                        <span class="text navbar-page-text">
                            kate's homepage
                        </span>
                        {foreach $navbarData as $item}
                            <a  {if $pageName == $item['pagename']}
                                    class="label label-primary"
                                {else}
                                    class="label"
                                {/if}
                                href="{$item['link']}">

                                {if isset($item['icon_url'])}
                                    <img class="label-icon" src="{$item['icon_url']}" width="12px" height="12px" />
                                {/if}

                                {$item['alt']}
                            </a>
                        {/foreach}
                    </div>
                    <div class="col"></div>
                </div>
            </div>
            <div class="container" {if isset($pageName)} pageName="{$pageName}" {/if}>
            {if isset($js_required)}
                <h1 aria-label="js-required" class="center">Javascript is required for this page.</h1>
                <script type="text/javascript">
                    document.querySelector('[aria-label=js-required]').remove()
                </script>
            {/if}