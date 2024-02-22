{include file="header.tpl" title="$postTitle" description={$post['description']}}
<link href="/css/blog.css" rel="stylesheet" type="text/css" />
{if $showPostListing}
    {include file="include/blog_list.tpl" postArray=$postArray}
{else}
    {include file="include/blog_post.tpl" postHideState=$postHideState post=$post}
    <hr/>
    <a href="#" style="padding-bottom: 3rem" onclick="history.back()" class="go-back"><< go back</a>
{/if}
{include file="footer.tpl"}