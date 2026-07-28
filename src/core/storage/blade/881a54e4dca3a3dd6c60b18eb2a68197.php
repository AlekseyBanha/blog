<?php
if (!function_exists('jsSvg')) {
    function jsSvg($svg) {
        $svg = str_replace(["\n", "\r", "\t"], '', $svg);
        $svg = preg_replace('/\s+/', ' ', $svg);
        return json_encode(trim($svg));
    }
}
if (!function_exists('jsIcon')) {
    function jsIcon($icon) {
        if (strpos($icon, '<') === false) {
            if (strpos($icon, 'tabler-') === 0) {
                $icon = svg($icon)->toHtml();
            } else {
                $icon = '<i class="' . $icon . '"></i>';
            }
        }
        return jsSvg($icon);
    }
}
if (!function_exists('iconHtml')) {
    function iconHtml($icon, $attrs = '') {
        if (strpos($icon, '<svg') !== false) {
            return $icon;
        }
        return '<i class="' . $icon . '"' . $attrs . '></i>';
    }
}

// Tabler SVG overrides for the frame menu/tree icons
$_style['icon_arrow_down_circle'] = svg('tabler-arrow-down')->toHtml();
$_style['icon_arrow_up_circle'] = svg('tabler-arrow-up')->toHtml();
$_style['icon_add'] = svg('tabler-file-plus')->toHtml();
$_style['icon_chain'] = svg('tabler-link')->toHtml();
$_style['icon_chain_broken'] = svg('tabler-link-plus')->toHtml();
$_style['icon_search'] = svg('tabler-search')->toHtml();
$_style['icon_camera'] = svg('tabler-camera')->toHtml();
$_style['icon_files'] = svg('tabler-files')->toHtml();
$_style['icon_desktop'] = svg('tabler-device-desktop')->toHtml();
$_style['icon_user'] = svg('tabler-user-circle')->toHtml();
$_style['icon_lock'] = svg('tabler-lock')->toHtml();
$_style['icon_logout'] = svg('tabler-logout')->toHtml();
$_style['icon_theme'] = svg('tabler-brightness')->toHtml();
$_style['icon_cogs'] = svg('tabler-settings-cog')->toHtml();
$_style['icon_sliders'] = svg('tabler-adjustments-horizontal')->toHtml();
$_style['icon_calendar'] = svg('tabler-calendar')->toHtml();
$_style['icon_info_triangle'] = svg('tabler-info-triangle')->toHtml();
$_style['icon_user_secret'] = svg('tabler-timeline-event-exclamation')->toHtml();
$_style['icon_info_circle'] = svg('tabler-info-circle')->toHtml();
$_style['icon_question_circle'] = svg('tabler-help-circle')->toHtml();
$_style['icon_home'] = svg('tabler-home')->toHtml();
$_style['icon_expand'] = svg('tabler-arrows-maximize')->toHtml();
$_style['icon_compress'] = svg('tabler-arrows-minimize')->toHtml();
$_style['icon_trash'] = svg('tabler-trash-x')->toHtml();
$_style['icon_trash_alt'] = svg('tabler-trash')->toHtml();
$managerTitle = evo()->getConfig('site_name') . ' - (Evolution CMS Manager)';
?>
<!DOCTYPE html>
<html dir="<?php echo e(ManagerTheme::getTextDir()); ?>" lang="<?php echo e(ManagerTheme::getLang()); ?>" xml:lang="<?php echo e(ManagerTheme::getLang()); ?>" class="manager-frame <?php echo e(ManagerTheme::getThemeStyle()); ?>">
<head>
    <title><?php echo $managerTitle; ?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo e(ManagerTheme::getCharset()); ?>" />
    <meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1,width=device-width" />
    <meta name="theme-color" content="<?php echo e(ManagerTheme::getThemeColor()); ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" type="text/css" href="<?php echo e($css); ?>" />
    <?php if(evo()->getConfig('show_picker')): ?>
        <link rel="stylesheet" href="media/style/common/spectrum/spectrum.css" />
        <link rel="stylesheet" type="text/css" href="<?php echo e(ManagerTheme::getThemeUrl()); ?>css/color.switcher.css" />
    <?php endif; ?>
    <link rel="icon" type="image/ico" href="<?php echo e(ManagerTheme::getStyle('favicon')); ?>" />
    <style>
        #tree{width:<?php echo e($EVO_widthSideBar); ?>rem}
        #main,#resizer{left:<?php echo e($EVO_widthSideBar); ?>rem}
        html.manager-frame,
        html.manager-frame body,
        html.manager-frame #frameset{background-color:<?php echo e(ManagerTheme::getThemeColor()); ?>}
        .ios #main{-webkit-overflow-scrolling:touch;overflow-y:scroll;}
        #mainMenu #nav #bars .icon-expand,
        #mainMenu #nav #bars .icon-collapse{display:inline-block;}
        body:not(.sidebar-closed) #bars .icon-expand{display:none!important;}
        body:not(.sidebar-closed) #bars .icon-collapse{display:inline-block!important;}
        body.sidebar-closed #bars .icon-expand{display:inline-block!important;}
        body.sidebar-closed #bars .icon-collapse{display:none!important;}
        #mainMenu .nav > li > ul > li.dropdown-toggle > a > svg.toggle,
        #mainMenu .nav > li > ul > li.dropdown-toggle > a > svg[class*="chevron"],
        #mainMenu .nav > li > ul > li.dropdown-toggle > a > svg[class*="angle"]{
            position:absolute!important;
            top:50%!important;
            right:.75rem!important;
            transform:translateY(-50%)!important;
            width:.9em!important;
            height:.9em!important;
            opacity:.6!important;
        }
    </style>
    <script>
        if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
            document.documentElement.className += ' ios';
        }
    </script>
    <script src="media/script/jquery/jquery.min.js" type="text/javascript"></script>
    <script>
        // GLOBAL variable evo
        var evo = {
            MGR_DIR: '<?php echo e(MGR_DIR); ?>',
            EVO_SITE_URL: '<?php echo e(EVO_SITE_URL); ?>',
            EVO_MANAGER_URL: '<?php echo e(EVO_MANAGER_URL); ?>',
            MODX_SITE_URL: '<?php echo e(EVO_SITE_URL); ?>',
            MODX_MANAGER_URL: '<?php echo e(EVO_MANAGER_URL); ?>',
            user: {
                role: <?php echo e((int)$user['role']); ?>,
                username: '<?php echo e($user['username']); ?>',
                groups: <?php echo json_encode(evo()->getUserDocGroups()); ?>

            },
            config: {
                manager_title: <?php echo json_encode($managerTitle, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES); ?>,
                menu_height: <?php echo e((int)evo()->getConfig('manager_menu_height')); ?>,
                tree_width: <?php echo e((int)$EVO_widthSideBar); ?>,
                tree_min_width: <?php echo e((int)$tree_min_width); ?>,
                session_timeout: <?php echo e((int)evo()->getConfig('session_timeout')); ?>,
                site_start: <?php echo e((int)evo()->getConfig('site_start')); ?>,
                tree_page_click: <?php echo e(evo()->getConfig('tree_page_click')); ?>,
                theme: '<?php echo e(ManagerTheme::getTheme()); ?>',
                theme_mode: '<?php echo e(ManagerTheme::getThemeStyle()); ?>',
                which_browser: '<?php echo e($user['which_browser']); ?>',
                layout: <?php echo e((int)evo()->getConfig('manager_layout')); ?>,
                textdir: '<?php echo e(ManagerTheme::getTextDir()); ?>',
                global_tabs: <?php echo e((int)evo()->getConfig('global_tabs')); ?>

            },
            tree: {
                itemToChange: '',
                selectedObjectName: null
            },
            lang: <?php echo js_json([
                'already_deleted' => ManagerTheme::getLexicon('already_deleted'),
                'cm_unknown_error' => ManagerTheme::getLexicon('cm_unknown_error'),
                'collapse_tree' => ManagerTheme::getLexicon('collapse_tree'),
                'confirm_delete_resource' => ManagerTheme::getLexicon('confirm_delete_resource'),
                'confirm_empty_trash' => ManagerTheme::getLexicon('confirm_empty_trash'),
                'confirm_publish' => ManagerTheme::getLexicon('confirm_publish'),
                'confirm_remove_locks' => ManagerTheme::getLexicon('confirm_remove_locks'),
                'confirm_resource_duplicate' => ManagerTheme::getLexicon('confirm_resource_duplicate'),
                'confirm_undelete' => ManagerTheme::getLexicon('confirm_undelete'),
                'confirm_unpublish' => ManagerTheme::getLexicon('confirm_unpublish'),
                'empty_recycle_bin' => ManagerTheme::getLexicon('empty_recycle_bin'),
                'empty_recycle_bin_empty' => ManagerTheme::getLexicon('empty_recycle_bin_empty'),
                'error_no_privileges' => ManagerTheme::getLexicon('error_no_privileges'),
                'error_parent_deleted' => ManagerTheme::getLexicon('error_parent_deleted'),
                'expand_tree' => ManagerTheme::getLexicon('expand_tree'),
                'loading_doc_tree' => ManagerTheme::getLexicon('loading_doc_tree'),
                'loading_menu' => ManagerTheme::getLexicon('loading_menu'),
                'not_deleted' => ManagerTheme::getLexicon('not_deleted'),
                'unable_set_link' => ManagerTheme::getLexicon('unable_set_link'),
                'unable_set_parent' => ManagerTheme::getLexicon('unable_set_parent'),
                'working' => ManagerTheme::getLexicon('working'),
                'paging_prev' => ManagerTheme::getLexicon('paging_prev'),
            ]); ?>,
            style: {
                actions_file: '<?php echo addslashes($_style['icon_file']); ?>',
                actions_pencil: '<?php echo addslashes($_style['icon_pencil']); ?>',
                actions_plus: '<?php echo addslashes($_style['icon_plus']); ?>',
                actions_reply: '<?php echo addslashes($_style['icon_reply']); ?>',
                collapse_tree: <?php echo jsIcon($_style['icon_arrow_up_circle']); ?>,
                email: '<?php echo addslashes('<i class="' . $_style['icon_mail'] . '"></i>'); ?>',
                expand_tree: <?php echo jsIcon($_style['icon_arrow_down_circle']); ?>,
                icon_angle_left: '<?php echo addslashes($_style['icon_angle_left']); ?>',
                icon_angle_right: '<?php echo addslashes($_style['icon_angle_right']); ?>',
                icon_chunk: '<?php echo addslashes($_style['icon_chunk']); ?>',
                icon_circle: '<?php echo addslashes($_style['icon_circle']); ?>',
                icon_code: '<?php echo addslashes($_style['icon_code']); ?>',
                icon_edit: '<?php echo addslashes($_style['icon_edit']); ?>',
                icon_element: '<?php echo addslashes($_style['icon_elements']); ?>',
                icon_folder: '<?php echo addslashes('<i class="' . $_style['icon_folder'] . '"></i>'); ?>',
                icon_plugin: '<?php echo addslashes($_style['icon_plugin']); ?>',
                icon_refresh: '<?php echo addslashes($_style['icon_refresh']); ?>',
                icon_spin: '<?php echo addslashes($_style['icon_spin']); ?>',
                icon_template: '<?php echo addslashes($_style['icon_template']); ?>',
                icon_trash: <?php echo jsIcon($_style['icon_trash']); ?>,
                icon_trash_alt: <?php echo jsIcon($_style['icon_trash_alt']); ?>,
                icon_tv: '<?php echo addslashes($_style['icon_tv']); ?>',
                icons_external_link: '<?php echo addslashes('<i class="' . $_style['icon_external_link'] . '"></i>'); ?>',
                icons_working: <?php echo jsIcon($_style['icon_info_triangle']); ?>,
                tree_folder: '<?php echo addslashes('<i class="' . $_style['icon_folder'] . '"></i>'); ?>',
                tree_folder_secure: '<?php echo addslashes('<i class="' . $_style['icon_folder'] . '"></i>'); ?>',
                tree_folderopen: '<?php echo addslashes('<i class="' . $_style['icon_folder_open'] . '"></i>'); ?>',
                tree_folderopen_secure: '<?php echo addslashes('<i class="' . $_style['icon_folder_open'] . '"></i>'); ?>',
                tree_info: <?php echo jsIcon($_style['icon_info_circle']); ?>,
                tree_minusnode: '<?php echo addslashes('<i class="' . $_style['icon_angle_down'] . '"></i>'); ?>',
                tree_plusnode: '<?php echo addslashes('<i class="' . $_style['icon_angle_right'] . '"></i>'); ?>',
                tree_preview_resource: '<?php echo addslashes('<i class="' . $_style['icon_eye'] . '"></i>'); ?>'
            },
            permission: {
                assets_images: <?php echo e(evo()->hasPermission('assets_images') ? 1 : 0); ?>,
                delete_document: <?php echo e(evo()->hasPermission('delete_document') ? 1 : 0); ?>,
                edit_chunk: <?php echo e(evo()->hasPermission('edit_chunk') ? 1 : 0); ?>,
                edit_plugin: <?php echo e(evo()->hasPermission('edit_plugin') ? 1 : 0); ?>,
                edit_snippet: <?php echo e(evo()->hasPermission('edit_snippet') ? 1 : 0); ?>,
                edit_template: <?php echo e(evo()->hasPermission('edit_template') ? 1 : 0); ?>,
                new_document: <?php echo e(evo()->hasPermission('new_document') ? 1 : 0); ?>,
                publish_document: <?php echo e(evo()->hasPermission('publish_document') ? 1 : 0); ?>,
                dragndropdocintree: <?php echo e(evo()->hasPermission('new_document') && evo()->hasPermission('edit_document') && evo()->hasPermission('save_document') ? 1 : 0); ?>

            },
            plugins: {
                ElementsInTree: <?php echo e(isset(evo()->pluginCache['ElementsInTree']) ? 1 : 0); ?>,
                EVOmodal: <?php echo e(isset(evo()->pluginCache['EVO.modal']) ? 1 : 0); ?>

            },
            extend: function() {
                for (var i = 1; i < arguments.length; i++) {
                    for (var key in arguments[i]) {
                        if (arguments[i].hasOwnProperty(key)) {
                            arguments[0][key] = arguments[i][key];
                        }
                    }
                }
                return arguments[0];
            },
            extended: function(a) {
                for (var b in a) {
                    this[b] = a[b];
                }
                delete a[b];
            },
            openedArray: [],
            lockedElementsTranslation: <?= json_encode($unlockTranslations, JSON_FORCE_OBJECT | JSON_UNESCAPED_UNICODE) . "\n" ?>
        };
        <?php
        $opened = array_filter(array_map('intval', explode('|', isset($_SESSION['openedArray']) && is_scalar($_SESSION['openedArray']) ? $_SESSION['openedArray'] : '')));
        echo (empty($opened) ? '' : 'evo.openedArray[' . implode("] = 1;\n		evo.openedArray[", $opened) . '] = 1;') . "\n";
        ?>
        // Legacy aliases for manager plugins that still read parent.modx.tree / parent.tree.
        window.modx = evo;
        window.tree = evo.tree;
    </script>
    <script src="media/script/tree-drop-guard-helper.js?v=<?php echo e(evo()->getVersionData('version')); ?>"></script>
    <script src="media/script/main-target-link-helper.js?v=<?php echo e(evo()->getVersionData('version')); ?>"></script>
    <script src="<?php echo e(ManagerTheme::getThemeUrl()); ?>js/evo.js?v=<?php echo e(evo()->getVersionData('version')); ?>"></script>
    <?php if($modx->getConfig('show_picker')): ?>
        <script src="media/script/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="media/script/spectrum/spectrum.evo.min.js" type="text/javascript"></script>
        <script src="<?php echo e(ManagerTheme::getThemeUrl()); ?>js/color.switcher.js" type="text/javascript"></script>
    <?php endif; ?>
    <?php
    // invoke OnManagerTopPrerender event
    $evtOut = $modx->invokeEvent('OnManagerTopPrerender', $_REQUEST);
    if (is_array($evtOut)) {
        echo implode("\n", $evtOut);
    }
    ?>
