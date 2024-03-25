{include file="header.tpl" title="$title" description={$post['description']}}
<link href="/css/blog.css" rel="stylesheet" type="text/css" />
{if $showPostListing}
    {include file="include/blog_list.tpl" postArray=$postArray}
{else}
    {include file="include/blog_post.tpl" postHideState=$postHideState post=$post}
    <hr/>
    <div class="d-inline" style="padding-bottom: 20px">
        <a class="btn btn-sm btn-dark" href="#" style="margin-bottom: 3rem" onclick="history.back()" class="go-back"><< go back</a>
    </div>
{/if}
{include file="footer.tpl"}