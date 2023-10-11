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
                        <input type="text" class="form-control" id="name" name="name" required="true">
                        <div class="error-message" id="name-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" required="true">
                        <div class="error-message" id="phone-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required="true">
                        <div class="error-message" id="username-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required="true">
                        <div class="error-message" id="password-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="reEnterPassword" class="form-label">Re-enter Password</label>
                        <input type="password" class="form-control" id="reEnterPassword" name="reEnterPassword"
                               required="true">
                        <div class="error-message" id="reEnterPassword-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address">
                        <div class="error-message" id="address-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="dob" class="form-label">Date of birth</label>
                        <input type="date" class="form-control" id="dob" name="dob" required="true">
                        <div class="error-message" id="dob-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <select class="form-control" name="gender" id="gender" required="true">
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

    var nameInput = document.getElementById('name');
    var nameError = document.getElementById('name-error');
    var phoneInput = document.getElementById('phone');
    var phoneError = document.getElementById('phone-error');
    var usernameInput = document.getElementById('username');
    var usernameError = document.getElementById('username-error');
    var passwordInput = document.getElementById('password');
    var passwordError = document.getElementById('password-error');
    var reEnterPasswordInput = document.getElementById('reEnterPassword');
    var reEnterPasswordError = document.getElementById('reEnterPassword-error');
    var addressInput = document.getElementById('address');
    var addressError = document.getElementById('address-error');
    var dobInput = document.getElementById('dob');
    var dobError = document.getElementById('dob-error');
    var existingUsernames = ${usernameJSON};
    nameInput.addEventListener('blur', function () {
        var nameRegex = /^[A-Za-zÀ-Ỹà-ỹĂăÂâĐđÊêÔôƠơƯư\s]{6,}$/;
        if (!nameRegex.test(nameInput.value)) {
            nameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            nameError.textContent = 'Tên không được chứa kí tự số hoặc kí tự đặc biệt và có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            nameInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            nameError.textContent = ''; // Xóa thông báo lỗi
        }
    });

    phoneInput.addEventListener('blur', function () {
        var phoneRegex = /^0\d{9}$/; // Biểu thức chính quy kiểm tra số điện thoại bắt đầu từ số 0 và gồm 10 chữ số

        if (!phoneRegex.test(phoneInput.value)) {
            phoneInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            phoneError.textContent = 'Số điện thoại phải bắt đầu bằng số 0, phải đủ 10 chữ số'; // Hiển thị thông báo lỗi
        } else {
            phoneInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            phoneError.textContent = ''; // Xóa thông báo lỗi
        }
    });

    usernameInput.addEventListener('blur', function () {
        var usernameValue = usernameInput.value;
        if (usernameValue.length < 6) {
            usernameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            usernameError.textContent = 'Username phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else if (existingUsernames.map((user) => {
            return user.username
        }).includes(usernameValue)) {
            usernameInput.classList.add('is-invalid');
            usernameError.textContent = 'Username đã tồn tại';
        } else {
            usernameInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            usernameError.textContent = ''; // Xóa thông báo lỗi
        }
    })

    passwordInput.addEventListener('blur', function () {
        var passwordValue = passwordInput.value;
        var reEnterPasswordValue = reEnterPasswordInput.value;
        if (passwordValue.length < 6) {
            passwordInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            passwordError.textContent = 'Password phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else if (reEnterPasswordValue.length < 6) {
            reEnterPasswordInput.classList.add('is-invalid');
            reEnterPasswordError.textContent = 'reEnter Password phải có ít nhất 6 kí tự'
        } else if (passwordValue !== reEnterPasswordValue) {
            passwordInput.classList.add('is-invalid');
            reEnterPasswordInput.classList.add('is-invalid');
            passwordError.textContent = 'Password và reEnter Password phải trùng nhau'; // Hiển thị thông báo lỗi
            reEnterPasswordError.textContent = 'Password và reEnter Password phải trùng nhau'; // Hiển thị thông báo lỗi
        } else {
            passwordInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            passwordError.textContent = ''; // Xóa thông báo lỗi
            reEnterPasswordInput.classList.remove('is-invalid');
            reEnterPasswordError.textContent = '';
        }
    })
    reEnterPasswordInput.addEventListener('blur', function () {
        var passwordValue = passwordInput.value;
        var reEnterPasswordValue = reEnterPasswordInput.value;
        if (passwordValue.length < 6) {
            passwordInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            passwordError.textContent = 'Password phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else if (reEnterPasswordValue.length < 6) {
            reEnterPasswordInput.classList.add('is-invalid');
            reEnterPasswordError.textContent = 'reEnter Password phải có ít nhất 6 kí tự'
        } else if (passwordValue !== reEnterPasswordValue) {
            passwordInput.classList.add('is-invalid');
            reEnterPasswordInput.classList.add('is-invalid');
            passwordError.textContent = 'Password và reEnter Password phải trùng nhau'; // Hiển thị thông báo lỗi
            reEnterPasswordError.textContent = 'Password và reEnter Password phải trùng nhau'; // Hiển thị thông báo lỗi
        } else {
            passwordInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            passwordError.textContent = ''; // Xóa thông báo lỗi
            reEnterPasswordInput.classList.remove('is-invalid');
            reEnterPasswordError.textContent = '';
        }
    })

    addressInput.addEventListener('blur', function () {
        var addressRegex = /^[a-zA-Z0-9\s,\.\-']+.{6,}$/;
        if (!addressRegex.test(addressInput.value)) {
            addressInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            addressError.textContent = 'Địa chỉ không hợp lệ, tối thiểu 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            addressInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            addressError.textContent = ''; // Xóa thông báo lỗi
        }
    })

    dobInput.addEventListener("blur", function () {
        var dobValue = new Date(dobInput.value);
        var currentDate = new Date();

        var age = currentDate.getFullYear() - dobValue.getFullYear();
        var monthDiff = currentDate.getMonth() - dobValue.getMonth();
        var dayDiff = currentDate.getDate() - dobValue.getDate();

        if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
            age--; // Chưa đến sinh nhật năm nay, giảm tuổi đi 1
        }

        if (age < 10 || age > 100) {
            dobInput.classList.add("is-invalid");
            dobError.textContent = "Tuổi không hợp lệ, tuổi từ 10 đến 100";
        } else {
            dobInput.classList.remove("is-invalid");
            dobError.textContent = "";
        }
    });


    document.querySelector('form').addEventListener('submit', function (event) {

        var dobValue = new Date(dobInput.value);
        var currentDate = new Date();

        var age = currentDate.getFullYear() - dobValue.getFullYear();
        var monthDiff = currentDate.getMonth() - dobValue.getMonth();
        var dayDiff = currentDate.getDate() - dobValue.getDate();

        if (monthDiff < 0 || (monthDiff === 0 && dayDiff < 0)) {
            age--; // Chưa đến sinh nhật năm nay, giảm tuổi đi 1
        }


        if (age < 10 || age > 100) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            dobInput.classList.add("is-invalid");
            dobError.textContent = "Tuổi không hợp lệ, tuổi từ 10 đến 100";

            dobInput.focus(); // Tập trung vào trường dob không hợp lệ
        }

        var addressRegex = /^[a-zA-Z0-9\s,\.\-']+.{6,}$/;
        if (!addressRegex.test(addressInput.value)) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            addressInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            addressError.textContent = 'Địa chỉ không hợp lệ, tối thiểu 6 kí tự'; // Hiển thị thông báo lỗi

            addressInput.focus(); // Tập trung vào trường address không hợp lệ
        }

        var passwordValue = passwordInput.value;
        if (passwordValue.length < 6) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            passwordInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            passwordError.textContent = 'Password phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi

            passwordInput.focus(); // Tập trung vào trường password không hợp lệ
        }
        if (passwordValue)
            var usernameValue = usernameInput.value;
        if (usernameValue.length < 6) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            usernameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            usernameError.textContent = 'Username phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi

            usernameInput.focus(); // Tập trung vào trường username không hợp lệ
        }
        if (existingUsernames.map((user) => {
            return user.username
        }).includes(usernameValue)) {
            event.preventDefault();
            usernameInput.classList.add('is-invalid');
            usernameError.textContent = 'Username đã tồn tại';
        }
        var phoneRegex = /^0\d{9}$/; // Biểu thức chính quy kiểm tra số điện thoại bắt đầu từ số 0 và gồm 10 chữ số
        if (!phoneRegex.test(phoneInput.value)) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            phoneInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            phoneError.textContent = 'Số điện thoại phải bắt đầu bằng số 0, phải đủ 10 chữ số'; // Hiển thị thông báo lỗi

            phoneInput.focus(); // Tập trung vào trường phone không hợp lệ
        }

        var nameRegex = /^[A-Za-zÀ-Ỹà-ỹĂăÂâĐđÊêÔôƠơƯư\s]{6,}$/;
        if (!nameRegex.test(nameInput.value)) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            nameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            nameError.textContent = 'Tên không được chứa kí tự số hoặc kí tự đặc biệt và có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi

            nameInput.focus(); // Tập trung vào trường name không hợp lệ
        }

    });

</script>


</body>
</html>