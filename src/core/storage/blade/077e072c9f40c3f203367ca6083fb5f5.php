<div class="sidebar">
    <div class="row">
        <div class="col-lg-12">
            <div class="sidebar-item search">
                <form id="search_form" name="gs" method="GET" action="<?php echo e($blogUrl); ?>">
                    <input type="text" name="search" class="searchText" placeholder="type to search..." autocomplete="on" value="<?php echo e($_GET['search'] ?? ''); ?>">
                </form>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item recent-posts">
                <div class="sidebar-heading">
                    <h2>Recent Posts</h2>
                </div>
                <div class="content">
                    <ul>
                        <?php $__currentLoopData = $recentPosts; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li>
                                <a href="<?php echo e($item['url']); ?>">
                                    <h5><?php echo e($item['pagetitle']); ?></h5>
                                    <span><?php echo e($item['date']); ?></span>
                                </a>
                            </li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item categories">
                <div class="sidebar-heading">
                    <h2>Categories</h2>
                </div>
                <div class="content">
                    <ul>
                        <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><a href="<?php echo e($blogUrl); ?>">- <?php echo e($category); ?></a></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="sidebar-item tags">
                <div class="sidebar-heading">
                    <h2>Tag Clouds</h2>
                </div>
                <div class="content">
                    <ul>
                        <?php $__currentLoopData = $tagCloud; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $tag): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <li><a href="<?php echo e($blogUrl); ?>"><?php echo e($tag); ?></a></li>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<?php /**PATH /var/www/html/views/partials/sidebar.blade.php ENDPATH**/ ?>