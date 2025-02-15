
{if $found == 2}
    {include file="not_found.tpl"}
{else}
    {include file="links_list.tpl" data=$pageLinks}
{/if}