<?php
$linkData = array(
    [
        'name' => 'Social Media',
        'id' => 'social',
        'items' => [
            [
                'name' => 'Bluesky',
                'id' => 'bluesky',
                'link' => 'https://bsky.app/profile/kate.pet',
                'link_alt' => ['bluesky', 'bsky'],
                'link_txt' => '@kate.pet'
            ],
            [
                'name' => 'Mastodon',
                'id' => 'mastodon',
                'link' => 'https://dariox.club/@kate',
                'link_txt' => '@kate@dariox.club'
            ],
            [
                'name' => 'Twitter',
                'id' => 'twitter',
                'link' => 'https://twitter.com/seedvevo',
                'link_alt' => ['twitter', 'twt', 'x'],
                'link_txt' => '@SeedVEVO'
            ],
            [
                'name' => 'Reddit',
                'id' => 'reddit',
                'link' => 'https://reddit.com/u/ktwrd',
                'link_txt' => 'u/ktwrd'
            ],
            [
                'name' => '4chan',
                'txt' => 'kate !!DI0PM78d0GV'
            ]
        ]
    ],
    [
        'name' => 'Development',
        'id' => 'dev',
        'items' => [
            [
                'name' => 'Github',
                'id' => 'github',
                'link' => 'https://github.com/ktwrd'
            ],
            [
                'name' => 'Gitlab',
                'id' => 'gitlab',
                'link' => 'https://gitlab.com/ktwrd'
            ]
        ]
    ],
    [
        'name' => 'Projects',
        'id' => 'projects',
        'items' => [
            [
                'name' => 'Xenia Bot',
                'id' => 'xeniabot',
                'link' => 'https://xenia.kate.pet'
            ],
            [
                'name' => 'Uptime',
                'id' => 'uptime',
                'link' => 'https://uptime.dxcdn.net/status/kate'
            ],
            [
                'name' => 'Sixgrid',
                'id' => 'sixgrid',
                'link' => 'https://sixgrid.kate.pet'
            ]
        ]
    ],
    [
        'name' => 'Other',
        'id' => 'other',
        'items' => [
            [
                'name' => 'Ko-fi (Donate)',
                'id' => 'donate',
                'link' => 'https://ko-fi.com/ktwrd'
            ],
            [
                'name' => 'last.fm',
                'id' => 'lastfm',
                'link' => 'https://last.fm/user/seedvevo'
            ],
            [
                'name' => 'Steam',
                'id' => 'steam',
                'link' => 'https://steamcommunity.com/id/kate_main'
            ],
            [
                'name' => 'Discord Server',
                'id' => 'discord',
                'link' => 'https://discord.gg/PMrqTQPZFE'
            ],
            // [
            //     'name' => 'Pronouns',
            //     'id' => 'pronouns',
            //     'link' => 'https://en.pronouns.page/@seedvevo'
            // ],
            [
                'name' => 'Email',
                'id' => 'email',
                'link' => 'mailto:kate@dariox.club',
                'link_txt' => 'kate@dariox.club'
            ]
        ]
    ]
);

$smarty->assign('pageLinks', $linkData);
// $smarty->assign('pageLinks', $linkData);

$found = 0;
if (isset($_REQUEST['i']))
{
    foreach ($linkData as $linkGroup)
    {
        foreach ($linkGroup['items'] as $linkItem) {
            if ($found == 1) {
                continue;
            }
            if (isset($linkItem['link']) && isset($linkItem['id'])) {
                if ($linkItem[id] == $_REQUEST['i']) {
                    header('Location: ' . $linkItem['link']);
                    $found = 1;
                } else {
                    if (isset($linkItem['link_alt'])) {
                        if (in_array($_REQUEST['i'], $linkItem['link_alt'])) {
                            header('Location: ' . $linkItem['link']);
                            $found = 1;
                        }
                    }
                }
            }
        }
        if (isset($link['short']))
        {
            if ($link['short'] == $_REQUEST['i'])
            {
                header('Location: ' . $link['link']);
                $found = 1;
            }
        }
    }
    if ($found == 0)
    {
        $found = 2;
    }
}

$smarty->assign('found', $found);
?>