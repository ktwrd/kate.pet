
<div class="d-inline">
    <h1 class="italic">blog posts</h1>
    <a href="/blog.atom">
        <img src="/img/feed.png" class="fixed" style="margin-bottom:-2px;"/>
    </a>
    <sup style="position: relative; top: -6px; left: -4px;">rss feed</sup>
    
</div>
<div class="blog-list-cards">
    {foreach $postArray as $post}
        <div class="blog-card blog-card--2col">
            <article class="blog-card__box block">
                <h1>
                    <a href="/blog/{$post['id']}">{$post['subject']}</a>
                </h1>
                {if isset($post['description']) && strlen($post['description']) > 1}
                    <div class="entry-content">
                        {$post['description']}
                    </div>
                {/if}
                <div class="entry-meta tar" style="display: block">
                    {if isset($post['created_at_f'])}
                        <time class="ta-r" datetime="{$post['created_at_fl']}">{$post['created_at_f']}</time>
                    {/if}
                    {if isset($post['updated_at_f'])}
                        <br/>
                        <time class="ta-r" datetime="{$post['updated_at_fl']}">Updated: {$post['updated_at_f']}</time>
                    {/if}
                </div>
            </article>
        </div>
    {/foreach}
</div>