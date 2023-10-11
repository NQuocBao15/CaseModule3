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
                <div class="card container px-6" style="height: 100vh">
                    <h3 class="text-center">Product Import Detail</h3>
                    <form action="/cart?action=order&idUser=${user.id}" method="post" id="orderForm">
                        <div class="mb-3">
                            <input type="text" hidden="hidden" name="customerId" value="${user.id}">
                            <label for="customerName" class="form-label">Customer Name</label>
                            <input type="text" class="form-control" id="customerName" name="customerName" required
                                   value="${user.name}" readonly>
                            <div class="error-message" id="customerName-error"></div>
                        </div>
                        <div class="mb-3">
                            <label for="nameReceiver" class="form-label">Name Receiver</label>
                            <input type="text" class="form-control" id="nameReceiver" name="nameReceiver" required>
                            <div class="error-message" id="nameReceiver-error"></div>
                        </div>
                        <div class="mb-3">
                            <label for="addressReceiver" class="form-label">Address Receiver</label>
                            <input type="text" class="form-control" id="addressReceiver" name="addressReceiver"
                                   required>
                            <div class="error-message" id="addressReceiver-error"></div>
                        </div>
                        <div class="mb-3">
                            <label for="phoneReceiver" class="form-label">Phone Receiver</label>
                            <input type="text" class="form-control" id="phoneReceiver" name="phoneReceiver" required>
                            <div class="error-message" id="phoneReceiver-error"></div>
                        </div>
                        <div class="mb-3">
                            <label for="express" class="form-label">Express</label>
                            <select class="form-control" name="express" id="express" required>
                                <c:forEach var="e" items="${express}">
                                    <option value="${e.id}">${e.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="row mb-3">
                            <div class="col-5">
                                Product
                            </div>
                            <div class="col-2">
                                Quantity
                            </div>
                            <div class="col-2">
                                Price
                            </div>
                            <div class="col-3">
                                Total Price
                            </div>
                        </div>
                        <c:set var="totalPrice" value="0"/>
                        <c:forEach items="${carts}" var="cart">
                            <div class="row mb-3">
                                <c:set var="totalPrice" value="${totalPrice + (cart.price * cart.quantity)}"/>

                                <div class="col-5">
                                    <input type="number" hidden="hidden" name="productIds" value="${cart.product.id}">
                                    <input type="number" hidden="hidden" name="productName"
                                           value="${cart.product.name}">
                                    <img src="../img${cart.product.img}" style="width: 50%; height: 70%" alt="">
                                    <h5>${cart.product.name}</h5>
                                </div>
                                <div class="col-2">
                                    <input type="text" value="${cart.quantity}" name="quantity" readonly
                                           class="form-control">
                                </div>
                                <div class="col-2">
                                    <fmt:formatNumber var="formattedPrice" value="${cart.price}"
                                                      pattern="#,###.### VNĐ"/>
                                    <input type="text" name="price" value="${cart.price}" readonly hidden="hidden">
                                    <input type="text" id="formattedPrice" value="${formattedPrice}" readonly
                                           class="form-control"/>
                                </div>
                                <div class="col-3">
                                    <fmt:formatNumber var="formattedTotalPrice" value="${cart.price * cart.quantity}"
                                                      pattern="#,###.### VNĐ"/>
                                    <input type="text" name="totalPrice" value="${cart.price * cart.quantity}" readonly
                                           hidden="hidden">
                                    <input type="text" id="formattedTotalPrice" value="${formattedTotalPrice}"
                                           class="form-control" readonly>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="row mb-3">
                            <div class="col-5">

                            </div>
                            <div class="col-4">

                            </div>
                            <div class="col-1">
                                Total:
                            </div>
                            <div class="col-2">
                                <span><fmt:formatNumber value="${totalPrice}" pattern="#,###.### VNĐ"/></span>
                                <input type="text" name="total" value="${totalPrice}" hidden="hidden" readonly>
                            </div>
                        </div>
                        <a href="/homes" class="btn btn-dark">Back</a>
                        <button type="submit" class="btn btn-success"
                                onclick="return confirm('Would you like to make the payment for the bill?')">Order
                        </button>
                    </form>
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
