

<?php $__env->startSection('content'); ?>
    <div class="heading-page header-text">
        <section class="page-heading">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-content">
                            <h4><?php echo e($doc['longtitle'] ?: 'Page'); ?></h4>
                            <h2><?php echo e($doc['pagetitle']); ?></h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <?php echo $doc['content']; ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/views/page.blade.php ENDPATH**/ ?>