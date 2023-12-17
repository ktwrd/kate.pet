<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/include.php');

$smarty->assign('eightButtons', array(
    ['https://res.kate.pet/88x31/casey.png', 'https://casey.pet'],
    ['https://res.kate.pet/88x31/emma.gif', 'https://heckscaper.com'],
    ['https://res.kate.pet/88x31/exopet_newbutton.gif', 'https://exo.pet'],
    ['https://res.kate.pet/88x31/lapfoxgrad.gif', 'https://halleylabs.com'],
    ['https://res.kate.pet/88x31/niku.png', 'https://nikutrax.neocities.org'],
    ['https://88x31.kate.pet/niv-banner.gif', 'https://niv.gay/'],
    ['https://res.kate.pet/88x31/sanya.png', 'https://sanya.gay'],
    ['https://res.kate.pet/88x31/flag-trans.png'],
    ['https://res.kate.pet/88x31/flag-pan.png'],
    ['https://res.kate.pet/88x31/roly-saynotoweb3.gif', 'https://yesterweb.org/no-to-web3/'],
    ['https://res.kate.pet/88x31/therian.png', 'https://otherkin.fandom.com/wiki/Therians'],
    ['https://88x31.kate.pet/redhat.gif'],
    ['https://res.kate.pet/88x31/CGG_big.gif', 'https://kernel.org'],
    ['https://res.kate.pet/88x31/vscode.gif', 'https://code.visualstudio.com'],
    ['https://88x31.kate.pet/php.gif', 'https://php.net']
));
$headerImages = array(
    'this-user-likes-to-awoo.png',
    'ioletsgo1.png',
    'cathodegaytube-splash.png',
    'sky.png',
    'stormynights.png',
    'neurodivergent.png'
);
$smarty->assign('selectedHeaderImage', $headerImages[array_rand($headerImages)]);
?>