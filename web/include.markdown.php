<?php
use League\CommonMark\Environment\Environment;
use League\CommonMark\Extension\CommonMark\CommonMarkCoreExtension;
use League\CommonMark\Extension\CommonMark\Node\Block\FencedCode;
use League\CommonMark\Extension\CommonMark\Node\Block\IndentedCode;
use League\CommonMark\Extension\Footnote\FootnoteExtension;
use League\CommonMark\Extension\HeadingPermalink\HeadingPermalinkExtension;
use League\CommonMark\Extension\Table\TableExtension;
use League\CommonMark\Extension\TableOfContents\TableOfContentsExtension;
use League\CommonMark\Extension\TaskList\TaskListExtension;
use League\CommonMark\Extension\GithubFlavoredMarkdownExtension;
use League\CommonMark\MarkdownConverter;
use Spatie\CommonMarkHighlighter\FencedCodeRenderer;
use Spatie\CommonMarkHighlighter\IndentedCodeRenderer;

define("MDF_DEFAULT", 0x01 | 0x02 | 0x04);

define("MDF_EXT_TABLE", 0x01);
define("MDF_EXT_FOOTNOTE", 0x02);
define("MDF_EXT_GITHUB_FLAVOR", 0x04);
define("MDF_EXT_TOC", 0x08); // table of contents
define("MDF_EXT_HEADING_PERMALINK", 0x16);
define("MDF_EXT_TASK_LIST", 0x32);

if (!function_exists('formatMarkdown'))
{
    function formatMarkdown($text, $flags = MDF_DEFAULT)
    {
        $config = [
            'table' => [
                'wrap' => [
                    'enabled' => true,
                    'tag' => 'div',
                    'attributes' => ['class' => 'table-responsive'],
                ]
            ],
        ];
        $environment = new Environment($config);
        $environment->addExtension(new CommonMarkCoreExtension());

        // add optional extensions
        if ($flags & MDF_EXT_TABLE) {
            $environment->addExtension(new TableExtension());
        }
        if ($flags & MDF_EXT_FOOTNOTE) {
            $environment->addExtension(new FootnoteExtension());
        }
        if ($flags & MDF_EXT_GITHUB_FLAVOR) {
            $environment->addExtension(new GithubFlavoredMarkdownExtension());
        }
        if ($flags & MDF_EXT_HEADING_PERMALINK || $flags & MDF_EXT_TOC) {
            $environment->addExtension(new HeadingPermalinkExtension());
        }
        if ($flags & MDF_EXT_TOC) {
            $config['table_of_contents'] = array(
                'html_class' => 'table-of-contents',
                'position' => 'top',
                'style' => 'bullet',
                'min_heading_level' => 1,
                'max_heading_level' => 6,
                'normalize' => 'relative',
                'placeholder' => null,
            );
            $environment->addExtension(new TableOfContentsExtension());
        }
        if ($flags & MDF_EXT_TASK_LIST) {
            $environment->addExtension(new TaskListExtension());
        }
        
        $environment->addRenderer(FencedCode::class, new FencedCodeRenderer(['html', 'js', 'css', 'bash', 'php', 'json']));
        $environment->addRenderer(IndentedCode::class, new IndentedCodeRenderer(['html', 'js', 'css', 'bash', 'php', 'json']));
    
        $markdownConverter = new MarkdownConverter($environment);
        return $markdownConverter->convertToHtml($text);
    }
}
?>