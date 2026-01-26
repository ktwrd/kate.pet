{foreach $tags as $itemTag}
{foreach $ds as $dsTag}
{if $dsTag->id == $itemTag}
<button class="label" type="button"
        data-portfolio-tag="{$dsTag->id}"
        data-portfolio-tag-type="{$dsTag->type}"
        {if isset($dsTag->website)}data-portfolio-tag-website="{$dsTag->website}"{/if}>
{$dsTag->name}
</button>
{/if}
{/foreach}
{/foreach}