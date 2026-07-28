<?php namespace EvolutionCMS\Main\Controllers;

class PostDetailsController extends BaseController
{
    public function render()
    {
        $doc = $this->evo->documentObject;
        $tvs = [
            'image' => $doc['image'] ?? ($doc['tv.image'] ?? ''),
            'category' => $doc['category'] ?? ($doc['tv.category'] ?? ''),
            'tags' => $doc['tags'] ?? ($doc['tv.tags'] ?? ''),
            'views' => $doc['views'] ?? ($doc['tv.views'] ?? '0'),
        ];

        // documentObject stores TVs as nested arrays in some Evo versions
        foreach (['image', 'category', 'tags', 'views'] as $name) {
            if (isset($doc[$name]) && is_array($doc[$name])) {
                $tvs[$name] = $doc[$name][1] ?? ($doc[$name]['value'] ?? '');
            }
        }

        $this->data['post'] = $this->mapPost([
            'id' => $doc['id'],
            'pagetitle' => $doc['pagetitle'],
            'introtext' => $doc['introtext'] ?? '',
            'content' => $doc['content'] ?? '',
            'publishedon' => $doc['publishedon'] ?? 0,
            'tvs' => $tvs,
        ]);
    }

    public function noCacheRender()
    {
        $docId = (int) ($this->evo->documentIdentifier ?? 0);
        if ($docId <= 0 || $this->isBotRequest()) {
            return;
        }

        $views = $this->incrementPostViews($docId);
        if (isset($this->data['post'])) {
            $this->data['post']['views'] = $views;
            $this->data['post']['views_label'] = $this->formatViewsLabel($views);
        }
    }
}
