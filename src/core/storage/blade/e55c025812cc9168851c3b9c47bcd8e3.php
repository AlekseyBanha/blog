<header class="">
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="<?php echo e($homeUrl); ?>"><h2><?php echo e($siteName); ?><em>.</em></h2></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <?php $__currentLoopData = $menu; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <li class="nav-item<?php echo e(!empty($item['active']) ? ' active' : ''); ?>">
                            <a class="nav-link" href="<?php echo e($item['url']); ?>"><?php echo e($item['title']); ?>

                                <?php if(!empty($item['active'])): ?>
                                    <span class="sr-only">(current)</span>
                                <?php endif; ?>
                            </a>
                        </li>
                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </ul>
            </div>
        </div>
    </nav>
</header>
<?php /**PATH /var/www/html/views/partials/header.blade.php ENDPATH**/ ?>