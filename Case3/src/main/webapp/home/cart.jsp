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
    <style>
        .card {
            max-width: 1000px;
            max-height: 500px/* Đảm bảo thẻ card không vượt quá kích thước của nội dung bên trong */
        }

        .card img {
            max-width: 70%;
            max-height: 90%;/* Đảm bảo ảnh không vượt quá kích thước của thẻ cha */
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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

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
        <a href="#home">
            <div class="logo">
                FoodyCom
            </div>
        </a>
        <div class="menu h-xs">
            <a href="#home">
                <div class="menu-item active">
                    Home
                </div>
            </a>
            <a href="#about">
                <div class="menu-item">
                    About
                </div>
            </a>
            <a href="#food-menu-section">
                <div class="menu-item">
                    Menu
                </div>
            </a>
            <a href="#testimonial">
                <div class="menu-item">
                    Testimonials
                </div>
            </a>
        </div>
        <div class="right-menu">
            <div class="cart-btn">
                <a href="/homes?action=checkCart"><i class='bx bx-cart-alt'></i></a>
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
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th class="shoping__product">Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${requestScope.cart.getCartItems()}" var="cartItem">
                            <tr>
                                <td class="shoping__cart__item">
                                    <img  src="${cartItem.product.avatar}" alt="">
                                    <h5>${cartItem.product.name}</h5>
                                </td>
                                <td class="shoping__cart__price">
                                        ${cartItem.price}
                                </td>
                                <td class="shoping__cart__quantity">
                                    <div class="quantity">
                                        <input onchange="handleQuantityChange(this,${cartItem.product.id})" min="1"
                                               max="100" type="number" name="" class="form-control" id="test"
                                               value="${cartItem.quantity}">
                                    </div>
                                </td>
                                <td class="shoping__cart__total">
                                        ${cartItem.price * cartItem.quantity}
                                </td>
                                <td class="shoping__cart__item__close">
                                    <span class="icon_close" onclick="handleDeleteCartItem(${cartItem.getId()})"></span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6"></div>
            <div class="col-lg-6">
                <div class="shoping__checkout">
                    <h5>Cart Total</h5>
                    <ul>
                        <li>Total <span>$${cart.total}</span></li>
                    </ul>
                    <form method="get" action="/checkout" >
                        <button class="primary-btn">PROCEED TO CHECKOUT</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END FOOD MENU SECTION -->

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
</body>

</html>
