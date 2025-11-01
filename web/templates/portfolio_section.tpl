<h3 class="mb-0" id="section-{$section->id}">{$section->name}
{if isset($section->website) && strlen($section->website) > 0}
    (<a href="{$section->website}">website</a>)
{/if}
</h3>
{if isset($section->description) && strlen($section->description) > 0}
{$section->description}
{/if}

<div class="portfolio-container">
{foreach $section->items as $item}
<div class="card card-classic" id="{$item->id}">
    <div class="card-header">
    {include file="portfolio_section_item_icons.tpl" icons=$item->icons ds=$dsIcons}
    {$item->name}
    {if $item->active->canFormat()}
        <div class="card-header-sm">
            {$item->active->format()}
        </div>
    {/if}
    </div>
    <div class="card-body">
        {$item->content}
        {if count($item->tags) > 0}
        <div class="c-foot">
        <hr/>
        {include file="portfolio_section_tags.tpl" tags=$item->tags ds=$dsTags}
        </div>
        {* {foreach $item->tags as $sectionTag}
        {include file="portfolio_section_tags.tpl" tags=$sectionTag ds=$dsTags}
        {/foreach} *}
        {/if}
    </div>
</div>
{/foreach}
</div>