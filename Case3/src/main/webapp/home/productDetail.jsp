<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> FOODY.COM </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="../home/css/style.css">

    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">

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
    <link rel="stylesheet" href="../home/css/style.css">
    <style>
        .card {
            max-width: 1000px;
            max-height: 500px /* Đảm bảo thẻ card không vượt quá kích thước của nội dung bên trong */
        }

        .card img {
            max-width: 70%;
            max-height: 90%; /* Đảm bảo ảnh không vượt quá kích thước của thẻ cha */
            height: auto; /* Đảm bảo tỷ lệ hình ảnh được duy trì */
            width: auto;
        }
    </style>

    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="../lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<!-- MOBILE NAV -->
<div class="mb-nav">
    <div class="mb-move-item"></div>
    <div class="mb-nav-item active">
        <a href="/homes">
            <i class="bx bxs-home"></i>
        </a>
    </div>
    <div class="mb-nav-item">
        <a href="#about">
            <i class='bx bxs-wink-smile'></i>
        </a>
    </div>
    <div class="mb-nav-item">
        <a href="#food-menu-section">
            <i class='bx bxs-food-menu'></i>
        </a>
    </div>
    <div class="mb-nav-item">
        <a href="#testimonial">
            <i class='bx bxs-comment-detail'></i>
        </a>
    </div>
</div>
<!-- END MOBILE NAV -->
<!-- BACK TO TOP BTN -->
<a href="#home" class="back-to-top">
    <i class="bx bxs-to-top"></i>
</a>
<!-- END BACK TO TOP BTN -->
<!-- TOP NAVIGATION -->
<div class="nav">
    <div class="menu-wrap">
        <a href="/homes">
            <div class="logo">
                FoodyCom
            </div>
        </a>
        <div class="menu h-xs">
            <a href="/homes">
                <div class="menu-item active">
                    Home
                </div>
            </a>
            <a href="/homes#about">
                <div class="menu-item">
                    About
                </div>
            </a>
            <a href="/homes#food-menu-section">
                <div class="menu-item">
                    Menu
                </div>
            </a>
            <a href="/homes#testimonial">
                <div class="menu-item">
                    Testimonials
                </div>
            </a>
        </div>
        <div class="right-menu">
            <div class="cart-btn">
                <a href="/cart?idUser=${user.id}"><i class='bx bx-cart-alt'></i></a>
            </div>
        </div>
    </div>
    <div class="navbar-nav align-items-center ms-auto">
        <c:if test="${not empty loggedIn}">
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
        </c:if>
        <c:if test="${empty loggedIn}">
            <a href="/auth" class="login-btn">Login </a>
        </c:if>
    </div>
</div>
<!-- END TOP NAVIGATION -->
<!-- FOOD MENU SECTION -->
<section class="align-items-center bg-img bg-img-fixed" id="food-menu-section"
         style="background-image: url(../home/assets/katherine-chase-4MMK78S7eyk-unsplash.jpg);">
    <div class="container">
        <div class="food-menu">
            <div class="row">
                <div class="col-md-6 col-lg-7 p-b-30">
                    <div class="p-l-25 p-r-30 p-lr-0-lg">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="slick3 gallery-lb">
                                <div class="card d-flex align-items-center bg-white pt-2 pb-2">
                                    <img src="../img${product.img}" class="img-fluid" style="margin: 4px"
                                         alt="IMG-PRODUCT" id="imgProduct">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-5 p-b-30">
                    <div class="p-r-50 p-t-5 p-lr-0-lg">
                        <h3 id="idProduct" style="display: none">
                            ${product.id}
                        </h3>
                        <h4 class="mtext-105 cl2 js-name-detail p-b-14" id="nameProduct" class="product-name">
                            ${product.name}
                        </h4>
                        <p class="stext-106 cl2 product-price" id="priceProduct">Price: <fmt:formatNumber
                                value="${product.price}" pattern="###,###,### đ"/></p>
                        <%--                        <p class="stext-102 cl3 p-t-23" id="quantityProduct">--%>
                        <%--                            Quantity: ${product.quantity}--%>
                        <%--                        </p>--%>
                        <p class="stext-102 cl3 p-t-23" id="describeProduct">
                            Description: ${product.description}
                        </p>
                    </div>

                    <div class="p-t-33">
                        <div class="flex-w flex-r-m p-b-10">
                            <div class="size-204 flex-w flex-m respon6-next">
                                <form action="/homes?action=addToCart&id=${product.id}" method="post" id="formCreate">
                                    <div class="wrap-num-product flex-w m-r-20 m-tb-10">
                                        <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                                            <input type="text" hidden="hidden" name="idProduct" value="${product.id}">
                                            <input type="text" hidden="hidden" value="${user.id}" name="idUser">
                                            <i class="fs-16 zmdi zmdi-minus"></i>
                                        </div>
                                        <label>
                                            <input min="1" max="${productImportDetail.quantity}" name="quantity"
                                                   id="productQuantity" type="number" value="1"
                                                   style="text-align: center">
                                            <p id="totalCheckOut">-</p>
                                            <button class="btn-num-product-up cl8 hov-b tn3 trans-04 flex-c-m"><i
                                                    class="fs-16 zmdi zmdi-plus"></i></button>
                                        </label>


                                        <div class="btn-num-product-up cl8 hov-b tn3 trans-04 flex-c-m"
                                             id="btn-num-product-up">
                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                        </div>
                                    </div>
                                    <c:if test="${not empty loggedIn}">
                                        <button type="submit"
                                           class="btn btn-outline-success"
                                           data-product-id="${product.id}">
                                            Add to cart
                                        </button>
                                    </c:if>
                                    <c:if test="${empty loggedIn}">
                                        <a href="/auth" class="login-btn">Add to cart</a>
                                    </c:if>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END FOOD MENU SECTION -->
