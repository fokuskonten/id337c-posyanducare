<?php $__env->startSection('content'); ?>
<div class="main-content-container container-fluid p-4">
    <div class="row">
        <div class="col-md">
            <div class="card">
                <div class="card-header">
                    <div class="row"> 
                        <div class="col-md">
                            <h5>Data Pendaftaran</h5>
                        </div>
                        <div class="col-md text-right">
                            <a class="btn btn-primary" href="<?php echo e(Route('admin.laporan.pendaftaran')); ?>" target="_blank"><i class="material-icons">print</i> Cetak Data</a>
                            <button type="button" class="btn btn-success" data-toggle="modal"
                                data-target=".bd-example-modal-lg">+ Tambah Data</button>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                            <tr> 
                                <th>No</th>
                                <th>Nama Anak</th>
                                <th>Nama Orang Tua</th>
                                <th>Tempat, Tanggal Lahir</th>
                                <th>Alamat</th>
                                <th>No. Hp</th>
                                <th>Status</th>
                                <th class="text-center">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $__currentLoopData = $data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $d): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>

                            <tr>
                                <td><?php echo e($loop->iteration); ?></td>
                                <td><?php echo e($d->nama); ?></td>
                                <td><?php echo e($d->nama_orang_tua); ?></td>
                                <td><?php echo e($d->tempat_lahir); ?>,
                                    <?php echo e(carbon\carbon::parse($d->tanggal_lahir)->translatedFormat('d F Y')); ?></td>
                                <td><?php echo e($d->alamat); ?></td>
                                <td><?php echo e($d->nomor_telepon); ?></td>
                                <td>
                                    <?php switch($d->status):
                                    case (0): ?>
                                    <span class="badge badge-info">belum diverifikasi</span>

                                    <?php break; ?>
                                    <?php case (1): ?>
                                    <span class="badge badge-primary">terverifikasi</span>

                                    <?php break; ?>
                                    <?php default: ?>

                                    <?php endswitch; ?>
                                </td>
                                <td class="text-center">
                                    <?php if($d->status == 0): ?>
                                    <a class="btn btn-rounded btn-success"
                                        href="<?php echo e(Route('admin.pendaftaran.verif',['uuid'=> $d->pendaftaran_id])); ?>"><i
                                            class="material-icons">check_circle</i></a>
                                    <a class="btn btn-rounded btn-primary"
                                        href="<?php echo e(Route('admin.pendaftaran.edit',['uuid'=> $d->pendaftaran_id])); ?>"><i
                                            class="material-icons">edit</i></a>
                                    <a class="btn btn-secondary" href="#"><i class="material-icons">delete</i></a>
                                    <?php endif; ?>
                                    <a class="btn btn-rounded btn-warning"
                                        href="<?php echo e(Route('admin.pendaftaran.show',['uuid'=> $d->pendaftaran_id])); ?>"><i
                                            class="material-icons">info</i></a>
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

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
    aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tambah Data</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?php echo e(Route('admin.pendaftaran.store')); ?>" method="POST">
                    <?php echo csrf_field(); ?>
                    <div class="input-group mb-3">
                        <label for="">Nama Anak</label>
                        <div class="input-group input-group-seamless">
                            <span class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="material-icons">medication</i>
                                </span>
                            </span>
                            <input type="text" name="nama" class="form-control" id="form1-username"
                                placeholder="Nama Anak" required>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md">
                            <div class="input-group mb-3">
                                <label for="">Tempat lahir</label>
                                <div class="input-group input-group-seamless">
                                    <span class="input-group-prepend">
                                        <span class="input-group-text">
                                            <i class="material-icons">location_on</i>
                                        </span>
                                    </span>
                                    <input type="text" name="tempat_lahir" class="form-control" id="form1-username"
                                        placeholder="Kota..." required>
                                </div>
                            </div>
                        </div>
                        <div class="col-md">
                            <div class="form-group">
                                <label for="">Tanggal Lahir</label>
                                <input class="form-control" type="date" name="tanggal_lahir" required>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <label for="">Nama Orangtua (Ibu)</label>
                        <div class="input-group input-group-seamless">
                            <span class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="material-icons">medication</i>
                                </span>
                            </span>
                            <input type="text" name="nama_orang_tua" class="form-control" id="form1-username"
                                placeholder="Nama Orang Tua (Ibu)" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Alamat</label>
                        <textarea name="alamat" id="" class="form-control" required></textarea>
                    </div>
                    <div class="input-group mb-3">
                        <label for="">Nomor Hp</label>
                        <div class="input-group input-group-seamless">
                            <span class="input-group-prepend">
                                <span class="input-group-text">
                                    <i class="material-icons">phone</i>
                                </span>
                            </span>
                            <input type="text" name="nomor_telepon" class="form-control" id="form1-username"
                                maxlength="14" required>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="material-icons">close</i>
                    Batal</button>
                <button type="submit" class="btn btn-primary"><i class="material-icons">save</i> Simpan Data</button>
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
<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH H:\KATALOG_PWA_LARAVEL\ID337C - PosyanduCare - Aplikasi Posyandu Timbangan Balita Dan Jadwal Imunisasi\SOURCE_CODE_APLIKASI\resources\views/admin/pendaftaran/index.blade.php ENDPATH**/ ?>