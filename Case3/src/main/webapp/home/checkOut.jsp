<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDB.SHOP</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="../home/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="img/favicon.ico" rel="icon">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet"/>

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/toastr@2.1.4/build/toastr.min.css" rel="stylesheet">
    <style>
        .card {
            max-width: 100%;
            max-height: 100%;
        }

        .card img {
            max-width: 30%;
            max-height: 50%;
            height: auto;
            width: auto;
        }

        .error-message {
            color: red;
            font-style: italic;
        }

        a{
            text-decoration: none;
        }
    </style>
</head>

<body>
<!-- MOBILE NAV -->
<c:choose>
    <c:when test="${not empty loggedIn && user.role.id eq '2'}">
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
                        PDB Shop
                    </div>
                </a>
                <div class="menu h-xs">
                    <a href="/homes">
                        <div class="menu-item">
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
                <form action="/cart?action=order&idUser=${user.id}" method="post" id="orderForm"
                      onsubmit="return validate()">
                    <div class="card container px-6" style="height: 100%">
                        <h3 class="text-center">Bill</h3>

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
                        <div class="row">
                            <div class="col-12" style="overflow-y: scroll; max-height: 500px;">
                                <table class="table">
                                    <thead class="bg-dark text-white">
                                    <tr>
                                        <th></th>
                                        <th>Products Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                    </tr>
                                    </thead>
                                    <tbody class="">
                                    <c:set var="totalPrice" value="0"/>
                                    <c:forEach items="${carts}" var="cart">
                                        <tr class="card-body" style="min-height: 200px;">
                                            <td class="col-3" style="vertical-align: middle;">
                                                <div style="max-height: 200px; overflow: hidden;">
                                                    <img src="../img${cart.product.img}" alt="" style="max-height: 200px;">
                                                </div>
                                            </td>
                                            <td class="col-3" style="vertical-align: middle;">
                                                <h4>${cart.product.name}</h4>
                                                <input type="number" hidden="hidden" name="productIds" value="${cart.product.id}">
                                                <input type="number" hidden="hidden" name="productName" value="${cart.product.name}">
                                            </td>
                                            <td class="col-2" style="vertical-align: middle;">
                                                <input type="text" value="${cart.quantity}" name="quantity" readonly class="form-control">
                                            </td>
                                            <td class="col-2" style="vertical-align: middle;">
                                                <fmt:formatNumber var="formattedPrice" value="${cart.price}" pattern="#,###.### VNĐ"/>
                                                <input type="text" name="price" value="${cart.price}" readonly hidden="hidden">
                                                <input type="text" id="formattedPrice" value="${formattedPrice}" readonly class="form-control"/>
                                            </td>
                                            <td class="col-2" style="vertical-align: middle;">
                                                <fmt:formatNumber var="formattedTotalPrice" value="${cart.price * cart.quantity}" pattern="#,###.### VNĐ"/>
                                                <input type="text" name="totalPrice" value="${cart.price * cart.quantity}" readonly hidden="hidden">
                                                <input type="text" id="formattedTotalPrice" value="${formattedTotalPrice}" class="form-control" readonly>
                                            </td>
                                        </tr>
                                        <c:set var="totalPrice" value="${totalPrice + (cart.price * cart.quantity)}"/>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
                        <div class="row">
                            <span class="col-10"></span>
                            <a href="/homes" class="btn btn-dark col-1">Back</a>
                            <button type="submit" class="btn btn-success col-1"
                                    onclick="return confirm('Would you like to make the payment for the bill?')">Order
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </c:when>
    <c:otherwise>
        <c:redirect url="/auth"/>
    </c:otherwise>
</c:choose>
<!-- END FOOD MENU SECTION -->

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
<script>
    $(document).ready(function () {
        $("#orderForm").validate({
            rules: {
                nameReceiver: {
                    required: true
                },
                addressReceiver: {
                    required: true
                },
                phoneReceiver: {
                    required: true,
                    digits: true,
                    minlength: 10,
                    maxlength: 10,
                    regex: /^0\d{9}$/
                }
            },
            messages: {
                nameReceiver: {
                    required: "Please enter the name of the receiver"
                },
                addressReceiver: {
                    required: "Please enter the address of the receiver"
                },
                phoneReceiver: {
                    required: "Nhập số điện thoại",
                    digits: "Số điện thoại không chứa chữ",
                    minlength: "Số điện thoại phải đủ 10 số",
                    maxlength: "Số điện thoại phải đủ 10 số",
                    regex: "Số điện thoại phải bắt đầu bằng số 0"
                }
            },
            errorPlacement: function (error, element) {
                error.appendTo("#" + element.attr("id") + "-error");
            }
        });
    });
</script>
</body>

</html>
