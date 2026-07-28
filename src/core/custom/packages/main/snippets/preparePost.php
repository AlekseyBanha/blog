<?php
/**
 * Prepare DocLister rows: tags HTML + image fallback + banner slide link.
 */
$tags = trim((string) ($data['tv.tags'] ?? ''));
$html = [];
if ($tags !== '') {
    $parts = array_values(array_filter(array_map('trim', explode(',', $tags))));
    $last = count($parts) - 1;
    foreach ($parts as $i => $tag) {
        $comma = $i < $last ? ',' : '';
        $url = '[~5~]?tag=' . rawurlencode($tag);
        $html[] = '<li><a href="' . $url . '">' . htmlspecialchars($tag, ENT_QUOTES, 'UTF-8') . '</a>' . $comma . '</li>';
    }
}
$data['tags_html'] = implode("\n", $html);

$image = trim((string) ($data['tv.image'] ?? ''));
if ($image === '') {
    $image = 'assets/images/blog-thumb-01.jpg';
}
$data['tv.image'] = ltrim($image, '/');

$category = trim((string) ($data['tv.category'] ?? ''));
if ($category === '') {
    $data['tv.category'] = 'Подорожі';
}

$views = max(0, (int) ($data['tv.views'] ?? 0));
$data['tv.views'] = (string) $views;

$slideUrl = trim((string) ($data['tv.slide_url'] ?? ''));
if ($slideUrl === '') {
    $data['slide_href'] = $data['url'] ?? '#';
} elseif (preg_match('/^\[~(\d+)~]$/', $slideUrl, $m)) {
    $data['slide_href'] = '[~' . $m[1] . '~]';
} elseif (ctype_digit($slideUrl)) {
    $data['slide_href'] = '[~' . $slideUrl . '~]';
} else {
    $data['slide_href'] = $slideUrl;
}

return $data;
