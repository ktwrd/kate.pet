<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta name="description" content="{$description|default:"kate's personal homepage"}" />
        <meta name="theme-color" content="{$metaColor|default:"#000000"}" />
        <meta name="name" content="{$title|default:"kate's homepage"}" />
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="{$title|default:"kate's homepage"}" />

        <link rel="icon" href="/favicon.png" type="image/png" />
        
        <link rel="stylesheet" href="/highlight/styles/vs2015.css">
        <script src="/highlight/highlight.min.js"></script>

        <link rel="stylesheet" type="text/css" href="/css/style.css" />
        <title>{$title|default:"kate's homepage"}</title>
    </head>
    <body>
        <a rel="me" href="https://dariox.club/@kate" style="display: none">Mastodon</a>
        <main>
            <div class="toolbar">
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
            </div>
            <div class="container">