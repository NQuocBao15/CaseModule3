<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>DASHMIN - Bootstrap Admin Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <style>
        .error-message {
            color: red;
            font-size: 12px;
        }
    </style>
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>
    <!-- Spinner End -->


    <!-- Sidebar Start -->
    <div class="sidebar pe-4 pb-3">
        <nav class="navbar bg-light navbar-light">
            <a href="index.html" class="navbar-brand mx-4 mb-3">
                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>User</h3>
            </a>
            <div class="d-flex align-items-center ms-4 mb-4">
                <div class="position-relative">
                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">Jhon Doe</h6>
                    <span>Admin</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="/product" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                <a href="/product-import" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Product Import</a>
                <a href="/user" class="nav-item nav-link active"><i class="fa fa-table me-2"></i>User</a>
                <a href="/order" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Order</a>
                <a href="/express" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Express</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <div class="container">
            <div class="card container px-6" style="height: 100vh">
                <h3 class="text-center">Create User</h3>
                <form action="/user?action=create" method="post" onsubmit="return">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" name="name" required="true">
                        <div id="name-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone" required="true">
                        <div id="phone-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required="true">
                        <div id="username-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required="true">
                        <div id="password-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" required="true" >
                        <div id="address-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="dob" class="form-label">Date of birth</label>
                        <input type="date" class="form-control" id="dob" name="dob" required="true">
                        <div id="dob-error" class="text-danger"></div>
                    </div>
                    <div class="mb-3">
                        <label for="gender" class="form-label">Gender</label>
                        <select class="form-control" name="gender" id="gender" required="">
                            <c:forEach var="gender" items="${genders}">
                                <option value="${gender}">${gender}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Role</label>
                        <select class="form-control" name="role" id="role" required="">
                            <c:forEach var="role" items="${roles}">
                                <option value="${role.id}">${role.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <a href="/user" class="btn btn-dark mb-2">Cancel</a>
                    <button type="submit" class="btn btn-primary mb-2">Submit</button>
                </form>
            </div>

        </div>
    </div>
    <!-- Content End -->
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
<%--<script>--%>
<%--    // <![CDATA[  <-- For SVG support--%>
<%--    if ('WebSocket' in window) {--%>
<%--        (function () {--%>
<%--            function refreshCSS() {--%>
<%--                var sheets = [].slice.call(document.getElementsByTagName("link"));--%>
<%--                var head = document.getElementsByTagName("head")[0];--%>
<%--                for (var i = 0; i < sheets.length; ++i) {--%>
<%--                    var elem = sheets[i];--%>
<%--                    var parent = elem.parentElement || head;--%>
<%--                    parent.removeChild(elem);--%>
<%--                    var rel = elem.rel;--%>
<%--                    if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {--%>
<%--                        var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');--%>
<%--                        elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());--%>
<%--                    }--%>
<%--                    parent.appendChild(elem);--%>
<%--                }--%>
<%--            }--%>
<%--            var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';--%>
<%--            var address = protocol + window.location.host + window.location.pathname + '/ws';--%>
<%--            var socket = new WebSocket(address);--%>
<%--            socket.onmessage = function (msg) {--%>
<%--                if (msg.data == 'reload') window.location.reload();--%>
<%--                else if (msg.data == 'refreshcss') refreshCSS();--%>
<%--            };--%>
<%--            if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {--%>
<%--                console.log('Live reload enabled.');--%>
<%--                sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);--%>
<%--            }--%>
<%--        })();--%>
<%--    }--%>
<%--    else {--%>
<%--        console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');--%>
<%--    }--%>
<%--    // ]]>--%>
<%--</script>--%>

<%--Làm valid data--%>
<script>
    var nameInput = document.getElementById('name');
    var nameError = document.getElementById('name-error');
    var phoneInput = document.getElementById('phone');
    var phoneError = document.getElementById('phone-error');
    var usernameInput = document.getElementById('username');
    var usernameError = document.getElementById('username-error');
    var passwordInput = document.getElementById('password');
    var passwordError = document.getElementById('password-error');
    var addressInput = document.getElementById('address');
    var addressError = document.getElementById('address-error');
    var dobInput = document.getElementById('dob');
    var dobError = document.getElementById('dob-error');

    nameInput.addEventListener('blur', function (){
        var nameRegex = /^[A-Za-zÀ-Ỹà-ỹĂăÂâĐđÊêÔôƠơƯư\s]{6,}$/;
        if (!nameRegex.test(nameInput.value)) {
            nameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            nameError.textContent = 'Tên không được chứa kí tự số hoặc kí tự đặc biệt và có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            nameInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            nameError.textContent = ''; // Xóa thông báo lỗi
        }
    });

    phoneInput.addEventListener('blur', function() {
        var phoneRegex = /^0\d{9}$/; // Biểu thức chính quy kiểm tra số điện thoại bắt đầu từ số 0 và gồm 10 chữ số

        if (!phoneRegex.test(phoneInput.value)) {
            phoneInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            phoneError.textContent = 'Số điện thoại phải bắt đầu bằng số 0, phải đủ 10 chữ số'; // Hiển thị thông báo lỗi
        } else {
            phoneInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            phoneError.textContent = ''; // Xóa thông báo lỗi
        }
    });

    usernameInput.addEventListener('blur', function (){
        var usernameValue = usernameInput.value;
        if (usernameValue.length < 6) {
            usernameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            usernameError.textContent = 'Username phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            usernameInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            usernameError.textContent = ''; // Xóa thông báo lỗi
        }
    })

    passwordInput.addEventListener('blur', function (){
        var passwordValue = passwordInput.value;
        if (passwordValue.length < 6) {
            passwordInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            passwordError.textContent = 'Password phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            passwordInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            passwordError.textContent = ''; // Xóa thông báo lỗi
        }
    })

    addressInput.addEventListener('blur', function(){
        var addressRegex = /^[a-zA-Z0-9\s,\.\-']+.{6,}$/;
        if (!addressRegex.test(addressInput.value)) {
            addressInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            addressError.textContent = 'Địa chỉ không hợp lệ, tối thiểu 6 kí tự'; // Hiển thị thông báo lỗi
        } else {
            addressInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
            addressError.textContent = ''; // Xóa thông báo lỗi
        }
    })

    dobInput.addEventListener("blur", function() {
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



    document.querySelector('form').addEventListener('submit', function(event) {

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

        var usernameValue = usernameInput.value;
        if (usernameValue.length < 6) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            usernameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            usernameError.textContent = 'Username phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi

            usernameInput.focus(); // Tập trung vào trường username không hợp lệ
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


</body></html>