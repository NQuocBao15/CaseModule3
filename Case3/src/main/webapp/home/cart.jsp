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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
<!-- MOBILE NAV -->
<c:choose>
    <c:when test="${not empty loggedIn && user.role.id eq '2'}">
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
                            <a href="/auth?action=changePassword&id=${user.id}" class="dropdown-item">Change
                                Password</a>
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
        <section class="">
            <div class="container">
                <div class="row">
                    <div class="card col-8">
                        <table>
                            <thead>
                            <tr>
                                <th class="">Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody class="card-body">
                            <c:set var="totalPrice" value="0"/>
                            <c:forEach items="${carts}" var="cart">
                                <%--                        <c:set var="max" value="1"/>--%>
                                <%--                        <c:forEach items="${productImportDetails}" var="pid">--%>
                                <%--                            <c:if test="${cart.product.id == pid.product.id}">--%>
                                <%--                                <c:set var="max" value="${pid.quantity-pid.quantitySold}"/>--%>
                                <%--                            </c:if>--%>
                                <%--                        </c:forEach>--%>
                                <tr>
                                    <td class="col-4">
                                        <img src="../img${cart.product.img}" alt="">
                                        <h5>${cart.product.name}</h5>
                                    </td>
                                    <td class="col-1">
                                        <fmt:formatNumber value="${cart.price}" pattern="#,###.### VNĐ"/>
                                    </td>
                                    <td class="col-1">
                                            <%--                                    <input min="1" max="${productImportDetails}" name="quantity"--%>
                                            <%--                                           id="productQuantity" type="number" value="${cart.quantity}"--%>
                                            <%--                                           style="text-align: center; width: 100px" onchange="handleQuantityChange(this.value,${cart.product.id},${user.id})">--%>
                                            ${cart.quantity}
                                    </td>
                                    <td class="col-1">
                                        <fmt:formatNumber value="${cart.price * cart.quantity}"
                                                          pattern="#,###.### VNĐ"/>
                                    </td>
                                    <td class="col-1">
                                        <a class="btn btn-danger"
                                           href="/cart?action=delete&idProduct=${cart.product.id}&idUser=${cart.user.id}"
                                           onclick="return confirm('Do you want to remove' + ${cart.product.name} + '?')"><i
                                                class="fa-solid fa-xmark"></i></a>
                                    </td>
                                </tr>
                                <c:set var="totalPrice" value="${totalPrice + (cart.price * cart.quantity)}"/>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-4">
                        <div class="card">
                            <h5 style="text-align: center">Cart Total</h5>
                            <ul>
                                <p style="text-align: center">Total <span><fmt:formatNumber value="${totalPrice}"
                                                                                            pattern="#,###.### VNĐ"/> đ</span>
                                </p>
                            </ul>
                            <c:if test="${user.role.id eq '2'}">
                                <form method="post" action="/cart?action=checkOut&idUser=${user.id}"
                                      style="text-align: center">
                                        <%--                        <input type="text" hidden="hidden" value="${cart.user.id}" name="idUser">--%>
                                    <button class="primary-btn">PROCEED TO CHECKOUT</button>
                                </form>
                            </c:if>
                            <c:if test="${empty loggedIn}">
                                <a href="/auth" class="login-btn">Login </a>
                            </c:if>
                        </div>
                    </div>
                </div>

            </div>

        </section>
    </c:when>
    <c:otherwise>
        <c:redirect url="/auth"/>
    </c:otherwise>
</c:choose>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"
        integrity="sha512-uKQ39gEGiyUJl4AI6L+ekBdGKpGw4xJ55+xyJG7YFlJokPNYegn9KwQ3P8A7aFQAUtUsAQHep+d/lrGqrbPIDQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="../home/js/main.js"></script>
<script>
    const productID = ${productImportDetails};
    document.getElementById('productQuantity').addEventListener('input', function () {
        var quantity = parseInt(this.value);
        var price = parseFloat('${product.price}'); // Assuming product.price is in float format

        if (!isNaN(quantity) && !isNaN(price)) {
            var total = quantity * price;
            document.getElementById('totalCheckOut').textContent = 'Total: ' + total.toFixed(0) + ' đ'; // Assuming you want to display total in Vietnamese currency format
        }
    });

    function handleQuantityChange(eQuantity, idProduct, idUser) {
        let url = `/homes?action=update&idProduct=\${idProduct}&idUser=\${idUser}&quantity=\${eQuantity}`;
        window.location.assign(url);
    }

    function handleDeleteCartItem(idProduct, idUser) {
        let url = `/homes?action=delete&idProduct=\${idProduct}&idUser=\${idUser}`;
        window.location.assign(url);
    }
</script>
</body>

</html>