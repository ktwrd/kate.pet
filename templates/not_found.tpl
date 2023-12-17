{include file="header.tpl" title="uh oh! - kate's homepage" description="404 page not found ;w;"}

<div class="center">
    {if isset($pageName)}
        {if $pageName == 'blog'}
            <h1>Blog post not found</h1>
            <a href="/p/blog"><< go back</a>
        {elseif $pageName == 'links'}
            <h1>Link not found</h1>
            <a href="/p/links"><< go back</a>
        {else}
            <h1>Page not found</h1>
            <a href="/"><< go home</a>
        {/if}
    {else}
        <h1>Page not found</h1>
        <a href="/"><< go home</a>
    {/if}
</div>

{include file="footer.tpl"}