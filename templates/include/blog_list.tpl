
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
            {if isset($filterTag) && strtolower($filterTag) == strtolower($tag)}
                <a class="label label-info" href="/p/blog?tag={strtolower($tag)}" style="font-weight: bold;">{$tag}</a>
            {else}
                <a class="label" href="/p/blog?tag={strtolower($tag)}">{$tag}</a>
            {/if}
        {/foreach}
        {if isset($filterTag)}
            <br/>
            <a href="/p/blog">deselect tag</a>
        {/if}
    </div>
{/if}
<div class="blog-list-cards no-anim">
    {foreach $postArray as $post}
        {if isset($filterTag) && !doesPostHaveTag($post, $filterTag)}
            {if !doesPostHaveTag($post, $filterTag)}
                {continue}
            {/if}
        {/if}
        <div class="blog-card blog-card--2col no-anim">
            <article class="blog-card__box block no-anim">
                <h1>
                    <a href="/blog/{$post['id']}">{$post['subject']}</a>
                    {if isNewBlogPost($post)} <img src="https://res.kate.pet/icons/fuge-3.5.6/icons/new-text.png" /> {/if}
                </h1>
                <div class="entry-content">
                    {$post['description']}
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
                                <a class="label" href="/p/blog?tag={strtolower($t)}">{$t}</a>
                            {/foreach}
                        </div>
                    {/if}
                </div>
            </article>
        </div>
    {/foreach}
</div>