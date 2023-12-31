<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="utf-8">
    <title>Product Import</title>
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
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Product Import</h3>
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
                        <a href="/product" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                        <a href="/product-import" class="nav-item nav-link active"><i class="fa fa-keyboard me-2"></i>Product
                            Import</a>
                        <a href="/user" class="nav-item nav-link "><i class="fa fa-table me-2"></i>User</a>
                        <a href="/express" class="nav-item nav-link "><i class="fa fa-chart-bar me-2"></i>Express</a>
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
                        <h3 class="text-center">Create Product Import</h3>
                        <form action="/product-import?action=create" method="post" id="createForm"
                              onsubmit="return validateForm()">
                            <div class="mb-3">
                                <label for="code" class="form-label">Import Code</label>
                                <input type="text" class="form-control" id="code" name="code" required>
                                <div class="error-message" id="code-error"></div>
                            </div>
                            <div class="mb-3">
                                <label for="importDate" class="form-label">Import Date</label>
                                <input type="date" class="form-control" id="importDate" name="importDate" required>
                                <div class="error-message" id="importDate-error"></div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-4">
                                    Product
                                </div>
                                <div class="col-3">
                                    Quantity
                                </div>
                                <div class="col-3">
                                    Amount
                                </div>
                                <div class="col-2 d-flex justify-content-end">
                                    <button type="button" class="btn btn-info" onclick="addMore()">Add More</button>
                                </div>
                            </div>
                            <div id="product-import-detail">
                                <div class="row mb-3" id="product-import-1">
                                    <div class="col-4">
                                        <select class="form-control" onchange="onChangeSelect(this)" name="productIds"
                                                id="product" required>
                                            <option value="">---Please Choose---</option>
                                            <c:forEach var="product" items="${products}">
                                                <option value="${product.id}">${product.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <input type="number" class="form-control" id="quantities-1" name="quantities"
                                               required>
                                        <div class="error-message" id="quantities-1-error"></div>
                                    </div>
                                    <div class="col-3">
                                        <input type="number" class="form-control" id="amounts-1" name="amounts"
                                               required>
                                        <div class="error-message" id="amounts-1-error"></div>
                                    </div>
                                    <div class="col-2 d-flex justify-content-end">
                                        <button type="button" class="btn btn-danger" onclick="deleteRow(1)">Delete
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <a href="/product-import" class="btn btn-dark">Cancel</a>
                            <button type="submit" class="btn btn-primary" id="btnCreate">Create Import</button>
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
    <!-- Back to Top -->
    <%--  <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>--%>
</div>

<!-- JavaScript Libraries -->
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
<script>

    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }

    const productId = document.getElementById('product');
    const productImportDetail = document.getElementById('product-import-detail');
    const eSelect = document.getElementsByName('productIds');
    const products = ${productsJSON};
    let rowProductImport = 1;
    let rowCount = rowProductImport;

    function addMore() {
        if (rowCount === products.length) return
        rowCount++;
        let selectStr = '<select class="form-control" onchange="onChangeSelect(this)" name="productIds" id="product" required><option value="">---Please Choose---</option>';
        for (const product of products) {
            selectStr += `<option value="\${product.id}">\${product.name}</option>`;
        }

        selectStr += '</select>';
        const strRow = `<div class="row mb-3" id="product-import-\${++rowProductImport}">
            <div class="col-4">
                \${selectStr}
            </div>
            <div class="col-3">
                <input type="number" class="form-control" id="quantities-\${rowProductImport}"  name="quantities" required="true">
                                 <div class="error-message" id="quantities-\${rowProductImport}-error"></div>
            </div>
            <div class="col-3">
                <input type="number" class="form-control" id="amounts"  name="amounts" value="\${product.price}" required="true">
                               <div class="error-message" id="amounts-\${rowProductImport}-error"></div>
            </div>
            <div class="col-2 d-flex justify-content-end">
                <button class="btn btn-danger" onclick="deleteRow(\${rowProductImport})">Delete</button>
            </div>
        </div>`
        document.querySelector('#product-import-detail').innerHTML += strRow;


        $('#createForm').validate({
            rules: {
                code: {
                    required: true,
                    minlength: 6
                },
                importDate: {
                    required: true,
                    date: true,
                    customMaxDate: true
                },
                quantities: {
                    required: true,
                    number: true,
                    min: 1,
                },
                amounts: {
                    required: true,
                    number: true,
                    min: 1000,
                }
            },
            messages: {
                code: {
                    required: "Nhập code",
                    minlength: "Code tối thiểu 6 kí tự"
                },
                importDate: {
                    required: "Nhập ngày",
                    date: "Ngày không hợp lệ",
                    maxDate: "Ngày nhập không được lớn hơn ngày hiện tại"
                },
                quantities: {
                    required: "Nhập số lượng",
                    number: "Số lượng không hợp lệ",
                    min: "Số lượng tối thiểu là 1",
                },
                amounts: {
                    required: "Nhập giá",
                    number: "Giá không hợp lệ",
                    min: "Giá tối thiểu là 1000",
                }
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
        $.validator.addMethod(
            "customMaxDate",
            function (value) {
                var currentDate = new Date();
                var inputDate = new Date(value);

                return inputDate <= currentDate;
            },
            "Ngày không được lớn hơn ngày hiện tại"
        );
    }

    function deleteRow(number) {
        if (rowCount === 1) {
            toastr.warn('At least 1 product');
            return;
        }
        rowCount--;
        const row = document.getElementById('product-import-' + number);
        productImportDetail.removeChild(row);
    }

    let productsSelected = Array.from(eSelect).map(e => e.value);

    function onChangeSelect(e) {
        if (productsSelected.find(id => +id === +e.value)) {
            e.value = '';

        }
        productsSelected = Array.from(eSelect).map(e => e.value);
    }

    // ]]>

    $(document).ready(function () {

        $('#createForm').validate({
            rules: {
                code: {
                    required: true,
                    minlength: 6
                },
                importDate: {
                    required: true,
                    date: true,
                    customMaxDate: true
                },
                quantities: {
                    required: true,
                    number: true,
                    min: 1,
                },
                amounts: {
                    required: true,
                    number: true,
                    min: 1000,
                }
            },
            messages: {
                code: {
                    required: "Nhập code",
                    minlength: "Code tối thiểu 6 kí tự"
                },
                importDate: {
                    required: "Nhập ngày",
                    date: "Ngày không hợp lệ",
                    maxDate: "Ngày nhập không được lớn hơn ngày hiện tại"
                },
                quantities: {
                    required: "Nhập số lượng",
                    number: "Số lượng không hợp lệ",
                    min: "Số lượng tối thiểu là 1",
                },
                amounts: {
                    required: "Nhập giá",
                    number: "Giá không hợp lệ",
                    min: "Giá tối thiểu là 1000",
                }
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
        $.validator.addMethod(
            "customMaxDate",
            function (value, element) {
                var currentDate = new Date();
                var inputDate = new Date(value);

                return inputDate <= currentDate;
            },
            "Ngày không được lớn hơn ngày hiện tại"
        );
    })


    // var codeInput = document.getElementById("code");
    // var codeError = document.getElementById("code-error");
    // codeInput.addEventListener('blur', function () {
    //     var codeValue = codeInput.value;
    //     if (codeValue.length < 6) {
    //         codeInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
    //         codeError.textContent = 'Code phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
    //     } else { codeInput.classList.remove('is-invalid'); // Xóa lớp CSS 'is-invalid'
    //         codeError.textContent = ''; // Xóa thông báo lỗi
    //     } })
    //
    //     var importDateInput = document.getElementById('importDate');
    //     var importDateError = document.getElementById('importDate-error');
    //
    //     importDateInput.addEventListener("blur", function () {
    //         var importDateValue = new Date(importDateInput.value).getTime();
    //         var currentDate = new Date().getTime();
    //
    //         if (importDateValue > currentDate) {
    //             importDateInput.classList.add("is-invalid");
    //             importDateError.textContent = "Ngày không hợp lệ, không phải là ngày tương lai";
    //         } else {
    //             importDateInput.classList.remove("is-invalid");
    //             importDateError.textContent = "";
    //         }
    //
    //     });
    // var quantitiesInput = document.getElementById(`quantities-1`);
    // var quantitiesError = document.getElementById(`quantities-1-error`);
    // quantitiesInput.addEventListener('blur', function () {
    //     var inputValue = parseInt(quantitiesInput.value, 10);
    //     if (isNaN(inputValue) || inputValue < 1) {
    //         quantitiesInput.value = 1;
    //         quantitiesInput.classList.add("is-invalid");
    //         quantitiesError.textContent = "Số lượng tối thiểu là 1";
    //     } else {
    //         quantitiesInput.classList.remove("is-invalid");
    //         quantitiesError.textContent = "";
    //     }
    // });
    //
    // var amountsInput = document.getElementById(`amounts-1`);
    // var amountsError = document.getElementById(`amounts-1-error`);
    // amountsInput.addEventListener('blur', function () {
    //     var inputValue = Number(amountsInput.value).toFixed(3);
    //     if (isNaN(inputValue) || inputValue < 1000) {
    //         amountsInput.value = 1000;
    //         amountsInput.classList.add("is-invalid");
    //         amountsError.textContent = "Giá tối thiểu là 1000";
    //     } else {
    //         amountsInput.classList.remove("is-invalid");
    //         amountsError.textContent = "";
    //     }
    // });
    //
    //     document.querySelector('form').addEventListener('submit', function (event) {
    //
    //             var amountsInput = document.getElementById(`amounts-1`);
    //             var amountsError = document.getElementById(`amounts-1-error`);
    //             var amountValue = Number(amountsInput.value).toFixed(3);
    //             if (isNaN(amountValue) || amountValue < 1000) {
    //                 event.preventDefault();
    //                 amountsInput.classList.add('is-invalid');
    //                 amountsError.textContent = 'Số tiền tối thiểu là 1000';
    //                 amountsInput.focus();
    //             }
    //
    //             var quantitiesInput = document.getElementById(`quantities-1`);
    //             var quantitiesError = document.getElementById(`quantities-1-error`);
    //             var quantitiesValue = parseInt(quantitiesInput.value, 10);
    //             if (isNaN(quantitiesValue) || quantitiesValue < 1) {
    //                 event.preventDefault();
    //                 quantitiesInput.classList.add('is-invalid');
    //                 quantitiesError.textContent = 'Số lượng tối thiểu là 1';
    //                 quantitiesInput.focus();
    //             }
    //
    //         if (importDateValue > currentDate) {
    //             event.preventDefault(); // Ngăn chặn gửi form đi
    //
    //             importDateInput.classList.add("is-invalid");
    //             importDateError.textContent = "Ngày không hợp lệ, không phải là ngày tương lai";
    //             importDateInput.focus();
    //         }
    //
    //
    //         var codeValue = codeInput.value;
    //         if (codeValue.length < 6) {
    //             event.preventDefault(); // Ngăn chặn gửi form đi
    //
    //             codeInput.classList.add('is-invalid'); // Thêm lớp CSS 'is-invalid' để hiển thị viền đỏ
    //             codeError.textContent = 'Password phải có ít nhất 6 kí tự'; // Hiển thị thông báo lỗi
    //
    //             codeInput.focus(); // Tập trung vào trường password không hợp lệ
    //         }
    //     });
</script>


</body>
</html>