
<div class='blog-header'>
    <h1 field='title'>{$post['subject']}</h1>
    {if isset($post['description']) && strlen($post['description']) > 0}
        <p field='description'>{$post['description']}</p>
    {/if}
    {if isset($post['created_at_f'])}
        <h3 field='created_at'>
            {if isset($post['updated_at_f'])}Created: {/if}
            {$post['created_at_f']}</h3>
    {/if}
    {if isset($post['updated_at_f'])}
        <h3 field='updated_at'>Updated: {$post['updated_at_f']}</h3>
    {/if}
    {if count($post['tags']) > 0}
    <div class="d-inline">
        <strong>Tags:</strong>
        {foreach $post['tags'] as $tag}
            <a class="label" href="/p/blog?tag={lower($tag)}" style="font-weight: normal">{$tag}</a>
        {/foreach}
    </div>
    {/if}
</div>
<hr/>
<div class='blog-body'>
    {if count($post['internal_warnings']) > 0}
        {foreach $post['internal_warnings'] as $postWarning}
            <div class='blog-post-warn'>
                {$postWarning}
            </div>
        {/foreach}
    {/if}
    {if count($post['internal_errors']) > 0}
        {foreach $post['internal_errors'] as $postError}
            <div class='blog-post-error'>
                {$postError}
            </div>
        {/foreach}
    {/if}
    {$post['text']}
</div>

{if isset($post['utterances_cfg'])}
    {if isset($post['utterances_cfg']['issue_number'])}
        <hr/>
        {if isset($post['utterances_cfg']['label'])}
            <script src="https://utteranc.es/client.js"
                    repo="{$post['utterances_cfg']['repo']}"
                    issue-number="{$post['utterances_cfg']['issue_number']}"
                    label="{$post['utterances_cfg']['label']}"
                    theme="preferred-color-scheme"
                    crossorigin="anonymous"
                    async>
            </script>
        {else}
            <script src="https://utteranc.es/client.js"
                    repo="{$post['utterances_cfg']['repo']}"
                    issue-number="{$post['utterances_cfg']['issue_number']}"
                    theme="preferred-color-scheme"
                    crossorigin="anonymous"
                    async>
            </script>
        {/if}
    {elseif isset($post['utterances_cfg']['issue_term'])}
        <hr/>
        {if isset($post['utterances_cfg']['label'])}
            <script src="https://utteranc.es/client.js"
                    repo="{$post['utterances_cfg']['repo']}"
                    issue-term="{$post['utterances_cfg']['issue_term']}"
                    label="{$post['utterances_cfg']['label']}"
                    theme="preferred-color-scheme"
                    crossorigin="anonymous"
                    async>
            </script>
        {else}
            <script src="https://utteranc.es/client.js"
                    repo="{$post['utterances_cfg']['repo']}"
                    issue-term="{$post['utterances_cfg']['issue_term']}"
                    theme="preferred-color-scheme"
                    crossorigin="anonymous"
                    async>
            </script>
        {/if}
    {/if}
{/if}