<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');

$defaultTitle = "kate's blog";
$defaultDescription = "sometimes rambles, sometimes important updates. you'll never know!";

if (isset($_REQUEST['tag'])) {
    $smarty->assign('filterTag', $_REQUEST['tag']);
} else {
    $smarty->assign('filterTag', NULL);
}

$postHideState = 1;
$showPostListing = False;

if (isset($_REQUEST['i']))
{
    $postContent = retrieveBlogPost(basename($_REQUEST['i']));
    if ($postContent == null)
    {
        show_not_found($smarty);
        return;
    }
    else
    {
        $postHideState = isset($postContent['hide_state']) ? $postContent['hide_state'] : 2;
        $smarty->assign('post', $postContent);
        $subject = '';
        if (isset($postContent['subject'])) {
            $subject = $postContent['subject'];
        }
        $smarty->assign('postTitle', $subject . ' - ' . $defaultTitle);
        $smarty->assign('postDescription', $postContent['description']);
        if (isset($postContent['description'])) {
            $smarty->assign('description', $postContent['description']);
        }
    }

    if (displayBlogPostToUser($postContent))
    {
        if (!isset($postContent['subject'])) {
            $smarty->assign('title', $defaultTitle);
        } else {
            $smarty->assign('title', $postContent['subject'] . ' - ' . $defaultTitle);
        }
        if (isset($postContent['description']))
        {
            $smarty->assign('description', $postContent['description']);
        }
        else
        {
            $smarty->assign('description', $defaultDescription);
        }
        if (isset($postContent['embed_image'])) {
            $_META['image']=$postContent['embed_image'];
        }
    }
    else
    {
        show_not_found($smarty);
        return;
    }
}
else
{
    $showPostListing = True;
    $postArray = getAllBlogPosts();
    $postTagArray = array();
    foreach ($postArray as $p) {
        foreach ($p['tags'] as $t) {
            array_push($postTagArray, $t);
        }
    }
    $postTagArray = array_unique($postTagArray);
    $smarty->assign('postTagArray', $postTagArray);
    $smarty->assign('postArray', $postArray);
    $smarty->assign('title', $defaultTitle);
    $smarty->assign('description', $defaultDescription);
}

$smarty->assign('postHideState', $postHideState);
$smarty->assign('showPostListing', $showPostListing);
?>