<?php
    $sql = "SELECT * FROM USER WHERE ID = '{$user_id}'";
    $user_info = getOne($connect, $sql);
?>

<h2 class="mt-2 text-info">Hồ sơ cá nhân</h2>
<style>
    .gradient-custom {
    /* fallback for old browsers */
    background: #f6d365;

    /* Chrome 10-25, Safari 5.1-6 */
    background: -webkit-linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1));

    /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    background: linear-gradient(to right bottom, rgba(246, 211, 101, 1), rgba(253, 160, 133, 1))
    }
</style>

<hr>
<div class="container py-5 h-80">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col col-lg-6 mb-4 mb-lg-0">
        <div class="card mb-3" style="border-radius: .5rem;">
          <div class="row g-0">
            <div class="col-md-4 gradient-custom text-center text-white"
              style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">
              <img src="image/meow.png" alt="Avatar" class="img-fluid my-5" style="width: 80px;" />
              <h4><?= $user_info['fullname']?></h4>
              <p><?= ucfirst($user_info['user_type'])?></p>
            </div>
            <div class="col-md-8">
              <div class="card-body p-20">
                <h6>Thông tin </h6>
                <hr class="mt-0 mb-4">
                <div class="row pt-1">
                    <div class="col-4 mb-2">
                        <h6 class="mt-2">SĐT: </h6>
                        <h6 class="mt-2">Email: </h6>
                        <h6 class="mt-2">Địa chỉ: </h6>
                        <h6 class="mt-2">Trạng thái: </h6>
                    </div>
                    <div class="col-8 mb-3">
                        <h6 class="mt-2"><?= $user_info['phone_number']?></h6>
                        <h6 class="mt-2"><?= $user_info['email']?></h6>
                        <h6 class="mt-2"><?= $user_info['address']?></h6>
                        <h6 class="mt-2"><?= ucfirst($user_info['status'])?></h6>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</div>