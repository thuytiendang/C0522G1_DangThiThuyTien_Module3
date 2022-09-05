<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 28/8/2022
  Time: 11:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <title>Home</title>
    <style>
        .myCSS {
            background-color: white;
            display: flex;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="bg-gray-500 d-flex myCSS my-2" style="height: 100px">
            <div class="col-lg-2 left">
        <span style="font-size: 40px;color: black"><a class="navbar-brand" href="/" style="width: 70% ; height: 70%"><i
                class="fa-solid fa-list"></i></a></span>
                <span style="color: #0a58ca; border: seagreen; font-size: x-large">FURAMA</span>
            </div>
            <div class="col-lg-6 mid " style="text-align: center">
                <img src="https://www.furama.com/images/LOGOFurama_4C_Normal.png" height="80%" width="80%" alt="">
            </div>
            <div class="col-lg-4 right">
                <div class="row">
                    <div class="col-lg-6" id="navbarContent">
                        <ul class=" me-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown ms-3">
                                <a class="nav-link dropdown-toggle " href="#" role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false" style="font-size: 30px">Language</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Việt Nam </a></li>
                                    <li><a class="dropdown-item" href="#">English</a></li>
                                    <li><a class="dropdown-item" href="#">日本語</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-lg-2 col-md-2">
             <span style="font-size: 40px;color: #b28356"><a class="navbar-brand" href="/"
                                                             style="width: 70% ; height: 70%">
                 <i class="fa-brands fa-instagram"></i></a></span>
                    </div>
                    <div class="col-lg-2 col-md-2">
             <span style="font-size: 40px;color: #b28356"><a class="navbar-brand" href="/"
                                                             style="width: 70% ; height: 70%">
                 <i class="fa-brands fa-facebook"></i></a></span>
                    </div>
                    <div class="col-lg-2 col-md-2">
             <span style="font-size: 40px;color: #b28356"><a class="navbar-brand" href="/"
                                                             style="width: 70% ; height: 70%">
                 <i class="fa-brands fa-youtube"></i></a></span>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <nav class="navbar navbar-expand-lg bg-success ">
        <div class="container-fluid mx-5">
            <a class="navbar-brand" href="/">Home</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">Employee</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/employee">Employee list</a></li>
                            <li><a class="dropdown-item" href="/employee?action=create">Add new Employee</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">Customer</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/customer">Customer list</a></li>
                            <li><a class="dropdown-item" href="/customer?action=create">Add new Customer</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">Facility</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/facility">Facility list</a></li>
                            <li><a class="dropdown-item" href="/facility?action=create">Add new Facility</a></li>
                        </ul>
                    </li>

                    <li class="nav-item dropdown ms-3">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">Contract</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/contract">Contract list</a></li>
                            <li><a class="dropdown-item" href="/contract?action=create">Add new Contract</a></li>
                        </ul>
                    </li>
                </ul>

                <form class="d-flex my-2" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>
        </div>
    </nav>

    <div class="mt-5-2 mb-5">
        <div class="row">
            <div class="col-lg-3">
                <p style="text-align: center; color: #8c6a4a; font-size: xx-large">KHU NGHỈ DƯỠNG ĐẲNG CẤP THẾ GIỚI,
                    FURAMA
                    ĐÀ NẴNG, NỔI TIẾNG LÀ KHU NGHỈ DƯỠNG ẨM THỰC TẠI VIỆT NAM.</p>
            </div>
            <div class="col-lg-6" style="text-align: center">
                <iframe width="70%" height="100%" src="https://www.youtube.com/embed/0YT3hj2TLb8" title="Furama Resort
                 Danang" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
            </div>
            <div class="col-lg-3 ">
                <p style="text-align: left">Hướng ra bãi biển Đà Nẵng trải dài cát trắng, Furama Resort Đà Nẵng là
                    cửa ngõ đến với 3 di sản văn hoá thế giới: Hội An (20 phút), Mỹ Sơn (90 phút) và Huế (2 tiếng.
                    196 phòng hạng sang cùng với 70 căn biệt thự từ hai đến bốn phòng ngủ có hồ bơi riêng đều được
                    trang trí trang nhã, theo phong cách thiết kế truyền thống của Việt Nam và kiến trúc thuộc địa của
                    Pháp,
                    biến Furama thành khu nghỉ dưỡng danh giá nhất tại Việt Nam – vinh dự được đón tiếp nhiều người nổi
                    tiếng, giới hoàng gia, chính khách, ngôi sao điện ảnh và các nhà lãnh đạo kinh doanh quốc tế.</p>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="col-lg-12 text-success align-center">
            <p style="color: #b07137; font-size: xx-large ;text-align: center">CÁC LOẠI PHÒNG</p>
            <p style="text-align: center">Khu nghỉ dưỡng có 196 phòng được thiết kế theo phong cách truyền thống Việt
                Nam kết hợp với phong cách Pháp, 2 tòa nhà 4 tầng có hướng nhìn ra biển, nhìn ra hồ bơi trong xanh và những khu vườn nhiệt đới xanh tươi
                mát. Ngoài ra, khu nghỉ dưỡng Furama còn cung cấp các liệu pháp spa, phòng xông hơi ướt, phòng xông hơi
                khô, dịch vụ mát-xa cạnh hồ bơi, các dịch vụ thể thao dưới nước và các lớp tập yoga và Thái Cực Quyền trên
                bãi biển.</p>
        </div>

    </div>

    <div id="carouselExampleControls" class="carousel slide m-5" data-bs-ride="carousel">
        <div class="carousel-inner" style="height: 700px">
            <div class="carousel-item active">
                <img src="https://foto.hrsstatic.com/fotos/0/3/545/350/80/000000/http%3A%2F%2Ffoto-origin.hrsstatic.com%2Ffoto%2F0%2F8%2F9%2F5%2F089508%2F089508_su_19440247.jpg/kEUk9VxyMmr3ezajkyY44A%3D%3D/2048,1079/6/Furama_Resort_Danang-Da_Nang-Suite-11-89508.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn1.ivivu.com/iVivu/2019/11/28/13/three-bedroom-pool-villa-2-cr-800x450.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cdn1.ivivu.com/iVivu/2019/11/28/13/two-bedroom-pool-villa-cr-800x450.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://resortdanang.info/wp-content/uploads/2018/12/double-bed-garden-superior-furama-da-nang.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://resortdanang.info/wp-content/uploads/2018/12/twins-bed-lagoon-superior-furama-da-nang-1-1024x551.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://resortdanang.info/wp-content/uploads/2018/12/twins-bed-ocean-deluxe-furama-da-nang.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://www.tourismdanang.vn/wp-content/uploads/Ocean-Suite-One-Bedroom-Furama-Resort.png"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <div class="text-center bg-secondary">
        <p class="text-light p-3">&copy;FURAMA - officially operated in 1997.</p>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>
</body>
</html>
