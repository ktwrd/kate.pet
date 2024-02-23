<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');


$postHideState = 1;
$showPostListing = False;


if (isset($_REQUEST['i']))
{
    $postContent = retrieveBlogPost(basename($_REQUEST['i']));
    if ($postContent == null)
    {
        header('Location: /p/blog');
    }
    else
    {
        $postHideState = isset($postContent['hide_state']) ? $postContent['hide_state'] : 2;
        $smarty->assign('post', $postContent);
        $smarty->assign('postTitle', $postContent['subject'] . ' - kate\'s blog');
        $smarty->assign('title', $postContent['subject'] . ' - kate\'s blog');
        $smarty->assign('postDescription', $postContent['description']);
        $smarty->assign('description', $postContent['description']);
    }

    if (displayBlogPostToUser($postContent))
    {
        $smarty->assign('title', $postContent['subject'] . ' - kate\'s blog');
        $smarty->assign('description', $postContent['description']);
    }
}
else
{
    $showPostListing = True;
    $smarty->assign('postArray', getAllBlogPosts());
    $smarty->assign('title', 'kate\'s blog');
    $smarty->assign('description', 'sometimes rambles, sometimes important updates. you\'ll never know!');
}

$smarty->assign('postHideState', $postHideState);
$smarty->assign('showPostListing', $showPostListing);

?>