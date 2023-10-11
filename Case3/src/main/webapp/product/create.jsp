<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Product</title>
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
    <style>
        div {
            position: relative;
            overflow: hidden;
        }

        #file {
            position: absolute;
            font-size: 50px;
            opacity: 0;
            right: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
    </style>
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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Product</h3>
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
                        <a href="/user?action=profile&id=${user.id}" class="nav-item nav-link"><i
                                class="fa fa-tachometer-alt me-2"></i>Profile</a>
                        <a href="/product" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Product</a>
                        <a href="/product-import" class="nav-item nav-link "><i class="fa fa-keyboard me-2"></i>Product
                            Import</a>
                        <a href="/user" class="nav-item nav-link "><i class="fa fa-table me-2"></i>User</a>
                        <a href="/express" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Express</a>
                        <a href="/order" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Order</a>
                    </div>
                </nav>
            </div>
            <!-- Sidebar End -->

            <div class="content">
                <!-- Navbar Start -->
                <div>
                    <!-- Navbar Start -->
                    <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                        <a href="/admin" class="navbar-brand d-flex d-lg-none me-4">
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
                                    <a href="/auth?action=changePassword&id=${user.id}" class="dropdown-item">Change
                                        Password</a>
                                    <a href="/auth?action=logout" class="dropdown-item">Log Out</a>
                                </div>
                            </div>
                        </div>
                    </nav>
                </div>
                <!-- Navbar End -->
                <div class="container">
                    <div class="card container px-6" style="height: 100%">
                        <c:if test="${product.id == 0}">
                        <h3 class="text-center">Create Product</h3>
                        <form action="/product?action=create" method="post" id="createForm"
                              enctype="multipart/form-data">
                            </c:if>
                            <c:if test="${product.id != 0}">
                            <h3 class="text-center">Edit Product</h3>
                            <form action="/product?action=edit&id=${product.id}" id="editForm" method="post"
                                  enctype="multipart/form-data">
                                </c:if>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           value="${product.name}">
                                    <div class="error-message" id="name-error"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="category" class="form-label">Category</label>
                                    <select class="form-control" name="category" id="category">
                                        <c:forEach var="category" items="${categories}">
                                            <option value="${category.id}"
                                                    <c:if test="${category.id == product.category.id}">
                                                        selected
                                                    </c:if>
                                            >${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price</label>
                                    <input type="number" class="form-control" name="price" id="price"
                                           value="${product.price}">
                                    <div class="error-message" id="price-error"></div>
                                </div>
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description</label>
                                    <input type="text" class="form-control" name="description" id="description"
                                           value="${product.description}">
                                    <div class="error-message" id="description-error"></div>
                                </div>

                                <div class="mb-3">
                                        <%--                            <label for="file" class="form-label">Image</label>--%>
                                        <%--                            <input accept="image/*" value="img/${product.img}" type="file"--%>
                                        <%--                                   onchange="loadFile(event)" name="img" id="file">--%>
                                        <%--                            <p><img id="output" width="300"/></p>--%>
                                    <p><img id="output" width="300"
                                            <c:if test="${product.img != null}">src="../img/${product.img}"</c:if>
                                            <c:if test="${product.img == null}">src="../img/default-image.jpg"</c:if>
                                    /></p>
                                    <div class="file btn btn-primary first justify-content-center "
                                         style="width: 80px;">
                                        Upload
                                        <input type="file" accept="image/*" name="img" id="file"
                                               onchange="loadFile(event)">
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <a href="/product" class="btn btn-primary ">Back</a>
                            </form>
                        </form>
                    </div>

                </div>
            </div>
            <!-- Content Start -->
        </c:when>
        <c:otherwise>
            <c:redirect url="/auth"/>
        </c:otherwise>
    </c:choose>
</div>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"> </script>
<script src="../lib/chart/chart.min.js"> </script>
<script src="../lib/easing/easing.min.js"> </script>
<script src="../lib/waypoints/waypoints.min.js"> </script>
<script src="../lib/owlcarousel/owl.carousel.min.js"> </script>
<script src="../lib/tempusdominus/js/moment.min.js"> </script>
<script src="../lib/tempusdominus/js/moment-timezone.min.js"> </script>
<script src="../lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"> </script>

<!-- Template Javascript -->
<script src="../js/main.js"> </script>
<!-- Code injected by live-server -->
<script>
    // <![CDATA[  <-- For SVG support

    function changeImage() {
        var inputImage = document.getElementById('image-input');
        var imgPreview = document.getElementById('img-preview');

        if (inputImage.value === "") {
            imgPreview.src = "default-image.jpg";
        } else {
            imgPreview.src = inputImage.value;
        }
    }

    var loadFile = function (event) {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    };
</script>


<script>
    // <![CDATA[  <-- For SVG support

    $(document).ready(function () {
        $('#createForm').validate({
            rules: {
                name: {
                    required: true
                },
                price: {
                    required: true,
                    digits: true,
                    min: 1000
                },
            },
            messages: {
                name: {
                    required: "Nhập tên sản phẩm"
                },
                price: {
                    required: "Nhập giá sản phẩm",
                    digits: "Không được nhập chữ",
                    min: "Giá tối thiểu 1000"
                },

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
        $('#editForm').validate({
            rules: {
                name: {
                    required: true
                },
                price: {
                    required: true,
                    digits: true,
                    min: 1000
                },
            },
            messages: {
                name: {
                    required: "Nhập tên sản phẩm"
                },
                price: {
                    required: "Nhập giá sản phẩm",
                    digits: "Không được nhập chữ",
                    min: "Giá tối thiểu 1000"
                },

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
    });

</script>

</body>
</html>
