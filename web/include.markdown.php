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

class UnderlineNode extends League\CommonMark\Node\Inline\AbstractInline implements League\CommonMark\Node\Inline\DelimitedInterface
{
    private string $delimiter;

    public function __construct(string $delimiter = '_')
    {
        parent::__construct();

        $this->delimiter = $delimiter;
    }

    public function getOpeningDelimiter(): string
    {
        return $this->delimiter;
    }

    public function getClosingDelimiter(): string
    {
        return $this->delimiter;
    }
}

class UnderlineDelimiterProcessor implements League\CommonMark\Delimiter\Processor\CacheableDelimiterProcessorInterface, League\Config\ConfigurationAwareInterface
{
    /** @psalm-readonly */
    private string $char;

    /** @psalm-readonly-allow-private-mutation */
    private League\Config\ConfigurationInterface $config;

    /**
     * @param string $char The emphasis character to use (typically '*' or '_')
     */
    public function __construct(string $char)
    {
        $this->char = $char;
    }

    public function getOpeningCharacter(): string
    {
        return $this->char;
    }

    public function getClosingCharacter(): string
    {
        return $this->char;
    }

    public function getMinLength(): int
    {
        return 1;
    }

    public function getDelimiterUse(League\CommonMark\Delimiter\DelimiterInterface $opener, League\CommonMark\Delimiter\DelimiterInterface $closer): int
    {
        // "Multiple of 3" rule for internal delimiter runs
        if (($opener->canClose() || $closer->canOpen()) && $closer->getOriginalLength() % 3 !== 0 && ($opener->getOriginalLength() + $closer->getOriginalLength()) % 3 === 0) {
            return 0;
        }

        return 1;
    }

    public function process(League\CommonMark\Node\Inline\AbstractStringContainer $opener, League\CommonMark\Node\Inline\AbstractStringContainer $closer, int $delimiterUse): void
    {
        if ($delimiterUse === 1) {
            $emphasis = new UnderlineNode($this->char);
        } else {
            return;
        }

        $next = $opener->next();
        while ($next !== null && $next !== $closer) {
            $tmp = $next->next();
            $emphasis->appendChild($next);
            $next = $tmp;
        }

        $opener->insertAfter($emphasis);
    }

    public function setConfiguration(League\Config\ConfigurationInterface $configuration): void
    {
        $this->config = $configuration;
    }

    public function getCacheKey(League\CommonMark\Delimiter\DelimiterInterface $closer): string
    {
        return \sprintf(
            '%s-%s-%d-%d',
            $this->char,
            $closer->canOpen() ? 'canOpen' : 'cannotOpen',
            $closer->getOriginalLength() % 3,
            $closer->getLength(),
        );
    }
}

class UnderlineRenderer implements League\CommonMark\Renderer\NodeRendererInterface, League\CommonMark\Xml\XmlNodeRendererInterface
{
    /**
     * @param UnderlineNode $node
     *
     * {@inheritDoc}
     *
     * @psalm-suppress MoreSpecificImplementedParamType
     */
    public function render(League\CommonMark\Node\Node $node, League\CommonMark\Renderer\ChildNodeRendererInterface $childRenderer): \Stringable
    {
        UnderlineNode::assertInstanceOf($node);

        $attrs = $node->data->get('attributes');

        return new League\CommonMark\Util\HtmlElement('u', $attrs, $childRenderer->renderNodes($node->children()));
    }

    public function getXmlTagName(League\CommonMark\Node\Node $node): string
    {
        return 'u';
    }

    /**
     * {@inheritDoc}
     */
    public function getXmlAttributes(League\CommonMark\Node\Node $node): array
    {
        return [];
    }
}

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
            'commonmark' => [
                'use_underscore' => false
            ]
        ];
        $environment = new Environment($config);
        $environment->addExtension(new CommonMarkCoreExtension());
        $environment->addRenderer(UnderlineNode::class, new UnderlineRenderer(),    0);
        $environment->addDelimiterProcessor(new UnderlineDelimiterProcessor('_'));

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