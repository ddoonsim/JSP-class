<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Register</title>

    <!-- Custom fonts for this template-->
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
		.hid {
			display: none;
		}
	</style>

	<script type="text/javascript">
		window.onload = function() {
			console.log('onload event 발생') ;
			// 변수 선언
			// var : 변수의 중복선언이 가능
			// let- 지역변수, 중복선언이 불가능
			// const - 지역상수, 중복선언이 불가능 
			let regBtn = document.querySelector('#regBtn') ;
			regBtn.addEventListener('click', function(){
				console.log('회원가입 버튼 클릭') ;
				// 회원가입 유효성검사
				
				// 등록 요청
				regForm.action = "/regProcess"  // 요청 url 설정
				regForm.method = "post" ;
				// 폼을 전송 = 새로운 페이지를 요청
				regForm.submit() ;
			});
			
		}
		function validationCheck() {
			alert('유효성검사') ;
		}
	</script>
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">✨회원가입😎</h1>
                                
                            </div>
                            <form class="user" name="regForm">
                                <div class="form-group">
                                    <input type="text" required="required" class="form-control form-control-user" 
                                    	id="id" name="id" placeholder="ID">
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" required="required" class="form-control form-control-user" 
                                    	id="name" name="name" placeholder="Name">
                                </div>
                                
                                <div class="form-group">
                                    <input type="email" required="required" class="form-control form-control-user" 
                                    	id="email" name="email" placeholder="Email">
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="password" required="required" class="form-control form-control-user"
                                            id="pw" name="pw" placeholder="Password">
                                    </div>
                                    
                                    <div class="col-sm-6">
                                        <input type="password" required="required" class="form-control form-control-user"
                                            id="pwCheck" name="pwCheck" placeholder="Repeat Password">
                                    </div>
                                </div>
                                <a id="regBtn" class="btn btn-primary btn-user btn-block">회원가입</a>
                                <hr>
                                <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a>
                                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../js/sb-admin-2.min.js"></script>
    


</body>

</html>