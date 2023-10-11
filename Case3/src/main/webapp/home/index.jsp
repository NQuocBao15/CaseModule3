<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style>
        a {
            text-decoration: none;
            color: inherit; /* Giữ màu sắc của văn bản chung */
        }
    </style>
</head>

<body>
<c:if test="${message != null}">
    <h6 class="d-none" id="message">${message}</h6>
</c:if>
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
                <c:if test="${user.role.id eq '2'}">
                    <a href="/cart?idUser=${user.id}" class="cart-btn"><i class='bx bx-cart-alt'></i></a>
                </c:if>
                <c:if test="${empty loggedIn}">
                    <a href="/auth" class="cart-btn"><i class='bx bx-cart-alt'></i> </a>
                </c:if>
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
<!-- SECTION HOME -->
<section id="home" class="fullheight align-items-center bg-img bg-img-fixed"
         style="background-image: url(../home/img/ff2.jpg);">
    <div class="container">
        <div class="row">
            <div class="col-6 col-xs-12">
                <div class="slogan">
                    <h1 class="left-to-right play-on-scroll">
                        FoodyCom
                    </h1>
                    <p class="left-to-right play-on-scroll delay-2">
                        Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quae eveniet ullam perferendis
                        eos, nobis corrupti similique fuga ipsa minus at eius ipsam expedita quam aliquam
                        perspiciatis voluptate qui dolore soluta.
                    </p>
                    <div class="left-to-right play-on-scroll delay-4">
                        <a href="/homes#food-menu-section">
                                <button>Order</button>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END SECTION HOME -->
<!-- FOOD MENU SECTION -->
<section class="align-items-center bg-img bg-img-fixed" id="food-menu-section"
         style="background-image: url(../home/assets/katherine-chase-4MMK78S7eyk-unsplash.jpg);">
    <div class="container">
        <div class="food-menu">
            <h1>
                What will <span class="primary-color">you</span> eat today?
            </h1>
            <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Cumque alias aliquam eveniet, iure
                praesentium dicta ex dolorum inventore itaque minus repudiandae, odio provident? Velit architecto
                natus expedita non? Odio, dolorum.
            </p>
            <div class="food-category">
                <div class="zoom play-on-scroll">
                    <button class="active" data-food-type="all">
                        All food
                    </button>
                </div>
                <div class="zoom play-on-scroll delay-2">
                    <button data-food-type="salad">
                        Salad
                    </button>
                </div>
                <div class="zoom play-on-scroll delay-4">
                    <button data-food-type="lorem">
                        Lorem
                    </button>
                </div>
                <div class="zoom play-on-scroll delay-6">
                    <button data-food-type="ipsum">
                        Ipsum
                    </button>
                </div>
                <div class="zoom play-on-scroll delay-8">
                    <button data-food-type="dolor">
                        Dolor
                    </button>
                </div>
            </div>

            <div class="food-item-wrap all">
                <c:forEach items="${page.content}" var="product">
                    <div class="food-item salad-type">
                        <div class="item-wrap bottom-up play-on-scroll">
                            <div class="item-img">
                                <div class="img-holder bg-img"
                                     style="background-image: url(../img${product.img});"></div>
                            </div>
                            <div class="item-info">
                                <div>
                                    <h3>
                                            ${product.name}
                                    </h3>
                                    <span>
                                            Price: ${product.price}
                                    </span>
                                </div>
                                <div class="cart-btn">
                                    <a href="/homes?action=detail&id=${product.id}" class="cart-btn btn"<%-- style="border: 1px solid #1a7a1a"--%>>
                                        <i class="bx bx-cart-alt"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- END FOOD MENU SECTION -->
<!-- TESTIMONIAL SECTION -->
<section id="testimonial">
    <div class="container">
        <div class="row">
            <div class="col-4 col-xs-12">
                <div class="review-wrap zoom play-on-scroll delay-2">
                    <div class="review-content">
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, labore nisi non
                            molestias, minus laboriosam nostrum impedit iure facilis odio unde quia ad sunt corrupti
                            dolores ratione voluptatibus quidem explicabo.
                        </p>
                        <div class="review-img bg-img"
                             style="background-image: url(../home/assets/close-up-portrait-cute-young-woman-holding-textbook-colored-pencils-posing-studio-isolated-pink_176532-9674.jpg);">
                        </div>
                    </div>
                    <div class="review-info">
                        <h3>
                            Lorem Ipsum Dolor
                        </h3>
                        <div class="rating">
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                            <i class="bx bxs-star"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4 col-xs-12">
                <div class="zoom play-on-scroll">
                    <div class="review-wrap active">
                        <div class="review-content">
                            <p>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, labore nisi non
                                molestias, minus laboriosam nostrum impedit iure facilis odio unde quia ad sunt
                                corrupti
                                dolores ratione voluptatibus quidem explicabo.
                            </p>
                            <div class="review-img bg-img"
                                 style="background-image: url(../home/assets/michael-dam-mEZ3PoFGs_k-unsplash.jpg);">
                            </div>
                        </div>
                        <div class="review-info">
                            <h3>
                                Lorem Ipsum Dolor
                            </h3>
                            <div class="rating">
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                                <i class='bx bxs-star'></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-4 col-xs-12">
                <div class="review-wrap zoom play-on-scroll delay-4">
                    <div class="review-content">
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ullam, labore nisi non
                            molestias, minus laboriosam nostrum impedit iure facilis odio unde quia ad sunt corrupti
                            dolores ratione voluptatibus quidem explicabo.
                        </p>
                        <div class="review-img bg-img"
                             style="background-image: url(../home/assets/portrait-happy-young-man_171337-21716.jpg);">
                        </div>
                    </div>
                    <div class="review-info">
                        <h3>
                            Lorem Ipsum Dolor
                        </h3>
                        <div class="rating">
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                            <i class='bx bxs-star'></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- END TESTIMONIAL SECTION -->
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
