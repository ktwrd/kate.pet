<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');
$id = null;
if (isset($_REQUEST['i']))
{
    $id = basename($_REQUEST['i']);
}
$postHideState = 1;
$showPostListing = False;
if ($id)
{
    $postContent = retrieveBlogPost($id);
    if ($postContent == null)
    {
        header('Location: /p/blog');
    }
    else
    {
        $postHideState = isset($postContent['hide_state']) ? $postContent['hide_state'] : 2;
        $smarty->assign('post', $postContent);
        $smarty->assign('postTitle', $postContent['subject'] . ' - kate\'s blog');
        $smarty->assign('postDescription', $pageDescription);
    }
}
else
{
    $showPostListing = True;
    $smarty->assign('postArray', getAllBlogPosts());
}

$pageDescription = '';
$pageTitle = 'kate\'s blog';
if ($showPostListing)
{
    if ($postHideState != 1)
    {
        $pageTitle = 'kate\'s blog - ' . $postContent['subject'];
        $pageDescription = $postContent['description'];
        $smarty->assign('pageDescription', $pageDescription);
    }
}
$smarty->assign('title', $pageTitle);
$smarty->assign('description', $pageDescription);

$smarty->assign('postHideState', $postHideState);
$smarty->assign('showPostListing', $showPostListing);

?>