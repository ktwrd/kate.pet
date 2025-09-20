<h3 class="mb-0">{$group['name']}
{if isset($group['website'])}
    (<a href="{$group['website']}">website</a>)
{/if}
</h3>
{if isset($group['description'])}
{$group['description']}
{/if}

<div class="row d-flex flex-row">
{foreach $group['items'] as $item}
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
                {if count($item['tags']) > 0}
                <hr/>
                {foreach $item['tags'] as $groupTag}
                {include file="portfolio_section_tag.tpl" tag=$groupTag ds=$dsTags}
                {/foreach}
                {/if}
            </div>
        </div>
    </div>
{/foreach}
</div>