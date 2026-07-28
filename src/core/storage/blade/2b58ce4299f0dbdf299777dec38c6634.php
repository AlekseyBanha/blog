

<?php $__env->startSection('content'); ?>
    <div class="main-banner header-text">
        <div class="container-fluid">
            <div class="owl-banner owl-carousel">
                <?php $__currentLoopData = $bannerPosts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="item">
                        <img src="<?php echo e($item['image']); ?>" alt="<?php echo e($item['pagetitle']); ?>">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span><?php echo e($item['category']); ?></span>
                                </div>
                                <a href="<?php echo e($item['url']); ?>"><h4><?php echo e($item['pagetitle']); ?></h4></a>
                                <ul class="post-info">
                                    <li><a href="<?php echo e($item['url']); ?>">Admin</a></li>
                                    <li><a href="<?php echo e($item['url']); ?>"><?php echo e($item['date']); ?></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
        </div>
    </div>

    <?php echo $__env->make('partials.cta', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>

    <section class="blog-posts">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="all-blog-posts">
                        <div class="row">
                            <?php $__empty_1 = true; $__currentLoopData = $posts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="<?php echo e($item['image']); ?>" alt="<?php echo e($item['pagetitle']); ?>">
                                        </div>
                                        <div class="down-content">
                                            <span><?php echo e($item['category']); ?></span>
                                            <a href="<?php echo e($item['url']); ?>"><h4><?php echo e($item['pagetitle']); ?></h4></a>
                                            <ul class="post-info">
                                                <li><a href="<?php echo e($item['url']); ?>">Admin</a></li>
                                                <li><a href="<?php echo e($item['url']); ?>"><?php echo e($item['date']); ?></a></li>
                                            </ul>
                                            <p><?php echo e($item['introtext']); ?></p>
                                            <div class="post-options">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            <?php $__currentLoopData = $item['tags']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $i => $tag): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                <li><a href="<?php echo e($blogUrl); ?>"><?php echo e($tag); ?></a><?php if($i < count($item['tags']) - 1): ?>,<?php endif; ?></li>
                                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                        </ul>
                                                    </div>
                                                    <div class="col-6">
                                                        <ul class="post-share">
                                                            <li><i class="fa fa-share-alt"></i></li>
                                                            <li><a href="#">Facebook</a>,</li>
                                                            <li><a href="#"> Twitter</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
                                <div class="col-lg-12"><p>No posts yet.</p></div>
                            <?php endif; ?>
                            <div class="col-lg-12">
                                <div class="main-button">
                                    <a href="<?php echo e($blogUrl); ?>">View All Posts</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <?php echo $__env->make('partials.sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?>
                </div>
            </div>
        </div>
    </section>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH /var/www/html/views/home.blade.php ENDPATH**/ ?>