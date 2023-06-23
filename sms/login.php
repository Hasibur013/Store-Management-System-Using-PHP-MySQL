<?php
require('connector.php');
session_start();
?>

<!DOCTYPE html>

<html>

<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <div class="container mt-5 pt-5">
        <div class="row">
            <div class="col-12 col-sm-8 col-md-6 m-auto">
                <div class="card">
                    <div class="card-body mx-5">
                        <?php
                        if (isset($_POST['user_email'])) {
                            $user_email = $_POST['user_email'];
                            $user_password = $_POST['user_password'];

                            $sql = "SELECT * FROM users WHERE user_email='$user_email' AND user_password='$user_password' ";

                            $query = $conn->query($sql);

                            if (mysqli_num_rows($query) > 0) {
                                $data = mysqli_fetch_array($query);

                                $user_first_name  = $data['user_first_name'];
                                $user_last_name  = $data['user_last_name'];

                                $_SESSION['user_first_name'] = $user_first_name;
                                $_SESSION['user_last_name'] = $user_last_name;

                                header('location:index.php');
                            } else {
                                echo "Email and Password not match";
                            }
                        }
                        ?>
                        <form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST">
                            Email : <br>
                            <input type="email" name="user_email" class="form-control my-3 py-2" placeholder="Email">
                            Password : <br>
                            <input type="password" name="user_password" class="form-control my-3 py-2" placeholder="Password">
                            <div class="text-center">
                                <input type="submit" name="Login" class="btn btn-primary px-5"></br>
                                <a href="user_add.php" class='btn btn-success my-4'>Register</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>