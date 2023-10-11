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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <c:choose>
        <c:when test="${not empty loggedIn && user.role.id eq '2'}">


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
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Bill</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <a href="/admin"></a>
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${user.name}</h6>
                            <span>${user.role.name}</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <c:choose>
                            <c:when test="${user.role.id eq '1'}">
                                <a href="/user?action=profile&id=${user.id}" class="nav-item nav-link "><i
                                        class="fa fa-tachometer-alt me-2"></i>Profile</a>
                                <a href="/product" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                                <a href="/product-import" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Product
                                    Import</a>
                                <a href="/user" class="nav-item nav-link active "><i
                                        class="fa fa-table me-2"></i>User</a>
                                <a href="/express" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Express</a>
                                <a href="/order" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Order</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${user.role.id eq '2'}">
                                <a href="/user?action=profile&id=${user.id}" class="nav-item nav-link "><i
                                        class="fa fa-tachometer-alt me-2"></i>Profile</a>
                                <a href="/order?idUser=${user.id}" class="nav-item nav-link "><i class="fa fa-chart-bar me-2"></i>Order</a>
                                <a href="/bill?idUser=${user.id}" class="nav-item nav-link active"><i class="fa fa-chart-bar me-2"></i>Bill</a>
                            </c:when>
                        </c:choose>
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
                        <c:choose>
                            <c:when test="${user.role.id eq '2'}">
                                <a href="/homes">
                                    <div class="menu-item active">
                                        Home
                                    </div>
                                </a>
                            </c:when>
                        </c:choose>
                        <div class="navbar-nav align-items-center ms-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                    <img class="rounded-circle me-lg-2" src="img/user.jpg" alt=""
                                         style="width: 40px; height: 40px;">
                                    <span class="d-none d-lg-inline-flex">${user.name}</span>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                    <a href="/user?action=profile&id=${user.id}" class="dropdown-item">My Profile</a>
                                    <a href="/auth?action=changePassword&id=${user.id}" class="dropdown-item">Change Password</a>
                                    <a href="/auth?action=logout" class="dropdown-item">Log Out</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <!-- Navbar Start -->
                <div class="container">
                    <div class="card container px-6" style="height: 100vh">
                        <h3 class="text-center">Management Bill</h3>
                        <c:if test="${message != null}">
                            <h6 class="d-none" id="message">${message}</h6>
                        </c:if>

                        <div style="display: flex; align-items: center;">
                            <div style="margin-right: auto;">
                            </div>
                            <form action="/bill?page=${page.currentPage}"
                                  style="display: flex; align-items: center; margin-right: 10px;">
                                <div>
                                    <input type="text" id="searchBill" value="${search}" name="search"
                                           class="form-control" style="width: 85%" placeholder="Search Bill">
                                </div>
                                <div style="margin-left: 10px;">
                                    <button id="searchButton" class="btn btn-primary">Search</button>
                                </div>
                            </form>
                        </div>

                        <table class="table table-striped">
                            <tbody>
                            <tr>
                                <td>Id Bill </td>
                                <td>Create At </td>
                                <td>Customer Name </td>
                                <td>Products </td>
                                <td>Total </td>
                                <td>Action </td>
                            </tr>
                            <c:forEach var="bill" items="${page.content}">
                            <tr>
                                <td>${bill.idBill} </td>
                                <td>${bill.createAt} </td>
                                <td>${bill.customerName} </td>
                                <td>${bill.products} </td>
                                <td>${bill.total} </td>
                                <td>
                                        <a href="/bill?action=detail&idBill=${bill.idBill}&idUser=${user.id}"
                                           class="btn btn-info mb-2">Detail</a>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                        <div style="display: flex; align-items: center; justify-content: center; margin-top: 20px;">
                            <nav aria-label="...">
                                <c:set var="url" value="/bill?search=${search}&page="/>
                                <ul class="pagination">
                                    <li class="page-item <c:if test="${page.currentPage == 1}">disabled</c:if>">
                                        <a class="page-link" href="${url}${(page.currentPage - 1)}" tabindex="-1"
                                           aria-disabled="true">Previous</a>
                                    </li>
                                    <c:forEach var="number" begin="1" end="${page.totalPage}">
                                        <c:if test="${number == page.currentPage}">
                                            <li class="page-item active" aria-current="page">
                                                <a class="page-link" href="${url}${number}">${number}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${number != page.currentPage}">
                                            <li class="page-item">
                                                <a class="page-link" href="${url}${number}">${number}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <li class="page-item <c:if test="${page.currentPage >= page.totalPage}">disabled</c:if>">
                                        <a class="page-link" href="${url}${(page.currentPage + 1)}">Next</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </div>
                <!-- Navbar End -->

            </div>

        </c:when>
        <c:otherwise>
            <c:redirect url="/auth"/>
        </c:otherwise>
    </c:choose>      <!-- Content End -->
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>

<script>
    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }

    document.getElementById("searchButton").addEventListener("click", function () {
        var searchInput = document.getElementById("searchBill").value;
        var searchUrl = "/bill?action=search&result=" + encodeURIComponent(searchInput);
        window.location.href = searchUrl;
    });

    function showConfirmation(orderId) {
        const confirmation = confirm("Are you sure you want to delete Order: " + orderId + "?");
        if (confirmation) {
            // Nếu người dùng nhấn OK trong hộp xác nhận, chuyển hướng đến URL xóa sinh viên
            window.location.href = "/bill?action=delete&id=" + orderId;
        }
    }

</script>


</body>
</html>