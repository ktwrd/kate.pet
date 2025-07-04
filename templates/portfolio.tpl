{include 
    file="header.tpl" 
    title="kate's portfolio" 
    description="all of the notable stuff i've worked on in the past few years."
    use_jquery=""
    use_bootstrap_js=""}
<h1 class="italic">portfolio</h1>
<strong>note:</strong> this <i>isn't a full/complete list</i> of all projects i've contributed to, it's a truncated list of the things i'm actually proud of.<br/>

<div class="row d-flex flex-row">
    {foreach $portfolio_data as $item}
        {if $item['archived'] == 0}
        <div class="m-1 col-auto">
            <div class="card card-classic" id="{$item['name']}">
                <div class="card-header">
                    {foreach $item['icons'] as $icon}
                        <img src="/img/{$icon[1]}" class="img-sm" alt="{$icon[0]}" />
                    {/foreach}
                    {if isset($item['display_name'])}
                        {$item['display_name']}
                    {else}
                        {$item['name']}
                    {/if}
                    {if isset($item['header-sm'])}
                        <div class="card-header-sm">
                            {$item['header-sm']}
                        </div>
                    {/if}
                </div>
                <div class="card-body">
                    {$item['content']}
                </div>
            </div>
        </div>
        {/if}
    {/foreach}
</div>
<br/>
<br/>
<hr/>
<h3 id="inactive" >archived/inactive projects</h3>
<div class="row d-flex flex-row">
    {foreach $portfolio_data as $item}
        {if $item['archived'] == 1}
        <div class="m-1 col-auto">
            <div class="card card-classic" id="{$item['name']}">
                <div class="card-header">
                    {foreach $item['icons'] as $icon}
                        <img src="/img/{$icon[1]}" class="img-sm" alt="{$icon[0]}" />
                    {/foreach}
                    {if isset($item['display_name'])}
                        {$item['display_name']}
                    {else}
                        {$item['name']}
                    {/if}
                    {if isset($item['header-sm'])}
                        <div class="card-header-sm">
                            {$item['header-sm']}
                        </div>
                    {/if}
                </div>
                <div class="card-body">
                    {$item['content']}
                </div>
            </div>
        </div>
        {/if}
    {/foreach}
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
        $('.card#beans-rs [alt=openfortress-logo]').tooltip({
            placement: 'bottom',
            title: 'Created for Open Fortress'
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
