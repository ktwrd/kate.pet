<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');
$eightButtons = [
    [88, 31, 'https://res.kate.pet/88x31/msx8831.gif', 'https://msx.horse'],
    //[88, 31, 'https://res.kate.pet/88x31/exopet_newbutton.gif', 'https://exo.pet'],
    //[88, 31, 'https://res.kate.pet/88x31/lapfoxgrad.gif', 'https://halleylabs.com'],
    [88, 31, 'https://res.kate.pet/88x31/sanya.png', 'https://sanya.gay'],
    [88, 31, 'https://88x31.kate.pet/8831trans_nyannyanmachine.png', 'https://nyanyamachine.dev/'],
    [88, 31, 'https://res.kate.pet/88x31/therian.png', 'https://otherkin.fandom.com/wiki/Therians'],
    [88, 31, 'https://88x31.kate.pet/redhat.gif'],
    [120, 31, 'https://res.kate.pet/88x31/CGG_big.gif', 'https://kernel.org'],
    //[88, 31, 'https://res.kate.pet/88x31/vscode.gif', 'https://code.visualstudio.com'],
    [88, 31, 'https://88x31.kate.pet/php.gif', 'https://php.net'],
];
$headerImages = [
    ['this-user-likes-to-awoo.png', 239, 49],
    ['ioletsgo1.png', 978, 1036],
    ['cathodegaytube-splash.png', 524, 700],
    ['sky.png', 239, 49],
    ['stormynights.png', 240, 55],
    ['neurodivergent.png', 240, 47],
];
$smarty->assign('eightButtons', $eightButtons);

$smarty->assign('redirectLinks', array(
    ['discord', 'https://discord.gg/PMrqTQPZFE'],
    ['xenia_bot', 'https://xenia.kate.pet'],
    // ['mastodon', 'https://dariox.club/@kate'],
    // ['bluesky', 'https://bsky.app/profile/kate.pet'],
    ['github', 'https://github.com/ktwrd'],
    ['kofi_s_tag_dark', 'https://ko-fi.com/ktwrd']
));
$kapp->img_preload_add('/button.gif');
$kapp->img_preload_add('/button2.gif');
foreach ($eightButtons as $i) {
    $kapp->img_preload_add($i[2]);
}
$smarty->assign('selectedHeaderImage', $headerImages[array_rand($headerImages)]);
?>