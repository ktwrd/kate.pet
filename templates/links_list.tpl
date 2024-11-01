{include file="header.tpl" title="kate's homepage - links" description="links to all of my stuff"}

<h1 class="italic">Links</h1>
<div class="row">
    <div class="cols-auto pl-1">
        {foreach $pageLinks as $link}
            <div class="row">
                <div class="col-auto" style="font-size: 2rem;">
                {if isset($link['short'])}
                    <a href="/l/{$link['short']}" style="font-size: 2rem">{$link['label']}</a>
                {elseif isset($link['link'])}
                    <a href="{$link['link']}" style="font-size: 2rem">{$link['label']}</a>
                {else}
                    {$link['label']}
                {/if}
                </div>
                {if isset($link['text'])}
                    <div class="col-auto">
                        <code class="codething">{$link['text']}</code>
                    </div>
                {/if}
            </div>
        {/foreach}
    </div>
    <div class="col"></div>
</div>
<style>
.codething {
    font-size: 1.5rem;
    line-height: 2rem;
    margin-top: 0.25rem;
    /* margin-bottom: 0.5rem; */
    display: block;
}
</style>

{include file="footer.tpl"}