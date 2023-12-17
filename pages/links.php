<?php
$linkData = array(
    array(
        'label' => 'Fedi (Pleroma)',
        'link' => 'https://xenia.social/kate',
        'short' => 'pleroma'
    ),
    array(
        'label' => 'Lemmy',
        'link' => 'https://lemmy.blahaj.zone/u/ktwrd',
        'short' => 'lemmy'
    ),
    array(
        'label' => 'Bluesky',
        'link' => 'https://bsky.app/profile/kate.pet',
        'text' => '@kate.pet',
        'short' => 'bluesky'
    ),
    array(
        'label' => 'Blog',
        'link' => 'https://kate.pet/p/blog',
        'short' => 'blog'
    ),
    array(
        'label' => 'Twitter',
        'link' => 'https://twitter.com/seedvevo',
        'short' => 'twitter'
    ),
    array(
        'label' => '4chan',
        'text' => 'kate !!DI0PM78d0GV',
    ),
    array(
        'label' => 'Email',
        'text' => 'kate@dariox.club',
    ),
    array(
        'label' => 'Pronouns',
        'link' => 'https://en.pronouns.page/@seedvevo',
        'short' => 'pronouns'
    ),
    array(
        'label' => 'Discord Server',
        'link' => 'https://discord.gg/PMrqTQPZFE',
        'short' => 'discord'
    ),
    array(
        'label' => 'Github',
        'link' => 'https://github.com/ktwrd',
        'short' => 'github'
    ),
    array(
        'label' => 'Last.fm',
        'link' => 'https://last.fm/user/seedvevo',
        'short' => 'lastfm'
    ),
    array(
        'label' => 'Steam',
        'link' => 'https://steamcommunity.com/id/kate_main',
        'short' => 'steam'
    )
);
$smarty->assign('pageLinks', $linkData);

if (isset($_REQUEST['i']))
{
    foreach ($linkData as $link)
    {
        if (isset($link['short']))
        {
            if ($link['short'] == $_REQUEST['i'])
            {
                header('Location: ' . $link['link']);
            }
        }
    }
}
?>