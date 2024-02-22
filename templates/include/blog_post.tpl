
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
</div>
<hr/>
<div class='blog-body'>
    {$post['text']}
</div>