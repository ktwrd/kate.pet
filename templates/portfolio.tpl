{include 
    file="header.tpl" 
    title="kate's portfolio" 
    description="all of the notable stuff i've worked on in the past few years."
    use_jquery=""
    use_bootstrap_js=""}
<h1 class="italic">portfolio</h1>
<strong>note:</strong> this <i>isn't a full/complete list</i> of all projects i've contributed to, it's a truncated list of the things i'm actually proud of.<br/>

{foreach $parse_errors as $e}
<div class='error-container'>{$e}</div>
{/foreach}

<p class="mb-0">
<strong>sections</strong>
<ul class="list-inline mt-0">
{foreach $sections as $section}
<li class="list-inline-item"><a href="#section-{$section->id}">{$section->name}</a></li>
{/foreach}
</ul>
</p>

{if count($sections) > 0}
{foreach $sections as $k => $section}
{include file="portfolio_section.tpl" dsTags=$tags dsIcons=$icons section=$section}
{if $k < (count($sections) - 1)}<hr/>{/if}
{/foreach}
{/if}

{if count($sections_archived) > 0}
    <br/>
    <br/>
    <h1 id="archive">archive</h1>
    <hr/>
    {foreach $sections_archived as $k => $section}
    {include file="portfolio_section.tpl" dsTags=$tags dsIcons=$icons section=$section}
    {if $k < (count($sections_archived) - 1)}<hr/>{/if}
    {/foreach}
{/if}

<script>
    document.addEventListener('DOMContentLoaded', () => {
        $('.card#beans-rs [data-id=openfortress]').tooltip({
            placement: 'bottom',
            title: 'Created for Open Fortress'
        });
        $('[data-id=cpp-logo]').tooltip({
            placement: 'bottom',
            title: 'Uses C++'
        });
        $('[data-id=source-engine]').tooltip({
            placement: 'bottom',
            title: 'Created in the Source Engine'
        });
        $('[data-id=adastral-logo]').tooltip({
            placement: 'bottom',
            title: 'Developed in collaboration with Adastral Group'
        });
        $('[data-id=csharp-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with C#'
        });
        $('[data-id=rustlang-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Rust'
        });
        $('[data-id=php-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with PHP'
        });
        $('[data-id=js-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with JavaScript'
        });
        $('[data-id=vue-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Vue.JS'
        });
        $('[data-id=electron-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Electron'
        });
    });
</script>

{include file="footer.tpl"}
