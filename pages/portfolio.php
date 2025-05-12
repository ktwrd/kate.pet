<?php

$data_raw = array(
    [
        'icons' => [
            ['openfortress-logo', 'openfortress-logo.png'],
            ['cpp-logo', 'cpp-logo.svg'],
            ['source-engine', '24px-Icon-Source.png']
        ],
        'name' => 'open-fortress',
        'display_name' => 'Open Fortress',
        'links' => [
            ['website', 'https://openfortress.fun'],
            ['steam', 'https://store.steampowered.com/app/3561320/Open_Fortress/']
        ],
        'header-sm' => 'May 2024 - Current'
    ],
    array(
        'icons' => array(
            array('openfortress-logo', 'openfortress-logo.png'),
            array('rustlang-logo', 'rustlang-logo.svg')
        ),
        'name' => 'beans-rs',
        'links' => array(
            ['git', 'https://github.com/ktwrd/beans-rs']
        ),
        'header-sm' => 'May 2024 - Current',
    ),
    [
        'icons' => [
            ['adastral-logo', 'adastral-logo.png'],
            ['csharp-logo', 'csharp-logo.svg']
        ],
        'name' => 'cockatoo',
        'display_name' => 'Cockatoo',
        'links' => [
            ['git', 'https://github.com/AdastralGroup/Cockatoo']
        ],
        'header-sm' => 'June 2024 - Feb 2025',
        'archived' => 1
    ],
    [
        'icons' => [
            ['rustlang-logo', 'rustlang-logo.svg']
        ],
        'name' => 'rustgrab',
        'links' => [
            ['git', 'https://github.com/ktwrd/rustgrab']
        ],
        'header-sm' => 'May 2024 - Current'
    ],
    [
        'icons' => [
            ['csharp-logo', 'csharp-logo.svg']
        ],
        'name' => 'kasta',
        'display_name' => 'Kasta',
        'links' => [
            ['git', 'https://github.com/ktwrd/Kasta']
        ],
        'header-sm' => 'Nov 2024 - Current'
    ],
    [
        'icons' => [
            ['adastral-logo', 'adastral-logo.png'],
            ['csharp-logo', 'csharp-logo.svg']
        ],
        'name' => 'northam',
        'display_name' => 'Northam',
        'links' => [],
        'header-sm' => 'Sep 2024 - Feb 2025',
        'archived' => 1
    ],
    [
        'icons' => [
            ['csharp-logo', 'csharp-logo.svg'],
        ],
        'name' => 'xenia-bot',
        'display_name' => 'Xenia Bot',
        'links' => [
            ['website', 'https://xenia.kate.pet'],
            ['git', 'https://github.com/ktwrd/xeniabot']
        ],
        'header-sm' => 'Jan 2023 - Current'
    ],
    [
        'icons' => [
            ['php-logo', 'php-logo.svg']
        ],
        'name' => 'website-v2',
        'display_name' => 'Personal Website v2',
        'links' => [
            ['git', 'https://github.com/ktwrd/kate.pet']
        ],
        'header-sm' => 'Dec 2023 - current'
    ],
    [
        'icons' => [
            ['php-logo', 'php-logo.svg']
        ],
        'name' => 'xenia-bot-website',
        'display_name' => 'Xenia Bot Website',
        'links' => [
            ['git', 'https://github.com/ktwrd/XeniaBot-Website']
        ],
        'header-sm' => 'Jan 2024 - current'
    ],
    [
        'icons' => [
            ['rust-logo', 'rust-logo.svg'],
            ['csharp-logo', 'csharp-logo.svg']
        ],
        'name' => 'ekls-drm',
        'display_name' => 'Custom DRM and Copy Protection',
        'header-sm' => 'May 2023 - Aug 2023',
        'archived' => 1
    ],
    [
        'icons' => [
            ['js-logo', 'js-logo.svg'],
            ['vue-logo', 'vue-logo.svg'],
            ['electron-logo', 'electron-logo.svg']
        ],
        'name' => 'sixgrid',
        'display_name' => 'SixGrid',
        'links' => [
            ['website', 'https://sixgrid.kate.pet'],
            ['git', 'https://github.com/SixGrid']
        ],
        'header-sm' => 'Dec 2020 - Apr 2024',
        'archived' => 1
    ],
    [
        'icons' => [
            ['js-logo', 'js-logo.svg']
        ],
        'name' => '88x31',
        'links' => [
            ['website', 'https://88x31.kate.pet']
        ],
        'header-sm' => 'Aug 2022 - Current',
        'archived' => 1
    ],
    [
        'icons' => [
            ['js-logo', 'js-logo.svg'],
            ['vue-logo', 'vue-logo.svg']
        ],
        'name' => 'website-v1',
        'display_name' => 'Personal Website v1',
        'links' => [
            ['see', 'https://old.kate.pet']
        ],
        'header-sm' => 'Jan 2022 - Nov 2023',
        'archived' => 1
    ],
    [
        'icons' => [
            ['csharp-logo', 'csharp-logo.svg']
        ],
        'name' => 'osl',
        'display_name' => 'OpenSoftwareLauncher',
        'links' => [
            ['git', 'https://github.com/ktwrd/OpenSoftwareLauncher']
        ],
        'header-sm' => 'Sep 2022 - Jan 2023',
        'archived' => 1
    ]
);

$data = array();
foreach ($data_raw as $d)
{
    $n = $d['name'];
    $file_content = file_get_contents(K_WEB_ROOT. "/pages/portfolio/$n.md");
    $d['content'] = formatMarkdown($file_content);
    unset($file_content);
    if (!isset($d['icons']))
    {
        $d['icons'] = array();
    }
    if (!isset($d['repo']))
    {
        $d['repo'] = '';
    }
    if (!isset($d['header-sm']))
    {
        $d['header-sm'] = '';
    }
    if (!isset($d['archived'])) {
        $d['archived'] = 0;
    }

    $post_name_brackets = array();
    if (isset($d['links']))
    {
        foreach ($d['links'] as $link)
        {
            $a = $link[0];
            $b = $link[1];
            array_push($post_name_brackets, "<a href=\"$b\">$a</a>");
        }
    }
    if (count($post_name_brackets) > 0)
    {
        $display_name = $d['name'];
        if (isset($d['display_name']))
        {
            if (strlen($d['display_name']) > 0)
            {
                $display_name = $d['display_name'];
            }
        }

        $bracket_join = join(", ", $post_name_brackets);
        $d['display_name'] = "$display_name ($bracket_join)";
    }

    array_push($data, $d);
}

$smarty->assign('portfolio_data', $data);