<?php
    ob_clean();
    session_start();
?>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Đăng nhập</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="css/mdb.min.css" />
    <style>
      #intro {
        background-image: url(https://mdbootstrap.com/img/new/fluid/city/008.jpg);
        height: 800px;
      }

      /* Height for devices larger than 576px */
      @media (min-width: 992px) {
        #intro {
          margin-top: -58.59px;
        }
      }

      .navbar .nav-link {
        color: #fff !important;
      }
    </style>
</head>

<body class="text-center">
    <?php
        require "database.php";
        require "function.php";
        // Kết nối database
        $connect = connectDatabase($host, $username_database, $password_database, $db_name);
        $error_msg = '';

        // Kiểm tra xem nếu người dùng bấm vào nút đăng nhập thì sẽ đi thực hiện đăng nhập
        if (isset($_POST['is_login']) == true) {
            // Lấy ra thông tin tài khoản + mật khẩu được gửi lên server để kiểm tra đăng nhập
            $username_login = isset($_POST['username']) == true ? $_POST['username'] : '';
            $password_login = isset($_POST['password']) == true ? $_POST['password'] : '';

            $info_user = getInfoLogin($connect, $username_login, $password_login);
            if (empty($info_user) === true) {
                $error_msg = 'Thông tin tài khoản hoặc mật khẩu không chính xác';
            } else {
                $result = setDataToSession('user_login', $info_user);
                if ($result == true) {
                    redirect("index.php");
                }
            }
        }       
    ?>
    <div id="intro" class="bg-image shadow-2-strong">
      <div class="mask d-flex align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.8);">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-xl-5 col-md-8">
              <form class="bg-white rounded shadow-5-strong p-5" method="POST" action="#">
                <!-- Email input -->
                <div class="form-outline mb-4">
                  <input type="text" id="inputUsername" class="form-control" required autofocus name="username"/>
                  <label class="form-label" for="inputUsername">Username</label>
                </div>

                <!-- Password input -->
                <div class="form-outline mb-4">
                  <input type="password" id="inputPassword" class="form-control" required name="password"/>
                  <label class="form-label" for="inputPassword">Password</label>
                </div>

                  <div class="col d-flex justify-content-center">
                    <!-- Checkbox -->
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="remember-me" id="remember" checked />
                      <label class="form-check-label" for="remember">
                        Remember me
                      </label>
                    </div>
                  </div>

                <p class="text-danger"><?= $error_msg?></p>
                <!-- Submit button -->
                <button type="submit" class="btn btn-primary btn-block" name="is_login">Sign in</button>
                <p class="mt-5 mb-3 text-muted">&copy; 2022</p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- MDB -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <?php
        // Ngắt kết nối database
        $connect = null;
    ?>
</body>
</html>