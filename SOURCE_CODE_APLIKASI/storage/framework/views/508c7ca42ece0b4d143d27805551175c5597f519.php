<?php if(config('sweetalert.alwaysLoadJS') === true && config('sweetalert.neverLoadJS') === false ): ?>
    <script src="<?php echo e($cdn ?? asset('vendor/sweetalert/sweetalert.all.js')); ?>"></script>
<?php endif; ?>
<?php if(Session::has('alert.config')): ?>
    <?php if(config('sweetalert.animation.enable')): ?>
        <link rel="stylesheet" href="<?php echo e(config('sweetalert.animatecss')); ?>">
    <?php endif; ?>
    <?php if(config('sweetalert.alwaysLoadJS') === false && config('sweetalert.neverLoadJS') === false): ?>
        <script src="<?php echo e($cdn ?? asset('vendor/sweetalert/sweetalert.all.js')); ?>"></script>
    <?php endif; ?>
    <script>
        Swal.fire(<?php echo Session::pull('alert.config'); ?>);
    </script>
<?php endif; ?>
<?php /**PATH H:\KATALOG_PWA_LARAVEL\ID337C - PosyanduCare - Aplikasi Posyandu Timbangan Balita Dan Jadwal Imunisasi\SOURCE_CODE_APLIKASI\resources\views/vendor/sweetalert/alert.blade.php ENDPATH**/ ?>