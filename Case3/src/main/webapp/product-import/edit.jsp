<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en"><head>
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

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>

    <style>
        .error-message {
            color: red;
            font-style: italic;
        }
    </style>
</head>

<body>
<div class="container-xxl position-relative bg-white d-flex p-0">
    <!-- Spinner Start -->
    <div id="spinner" class="bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
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
                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                </div>
                <div class="ms-3">
                    <h6 class="mb-0">${user.name}</h6>
                    <span>${user.role.name}</span>
                </div>
            </div>
            <div class="navbar-nav w-100">
                <a href="/admin" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                <a href="/product" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Product</a>
                <a href="/product-import" class="nav-item nav-link active"><i class="fa fa-keyboard me-2"></i>Product Import</a>
                <a href="/user" class="nav-item nav-link "><i class="fa fa-table me-2"></i>User</a>
                <a href="/order" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Order</a>
                <a href="/express" class="nav-item nav-link "><i class="fa fa-chart-bar me-2"></i>Express</a>
            </div>
        </nav>
    </div>
    <!-- Sidebar End -->


    <!-- Content Start -->
    <div class="content">
        <div class="container">
            <div class="card container px-6" style="height: 100vh">
                <h3 class="text-center">Edit Product Import</h3>
                <form action="/product-import?action=edit&id=${productImport.id}" method="post" id="editForm" onsubmit="return validateForm()">
                    <div class="mb-3">
                        <label for="code" class="form-label">Import Code</label>
                        <input type="text" class="form-control" id="code" name="code" required value="${productImport.code}">
                        <div class="error-message" id="code-error"></div>
                    </div>
                    <div class="mb-3">
                        <label for="importDate" class="form-label">Import Date</label>
                        <input type="date" class="form-control" id="importDate" name="importDate" required value="${productImport.dateImport}">
                        <div class="error-message" id="importDate-error"></div>
                    </div>
                    <%--        <div class="mb-3">--%>
                    <%--            <label for="totalAmount" class="form-label">Tổng giá trị</label>--%>
                    <%--            <input type="number" class="form-control" id="totalAmount" name="totalAmount" required>--%>
                    <%--        </div>--%>
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
                        <c:forEach var="piDetail" varStatus="status" items="${productImport.productImportDetails}">
                            <div class="row mb-3" id="product-import-${status.index + 1}">
                                <div class="col-4">
                                    <select class="form-control" onchange="onChangeSelect(this)" name="productIds" id="product" required>
                                        <option value="">---Please Choose---</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.id}" ${product.id == piDetail.product.id ? 'selected' : ''}>
                                                    ${product.name}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-3">
                                    <input type="number" class="form-control" id="quantities-1" name="quantities" value="${piDetail.quantity}" required>
                                    <div class="error-message" id="quantities-1-error"></div>
                                </div>
                                <div class="col-3">
                                    <input type="number" class="form-control" id="amounts-1" name="amounts" value="${piDetail.price}" required>
                                    <div class="error-message" id="amounts-1-error"></div>
                                </div>
                                <div class="col-2 d-flex justify-content-end">
                                    <button type="button" class="btn btn-danger" onclick="deleteRow(${status.index + 1})">Delete</button>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <a href="/product-import" class="btn btn-dark">Cancel</a>
                    <button type="submit" class="btn btn-primary">Edit import</button>
                </form>
            </div>

        </div>
    </div>
    <!-- Content End -->


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
    // <![CDATA[  <-- For SVG support
    // if ('WebSocket' in window) {
    //   (function () {
    //     function refreshCSS() {
    //       var sheets = [].slice.call(document.getElementsByTagName("link"));
    //       var head = document.getElementsByTagName("head")[0];
    //       for (var i = 0; i < sheets.length; ++i) {
    //         var elem = sheets[i];
    //         var parent = elem.parentElement || head;
    //         parent.removeChild(elem);
    //         var rel = elem.rel;
    //         if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
    //           var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
    //           elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
    //         }
    //         parent.appendChild(elem);
    //       }
    //     }
    //     var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
    //     var address = protocol + window.location.host + window.location.pathname + '/ws';
    //     var socket = new WebSocket(address);
    //     socket.onmessage = function (msg) {
    //       if (msg.data == 'reload') window.location.reload();
    //       else if (msg.data == 'refreshcss') refreshCSS();
    //     };
    //     if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
    //       console.log('Live reload enabled.');
    //       sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
    //     }
    //   })();
    // }
    // else {
    //   console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
    // }

    const message = document.getElementById('message');
    if (message !== null && message.innerHTML) {
        toastr.success(message.innerHTML);
    }


    const productId = document.getElementById('product');
    const productImportDetail = document.getElementById('product-import-detail');
    const eSelect = document.getElementsByName('productIds');
    const products = ${productsJSON};

    let rowProductImport = ${productImport.productImportDetails.size()};
    let rowCount = rowProductImport;
    function addMore() {
        if(rowCount === products.length) return
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

        $('#editForm').validate({
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
            errorPlacement: function(error, element) {
                // Hiển thị thông báo lỗi màu đỏ
                error.addClass('error-message');
                error.insertAfter(element);
            },
            highlight: function(element) {
                // Áp dụng hiệu ứng giao diện khi lỗi xảy ra
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element) {
                // Xóa hiệu ứng giao diện khi lỗi được giải quyết
                $(element).removeClass('is-invalid');
            },
            submitHandler: function(form) {
                // Xử lý gửi form khi dữ liệu hợp lệ
                form.submit();
            }
        });
        $.validator.addMethod(
            "customMaxDate",
            function(value) {
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
    function onChangeSelect(e){
        if(productsSelected.find(id => +id === +e.value)){
            e.value = '';
            toastr.warn('Product has been selected');
        }
        productsSelected = Array.from(eSelect).map(e => e.value);
    }
    // ]]>
    $(document).ready(function (){
        $('#editForm').validate({
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
            errorPlacement: function(error, element) {
                // Hiển thị thông báo lỗi màu đỏ
                error.addClass('error-message');
                error.insertAfter(element);
            },
            highlight: function(element) {
                // Áp dụng hiệu ứng giao diện khi lỗi xảy ra
                $(element).addClass('is-invalid');
            },
            unhighlight: function(element) {
                // Xóa hiệu ứng giao diện khi lỗi được giải quyết
                $(element).removeClass('is-invalid');
            },
            submitHandler: function(form) {
                // Xử lý gửi form khi dữ liệu hợp lệ
                form.submit();
            }
        });
        $.validator.addMethod(
            "customMaxDate",
            function(value, element) {
                var currentDate = new Date();
                var inputDate = new Date(value);

                return inputDate <= currentDate;
            },
            "Ngày không được lớn hơn ngày hiện tại"
        );
    })

</script>


</body></html>