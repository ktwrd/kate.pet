{include 
    file="header.tpl" 
    title="kate's portfolio" 
    description="all of the notable stuff i've worked on in the past few years."
    use_jquery=""
    use_bootstrap_js=""}
<h1 class="italic">portfolio</h1>
<strong>note:</strong> this <i>isn't a full/complete list</i> of all projects i've contributed to, it's a truncated list of the things i'm actually proud of.<br/>

{if count($unknown_tags) != 0}
<div class='error-container'>
    <strong>missing tags:</strong> {join(', ', $unknown_tags)}
</div>
{/if}

{foreach $sections as $k => $section}
{if $section['archived_items_count'] != count($section['items'])}
{include file="portfolio_section.tpl" group=$section dsTags=$data_tags}
{if $k != count($sections)}
<hr/>
{/if}
{/if}
{/foreach}
{if $require_archive_section != 0}
    <br/>
    <br/>
    <h1 id="inactive">archive</h1>
    <hr/>
    {foreach $sections as $k => $section}
        {if $section['archived_items_count'] == count($section['items'])}
            {include file="portfolio_section.tpl" group=$section dsTags=$data_tags}
            {if $k < (count($sections) - 1)}<hr/>{/if}
        {/if}
    {/foreach}
{/if}

<script>
    document.addEventListener('DOMContentLoaded', () => {
        $('.card#beans-rs [alt=openfortress-logo]').tooltip({
            placement: 'bottom',
            title: 'Created for Open Fortress'
        });
        $('[alt=cpp-logo]').tooltip({
            placement: 'bottom',
            title: 'Uses C++'
        });
        $('[alt=source-engine]').tooltip({
            placement: 'bottom',
            title: 'Created in the Source Engine'
        });
        $('[alt=adastral-logo]').tooltip({
            placement: 'bottom',
            title: 'Developed in collaboration with Adastral Group'
        });
        $('[alt=csharp-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with C#'
        });
        $('[alt=rustlang-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Rust'
        });
        $('[alt=php-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with PHP'
        });
        $('[alt=js-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with JavaScript'
        });
        $('[alt=vue-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Vue.JS'
        });
        $('[alt=electron-logo]').tooltip({
            placement: 'bottom',
            title: 'Made with Electron'
        });
    });
</script>

{include file="footer.tpl"}
