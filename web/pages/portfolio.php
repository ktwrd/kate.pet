<?php

class PortfolioSectionItemLink {
    function __construct(array $json) {
        $this->name = $json[0];
        $this->url = $json[1];
    }

    /** @var string */
    public $name;
    /** @var string */
    public $url;
}
class PortfolioSectionItemActive {
    function __construct(array $json) {
        $this->is = isset($json) && is_array($json) && count($json) == 2;
        $this->start = null;
        $this->end = null;

        if ($this->is) {
            $this->start = DateTimeImmutable::createFromFormat('Y/m', $json[0]);
            if (isset($json[1]) && $json[1] != null) {
                $this->end = DateTimeImmutable::createFromFormat('Y/m', $json[1]);
            }
        }
    }

    /** @var bool */
    public $is;

    /**
     * Only null when: $is == false
     * 
     * When displaying, only care about the year & month.
     * @var DateTime|null
     */
    public $start;
    /**
     * When null, the project is still ongoing.
     * @var DateTime|null
     */
    public $end;

    /** @return bool */
    public function canFormat(): bool {
        return $this->is && $this->start != null;
    }

    /** @return string */
    public function format(): string {
        if (!$this->canFormat()) return '';
        $s = $this->start->format('Y M') . ' - ';
        if ($this->end == null) {
            return $s . 'Current';
        }
        return $s . $this->end->format('Y M');
    }
}

class PortfolioSectionItem {
    public function __construct(array &$json) {
        $this->id = $json['id'];
        if (isset($json['name'])) {
            $this->name = $json['name'];
        } else {
            $this->name = $this->id;
        }

        // parse tags
        $this->tags = array();
        if (isset($json['tags']) && is_array($json['tags'])) {
            $this->tags = $json['tags'];
            array_unique($this->tags);
        }

        // parse icons
        $this->icons = array();
        if (isset($json['icons']) && is_array($json['icons'])) {
            $this->icons = $json['icons'];
            array_unique($this->icons, SORT_REGULAR);
        }

        // parse links
        $this->links = array();
        if (isset($json['links']) && is_array($json['links'])) {
            foreach ($json['links'] as $jk => $jv) {
                array_push($this->links, new PortfolioSectionItemLink([$jk, $jv]));
            }
        }

        if (isset($json['active']) && is_array($json['active'])) {
            $this->active = new PortfolioSectionItemActive($json['active']);
        } else {
            $this->active = new PortfolioSectionItemActive(array());
        }

        $this->content = self::readContent($this->id);
    }
    private static function readContent(string &$id): string {
        return formatMarkdown(
            file_get_contents(K_WEB_ROOT. "/pages/portfolio/$id.md")
        );
    }

    /** @var string */
    public $id;
    /** @var string */
    public $name;

    /** @var PortfolioSectionItemActive */
    public $active;
    /** @var string[] */
    public $tags = [];
    /** @var string[] */
    public $icons = [];
    /** @var PortfolioSectionItemLink[] */
    public $links = [];
    
    /** @var string */
    public $content;


    public function isArchived(): bool {
        return $this->active->is == false
            || $this->active->end != null;
    }
}

class PortfolioSection {
    function __construct(array &$json) {
        $this->id = $json['id'];
        $this->name = $json['name'];
        $this->description = null;
        $this->website = null;
        
        if (isset($json['description'])) {
            $this->description = formatMarkdown($json['description']);
        }
        if (isset($json['website'])) {
            $this->website = $json['website'];
        }
        if (isset($json['items']) && is_array($json['items'])) {
            foreach ($json['items'] as $jsonItem) {
                array_push($this->items, new PortfolioSectionItem($jsonItem));
            }
        }
        if (isset($json['$ref_items']) && is_array($json['$ref_items'])) {
            $this->refItemIds = $json['$ref_items'];
        }
    }

    /** @var string */
    public $id;
    /** @var string */
    public $name;
    /** @var string|null */
    public $description;
    /** @var string|null */
    public $website;

    /** @var PortfolioSectionItem[] */
    public $items = [];

    /** 
     * Array if item Ids (PortfolioSectionItem->$id) that should be included in this section.
     * @var string[]
     */
    public $refItemIds = [];

    public function containsItemById(string &$id): bool {
        foreach ($this->items as $i) {
            if ($i->id == $id) {
                return true;
            }
        }
        return false;
    }

    /** @param PortfolioSectionItem[] $items */
    public function populateFromReferences(array &$items) {
        foreach ($this->refItemIds as $refItemId) {
            $found = false;
            foreach ($items as $item) {
                if ($found) continue;
                if ($item->id != $refItemId) continue;
                if (self::containsItemById($item->id)) continue;

                array_push($this->items, $item);
                $found = true;
                // remove current item ref. easier to find out invalid references
                $this->refItemIds = array_diff($this->refItemIds, [$refItemId]);
            }
        }
    }

    /**
     * Does this section exclusively have archived items?
     */
    public function isArchived() {
        $c = 0;
        foreach ($this->items as $item) {
            if ($item->isArchived()) {
                $c += 1;
            }
        }
        return $c == count($this->items);
    }

    /**
     * Does this section have any archived items?
     */
    public function hasAnyArchived(): bool {
        $c = 0;
        foreach ($this->items as $item) {
            if ($item->isArchived()) {
                $c += 1;
            }
        }
        return $c > 0;
    }