<!-- FOOTER SECTION -->
<section class="footer bg-img" style="background-image: url(../home/assets/nordwood-themes-pYWrdKO5ksI-unsplash.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-6 col-xs-12">
                <h1>
                    Freshfood
                </h1>
                <br>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt, quas harum? Atque eius
                    quaerat fuga sint molestiae illo corrupti vitae voluptatibus. Dicta rerum est delectus
                    perspiciatis nemo nihil autem! Doloremque?</p>
                <br>
                <p>Email: kimjayden001@gmail.com</p>
                <p>Phone: +254712080741</p>
                <p>Website: foodycom.com</p>
            </div>
            <div class="col-2 col-xs-12">
                <h1>
                    About us
                </h1>
                <br>
                <p>
                    <a href="#">
                        Chefs
                    </a>
                </p>
                <p>
                    <a href="#">
                        Menu
                    </a>
                </p>
                <p>
                    <a href="#">
                        Testimonials
                    </a>
                </p>
                <p>
                    <a href="#">
                        Lorem ipsum
                    </a>
                </p>
            </div>
            <div class="col-4 col-xs-12">
                <h1>
                    Subscribe & media
                </h1>
                <br>
                <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Iusto aspernatur doloremque rerum nam
                    ullam obcaecati error asperiores temporibus quo eum eaque sed odio vitae accusantium, dolorem
                    nihil molestiae deserunt maxime!</p>
                <div class="input-group">
                    <input type="text" placeholder="Enter your email">
                    <button>
                        Subscribe
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END FOOTER SECTION -->

<script>
    document.getElementById('productQuantity').addEventListener('input', function () {
        var quantity = parseInt(this.value);
        var price = parseFloat('${product.price}'); // Assuming product.price is in float format

        if (!isNaN(quantity) && !isNaN(price)) {
            var total = quantity * price;
            document.getElementById('totalCheckOut').textContent = 'Total: ' + total.toFixed(0) + ' đ'; // Assuming you want to display total in Vietnamese currency format
        }
    });

    $(document).ready(function () {
        $(".js-addcart-detail").click(function (event) {
            event.preventDefault(); // Prevent default link behavior

            // Get the product ID and quantity
            var productId = $(this).data('product-id');
            var quantity = $("#productQuantity").val();
            var maxQuantity = parseInt($("#productQuantity").attr('max'));

            if (parseInt(quantity) > maxQuantity) {
                $("#productQuantity").focus();
                // Có thể thêm thông báo lỗi ở đây nếu cần thiết
            } else {
                // Construct the URL with the quantity value
                var addToCartURL = `/homes?action=addToCart&id=` + productId + `&quantity=` + quantity;

                // Perform the redirection
                window.location.href = addToCartURL;
            }
        });

        // $('#productQuantity').on('input', function () {
        //     var quantity = parseInt($(this).val());
        //     var maxQuantity = parseInt($(this).attr('max'));
        //     var minQuantity = parseInt($(this).attr('min'));
        //
        //     if (isNaN(quantity)) {
        //         $('#totalCheckOut').text('Invalid input');
        //     } else if (quantity < minQuantity || quantity > maxQuantity) {
        //         $('#totalCheckOut').text('Quantity out of range');
        //     } else {
        //         $('#totalCheckOut').text('Valid quantity');
        //     }
        // });
    });

</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/chart/chart.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>
<script src="lib/tempusdominus/js/moment.min.js"></script>
<script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
<script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

<script src="../home/js/main.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        $('form').submit(function(e) {--%>
<%--            e.preventDefault(); // Ngăn việc gửi biểu mẫu mặc định--%>

<%--            // Lấy giá trị số lượng--%>
<%--            var quantity = $('#productQuantity').val();--%>

<%--            // Cập nhật thuộc tính action--%>
<%--            var action = $(this).attr('action');--%>
<%--            action = action + '&quantity=' + quantity;--%>
<%--            $(this).attr('action', action);--%>

<%--            // Gửi biểu mẫu bằng AJAX--%>
<%--            $.ajax({--%>
<%--                type: 'post',--%>
<%--                url: action,--%>
<%--                data: $(this).serialize(),--%>
<%--                success: function(response) {--%>
<%--                    // Xử lý phản hồi nếu cần--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    document.getElementById('formCreate').addEventListener('submit', function() {--%>
<%--        var quantity = document.getElementById('productQuantity').value;--%>
<%--        var formAction = "/homes?action=addToCart&id=${product.id}&quantity=" + quantity;--%>
<%--        this.action = formAction;--%>
<%--    });--%>
<%--</script>--%>

</body>

</html>
<%--</jsp:root>--%>