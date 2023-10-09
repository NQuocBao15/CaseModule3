<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Register user</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&amp;display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

    <style>
        .error-message {
            color: red;
            font-style: italic;
        }
    </style>
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div class="content">
        <div class="container">
            <div class="card container px-6" style="height: 100vh">
                <h3 class="text-center">Create User</h3>
                <form action="/auth?action=register" method="post" id="registerForm" onsubmit="return validateForm()">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                        <div class="error-message" id="name-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" required>
                        <div class="error-message" id="phone-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                        <div class="error-message" id="username-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <div class="error-message" id="password-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="reEnterPassword" class="form-label">Re-enter Password</label>
                        <input type="password" class="form-control" id="reEnterPassword" name="reEnterPassword"
                               required>
                        <div class="error-message" id="reEnterPassword-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address">
                        <div class="error-message" id="address-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="dob" class="form-label">Date of birth</label>
                        <input type="date" class="form-control" id="dob" name="dob" required>
                        <div class="error-message" id="dob-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <select class="form-control" name="gender" id="gender" required="">
                            <c:forEach var="gender" items="${genders}">
                                <option value="${gender}">${gender}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <a href="/auth" class="btn btn-dark mb-2">Cancel</a>
                    <button type="submit" class="btn btn-primary mb-2">Submit</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Content End -->
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
</div>

<!-- JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="../lib/chart/chart.min.js"></script>
<script src="../lib/easing/easing.min.js"></script>
<script src="../lib/waypoints/waypoints.min.js"></script>
<script src="../lib/owlcarousel/owl.carousel.min.js"></script>
<script src="../lib/tempusdominus/js/moment.min.js"></script>
<script src="../lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>


<!-- Template Javascript -->
<script src="../js/main.js"></script>
<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support

    $(document).ready(function () {
        $('#registerForm').validate({
            rules: {
                name: {
                    required: true,
                    nameValidation: true,
                    minlength: 6
                },
                phone: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 10,
                    regex: /^0\d{9}$/
                },
                username: {
                    required: true,
                    minlength: 6,
                },
                password: {
                    required: true,
                    minlength: 6
                },
                reEnterPassword: {
                    required: true,
                    equalTo: "#password"
                },
                dob: {
                    required: true,
                    dobValidation: true
                }
            },
            messages: {
                name: {
                    required: "Nhập tên",
                    pattern: "Tên không được nhập số",
                    minlength: "Tối thiểu 6 kí tự"
                },
                phone: {
                    required: "Nhập số điện thoại",
                    digits: "Số điện thoại không chứa chữ",
                    minlength: "Số điện thoại phải đủ 10 số",
                    maxlength: "Số điện thoại phải đủ 10 số",
                    regex: "Số điện thoại phải bắt đầu bằng số 0"
                },
                username: {
                    required: "Nhập username",
                    minlength: "Username tối thiểu 6 kí tự",
                },
                password: {
                    required: "Nhập password",
                    minlength: "Password tối thiểu 6 kí tự"
                },
                reEnterPassword: {
                    required: "Nhập lại password",
                    equalTo: "Password nhập lại không khớp với password"
                },
                dob: {
                    required: "Nhập ngày sinh",
                }
            },
            errorPlacement: function (error, element) {
                // Hiển thị thông báo lỗi màu đỏ
                error.addClass('error-message');
                error.insertAfter(element);
            },
            highlight: function (element) {
                // Áp dụng hiệu ứng giao diện khi lỗi xảy ra
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element) {
                // Xóa hiệu ứng giao diện khi lỗi được giải quyết
                $(element).removeClass('is-invalid');
            },
            submitHandler: function (form) {
                // Xử lý gửi form khi dữ liệu hợp lệ
                form.submit();
            }
        });

        $$.validator.addMethod(
            "dobValidation",
            function (value) {
                var birthDate = new Date(value);
                var currentDate = new Date();
                var age = currentDate.getFullYear() - birthDate.getFullYear();
                if (age < 10 || age > 100) {
                    return false;
                }
                return true;
            },
            "Tuổi không được nhỏ hơn 10 và lớn hơn 100"
        );
        $.validator.addMethod(
            "nameValidation",
            function (value, element) {
                return this.optional(element) || /^[A-Za-zÀ-Ỹà-ỹĂăÂâĐđÊêÔôƠơƯư\s]+$/.test(value);
            },
            "Tên không được nhập số"
        );
    });

</script>


</body>
</html>