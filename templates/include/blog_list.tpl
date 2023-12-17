
<h2>blog posts</h2>
<div class="blog-list-cards">
    {foreach $postArray as $post}
        <div class="blog-card blog-card--2col">
            <article class="blog-card__box block">
                <h1>
                    <a href="/blog/{$post['id']}">{$post['subject']}</a>
                </h1>
                <div class="entry-content">
                    {$post['description']}
                </div>
                <div class="entry-meta tar" style="display: block">
                    {if isset($post['created_at_f'])}
                        <time class="tar" datetime="{$post['created_at_fl']}">{$post['created_at_f']}</time>
                    {/if}
                    {if isset($post['updated_at_f'])}
                        <br/>
                        <time class="tar" datetime="{$post['updated_at_fl']}">Updated: {$post['updated_at_f']}</time>
                    {/if}
                </div>
            </article>
        </div>
    {/foreach}
</div>
<style>
.blog-list-cards {
    display: flex;
    flex-wrap: wrap;
}
@media screen and (min-width: 992px) {
    .blog-card--2col {
        width: 50%;
    }
}
@media screen and (min-width: 768px) {
    .blog-card {
        padding: .3125rem 0;
    }
}
.blog-card {
    display: flex;
    width: 100%;
}
@media screen and (min-width: 768px) {
    .blog-card__box {
        border-width: 1px;
    }
}
.blog-card__box {
    border: 1px solid #666666;
    display: flex;
    flex-direction: column;
    width: 100%;
    margin: 0;
    border-width: 0 0 1px;
}
.blog-card__box h1 {
    font-size: 1.25rem;
    margin-top: 0;
    margin-bottom: 0.5rem;
    font-weight: 600;
}
.blog-card__box .entry-meta {
    font-size: .875rem;
    margin-top: 1rem;
}
</style>