<?php
    $sql = "SELECT * FROM TRAINING_INSTITUTE";
    $training_institute = getAll($connect, $sql);
?>
<h2 class=" mt-2 text-info">Danh sách viện đào tạo</h2>
<hr>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-6 pl-0">
            <div class="table-responsive mt-2">
                <table class="table table-striped table-sm table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 1%;">STT</th>
                        <th style="width: 3%;">Mã viện đào tạo</th>
                        <th style="width: 10%;">Viện đào tạo</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    foreach ($training_institute as $item) {
                        ?>
                        <tr>
                            <td class="text-center"><?= $item['id']?></td>
                            <td class="text-center"><?= $item['training_institute_code']?></td>
                            <td><?= $item['training_institute_name']?></td>
                        </tr>
                    <?php }?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<a href="?r=trang-chu" class="btn btn-secondary">Trở về</a>