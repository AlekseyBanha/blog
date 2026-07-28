<?php
/**
 * Prepare DocLister rows: tags HTML + image fallback.
 */
$tags = trim((string) ($data['tv.tags'] ?? ''));
$html = [];
if ($tags !== '') {
    $parts = array_values(array_filter(array_map('trim', explode(',', $tags))));
    $last = count($parts) - 1;
    foreach ($parts as $i => $tag) {
        $comma = $i < $last ? ',' : '';
        $html[] = '<li><a href="#">' . htmlspecialchars($tag, ENT_QUOTES, 'UTF-8') . '</a>' . $comma . '</li>';
    }
}
$data['tags_html'] = implode("\n", $html);

$image = trim((string) ($data['tv.image'] ?? ''));
if ($image === '') {
    $image = 'images/blog-thumb-01.jpg';
}
$data['tv.image'] = ltrim($image, '/');

$category = trim((string) ($data['tv.category'] ?? ''));
if ($category === '') {
    $data['tv.category'] = 'Blog';
}

return $data;
