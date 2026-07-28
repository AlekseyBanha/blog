<!DOCTYPE html>
<html lang="<?php echo e(evo()->getConfig('lang', 'en')); ?>" class="page">
<head>
    <base href="<?php echo e(evo()->getConfig('site_url', '/')); ?>"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="<?php echo e($doc['description'] ?? ''); ?>">
    <?php if(is_array($evtHead = evo()->invokeEvent('OnWebDocumentRender'))): ?>
        <?php echo implode('', $evtHead); ?>

    <?php endif; ?>
    <title><?php echo e($doc['pagetitle'] ?? $siteName); ?> | <?php echo e($siteName); ?></title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/templatemo-stand-blog.css">
    <link rel="stylesheet" href="/css/owl.css">
</head>
<body>
<?php echo $__env->make('partials.preloader', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<?php echo $__env->make('partials.header', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

<?php echo $__env->yieldContent('content'); ?>

<?php echo $__env->make('partials.footer', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
<script src="/js/jquery.min.js"></script>
<script src="/js/bootstrap.bundle.min.js"></script>
<script src="/js/custom.js"></script>
<script src="/js/owl.js"></script>
<script src="/js/slick.js"></script>
<script src="/js/isotope.js"></script>
<script src="/js/accordions.js"></script>
<?php echo $__env->yieldPushContent('scripts.bottom'); ?>
</body>
</html>
<?php /**PATH /var/www/html/views/layout.blade.php ENDPATH**/ ?>