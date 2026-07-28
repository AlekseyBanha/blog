<?php
/**
 * Ensure the "views" TV exists and is attached to the Post template.
 * Run: php core/custom/packages/main/ensure-views-tv.php
 */

define('MODX_API_MODE', true);

require dirname(__DIR__, 4) . '/index.php';

$tv = \EvolutionCMS\Models\SiteTmplvar::query()->where('name', 'views')->first();
if (!$tv) {
    $tv = new \EvolutionCMS\Models\SiteTmplvar();
    $tv->name = 'views';
}
$tv->caption = 'Перегляди';
$tv->type = 'number';
$tv->default_text = '0';
$tv->description = 'Лічильник переглядів статті';
$tv->save();
$tvId = (int) $tv->id;

$postTemplateId = (int) \EvolutionCMS\Models\SiteTemplate::query()
    ->where('templatealias', 'post_details')
    ->value('id');

if ($postTemplateId === 0) {
    $postTemplateId = (int) \EvolutionCMS\Models\SiteTemplate::query()
        ->where('templatename', 'Post')
        ->value('id');
}

if ($postTemplateId > 0) {
    $exists = \EvolutionCMS\Models\SiteTmplvarTemplate::query()
        ->where('tmplvarid', $tvId)
        ->where('templateid', $postTemplateId)
        ->exists();
    if (!$exists) {
        \EvolutionCMS\Models\SiteTmplvarTemplate::query()->insert([
            'tmplvarid' => $tvId,
            'templateid' => $postTemplateId,
            'rank' => 10,
        ]);
    }
}

echo "TV views #{$tvId} ready (template #{$postTemplateId})\n";
