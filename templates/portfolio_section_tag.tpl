{foreach $ds as $dsKey => $dsTag}
{if $dsKey == $tag}
<button class="label" data-portfolio-tag="{$dsKey}" type="button">
{$dsTag['name']}
</button>
{/if}
{/foreach}