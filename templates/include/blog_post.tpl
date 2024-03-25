
<div class='blog-header'>
    <h1 field='title'>{$post['subject']}</h1>
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
            <a href="/p/blog?tag={strtolower($tag)}" style="font-weight: normal">{$tag}</a>
        {/foreach}
    </div>
    {/if}
</div>
<hr/>
<div class='blog-body'>
    {$post['text']}
</div>