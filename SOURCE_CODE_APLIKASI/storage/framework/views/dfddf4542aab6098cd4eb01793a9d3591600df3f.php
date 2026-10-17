<?php $__env->startSection('content'); ?>
<div class="main-content-container container-fluid p-4">
    <div class="row">
        <div class="col-md">
            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md">
                            <h5>Data Imunisasi</h5>
                        </div>
                        <div class="col-md text-right">
                            <a class="btn btn-primary" href="<?php echo e(Route('admin.laporan.imunisasi')); ?>" target="_blank"><i class="material-icons">print</i>
                                Cetak Data</a>
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                data-target="#exampleModal">+ Tambah Data</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Vaksin</th>
                                <th>Petugas Imunisasi</th>
                                <th>Tanggal Imunisasi</th>
                                <th>Tempat Imunisasi</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $d): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                            <tr>
                                <td><?php echo e($loop->iteration); ?></td>
                                <td><?php echo e($d->vaksin->nama_vaksin); ?></td>
                                <td><?php echo e($d->bidan->nama); ?></td>
                                <td><?php echo e(carbon\carbon::parse($d->tanggal_imunisasi)->translatedFormat('d F Y')); ?></td>
                                <td><?php echo e($d->tempat_imunisasi); ?></td>
                                <td class="text-center">
                                    <a class="btn btn-rounded btn-info"
                                        href="<?php echo e(Route('admin.imunisasi.show',['uuid'=>$d->id])); ?>"><i
                                            class="material-icons">info</i></a>
                                    <a class="btn btn-rounded btn-primary"
                                        href="<?php echo e(Route('admin.imunisasi.edit',['uuid'=>$d->id])); ?>"><i
                                            class="material-icons">edit</i></a>
                                    <a href="<?php echo e(Route('admin.imunisasi.destroy',['uuid'=>$d->id])); ?>"
                                        class="btn btn-secondary"
                                        onclick="return confirm('Apa anda yakin ingin menghapus data?')"><i
                                            class="material-icons">delete</i></a>
                                </td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="<?php echo e(Route('admin.imunisasi.store')); ?>" method="POST">
                <?php echo csrf_field(); ?>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="">Bidan</label>
                        <select name="bidan_id" id="" class="form-control" required>
                            <option value="">-- pilih petugas imunisasi --</option>
                            <?php $__currentLoopData = $bidan; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $v): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($v->bidan_id); ?>"><?php echo e($v->nama); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Vaksin</label>
                        <select name="vaksin_id" id="" class="form-control" required>
                            <option value="">-- pilih vaksin --</option>
                            <?php $__currentLoopData = $vaksin; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $v): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($v->vaksin_id); ?>"><?php echo e($v->nama_vaksin); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Tanggal Imunisasi</label>
                        <input type="date" name="tanggal_imunisasi" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="">Tempat Imunisasi</label>
                        <input type="text" name="tempat_imunisasi" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"><i
                            class="material-icons">close</i>
                        Batal</button>
                    <button type="submit" class="btn btn-primary"><i class="material-icons">save</i> Simpan
                        Data</button>
                </div>
            </form>
        </div>
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('scripts'); ?>
<script>
    $(document).ready(function() {
            $('#example').DataTable();
        } );
</script>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\KATALOG_PWA_LARAVEL\ID337C - PosyanduCare - Aplikasi Posyandu Timbangan Balita Dan Jadwal Imunisasi\SOURCE_CODE_APLIKASI\resources\views/admin/imunisasi/index.blade.php ENDPATH**/ ?>