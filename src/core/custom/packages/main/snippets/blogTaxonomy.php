<?php
/**
 * Unique categories or tags from published posts for the sidebar.
 *
 * Usage: [[blogTaxonomy? &type=`category`]] or [[blogTaxonomy? &type=`tags`]]
 */
$type = trim((string) ($type ?? 'category'));
$splitByComma = $type === 'tags';
$tvName = $splitByComma ? 'tags' : 'category';
$blogParent = 5;

$tvId = (int) \EvolutionCMS\Models\SiteTmplvar::query()->where('name', $tvName)->value('id');
if ($tvId === 0) {
    return '';
}

$postIds = \EvolutionCMS\Models\SiteContent::query()
    ->where('parent', $blogParent)
    ->where('published', 1)
    ->where('deleted', 0)
    ->pluck('id');

if ($postIds->isEmpty()) {
    return '';
}

$values = \EvolutionCMS\Models\SiteTmplvarContentvalue::query()
    ->where('tmplvarid', $tvId)
    ->whereIn('contentid', $postIds)
    ->where('value', '!=', '')
    ->pluck('value');

$items = [];
foreach ($values as $raw) {
    $parts = $splitByComma ? explode(',', (string) $raw) : [(string) $raw];
    foreach ($parts as $part) {
        $part = trim($part);
        if ($part !== '') {
            $items[$part] = true;
        }
    }
}

$list = array_keys($items);
sort($list, SORT_NATURAL | SORT_FLAG_CASE);

$html = [];
foreach ($list as $item) {
    $encoded = rawurlencode($item);
    $safe = htmlspecialchars($item, ENT_QUOTES, 'UTF-8');
    if ($splitByComma) {
        $html[] = '<li><a href="[~' . $blogParent . '~]?tag=' . $encoded . '">' . $safe . '</a></li>';
    } else {
        $html[] = '<li><a href="[~' . $blogParent . '~]?category=' . $encoded . '">- ' . $safe . '</a></li>';
    }
}

return implode("\n", $html);
