<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8">
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <c:choose>
        <c:when test="${user.role.id eq '1'}">
            <!-- Spinner Start -->
            <div id="spinner"
                 class="bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="/admin" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Express</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <a href="/admin"></a>
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${user.name}</h6>
                            <span>${user.role.name}</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="/user?action=profile&id=${user.id}" class="nav-item nav-link"><i
                                class="fa fa-tachometer-alt me-2"></i>Profile</a>
                        <a href="/product" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                        <a href="/product-import" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Product
                            Import</a>
                        <a href="/user" class="nav-item nav-link "><i class="fa fa-table me-2"></i>User</a>
                        <a href="/express" class="nav-item nav-link active"><i class="fa fa-chart-bar me-2"></i>Express</a>
                        <a href="/order" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Order</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->
            <!-- Content Start -->
            <div class="content">
                <div>
                    <!-- Navbar Start -->
                    <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                        <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                            <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                        </a>
                        <a href="#" class="sidebar-toggler flex-shrink-0">
                            <i class="fa fa-bars"></i>
                        </a>
                        <div class="navbar-nav align-items-center ms-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                    <img class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
                                         style="width: 40px; height: 40px;">
                                    <span class="d-none d-lg-inline-flex">${user.name}</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                    <a href="/user?action=profile&id=${user.id}" class="dropdown-item">My Profile</a>
                                    <a href="/admin?action=changePassword&id=${user.id}" class="dropdown-item">Change
                                        Password</a>
                                    <a href="/auth?action=logout" class="dropdown-item">Log Out</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <div class="container">
                    <div class="card container px-6" style="height: 100vh">
                        <h3 class="text-center">Create Express</h3>
                        <form action="/express?action=create" method="post" onsubmit="return">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" class="form-control" id="name" name="name" required="true">
                                <div id="name-error" class="text-danger"></div>
                            </div>
                            <a href="/express" class="btn btn-dark mb-2">Cancel</a>
                            <button type="submit" class="btn btn-primary mb-2">Create</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Content End -->
        </c:when>
        <c:otherwise>
            <c:redirect url="/auth"/>
        </c:otherwise>
    </c:choose>
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
<%--  // <![CDATA[  <-- For SVG support--%>
<%--  if ('WebSocket' in window) {--%>
<%--    (function () {--%>
<%--      function refreshCSS() {--%>
<%--        var sheets = [].slice.call(document.getElementsByTagName("link"));--%>
<%--        var head = document.getElementsByTagName("head")[0];--%>
<%--        for (var i = 0; i < sheets.length; ++i) {--%>
<%--          var elem = sheets[i];--%>
<%--          var parent = elem.parentElement || head;--%>
<%--          parent.removeChild(elem);--%>
<%--          var rel = elem.rel;--%>
<%--          if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {--%>
<%--            var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');--%>
<%--            elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());--%>
<%--          }--%>
<%--          parent.appendChild(elem);--%>
<%--        }--%>
<%--      }--%>
<%--      var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';--%>
<%--      var address = protocol + window.location.host + window.location.pathname + '/ws';--%>
<%--      var socket = new WebSocket(address);--%>
<%--      socket.onmessage = function (msg) {--%>
<%--        if (msg.data == 'reload') window.location.reload();--%>
<%--        else if (msg.data == 'refreshcss') refreshCSS();--%>
<%--      };--%>
<%--      if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {--%>
<%--        console.log('Live reload enabled.');--%>
<%--        sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);--%>
<%--      }--%>
<%--    })();--%>
<%--  }--%>
<%--  else {--%>
<%--    console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');--%>
<%--  }--%>
<%--  // ]]>--%>
<%--</script>--%>
<script>
    var nameInput = document.getElementById('name');
    var nameError = document.getElementById('name-error');
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
    document.querySelector('form').addEventListener('submit', function (event) {

        var nameRegex = /^[A-Za-zÀ-Ỹà-ỹĂăÂâĐđÊêÔôƠơƯư\s]{6,}$/;
        if (!nameRegex.test(nameInput.value)) {
            event.preventDefault(); // Ngăn chặn gửi form đi

            nameInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
            nameError.textContent = 'Tên không được chứa kí tự số hoặc kí tự đặc biệt và có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi

            nameInput.focus(); // Tập trung vào trường name không hợp lệ
        }
    });
    // <![CDATA[  <-- For SVG support
</script>


</body>
</html>