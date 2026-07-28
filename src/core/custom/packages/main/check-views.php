<?php
define('MODX_API_MODE', true);
require dirname(__DIR__, 4) . '/index.php';

$tvId = (int) \EvolutionCMS\Models\SiteTmplvar::query()->where('name', 'views')->value('id');
$rows = \EvolutionCMS\Models\SiteTmplvarContentvalue::query()
    ->where('tmplvarid', $tvId)
    ->get(['contentid', 'value']);

foreach ($rows as $r) {
    echo $r->contentid . '=' . $r->value . PHP_EOL;
}
if ($rows->isEmpty()) {
    echo "no values yet\n";
}
