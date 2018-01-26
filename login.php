<?php 
	$username = '';
	$password = '';
	$check=false;
	if(isset($_POST['login'])){
		$username = $_POST['username'];
		$password = $_POST['password'];
		if(isset($_POST['remember'])){
			setcookie('username', $_POST['username']);
			setcookie('password', $_POST['password']);
		}
		$userinfo = array('username' => 'admin', 'password' => '123456');
		if($userinfo['username'] == $username && $userinfo['password'] == $password){
			$_SESSION['userLogin'] = $userinfo;
			header('location:index.php');
		} else {
			echo 'Đăng nhập k thành công';
		}
	}
	if(isset($_COOKIE['username']) && isset($_COOKIE['password'])){
		$check = true;
		$username = $_COOKIE['username'];
		$password = $_COOKIE['password'];
	}
 ?>