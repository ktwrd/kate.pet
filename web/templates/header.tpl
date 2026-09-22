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
        <meta id="embed-image" property="og:image" content="{$_META['image']}"/>
        <meta id="discord" name="twitter:image" content="{$_META['image']}"/>
        <meta img="image-src" name="twitter:image:src" content="{$_META['image']}"/>
{/if}
{/if}

        <link rel="icon" href="/favicon.png" type="image/png" />
        
        <link href="/highlight/styles/vs2015.css" rel="preload" as="script" />
        <link rel="stylesheet" href="/highlight/styles/vs2015.css" />
        <script src="/highlight/highlight.min.js"></script>

        <link href="/style.php" rel="preload" as="script" />
        <link rel="stylesheet" type="text/css" href="/style.php" />
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

{foreach $img_preload as $img_to_preload}
        <link href="{{$img_to_preload}}" rel="preload" as="image" />
{/foreach}
    </head>
    <body>
        <a rel="me" href="https://dariox.club/@kate" style="display: none">Mastodon</a>
        <main>
{include file="include/navbar.tpl"}
            <div class="container" {if isset($pageName)} pageName="{$pageName}" {/if}>
            {if isset($js_required)}
                <h1 aria-label="js-required" class="center">Javascript is required for this page.</h1>
                <script type="text/javascript">
                    document.querySelector('[aria-label=js-required]').remove()
                </script>
            {/if}