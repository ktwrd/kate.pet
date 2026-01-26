
<h1 style="font-style: italic;">
    blog posts
    <a href="/blog.atom">
        <img src="https://res.kate.pet/icons/fuge-3.5.6/bonus/icons-24/feed.png" alt="rss feed" />
    </a>
</h1>
{if count($postTagArray) > 0}
    <div class="d-inline">
        <strong>Tags:</strong>
        {foreach $postTagArray as $tag}
            {if $filterTag === $tag[1]}
                <a class="label label-info" href="/p/blog?tag={$tag[1]}" style="font-weight: bold;">{$tag[0]}</a>
            {else}
                <a class="label" href="/p/blog?tag={$tag[1]}">{$tag[0]}</a>
            {/if}
        {/foreach}
        {if isset($filterTag)}
            <br/>
            <a href="/p/blog">deselect tag</a>
        {else}
            <br/>
            <br/>
        {/if}
    </div>
{/if}
<div class="label label-primary">{count($postArray)} blog post{if count($postArray) != 1}s{/if}</div>
<div class="blog-list-cards no-anim">
    {foreach $postArray as $post}
        {if !isset($post) || !isset($post['id']) || !isset($post['subject'])}
            {continue}
        {/if}
        <div class="blog-card blog-card--2col no-anim">
            <article class="blog-card__box block no-anim">
                <h1>
                    <a href="/blog/{$post['id']}">{$post['subject']}</a>
                    {if isset($post['_new'])} <img src="img/icon-new-text.png" /> {/if}
                </h1>
                <div class="entry-content">
                    {if isset($post['description'])}
                    {$post['description']}
                    {/if}
                </div>
                <div class="entry-meta tar" style="display: block">
                    {if isset($post['created_at_f'])}
                        <time class="ta-r" datetime="{$post['created_at_fl']}"><i class="bi bi-calendar" title="Created at"></i> {$post['created_at_f']}</time>
                    {/if}
                    {if isset($post['updated_at_f'])}
                        | <time class="ta-r" datetime="{$post['updated_at_fl']}"><i class="bi bi-pencil" title="Updated at"></i> {$post['updated_at_f']}</time>
                    {/if}
                    {if isset($post['tags']) && count($post['tags']) > 0}
                        <div class="blog-listing__item-tags">
                            Tags
                            {foreach $post['tags'] as $t}
                                <a class="label" href="/p/blog?tag={lower($t)}">{$t}</a>
                            {/foreach}
                        </div>
                    {/if}
                </div>
            </article>
        </div>
    {/foreach}
</div>