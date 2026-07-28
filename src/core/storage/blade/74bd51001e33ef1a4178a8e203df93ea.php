<?php
    $evtOut = evo()->invokeEvent('OnManagerTreeInit', $_REQUEST);
    if (is_array($evtOut)) {
        echo implode("\n", $evtOut);
    }
?>

<?php
$__iconBackup = [
    'icon_arrow_down_circle' => $_style['icon_arrow_down_circle'],
    'icon_arrow_up_circle' => $_style['icon_arrow_up_circle'],
    'icon_add' => $_style['icon_add'],
    'icon_chain_broken' => $_style['icon_chain_broken'],
    'icon_refresh' => $_style['icon_refresh'],
    'icon_sort' => $_style['icon_sort'],
    'icon_sort_num_asc' => $_style['icon_sort_num_asc'],
    'icon_trash' => $_style['icon_trash'],
];
$_style['icon_arrow_down_circle'] = svg('tabler-arrow-down')->toHtml();
$_style['icon_arrow_up_circle'] = svg('tabler-arrow-up')->toHtml();
$_style['icon_add'] = svg('tabler-file-plus')->toHtml();
$_style['icon_chain_broken'] = svg('tabler-link-plus')->toHtml();
$_style['icon_refresh'] = svg('tabler-refresh')->toHtml();
$_style['icon_sort'] = svg('tabler-caret-up-down')->toHtml();
$_style['icon_sort_num_asc'] = svg('tabler-sort-ascending-letters')->toHtml();
$_style['icon_trash'] = svg('tabler-trash')->toHtml();
?>

<div class="treeframebody">
    <div id="treeMenu">
        <a class="treeButton" id="treeMenu_expandtree" onclick="evo.tree.expandTree();" title="<?php echo e(ManagerTheme::getLexicon('expand_tree')); ?>"><?php echo $_style['icon_arrow_down_circle']; ?></a>
        <a class="treeButton" id="treeMenu_collapsetree" onclick="evo.tree.collapseTree();" title="<?php echo e(ManagerTheme::getLexicon('collapse_tree')); ?>"><?php echo $_style['icon_arrow_up_circle']; ?></a>
        <?php if(evo()->hasPermission('new_document')): ?>
            <a class="treeButton" id="treeMenu_addresource" onclick="evo.tabs({url:'<?php echo e(EVO_MANAGER_URL); ?>?a=4', title: '<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>'});" title="<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>"><?php echo $_style['icon_add']; ?></a>
            <a class="treeButton" id="treeMenu_addweblink" onclick="evo.tabs({url:'<?php echo e(EVO_MANAGER_URL); ?>?a=72', title: '<?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>'});" title="<?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>"><?php echo $_style['icon_chain_broken']; ?></a>
        <?php endif; ?>
        <a class="treeButton" id="treeMenu_refreshtree" onclick="evo.tree.restoreTree();" title="<?php echo e(ManagerTheme::getLexicon('refresh_tree')); ?>"><?php echo $_style['icon_refresh']; ?></a>
        <a class="treeButton" id="treeMenu_sortingtree" onclick="evo.tree.showSorter(event);" title="<?php echo e(ManagerTheme::getLexicon('sort_tree')); ?>"><?php echo $_style['icon_sort']; ?></a>
        <?php if(evo()->hasPermission('edit_document') && evo()->hasPermission('save_document')): ?>
            <a class="treeButton" id="treeMenu_sortingindex" onclick="evo.tree.openSortMenuIndex();" title="<?php echo e(ManagerTheme::getLexicon('sort_menuindex')); ?>"><?php echo $_style['icon_sort_num_asc']; ?></a>
        <?php endif; ?>
        
        
        <?php if(evo()->hasPermission('empty_trash')): ?>
            <a class="treeButton treeButtonDisabled" id="treeMenu_emptytrash" title="<?php echo e(ManagerTheme::getLexicon('empty_recycle_bin_empty')); ?>"><?php echo $_style['icon_trash']; ?></a>
        <?php endif; ?>
        
    </div>

    <div id="treeHolder">
        <?php
            $evtOut = evo()->invokeEvent('OnManagerTreePrerender', $_REQUEST);
            if (is_array($evtOut)) {
                echo implode("\n", $evtOut);
            }
            $siteName = evo()->getConfig('site_name');
        ?>

        <div id="node0" class="rootNode"><a class="node" onclick="evo.tree.treeAction(event, 0)" data-id="0"
            data-title-esc="<?php echo e($siteName); ?>"><span class="icon"><i
            class="<?php echo e($_style['icon_sitemap']); ?>"></i></span><span class="title"><?php echo e($siteName); ?></span></a>
            <div id="treeloader"><i class="<?php echo e($_style['icon_cog']); ?> <?php echo e($_style['icon_spin']); ?>"></i></div>
        </div>
        <div id="treeRoot0" class="treeRoot"></div>

        <?php
            $evtOut = evo()->invokeEvent('OnManagerTreeRender', $_REQUEST);
            if (is_array($evtOut)) {
                echo implode("\n", $evtOut);
            }
        ?>
    </div>
</div>

<?php
foreach ($__iconBackup as $__key => $__value) {
    $_style[$__key] = $__value;
}
?>
<?php /**PATH /var/www/html/manager//views//frame/tree.blade.php ENDPATH**/ ?>