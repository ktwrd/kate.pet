
{foreach $icons as $iconId}
{foreach $ds as $dsIcon}
{if $dsIcon->id == $iconId}
<img src="{$dsIcon->getUrl()}" class="img-sm" alt="{$dsIcon->getAlt()}" data-id="{$dsIcon->id}" />
{/if}
{/foreach}
{/foreach}