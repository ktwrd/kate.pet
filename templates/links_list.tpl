{include file="header.tpl" title="kate's homepage - links" description="links to all of my stuff"}

<h1 class="italic">Links</h1>
<p>
<i>just a collection of all my links to my active social media pages & projects</i>
</p>

<div class="row d-flex flex-row justify-content-center">
{foreach $data as $group}
    <div class="m-1 col-auto">
        <div class="card card-classic" id="{$group['id']}">
            <div class="card-header">
                {$group['name']}
            </div>
            <div class="card-body">
                <table>
                    {foreach $group['items'] as $item}
                        <tr>
                        {if isset($item['link'])}
                            {if isset($item['link_txt'])}
                                <td>{$item['name']}</td>
                                <td><a href="/l/{$item['id']}">{$item['link_txt']}</a></td>
                            {else}
                                <td colspan="2"><a href="/l/{$item['id']}">{$item['name']}</a></td>
                            {/if}
                        {elseif isset($item['txt'])}
                            <td>{$item['name']}</td>
                            <td><code>{$item['txt']}</code></td>
                        {/if}
                        </tr>
                    {/foreach}
                </table>
            </div>
        </div>
    </div>
{/foreach}
</div>

<style>
h1 {
    margin: 0;
    margin-left: 1rem;
}
p {
    margin: 0;
    margin-bottom: 1.5rem;
    padding-left: 0.5rem;
    padding-right: 0.5rem;
}
</style>

{include file="footer.tpl"}