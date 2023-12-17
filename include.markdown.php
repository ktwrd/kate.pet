<?php
use League\CommonMark\Environment\Environment;
use League\CommonMark\Extension\CommonMark\CommonMarkCoreExtension;
use League\CommonMark\Extension\CommonMark\Node\Block\FencedCode;
use League\CommonMark\Extension\CommonMark\Node\Block\IndentedCode;
use League\CommonMark\MarkdownConverter;
use Spatie\CommonMarkHighlighter\FencedCodeRenderer;
use Spatie\CommonMarkHighlighter\IndentedCodeRenderer;

if (!function_exists('formatMarkdown'))
{
    function formatMarkdown($text)
    {
        $environment = new Environment();
        $environment->addExtension(new CommonMarkCoreExtension());
        $environment->addRenderer(FencedCode::class, new FencedCodeRenderer(['html', 'js', 'css', 'bash', 'php', 'json']));
        $environment->addRenderer(IndentedCode::class, new IndentedCodeRenderer(['html', 'js', 'css', 'bash', 'php', 'json']));
    
        $markdownConverter = new MarkdownConverter($environment);
    
        return $markdownConverter->convertToHtml($text);
    }
}
?>