</head>
<body class="<?php echo e($body_class); ?>">
<input type="hidden" name="sessToken" id="sessTokenInput" value="<?php echo e(isset($_SESSION['mgrToken']) ? $_SESSION['mgrToken'] : ''); ?>" />
<div id="frameset">
    <div id="mainMenu" class="dropdown">
        <div class="container">
            <div class="row">
                <div class="cell" data-evocp="bgmColor"><?php echo $menu; ?></div>
                <div class="cell" data-evocp="bgmColor">
                    <ul id="settings" class="nav">
                        <li id="searchform">
                            <form action="index.php?a=71" method="post" target="main">
                                <input type="hidden" value="Search" name="submitok" />
                                <label for="searchid" class="label_searchid"><?php echo $_style['icon_search']; ?></label>
                                <input type="text" id="searchid" name="searchid" size="25" />
                                <div class="mask"></div>
                            </form>
                        </li>
                        <?php if(evo()->getConfig('show_newresource_btn') && evo()->hasPermission('new_document')): ?>
                            <li id="newresource" class="dropdown newresource">
                                <a href="javascript:;" class="dropdown-toggle" onclick="return false;" title="<?php echo e(ManagerTheme::getLexicon('add_resource')); ?>">
                                    <?php echo $_style['icon_add']; ?>

                                </a>
                                <ul class="dropdown-menu">
                                    <?php if(evo()->hasPermission('new_document')): ?>
                                        <li>
                                            <a onclick="" href="index.php?a=4" target="main">
                                                <?php echo $_style['icon_add']; ?> <?php echo e(ManagerTheme::getLexicon('add_resource')); ?>

                                            </a>
                                        </li>
                                        <li>
                                            <a onclick="" href="index.php?a=72" target="main">
                                                <?php echo iconHtml($_style['icon_chain']); ?> <?php echo e(ManagerTheme::getLexicon('add_weblink')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->getConfig('use_browser') && evo()->hasPermission('assets_images')): ?>
                                        <li>
                                            <a onclick="" href="media/browser/<?php echo e(evo()->getConfig('which_browser')); ?>/browse.php?&type=images" target="main">
                                                <?php echo $_style['icon_camera']; ?> <?php echo e(ManagerTheme::getLexicon('images_management')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->getConfig('use_browser') && evo()->hasPermission('assets_files')): ?>
                                        <li>
                                            <a onclick="" href="media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php?&type=files" target="main">
                                                <?php echo $_style['icon_files']; ?> <?php echo e(ManagerTheme::getLexicon('files_management')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                </ul>
                            </li>
                        <?php endif; ?>
                        <li id="preview">
                            <a href="../" target="_blank" title="<?php echo e(ManagerTheme::getLexicon('preview')); ?>">
                                <?php echo $_style['icon_desktop']; ?>

                            </a>
                        </li>
                        <li id="account" class="dropdown account">
                            <a href="javascript:;" class="dropdown-toggle" onclick="return false;">
                                <?php if($user['photo']): ?>
                                    <span class="icon photo" style="background-image: url(<?php echo EVO_SITE_URL . entities($user['photo'], evo()->getConfig('modx_charset')); ?>);"></span>
                                <?php else: ?>
                                    <span class="icon"><?php echo $_style['icon_user']; ?></span>
                                <?php endif; ?>
                                <span class="username"><?php echo e(entities($user['username'], evo()->getConfig('modx_charset'))); ?></span>
                            </a>
                            <ul class="dropdown-menu">
                                <?php if(evo()->hasPermission('change_password')): ?>
                                    <li>
                                        <a onclick="" href="index.php?a=28" target="main">
                                            <?php echo $_style['icon_lock']; ?> <?php echo e(ManagerTheme::getLexicon('change_password')); ?>

                                        </a>
                                    </li>
                                <?php endif; ?>
                                <li>
                                    <a href="index.php?a=8">
                                        <?php echo $_style['icon_logout']; ?> <?php echo e(ManagerTheme::getLexicon('logout')); ?>

                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li id="theme">
                            <a id="treeMenu_theme_dark" onclick="evo.tree.toggleTheme(event)" title="<?php echo e(ManagerTheme::getLexicon('manager_theme_mode_title')); ?>">
                                <span class="icon"><?php echo $_style['icon_theme']; ?></span>
                            </a>
                        </li>
                        <?php if(
                            evo()->hasPermission('settings') ||
                            evo()->hasPermission('view_eventlog') ||
                            evo()->hasPermission('logs') ||
                            evo()->hasPermission('help')
                        ): ?>
                            <li id="system" class="dropdown">
                                <a href="javascript:;" class="dropdown-toggle" title="<?php echo e(ManagerTheme::getLexicon('system')); ?>" onclick="return false;">
                                    <?php echo $_style['icon_cogs']; ?>

                                </a>
                                <ul class="dropdown-menu">
                                    <?php if(evo()->hasPermission('settings')): ?>
                                        <li>
                                            <a href="index.php?a=17" target="main">
                                                <?php echo $_style['icon_sliders']; ?> <?php echo e(ManagerTheme::getLexicon('edit_settings')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->hasPermission('view_eventlog')): ?>
                                        <li>
                                            <a href="index.php?a=70" target="main">
                                                <?php echo $_style['icon_calendar']; ?> <?php echo e(ManagerTheme::getLexicon('site_schedule')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->hasPermission('view_eventlog')): ?>
                                        <li>
                                            <a href="index.php?a=114" target="main">
                                                <?php echo $_style['icon_info_triangle']; ?> <?php echo e(ManagerTheme::getLexicon('eventlog_viewer')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->hasPermission('logs')): ?>
                                        <li>
                                            <a href="index.php?a=13" target="main">
                                                <?php echo $_style['icon_user_secret']; ?> <?php echo e(ManagerTheme::getLexicon('view_logging')); ?>

                                            </a>
                                        </li>
                                        <li>
                                            <a href="index.php?a=53" target="main">
                                                <?php echo $_style['icon_info_circle']; ?> <?php echo e(ManagerTheme::getLexicon('view_sysinfo')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php if(evo()->hasPermission('help')): ?>
                                        <li>
                                            <a href="index.php?a=9" target="main">
                                                <?php echo $_style['icon_question_circle']; ?> <?php echo e(ManagerTheme::getLexicon('help')); ?>

                                            </a>
                                        </li>
                                    <?php endif; ?>
                                    <?php
                                        $style = evo()->getConfig('settings_version') !== evo()->getVersionData('version') ? 'style="color:#ffff8a;"' : '';
                                        echo '<li><span class="dropdown-item" title="' . evo()->getPhpCompat()->entities(evo()->getConfig('site_name')) . ' &ndash; ' . evo()->getVersionData('full_appname') . '" ' . $style . '>' . evo()->getVersionData('branch') . ' ' . evo()->getConfig('settings_version') . '</span></li>';
                                    ?>
                                </ul>
                            </li>
                        <?php endif; ?>
                        <?php if(evo()->getConfig('show_fullscreen_btn')): ?>
                            <li id="fullscreen">
                                <a href="javascript:;" onclick="toggleFullScreen();" id="toggleFullScreen" title="<?php echo e(ManagerTheme::getLexicon('toggle_fullscreen')); ?>">
                                    <?php echo $_style['icon_expand']; ?>

                                </a>
                            </li>
                        <?php endif; ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div id="tree"><?php echo $__env->make('manager::frame.tree', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?></div>
    <div id="main">
        <?php if(evo()->getConfig('global_tabs')): ?>
            <div class="tab-row-container evo-tab-row">
                <div class="tab-row">
                    <h2 id="evo-tab-home" class="tab selected" data-target="evo-tab-page-home" style="display:none!important;">
                        <?php echo iconHtml($_style['icon_home']); ?>

                    </h2>
                </div>
            </div>
            <div id="evo-tab-page-home" class="evo-tab-page show iframe-scroller">
                <iframe id="mainframe" src="index.php?a=<?php echo e($initMainframeAction); ?>" scrolling="auto" frameborder="0" onload="evo.main.onload(event);"></iframe>
            </div>
        <?php else: ?>
            <div class="iframe-scroller">
                <iframe id="mainframe" name="main" src="index.php?a=<?php echo e($initMainframeAction); ?>" scrolling="auto" frameborder="0" onload="evo.main.onload(event);"></iframe>
            </div>
        <?php endif; ?>
        <script>
            if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
                document.getElementById('mainframe').setAttribute('scrolling', 'no');
                document.getElementsByClassName("tabframes").setAttribute("scrolling", "no");
            }
        </script>
        <div id="mainloader"><div class="evo__logo">EVO</div></div>
    </div>
    <div id="resizer"></div>
    <div id="searchresult"></div>
    <div id="floater" class="dropdown">
        <?php
            $sortParams = ['tree_sortby', 'tree_sortdir', 'tree_nodename'];
            foreach ($sortParams as $param) {
                if (isset($_REQUEST[$param])) {
                    evo()->getManagerApi()->saveLastUserSetting($param, $_REQUEST[$param]);
                    $_SESSION[$param] = $_REQUEST[$param];
                } elseif (!isset($_SESSION[$param])) {
                    $_SESSION[$param] = evo()->getManagerApi()->getLastUserSetting($param);
                }
            }
        ?>
        <form name="sortFrm" id="sortFrm">
            <div class="form-group">
                <input type="hidden" name="dt" value="<?php echo e(isset($_REQUEST['dt']) ? htmlspecialchars($_REQUEST['dt']) : ''); ?>" />
                <label><?php echo e(ManagerTheme::getLexicon('sort_tree')); ?></label>
                <select name="sortby" class="form-control">
                    <option value="isfolder" <?php echo e($_SESSION['tree_sortby'] == 'isfolder' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('folder')); ?></option>
                    <option value="pagetitle" <?php echo e($_SESSION['tree_sortby'] == 'pagetitle' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('pagetitle')); ?></option>
                    <option value="longtitle" <?php echo e($_SESSION['tree_sortby'] == 'longtitle' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('long_title')); ?></option>
                    <option value="id" <?php echo e($_SESSION['tree_sortby'] == 'id' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('id')); ?></option>
                    <option value="menuindex" <?php echo e($_SESSION['tree_sortby'] == 'menuindex' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('resource_opt_menu_index')); ?></option>
                    <option value="createdon" <?php echo e($_SESSION['tree_sortby'] == 'createdon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('createdon')); ?></option>
                    <option value="editedon" <?php echo e($_SESSION['tree_sortby'] == 'editedon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('editedon')); ?></option>
                    <option value="publishedon" <?php echo e($_SESSION['tree_sortby'] == 'publishedon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('page_data_publishdate')); ?></option>
                    <option value="alias" <?php echo e($_SESSION['tree_sortby'] == 'alias' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('page_data_alias')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <select name="sortdir" class="form-control">
                    <option value="DESC" <?php echo e($_SESSION['tree_sortdir'] == 'DESC' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('sort_desc')); ?></option>
                    <option value="ASC" <?php echo e($_SESSION['tree_sortdir'] == 'ASC' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('sort_asc')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <label><?php echo e(ManagerTheme::getLexicon('setting_resource_tree_node_name')); ?></label>
                <select name="nodename" class="form-control">
                    <option value="default" <?php echo e($_SESSION['tree_nodename'] == 'default' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('default')); ?></option>
                    <option value="pagetitle" <?php echo e($_SESSION['tree_nodename'] == 'pagetitle' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('pagetitle')); ?></option>
                    <option value="longtitle" <?php echo e($_SESSION['tree_nodename'] == 'longtitle' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('long_title')); ?></option>
                    <option value="menutitle" <?php echo e($_SESSION['tree_nodename'] == 'menutitle' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('resource_opt_menu_title')); ?></option>
                    <option value="alias" <?php echo e($_SESSION['tree_nodename'] == 'alias' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('alias')); ?></option>
                    <option value="createdon" <?php echo e($_SESSION['tree_nodename'] == 'createdon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('createdon')); ?></option>
                    <option value="editedon" <?php echo e($_SESSION['tree_nodename'] == 'editedon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('editedon')); ?></option>
                    <option value="publishedon" <?php echo e($_SESSION['tree_nodename'] == 'publishedon' ? 'selected' : ''); ?>><?php echo e(ManagerTheme::getLexicon('page_data_publishdate')); ?></option>
                </select>
            </div>
            <div class="form-group">
                <label>
                    <input type="checkbox" name="showonlyfolders" value="<?php echo e($_SESSION['tree_show_only_folders'] ? 1 : ''); ?>" onclick="this.value = (this.value ? '' : 1);" <?php echo e($_SESSION['tree_show_only_folders'] ? '' : 'checked'); ?> /><?php echo e(ManagerTheme::getLexicon('view_child_resources_in_container')); ?>

                </label>
            </div>
            <div class="text-center">
                <a href="javascript:;" class="btn btn-primary" onclick="evo.tree.updateTree();evo.tree.showSorter(event);" title="<?php echo e(ManagerTheme::getLexicon('sort_tree')); ?>"><?php echo e(ManagerTheme::getLexicon('sort_tree')); ?></a>
            </div>
        </form>
    </div>
    <?php
    $__contextIconBackup = [
        'icon_document' => $_style['icon_document'],
        'icon_edit' => $_style['icon_edit'],
        'icon_move' => $_style['icon_move'],
        'icon_clone' => $_style['icon_clone'],
        'icon_sort_num_asc' => $_style['icon_sort_num_asc'],
        'icon_check' => $_style['icon_check'],
        'icon_close' => $_style['icon_close'],
        'icon_trash' => $_style['icon_trash'],
        'icon_undo' => $_style['icon_undo'],
        'icon_chain' => $_style['icon_chain'],
        'icon_info' => $_style['icon_info'],
        'icon_eye' => $_style['icon_eye'],
    ];
    $_style['icon_document'] = svg('tabler-file-plus')->toHtml();
    $_style['icon_edit'] = svg('tabler-file-pencil')->toHtml();
    $_style['icon_move'] = svg('tabler-replace')->toHtml();
    $_style['icon_clone'] = svg('tabler-copy')->toHtml();
    $_style['icon_sort_num_asc'] = svg('tabler-sort-ascending-letters')->toHtml();
    $_style['icon_check'] = svg('tabler-check')->toHtml();
    $_style['icon_close'] = svg('tabler-x')->toHtml();
    $_style['icon_trash'] = svg('tabler-trash')->toHtml();
    $_style['icon_undo'] = svg('tabler-arrow-back-up')->toHtml();
    $_style['icon_chain'] = svg('tabler-link')->toHtml();
    $_style['icon_info'] = svg('tabler-info-square-rounded')->toHtml();
    $_style['icon_eye'] = svg('tabler-eye')->toHtml();

    if (!function_exists('constructLink')) {
        /**
         * @param string $action
         * @param string $img
         * @param string $text
         * @param bool $allowed
         */
        function constructLink($action, $img, $text, $allowed)
        {
            if ((bool) $allowed) {
                echo '<div class="menuLink" id="item' . $action . '" onclick="evo.tree.menuHandler(' . $action . ');">';
                echo iconHtml($img) . ' ' . $text . '</div>';
            }
        }
    }
    ?><!-- Contextual Menu Popup Code -->
    <div id="mx_contextmenu" class="dropdown" onselectstart="return false;">
        <div id="nameHolder">&nbsp;</div>
        <?php
        constructLink(3, $_style['icon_document'], ManagerTheme::getLexicon('create_resource_here'), evo()->hasPermission('new_document')); // new Resource
        constructLink(2, $_style['icon_edit'], ManagerTheme::getLexicon('edit_resource'), evo()->hasPermission('edit_document')); // edit
        constructLink(5, $_style['icon_move'], ManagerTheme::getLexicon('move_resource'), evo()->hasPermission('save_document')); // move
        constructLink(7, $_style['icon_clone'], ManagerTheme::getLexicon('resource_duplicate'), evo()->hasPermission('new_document')); // duplicate
        constructLink(11, $_style['icon_sort_num_asc'], ManagerTheme::getLexicon('sort_menuindex'), !!(evo()->hasPermission('edit_document') && $modx->hasPermission('save_document'))); // sort menu index
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(9, $_style['icon_check'], ManagerTheme::getLexicon('publish_resource'), evo()->hasPermission('publish_document')); // publish
        constructLink(10, $_style['icon_close'], ManagerTheme::getLexicon('unpublish_resource'), evo()->hasPermission('publish_document')); // unpublish
        constructLink(4, $_style['icon_trash'], ManagerTheme::getLexicon('delete_resource'), evo()->hasPermission('delete_document')); // delete
        constructLink(8, $_style['icon_undo'], ManagerTheme::getLexicon('undelete_resource'), evo()->hasPermission('delete_document')); // undelete
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(6, $_style['icon_chain'], ManagerTheme::getLexicon('create_weblink_here'), evo()->hasPermission('new_document')); // new Weblink
        ?>
        <div class="seperator"></div>
        <?php
        constructLink(1, $_style['icon_info'], ManagerTheme::getLexicon('resource_overview'), evo()->hasPermission('view_document')); // view
        constructLink(12, $_style['icon_eye'], ManagerTheme::getLexicon('preview_resource'), 1); // preview
        ?>

    </div>

    <?php
    foreach ($__contextIconBackup as $__key => $__value) {
        $_style[$__key] = $__value;
    }
    ?>

    <script type="text/javascript">
        if (document.getElementById('treeMenu')) {
            <?php if(evo()->getConfig('use_browser') && evo()->hasPermission('assets_images')): ?>

            var treeMenuOpenImages = document.getElementById('treeMenu_openimages');
            if (treeMenuOpenImages) treeMenuOpenImages.onclick = function(e) {
                e.preventDefault();
                if (evo.config.global_tabs && !e.shiftKey) {
                    evo.tabs({
                        url: '<?php echo e(EVO_MANAGER_URL); ?>media/browser/<?php echo e(evo()->getConfig('which_browser')); ?>/browse.php?filemanager=media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php&type=images',
                        title: '<?php echo e(ManagerTheme::getLexicon('images_management')); ?>'
                    });
                } else {
                    var randomNum = '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>';
                    if (e.shiftKey) {
                        randomNum += ' #' + Math.floor((Math.random() * 999999) + 1);
                    }
                    evo.openWindow({
                        url: '<?php echo e(EVO_MANAGER_URL); ?>media/browser/<?php echo e(evo()->getConfig('which_browser')); ?>/browse.php?&type=images',
                        title: randomNum
                    });
                }
            };
            <?php endif; ?>
            <?php if(evo()->getConfig('use_browser') && evo()->hasPermission('assets_files')): ?>

            var treeMenuOpenFiles = document.getElementById('treeMenu_openfiles');
            if (treeMenuOpenFiles) treeMenuOpenFiles.onclick = function(e) {
                e.preventDefault();
                if (evo.config.global_tabs && !e.shiftKey) {
                    evo.tabs({
                        url: '<?php echo e(EVO_MANAGER_URL); ?>media/browser/<?php echo e(evo()->getConfig('which_browser')); ?>/browse.php?filemanager=media/browser/<?php echo e($modx->getConfig('which_browser')); ?>/browse.php&type=files',
                        title: '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>'
                    });
                } else {
                    var randomNum = '<?php echo e(ManagerTheme::getLexicon('files_files')); ?>';
                    if (e.shiftKey) {
                        randomNum += ' #' + Math.floor((Math.random() * 999999) + 1);
                    }
                    evo.openWindow({
                        url: '<?php echo e(EVO_MANAGER_URL); ?>media/browser/<?php echo e(evo()->getConfig('which_browser')); ?>/browse.php?&type=files',
                        title: randomNum
                    });
                }
            };
            <?php endif; ?>

        }
    </script>
    <?php if(evo()->getConfig('show_fullscreen_btn')): ?>
        <script>
            function toggleFullScreen() {
                if ((document.fullScreenElement && document.fullScreenElement !== null) ||
                    (!document.mozFullScreen && !document.webkitIsFullScreen)) {
                    if (document.documentElement.requestFullScreen) {
                        document.documentElement.requestFullScreen();
                    } else if (document.documentElement.mozRequestFullScreen) {
                        document.documentElement.mozRequestFullScreen();
                    } else if (document.documentElement.webkitRequestFullScreen) {
                        document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                    }
                } else {
                    if (document.cancelFullScreen) {
                        document.cancelFullScreen();
                    } else if (document.mozCancelFullScreen) {
                        document.mozCancelFullScreen();
                    } else if (document.webkitCancelFullScreen) {
                        document.webkitCancelFullScreen();
                    }
                }
            }

            $('#toggleFullScreen').click(function() {
                var $toggle = $(this);
                var isExpanded = $toggle.data('expanded') === true;
                $toggle.html(isExpanded ? <?php echo jsIcon($_style['icon_expand']); ?> : <?php echo jsIcon($_style['icon_compress']); ?>);
                $toggle.data('expanded', !isExpanded);
            });
        </script>
    <?php endif; ?>
    <?php echo evo()->invokeEvent('OnManagerFrameLoader', ['action' => ManagerTheme::getActionId()]); ?>

</div>
<?php if(evo()->getConfig('show_picker')): ?>
    <div class="evocp-box">
        <div class="evocp-icon"><i class="evocpicon <?php echo e($_style['icon_brush']); ?>" aria-hidden="true"></i></div>
        <div class="evocp-frame">
            <h2>COLOR SWITCHER</h2>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".bgmcolors"><i
                                class="togglearrow <?php echo e($_style['icon_chevron_down']); ?>" aria-hidden="true"></i> <i
                                class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu Background</h3><a
                            title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;"
                            onclick="cleanLocalStorageReloadAll('my_evo_bgmcolor')"
                            class="pull-right resetcolor btn btn-secondary"><i
                                class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse in bgmcolors">
                    <div class="evocp-bgmcolors">
                        <div class="evocp-bgmcolor">#000</div>
                        <div class="evocp-bgmcolor">#222</div>
                        <div class="evocp-bgmcolor">#333</div>
                        <div class="evocp-bgmcolor">#444</div>
                        <div class="evocp-bgmcolor">#555</div>
                        <div class="evocp-bgmcolor">#777</div>
                        <div class="evocp-bgmcolor">#888</div>
                        <div class="evocp-bgmcolor">#0f243e</div>
                        <div class="evocp-bgmcolor">#548dd4</div>
                        <div class="evocp-bgmcolor">#134f5c</div>
                        <div class="evocp-bgmcolor">#0b5394</div>
                        <div class="evocp-bgmcolor">#351c75</div>
                        <div class="evocp-bgmcolor">#741b47</div>
                        <div class="evocp-bgmcolor">#900</div>
                    </div>
                    <input type="color" class="color" id="bgmPicker" name="evocpCustombgmColor"
                           value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 span data-toggle="collapse" data-target=".menuColors"><i
                                class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i
                                class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu links</h3> <a
                            title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;"
                            onclick="cleanLocalStorageReloadMain('my_evo_menuColor')"
                            class="pull-right resetcolor btn btn-secondary"><i
                                class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse menuColors">
                    <div class="evocp-menuColors">
                        <div class="evocp-menuColor">#000</div>
                        <div class="evocp-menuColor">#222</div>
                        <div class="evocp-menuColor">#555</div>
                        <div class="evocp-menuColor">#666</div>
                        <div class="evocp-menuColor evocp_light">#dedede</div>
                        <div class="evocp-menuColor evocp_light">#fafafa</div>
                        <div class="evocp-menuColor evocp_light">#fff</div>
                        <div class="evocp-menuColor">#b45f06</div>
                        <div class="evocp-menuColor">#38761d</div>
                        <div class="evocp-menuColor">#134f5c</div>
                        <div class="evocp-menuColor">#0b5394</div>
                        <div class="evocp-menuColor">#351c75</div>
                        <div class="evocp-menuColor">#741b47</div>
                        <div class="evocp-menuColor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="menucolorPicker" name="evocpCustommenuColor"
                           value="#cf2626" placeholder="color code...">
                </div>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".menuHColors"><i
                                class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i
                                class="<?php echo e($_style['icon_bars']); ?>" aria-hidden="true"></i> Menu links:hover </h3><a
                            title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;"
                            onclick="cleanLocalStorageReloadMain('my_evo_menuHColor')"
                            class="pull-right resetcolor btn btn-secondary"><i
                                class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse menuHColors">
                    <div class="evocp-menuHColors">
                        <div class="evocp-menuHColor">#000</div>
                        <div class="evocp-menuHColor">#222</div>
                        <div class="evocp-menuHColor">#555</div>
                        <div class="evocp-menuHColor">#666</div>
                        <div class="evocp-menuHColor evocp_light">#dedede</div>
                        <div class="evocp-menuHColor evocp_light">#fafafa</div>
                        <div class="evocp-menuHColor evocp_light">#fff</div>
                        <div class="evocp-menuHColor">#b45f06</div>
                        <div class="evocp-menuHColor">#38761d</div>
                        <div class="evocp-menuHColor">#134f5c</div>
                        <div class="evocp-menuHColor">#0b5394</div>
                        <div class="evocp-menuHColor">#351c75</div>
                        <div class="evocp-menuHColor">#741b47</div>
                        <div class="evocp-menuHColor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="menuHcolorPicker" name="evocpCustommenuHColor"
                           value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".cpcolors"><i
                                class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i> <i
                                class="<?php echo e($_style['icon_font']); ?>" aria-hidden="true"></i> Text color </h3><a
                            title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;"
                            onclick="cleanLocalStorageReloadMain('my_evo_color')"
                            class="pull-right resetcolor btn btn-secondary"><i
                                class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse cpcolors">
                    <div class="evocp-colors">
                        <div class="evocp-color">#000</div>
                        <div class="evocp-color">#222</div>
                        <div class="evocp-color">#333</div>
                        <div class="evocp-color">#444</div>
                        <div class="evocp-color">#555</div>
                        <div class="evocp-color">#777</div>
                        <div class="evocp-color">#888</div>
                        <div class="evocp-color">#b45f06</div>
                        <div class="evocp-color">#38761d</div>
                        <div class="evocp-color">#134f5c</div>
                        <div class="evocp-color">#0b5394</div>
                        <div class="evocp-color">#351c75</div>
                        <div class="evocp-color">#741b47</div>
                        <div class="evocp-color">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="textcolorPicker" name="textcolorPicker"
                           value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 data-toggle="collapse" data-target=".alinkcolors"><i
                                class="togglearrow <?php echo e($_style['icon_chevron_right']); ?>" aria-hidden="true"></i>
                        <?php echo iconHtml($_style['icon_chain'], ' aria-hidden="true"'); ?> Links Color</h3> <a
                            title="<?php echo e(ManagerTheme::getLexicon('reset')); ?>" href="javascript:;"
                            onclick="cleanLocalStorageReloadMain('my_evo_alinkcolor')"
                            class="pull-right resetcolor btn btn-secondary"><i
                                class="<?php echo e($_style['icon_refresh']); ?>"></i></a>
                </div>
                <div class="panel-body collapse alinkcolors">
                    <div class="evocp-alinkcolors">
                        <div class="evocp-alinkcolor">#000</div>
                        <div class="evocp-alinkcolor">#222</div>
                        <div class="evocp-alinkcolor">#555</div>
                        <div class="evocp-alinkcolor">#666</div>
                        <div class="evocp-alinkcolor">#dedede</div>
                        <div class="evocp-alinkcolor">#fafafa</div>
                        <div class="evocp-alinkcolor">#fff</div>
                        <div class="evocp-alinkcolor">#b45f06</div>
                        <div class="evocp-alinkcolor">#38761d</div>
                        <div class="evocp-alinkcolor">#134f5c</div>
                        <div class="evocp-alinkcolor">#0b5394</div>
                        <div class="evocp-alinkcolor">#351c75</div>
                        <div class="evocp-alinkcolor">#741b47</div>
                        <div class="evocp-alinkcolor">#9d2661</div>
                    </div>
                    <input class="color" type="color" id="linkcolorPicker" name="alinkcolorPicker"
                           value="#cf2626" placeholder="color code...">
                </div>
            </div>
            <hr />
            <input type="reset"
                   onclick="cleanLocalStorageReloadAll('my_evo_alinkcolor,my_evo_menuColor,my_evo_menuHColor,my_evo_bgmcolor,my_evo_color')"
                   class="btn btn-secondary" value="<?php echo e(ManagerTheme::getLexicon('reset')); ?>">
        </div>
    </div>
    <script>
        $("#bgmPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'bgmPicker',
            showInput: true,
            allowEmpty: true
        });
        $("#menucolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'menucolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty: true
        });
        $("#menuHcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'menuHcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty: true
        });
        $("#textcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'textcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty: true
        });
        $("#linkcolorPicker").spectrum({
            showButtons: false,
            preferredFormat: "hex3",
            containerClassName: 'linkcolorPicker',
            replacerClassName: 'evo-cp-replacer',
            showInput: true,
            allowEmpty: true
        });
    </script>
<?php endif; ?>
</body>
</html>
<?php /**PATH /var/www/html/manager//views//frame/1.blade.php ENDPATH**/ ?>