    /**
     * Create a copy of this section, but only has archived sections.
     * @return PortfolioSection
     */
    public function createArchived(): PortfolioSection {
        $a_items = [];
        $a_refItemIds = [];
        foreach ($this->items as $item) {
            if ($item->isArchived()) {
                array_push($a_items, $item);
                array_push($a_refItemIds, $item->id);
            }
        }
        $a = [
            'name' => $this->name,
            'id' => $this->id.'_archive',
            'description' => '',
            'website' => '',
            'refItemIds' => $a_refItemIds
        ];
        $r = new PortfolioSection($a);
        $r->items = $a_items;
        return $r;
    }

    /**
     * Create a copy of this section, without any archived items.
     * @return PortfolioSection
     */
    public function createWithoutArchives(): PortfolioSection {
        $a_items = [];
        $a_refItemIds = [];
        foreach ($this->items as $item) {
            if (!$item->isArchived()) {
                array_push($a_items, $item);
                array_push($a_refItemIds, $item->id);
            }
        }
        $a = [
            'name' => $this->name,
            'id' => $this->id,
            'description' => $this->description,
            'website' => $this->website,
            'refItemIds' => $a_refItemIds
        ];
        $r = new PortfolioSection($a);
        $r->items = $a_items;
        return $r;
    }
}
class PortfolioIcon {
    function __construct(array $json) {
        $this->id = $json[0];
        $this->filename = $json[1]['filename'];
        $this->altText = null;
        if (isset($json[1]['alt']) && strlen($json[1]['alt']) > 0) {
            $this->altText = $json[1]['alt'];
        }
    }

    /** @var string */
    public $id;
    /** @var string */
    public $filename;
    /** @var string|null */
    public $altText;
    
    public function getUrl(): string {
        return '/img/' . $this->filename; 
    }
    public function getAlt(): string {
        if (isset($this->altText) && strlen($this->altText) > 0) {
            return $this->altText;
        }
        return $this->id;
    }
}

class PortfolioTag {
    function __construct(array $json) {
        $this->id = $json[0];
        $this->type = $json[1]['type'];
        $this->name = $json[1]['name'];
        $this->website = null;
        if (isset($json[1]['website']) && strlen($json[1]['website']) > 0) {
            $this->website = $json[1]['website'];
        }
    }

    /** @var string */
    public $id;
    /** @var string */
    public $type;
    /** @var string */
    public $name;
    /** @var string|null */
    public $website;
}

class PortfolioData {
    function __construct(array &$json) {
        $items = [];
        if (isset($json['items']) && is_array($json['items'])) {
            foreach ($json['items'] as $jsonItem) {
                array_push($items, new PortfolioSectionItem($jsonItem));
            }
        }

        if (isset($json['sections']) && is_array($json['sections'])) {
            foreach ($json['sections'] as $jsonSection) {
                $s = new PortfolioSection($jsonSection);
                if (count($s->refItemIds) > 0) {
                    $s->populateFromReferences($items);
                }
                array_push($this->sections, $s);
            }
        }
        if (isset($json['tags']) && is_array($json['tags'])) {
            foreach ($json['tags'] as $jsonTagKey => $jsonTagValue) {
                array_push(
                    $this->tags,
                    new PortfolioTag([ $jsonTagKey, $jsonTagValue ])
                );
            }
        }
        if (isset($json['icons']) && is_array($json['icons'])) {
            foreach ($json['icons'] as $jsonTagKey => $jsonTagValue) {
                array_push(
                    $this->icons,
                    new PortfolioIcon([ $jsonTagKey, $jsonTagValue ])
                );
            }
        }

        self::checkTags();
    }

    /** @var PortfolioSection[] */
    public $sections = [];
    /** @var PortfolioTag[] */
    public $tags = [];
    /** @var PortfolioIcon[] */
    public $icons = [];

    public $errors = [];

    private function checkTags(): void {
        $all = [];
        $valid = [];
        $invalidTags = [];

        // get all tags
        foreach ($this->sections as $section) {
            foreach ($section->items as $sectionItem) {
                array_push($all, ...$sectionItem->tags);
            }
        }
        // get all registered tags
        foreach ($this->tags as $tag) {
            array_push($valid, $tag->id);
        }

        $all = array_unique($all);
        $valid = array_unique($valid);

        // find invalid tags
        foreach ($all as $tag) {
            if (!in_array($tag, $valid)) {
                array_push($invalidTags, $tag);
            }
        }

        // if there are any, add to errors
        $invalidTags = array_unique($invalidTags);
        sort($invalidTags, SORT_NATURAL | SORT_FLAG_CASE);
        if (count($invalidTags) > 0) {
            array_push($this->errors, '**'.count($invalidTags)." invalid tag(s):**\n" . implode(', ', $invalidTags));
        }
    }
}

$data_raw = JsonUtil::load(K_WEB_ROOT . '/pages/portfolio-data.json');
$data = new PortfolioData($data_raw);
foreach ($data->errors as $ek => $ev) {
    $data->errors[$ek] = formatMarkdown($ev);
}

$smarty->assign('tags', $data->tags);
$smarty->assign('icons', $data->icons);
$smarty->assign('parse_errors', $data->errors);
$sections = [];
$sections_archived = [];
foreach ($data->sections as $s) {
    if ($s->isArchived()) {
        array_push($sections_archived, $s);
    } else {
        array_push($sections, $s->createWithoutArchives());
        if ($s->hasAnyArchived()) {
            array_push($sections_archived, $s->createArchived());
        }
    }
}
$smarty->assign('sections', $sections);
$smarty->assign('sections_archived', $sections_archived);