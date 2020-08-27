<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Điện Máy Xanh - Index</title>
    <jsp:include page="../common/head.jsp" />

	<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/base.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
</head>
<body class="d-flex flex-column h-100">
<!-- Back to Top -->

    <div class="container-fluid">
        <div class="top-banner row">
            <img class="mx-auto" src="images/Tragop-1200-44-1200x44-1.png" alt="top-banner"/>
        </div>
    </div>

    <header class="container-fluid">
        <div class="container">
            <div class="row menu-bar">
                <!--         LEFT MENU -->
                <div class="left-area float-left d-flex">
                    <div id="brand">
                        <a class="brand-link" href="/actionpage">
                            <i class="icon-dmx logo-dmx"></i>
                        </a>
                    </div>
                    <div id="province-area">
                        <b>Xem giá, tồn kho ở: </b>
                        <a class="province" data-toggle="modal"
                           data-target="#selectProvinceModal">TP. Hồ CHí Minh
                            <i class="fa fa-chevron-down"></i>
                        </a>
                        <div class="modal fade" id="selectProvinceModal" tabindex="-1" role="dialog"
                             aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-md">
                                <div class="modal-content">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close"></button>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="province">
                                                    <strong>Chọn Tỉnh, Thành</strong>
                                                </label>
                                                <select class="form-control" id="province">
                                                    <option value="1">Hồ Chí Minh</option>
                                                    <option value="2">Hà Nội</option>
                                                    <option value="3">Đà Nẵng</option>
                                                    <option value="4">Cần Thơ</option>
                                                    <option value="5">Hải Phòng</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label id="chonAdd" for="district">
                                                    <strong>Chọn đầy đủ địa chỉ nhận hàng</strong> để biết chính xác
                                                    thời gian giao
                                                </label>
                                                <select class="form-control" id="district">
                                                    <option value="0" disabled selected>Vui lòng chọn Quận/Huyện
                                                    </option>
                                                    <option value="1" class="address-opt">Quận Abc</option>
                                                    <option value="2" class="address-opt">Quận Abc</option>
                                                    <option value="3" class="address-opt">Quận Abc</option>
                                                    <option value="4" class="address-opt">Huyện Xyz</option>
                                                    <option value="5" class="address-opt">Huyện Xyz</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control" id="ward" disabled>
                                                    <option value="0" disabled selected>Vui lòng chọn Phường/Xã</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="text" class="form-control" id="detailAdd"
                                                       placeholder="Số nhà, tên đường">
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default accept-btn" data-dismiss="modal">
                                            Xác nhận
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <form id="search-area" class="search-form" action="/action_page.php">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Bạn tìm gì..">
                            <div class="input-group-append">
                                <button type="button" class="input-group-text">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                    <div id="history-shopping">
                        <a class="left-info" href="#historyShopping">Lịch sử <br> mua hàng
                        </a>
                    </div>
                    <div class="cart-box">
                        <a class="cart" href="#cart">
                            <i class="icon-dmx cart-dmx"></i>
                        </a>
                    </div>
                </div>

                <!--         RIGHT MENU -->
                <div class="float-right right-area">
                    <div id="info" class="dropdown">
                        <a class="more-info" href="#knh">
                            Kinh nghiệm hay
                            <div class="km" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="km">
                                &amp; Tin khuyến mãi
                                    <label class="dropbtn">
                                        <i id="show-hide" class="fa fa-caret-down"
                                           aria-hidden="true"></i>
                                        <i class="fa fa-caret-up toShow" style="display: none"></i>
                                    </label>
                                </span>
                            </div>
                            <div class="dropdown-content toShow" aria-labelledby="dropdownMenuButton">
                                <a href="#" class="dropdown-item">Tư vấn chọn mua</a>
                                <a href="#" class="dropdown-item">Tin khuyến mãi</a>
                            </div>
                        </a>
                    </div>
                    <a class="more-info" href="#hotline">
                        1800.1061
                        <span> &amp; Tổng đài miễn phí</span>
                    </a>
                </div>
            </div>
        </div>
    </header>
    <nav>
        <div class="container-fluid">
            <div class="d-flex fixed-nav row">
                <div class="row main-menu">
                    <div>
                        <a id="content">
                            <i class="fa fa-bars"></i>
                            <strong>Danh Mục</strong>
                            <i class="fa fa-caret-down"></i>
                        </a>
                    </div>
                    <div>
                        <a id="showall">Xem tất cả</a>
                    </div>
                </div>
                <div class="row txt-banner">
                    <div>
                        <a class="hot-event">
                            <div class="dot">
                                <span class="ping"></span>
                            </div>
                            <span class="text">Tivi Giảm Lớn 49%</span>
                        </a>
                    </div>
                    <div>
                        <a>Quạt Điều Hòa Ưu Đãi Đến 34%</a>
                    </div>
                    <div>
                        <a>Bỏ Cũ Lấy Mới Máy Lọc Giảm 30%</a>
                    </div>
                    <div>
                        <a class="hot-event">
                            <div class="dot">
                                <span class="ping"></span>
                            </div>
                            <span class="text">Mobi <strong>KM 20%</strong> thẻ nạp</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
    <main class="container-fluid">
        <div class="row mixed-area">
            <div class="side-navbar">
                <ul class="list-nav-item">
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-tv"></i>
                            <a href="/tivi">Tivi</a>,
                            <a href="/tivi">Loa Karaoke</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>TIVI</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>LOA ÂM THANH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-tulanh"></i>
                            <a href="/tivi">Tủ Lạnh</a>,
                            <a href="/tivi">Tủ Đông</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>TỦ LẠNH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>TỦ ĐÔNG</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <label class="hot">HOT</label>
                            <a href="/tivi">Máy Giặt</a>,
                            <a href="/tivi">Sấy Quần Áo</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY GIẶT</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY SẤY QUẦN ÁO</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-maylanh"></i>
                            <a href="/tivi">Máy Lạnh</a>,
                            <a href="/tivi">Quạt Điều Hòa</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY LẠNH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>QUẠT ĐIỀU HÒA</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-locnuoc"></i>
                            <a href="/tivi">Lọc Nước</a>,
                            <a href="/tivi">Máy Nước Nóng</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>LỌC NƯỚC</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY NƯỚC NÓNG</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-noicom"></i>
                            <a href="/tivi">Điện Gia Dụng</a>,
                            <a href="/tivi">Quạt</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>ĐIỆN GIA DỤNG</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>QUẠT</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-dodunggd"></i>
                            <a href="/tivi">Đồ Dùng Gia Đình</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>PHÒNG ĂN</b>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>NHÀ BẾP</b>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>VỆ SINH NHÀ CỬA</b>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-dth"></i>
                            <a href="/tivi">Điện Thoại</a>,
                            <a href="/tivi">Tablet</a>,
                            <a href="/tivi">Laptop</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>ĐIỆN THOẠI</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>LAPTOP</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-pc"></i>
                            <a href="/tivi">Máy Bộ</a>,
                            <a href="/tivi">Màn Hình</a>,
                            <a href="/tivi">Máy In</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY TÍNH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÀN HÌNH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-headphone"></i>
                            <a href="/tivi">Phụ Kiện</a>,
                            <a href="/tivi">Đồng Hồ</a>,
                            <a href="/tivi">Vali</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>ĐÒNG HỒ THỜI TRANG</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>PHỤ KIỆN ĐIỆN THOẠI</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-sim"></i>
                            <a href="/tivi">Sim Số</a>,
                            <a href="/tivi">Thẻ Cào</a>,
                            <a href="/tivi">Thu Hộ</a>
                        </div>
                        </a>
                    </li>
                    <li class="nav-item">
                        <div class="sup-menu">
                            <i class="icon-dmx icon-maycu"></i>
                            <a href="/tivi">Máy Cũ</a>,
                            <a href="/tivi">Trưng Bày</a>
                        </div>
                        <div class="sub-menu">
                            <ul class="group">
                                <li class="group-title">
                                    <b>TIVI</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                                <li class="item"><a href="/">Từ- 32-43 inch</a></li>
                                <li class="item"><a href="/">Dưới 7 triệu</a></li>
                                <li class="item"><a href="/">Tivi cao cấp</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>DÀN LOA ÂM THANH</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>TỦ LẠNH, TỦ ĐÔNG</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                            <ul class="group">
                                <li class="group-title">
                                    <b>MÁY GIẶT, MÁY SẤY</b>
                                    <a class="view-all" href="#">
                                        Xem Tất Cả
                                        <i class="fa fa-caret-right"></i>
                                    </a>
                                </li>
                                <li class="item"><a href="/">Tivi trả góp 0-1%</a></li>
                                <li class="item"><a href="/">Sony</a></li>
                                <li class="item"><a href="/">Samsung</a></li>
                                <li class="item"><a href="/">LG</a></li>
                                <li class="item"><a href="/">TCL</a></li>
                                <li class="item"><a href="/">Từ 32-43 inch</a></li>
                            </ul>
                        </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="hot-campaign">
                <div id="campaignCarousel" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#campaignCarousel" data-slide-to="0" class="active">
                                <span>
                                    Bỏ cũ lấy mới <br>
                                    Chảo giảm 50%
                                </span>
                        </li>
                        <li data-target="#campaignCarousel" data-slide-to="1">
                                <span>
                                    Bỏ cũ lấy mới <br>
                                    Chảo giảm 50%
                                </span>
                        </li>
                        <li data-target="#campaignCarousel" data-slide-to="2">
                                <span>
                                    Bỏ cũ lấy mới <br>
                                    Chảo giảm 50%
                                </span>
                        </li>
                        <li data-target="#campaignCarousel" data-slide-to="3">
                                <span>
                                    Bỏ cũ lấy mới <br>
                                    Chảo giảm 50%
                                </span>
                        </li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="images/TV-Sony.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="images/TCL-TV-690-300-690x300.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="images/May-Giat-TOSHIBA.png" alt="Third slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="images/Le-Hoi_may-Giat.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#campaignCarousel" role="button"
                       data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#campaignCarousel" role="button"
                       data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <aside class="articles">
                <figure>
                    <h2>
                        <a href="#knh">
                            Kinh nghiệm hay - Video
                            <i class="fa fa-caret-right"></i>
                        </a>
                    </h2>
                </figure>
                <ul>
                    <li>
                        <a href="/top5maylanh"
                           title="Top 5 tủ lạnh Panasonic có ngăn lấy nước ngoài kháng khuẩn bán chạy nhất 6 tháng đầu năm 2020">
                            <p>
                                Top 5 tủ lạnh Panasonic có ngăn lấy nước ngoài kháng khuẩn bán <br>
                                chạy nhất 6 tháng đầu năm 2020
                            </p>
                        </a>
                    </li>
                    <li>
                        <a href="/top5tv"
                           title="Top 5 Smart tivi dưới 10 triệu bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy Xanh">
                            <p>
                                Top 5 Smart tivi dưới 10 triệu bán <br>
                                chạy nhất 6 tháng đầu năm 2020
                            </p>
                        </a>
                    </li>
                </ul>
                <div class="shopinshopBannerSection">
                    <div class="shoponshopBanner">
                        <a href="https://www.dienmayxanh.com/panasonic"
                           style="display: block; height: 67.5px">
                            <img src="images/26064-260x64.png" height="64" width="260"/>
                        </a>
                        <a href="https://www.dienmayxanh.com/lg"
                           style="display: block; height: 67.5px">
                            <img src="images/260X64.pngdesk-260x64.png" height="64" width="260"/>
                        </a>
                        <a href="https://www.dienmayxanh.com/tcl"
                           style="display: block; height: 67.5px">
                            <img src="images/StickyBannerTCL-2-260x64.png" height="64" width="260"/></a>
                    </div>
                </div>
            </aside>
        </div>
        <section class="month-top-deals row">
            <div class="title-promo">
                <img class="w-100" src="images/vunggiasocdesk-1200x80.png"/>
            </div>
            <div class="home-product">
                <div id="mTopDealsCarousel" class="carousel slide" data-ride="carousel" data-interval="500000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <ul>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/lg-rn7-1-600x600.jpg"/>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/giamsoc_optimized.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Loa Karaoke LG Xboom RN7 <br>
                                            <span class="new-prod-label">Mới 2020</span>
                                        </div>
                                        <div class="prod-price">8.990.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            <span class="line-through">
                                                13.390.000₫
                                        </span>
                                            <label class="disc-perct"> (33%)</label>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt-no-prod-deal">
                                            <img src="images/tcl-40s6500-550x340.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">

                                        </div>
                                        <div class="prod-name-no-prod-deal">
                                            TCL Android TV 40"
                                        </div>
                                        <div class="prod-price">5.990.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                            <label class="disc-perct"> (14%)</label>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">70 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/online-giảm-sốc-1x.png">
                                        </div>
                                        <div class="prod-name">
                                            Panasonic Inverter 188 lít <br>
                                            <span class="new-prod-label">Mới 2020</span>
                                        </div>
                                        <div class="prod-price">6.690.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            <span class="line-through">
                                                7.490.000₫
                                        </span>
                                            <label class="disc-perct"> (14%)</label>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">45 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/online-giảm-sốc-1x.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Samsung Inverter 9 Kg
                                        </div>
                                        <div class="prod-price">11.490.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            <span class="line-through">
                                                13.590.000₫
                                        </span>
                                            <label class="disc-perct"> (15%)</label>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">62 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/giamsoc_optimized.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Beko Inverter 1 HP
                                        </div>
                                        <div class="prod-price">7.790.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            Quà <b>&#8198;800.000₫</b>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">12 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/giamsoc_optimized.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Quạt điều hòa Midea AC120-16AR
                                        </div>
                                        <div class="prod-price">1.790.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            <span class="line-through">
                                                2.750.000₫
                                            </span>
                                            <label class="disc-perct"> (34%)</label>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">200 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="carousel-item">
                            <ul>
                                <li class="product-info">
                                    <a class="prod-link" href="#"
                                       title="Máy lọc nước R.O Hydrogen Kangraroo KG100HC 10 lõi">
                                        <div class="prod-avt-no-prod-deal">
                                            <img src="images/may-loc-nuoc-kangaroo-kg100hc-2-300x300.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">

                                        </div>
                                        <div class="prod-name-no-prod-deal">
                                            Máy lọc nước R.O Hydrogen Kangraroo...
                                        </div>
                                        <div class="prod-price">6.293.000<sup>₫</sup></div>
                                        <span class="line-through">
                                               8.990.000₫
                                           </span>
                                        <label class="disc-perct"> (30%)</label>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>2.6</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">22 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt-no-prod-deal">
                                            <img src="images/lg-49sm8100pta-550x340.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">

                                        </div>
                                        <div class="prod-name-no-prod-deal">
                                            LG Smart TV NanoCell 4K 49"
                                        </div>
                                        <div class="prod-price">13.890.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                           <span class="line-through">
                                                21.100.000₫
                                           </span>
                                            <label class="disc-perct"> (34%)</label>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.6</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">501 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/samsung-ww85k54e0ux-sv-10-300x300.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/online-giảm-sốc-1x.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Samsung Inverter 8.5 Kg
                                        </div>
                                        <div class="prod-price">12.990.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            Online giảm <b>&#8198;23%</b> còn <b>9.990.000₫</b>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>3.8</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">22 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt-no-prod-deal">
                                            <img src="images/midea-mfk95-1401wk-300x300.jpg"/>
                                            <label class="prod-mthd-payment">
                                                <!--                                            <span>-->
                                                Trả góp <b>0%</b>
                                                <!--                                            </span>-->
                                            </label>
                                        </div>
                                        <div class="prod-deal">

                                        </div>
                                        <div class="prod-name-no-prod-deal">
                                            Midea Inverter 9.5 Kg <br>
                                            <span class="new-prod-label">Mới 2020</span>
                                        </div>
                                        <div class="prod-price">9.990.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            Online giảm <b>&#8198;22%</b> còn <b>7.790.000₫</b>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">4 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/aqua-aqr-t219fa-pb-300x300.jpg"/>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/online-giảm-sốc-1x.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Aqua Inverter 186 lít <br>
                                            <span class="new-prod-label">Mới 2020</span>
                                        </div>
                                        <div class="prod-price">5.290.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            Online giảm <b>&#8198;5%</b> còn <b>4.990.000₫</b>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.8</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">5 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="product-info">
                                    <a class="prod-link" href="#">
                                        <div class="prod-avt">
                                            <img src="images/samsung-ua50ru7200-(5).jpg"/>
                                        </div>
                                        <div class="prod-deal">
                                            <img src="images/online-giảm-sốc-1x.png" alt="">
                                        </div>
                                        <div class="prod-name">
                                            Samsung Smart TV 4K 50'
                                        </div>
                                        <div class="prod-price">16.890.000<sup>₫</sup></div>
                                        <div class="prod-promo">
                                            Online giảm <b>&#8198;38%</b> còn <b>10.400.000₫</b>
                                        </div>
                                        <div class="rating">
                                            <span class="rating-point">
                                                <b>4.5</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                            <span class="rate-amount">149 đánh giá</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#mTopDealsCarousel" role="button"
                       data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#mTopDealsCarousel" role="button"
                       data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </section>
        <section class="row daily-deals">
            <div class="section-title">
                Khuyến mãi Hot mỗi ngày
            </div>
            <div class="group-tabs">
                <ul class="nav-tabs prod-types">
                    <li class="nav-tab-item active">
                        <a class="nav-link" href="#tab-1">
                            Nổi Bật
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-2">
                            Máy Lạnh
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-3">
                            Điện thoại, <br>
                            laptop
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-4">
                            Tivi, Loa <br>Karaoke
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-5">
                            Tủ lạnh, Tủ đông
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-6">
                            Máy giặt
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-7">
                            Máy lọc nước
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-8">
                            Điện gia dụng
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-9">
                            Đồ dùng nhà bếp
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-10">
                            Đồng hồ
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-11">
                            Phụ kiện
                        </a>
                    </li>
                    <li class="nav-tab-item">
                        <a class="nav-link" href="#tab-12">
                            Máy nước nóng
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-panel active" id="tab-1">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2063/217541/noi-chien-khong-dau-mishio-mk-155-35l-den-11-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-2">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2063/217541/noi-chien-khong-dau-mishio-mk-155-35l-den-11-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-3">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/42/213591/TimerThumb/oppo-reno3-(16).jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        Điện thoại Oppo Reno 3
                                    </div>
                                    <div class="prod-price">8.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Giảm <b>1.500.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.3</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">37 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/42/200533/TimerThumb/iphone-11-pro-max-(22).jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Điện thoại iPhone 11 Pro Max 64GB <br>
                                    </div>
                                    <div class="prod-price">33.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Giảm <b>3.500.000₫</b>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.7</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">37 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2063/217541/noi-chien-khong-dau-mishio-mk-155-35l-den-11-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-4">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2063/217541/noi-chien-khong-dau-mishio-mk-155-35l-den-11-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-5">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1943/188985/tu-lanh-samsung-rb27n4170s8-sv-10-300x300.JPG"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1943/220508/panasonic-nr-bl26avpvn-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1943/188924/tu-lanh-samsung-rb30n4010s8-sv-6-300x300.JPG"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/aqua-aqr-t219fa-pb-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1943/220313/samsung-rb30n4170by-sv-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1943/193449/tu-lanh-aqua-aqr-ig248en-gb-5-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-6">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1944/212883/panasonic-na-fd12vr1bv-22-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/https://cdn.tgdd.vn/Products/Images/1944/212917/samsung-ww10k44g0yw-sv-6-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1944/195940/may-giat-panasonic-na-fs14v7srv-10-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/https://cdn.tgdd.vn/Products/Images/1944/155200/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1944/219786/midea-mfk95-1401sk-1-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-7">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/142256/may-loc-nuoc-kangaroo-vtu-kg08-12-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/204077/may-loc-nuoc-ro-kangaroo-kg100hu-2-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/213830/may-loc-nuoc-ro-khong-vo-kangaroo-kg100hq-9-loi-9-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/214497/may-loc-nuoc-ro-khong-vo-kangaroo-kg110-9-loi-kg-10-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/204086/may-loc-nuoc-ro-daikiosan-dxw-33009g-2-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3385/224588/may-loc-nuoc-ro-delites-des0820ro-8-loi-den-imei-1-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-8">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7498/218311/may-lam-mat-khong-khi-kangaroo-kg50f61-19-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7498/199114/kangaroo-kg50f68-kg-5-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7498/154259/kangaroo-kg50f20-17-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7498/218452/may-lam-mat-bang-hoi-nuoc-gree-kswk-2001degl-21-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1991/217656/may-say-toc-delites-kf-5891-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1922/197076/noi-com-dien-tefal-rk-604165-23-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-9">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/5228/160978/binh-da-thai-lan-pioneer-8l-bd001-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/4930/133962/pioneer-pet-001-1-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/4930/132361/nhua-950ml-delites-pc-001-daidien-1-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/3729/163767/bo-6-moc-nhua-thai-lan-pioneer-ma001-6-7-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/4929/134792/bo-hop-nhua-vuong-jcj-h03-01-3-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/4929/134059/bo-hop-nhua-chu-nhat-dmx-h10-01-avatar-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-10">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/199618/g-shock-gba-800-8adr-xam-9-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/202483/timex-tw2p91500-nu-600x600.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/202108/timex-tw2r42800-den-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/201967/srwatch-sg5561-1402-vang-nam-thum-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/202144/timex-tw2t26300-nhieu-mau-600x600.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/7264/202464/timex-tw2p95800-nam-nu-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-11">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#" title="Pin sạc dự phòng 7.500 mAh AVA Cat 3S Cam Trắng">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/57/204428/pin-sac-du-phong-7500mah-ava-cat-3s-cam-trang-1-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        Pin sạc dự phòng 7.500 mAh AVA Cat 3S Cam...
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#" title="Pin sạc dự phòng 19.000 mAh Xmobile Gram 6S Trắng">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/57/217433/pin-sac-du-phong-7500mah-ava-lj-jp195-add-600x600.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Pin sạc dự phòng 19.000 mAh Xmobile Gram 6S...
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/57/214975/pin-sac-du-phong-7500mah-ava-la-10k-1-ava-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/58/215781/cap-lightning-1m-xmobile-ltl-01-xanh-reu-1-1-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/58/200960/cap-micro-2m-xmobile-ltmp-2006-xanh-navy-1-fix1-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/58/218375/de-sac-khong-day-qi-10w-xmobile-ts-c106w-b-den-1-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/54/74185/tai-nghe-chup-tai-kanen-ip-2090-2-3-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/54/146880/tai-nghe-bluetooth-awei-a930bs-avatar-600x600.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2162/78540/loa-vi-tinh-enkor-f200-avatar-2-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2162/144572/loa-bluetooth-esaver-s12b-2-den-avatar-2-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2162/188089/loa-vi-tinh-21-enkor-e900-bac-1-1-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/2162/146461/loa-bluetooth-icutes-mb-m818-cun-avatar-2-600x600.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (12%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="tab-12">
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/192293/may-nuoc-nong-midea-dsk45p3-9-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/189320/may-nuoc-nong-ariston-an2-rs-15-8-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/197173/may-nuoc-nong-ferroli-verdi-20l-ae-1-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.790.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/88654/may-nuoc-nong-electrolux-ewe451gx-dwb-10-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                2.750.000₫
                                        </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/195411/may-nuoc-nong-ferroli-qq-evo-30l-me-9-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Nồi chiên không dầu Mishio MK-155 3,5L Đen
                                    </div>
                                    <div class="prod-price">1.190.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Online giảm <b>&#8198;10%</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1962/195399/may-nuoc-nong-ferroli-fs-45te-9-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                        <ul class="home-product">
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt-no-prod-deal">
                                        <img src="https://cdn.tgdd.vn/Products/Images/1942/162950/TimerThumb/40j5250d.png"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">

                                    </div>
                                    <div class="prod-name-no-prod-deal">
                                        TCL Android TV 40"
                                    </div>
                                    <div class="prod-price">5.990.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                            <span class="line-through">
                                                6.990.000₫
                                            </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">70 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-giat-samsung-ww90j54e0bw-sv-dd-300x300.jpg"/>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Samsung Inverter 9 Kg
                                    </div>
                                    <div class="prod-price">11.490.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                13.590.000₫
                                        </span>
                                        <label class="disc-perct"> (15%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.1</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">62 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/panasonic-nr-ba229pkvn-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png">
                                    </div>
                                    <div class="prod-name">
                                        Panasonic Inverter 188 lít <br>
                                        <span class="new-prod-label">Mới 2020</span>
                                    </div>
                                    <div class="prod-price">6.690.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        <span class="line-through">
                                                7.490.000₫
                                        </span>
                                        <label class="disc-perct"> (14%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>2.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">45 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/midea-ac120-16ar-13-300x300.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/online-giảm-sốc-1x.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Quạt điều hòa idea AC120-16AR
                                    </div>
                                    <div class="prod-price">1.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                           <span class="line-through">
                                                2.750.000₫
                                           </span>
                                        <label class="disc-perct"> (34%)</label>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>4.2</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">200 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                            <li class="product-info">
                                <a class="prod-link" href="#">
                                    <div class="prod-avt">
                                        <img src="images/may-lanh-beko-rsvc09vs-5-550x160.jpg"/>
                                        <label class="prod-mthd-payment">
                                            <!--                                            <span>-->
                                            Trả góp <b>0%</b>
                                            <!--                                            </span>-->
                                        </label>
                                    </div>
                                    <div class="prod-deal">
                                        <img src="images/giamsoc_optimized.png" alt="">
                                    </div>
                                    <div class="prod-name">
                                        Beko Inverter 1 HP
                                    </div>
                                    <div class="prod-price">7.790.000<sup>₫</sup></div>
                                    <div class="prod-promo">
                                        Quà <b>&#8198;800.000₫</b>
                                    </div>
                                    <div class="rating">
                                            <span class="rating-point">
                                                <b>3.9</b> /5 <i class="icon-dmx dmx-star"></i>
                                            </span>
                                        <span class="rate-amount">12 đánh giá</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <div class="paging">
            <a class="vmore" href="#more">
                Xem thêm 134 sản phẩm giá sốc <i class="fa fa-caret-down"></i>
            </a>
        </div>
        <section class="ads row">
            <img src="images/CHUYENTRANGKANG4-394x76.jpg">
            <img src="images/HERUCRO-06-394x76.jpg">
            <img src="images/HERUCRO-01-394x76.jpg">
        </section>
        <section class="hot-vids-area">
            <div class="section-title">
                Kinh nghiệm hay, mẹo vặt, nấu ăn
            </div>
            <div class="hot-vids-content row">
                <div class="col-sm-7">
                    <a class="hero-vid">
                        <div class="vid-img btn-play" data-youtube-url="https://www.youtube.com/embed/dR6Xrs7_zAc">
                            <img src="images/maxresdefault.jpg">
                        </div>
                        <div class="vid-title">
                            Top 10 máy lạnh bán chạy nhất Điện Máy XANH năm 2019
                        </div>
                    </a>
                </div>
                <div class="col-sm-5 other-vid pl-0">
                    <a class="row vid-item" title="Top 10 máy điều hòa bán chạy nhất Điện Máy XANH năm 2019">
                        <div class="col-sm-3 vid-img btn-play px-0"
                             data-youtube-url="https://www.youtube.com/embed/BQ3s5XjsJ7c">
                            <img src="images/hqdefault-e.jpg"
                                 alt="Top 10 máy điều hòa bán chạy nhất Điện Máy XANH năm 2019">
                        </div>
                        <div class="col-sm-9 vid-title">
                            Top 10 máy điều hòa bán chạy nhất Điện Máy XANH năm 2019
                        </div>

                    </a>
                    <a class="row vid-item" title="Chọn máy giặt bao nhiêu kg thì phù hợp với lượng quần áo gia đình?">
                        <div class="col-sm-3 vid-img btn-play px-0"
                             data-youtube-url="https://www.youtube.com/embed/BQ3s5XjsJ7c">
                            <img src="images/hqdefault%20-kg.jpg"
                                 alt="Chọn máy giặt bao nhiêu kg thì phù hợp với lượng quần áo gia đình?">
                        </div>
                        <div class="col-sm-9 vid-title">
                            Chọn máy giặt bao nhiêu kg thì phù hợp với lượng quần áo gia đình?
                        </div>

                    </a>
                    <a class="row vid-item">
                        <div class="col-sm-3 vid-img px-0">
                            <img src="https://cdn.tgdd.vn/Files/2020/07/11/1269841/top-10-may-say-quan-ao-ban-chay-nhat-6-thang-dau-n-1-665x320.jpg"
                                 alt="">
                        </div>
                        <div class="col-sm-9 vid-title">
                            Top 6 Máy sấy quần áo bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH
                        </div>

                    </a>
                    <a class="row vid-item"
                       title="Top 10 Máy giặt bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH">
                        <div class="col-sm-3 vid-img px-0">
                            <img src="https://cdn.tgdd.vn/Files/2020/07/11/1269741/top-10-may-giat-ban-chay-nhat-6-thang-dau-nam-2020-665x320.jpg"
                                 alt="Top 10 Máy giặt bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH">
                        </div>
                        <div class="col-sm-9 vid-title">
                            Top 10 Máy giặt bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH
                        </div>
                    </a>
                    <a class="row vid-item"
                       title="Top 10 quạt điều hòa bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH">
                        <div class="col-sm-3 vid-img px-0">
                            <img src="https://cdn.tgdd.vn/Files/2020/07/08/1268794/top-10-quat-dieu-hoa-ban-chay-nhat-6-thang-dau-nam-665x320.jpg"
                                 alt="Top 10 quạt điều hòa bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH">
                        </div>
                        <div class="col-sm-9 vid-title">
                            Top 10 quạt điều hòa bán chạy nhất 6 tháng đầu năm 2020 tại Điện Máy XANH
                        </div>
                    </a>
                </div>
            </div>
            <div class="vid-player-modal d-none">
                <div class="vid-player-body">
                    <i class="close-btn fas fa-times"></i>
                    <div class="vid-player"></div>
                </div>
            </div>
        </section>
        <div id="bot-ads">
            <img src="https://cdn.tgdd.vn/2019/12/banner/03-1200x140.jpg">
        </div>
        <div class="box-footer">
            <span>
                Tìm kiếm nhiều:
            </span>
            <a href="/ve-sinh-may-giat">Vệ sinh máy giặt</a>
            <a href="/ve-sinh-may-giat">Vệ sinh quạt</a>
            <a href="/ve-sinh-may-giat">• Máy bơm nước</a>
            <a href="/ve-sinh-may-giat">• Món ngon mỗi ngày</a>
            <a href="/ve-sinh-may-giat">• Tivi Sony</a>
            <a href="/ve-sinh-may-giat">• Tivi Samsung</a>
            <a href="/ve-sinh-may-giat">• Quạt điều hòa Boss</a>
            <a href="/ve-sinh-may-giat">• Tủ lạnh Mini</a> <br>
            <a href="/ve-sinh-may-giat">• Máy giặt mới 2020</a>
            <a href="/ve-sinh-may-giat">• Máy giặt Midea</a>
            <a href="/ve-sinh-may-giat">• Tư vấn Đồng hồ</a>
            <a href="/ve-sinh-may-giat">• Máy giặt LG</a>
            <a href="/ve-sinh-may-giat">• Máy lạnh mói 2020</a>
            <a href="/ve-sinh-may-giat">• Máy lạnh Electrolux</a>
            <a href="/ve-sinh-may-giat">• Máy lạnh LG</a>
            <a href="/ve-sinh-may-giat">• Máy rửa xe</a>
            <a href="/ve-sinh-may-giat">• Tư vấn thiết bị thông minh</a>
            <a href="/ve-sinh-may-giat">• Tư vấn Quạt điều hòa</a>
        </div>
    </main>
    <div id="onl-support">
        <div class="onl-supp">
            <a href="#">
                <img src="images/iconinvitechat_2.v201901000046.png">
            </a>
            <a href="/ho=tro-onl">
                 <span>Hỗ trợ <br>online
                 </span>
            </a>
        </div>
    </div>

    <button onclick="topFunction()" id="myTopBtn" title="Back to Top">
    ↑
    </button>

    <footer class="footer">
        <div class="container-fluid">
            <div class="row rowfoot1">
                <ul class="col">
                    <li><strong>Thông tin điện máy xanh</strong></li>
                    <li>
                        <a rel="nofollow" href="/he-thong-sieu-thi-dien-may" title="Hệ thống siêu thị">
                            Hệ thống 1054 siêu thị <small>(8:00 - 22:00)</small>
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/gioi-thieu" title="Giới thiệu công ty">
                            Giới thiệu công ty
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/vieclam.thegioididong.com" title="Tìm việc làm">
                            Tìm việc làm
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/lien-he" title="Liên hệ, góp ý">
                            Liên hệ, góp ý
                        </a>
                    </li>
                </ul>
                <ul class="col">
                    <li><strong>Hỗ trợ khách hàng</strong></li>
                    <li>
                        <a rel="nofollow" href="/tra-gop" title="Tìm hiểu về mua trả góp">
                            Tìm hiểu về mua trả góp
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/chinh-sach-giao-hang-lap-dat" title="Giao hàng, lắp đặt">
                            Giao hàng, lắp đặt
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/bao-hanh-doi-tra" title="Bảo hành, đổi trả">
                            Bảo hành, đổi trả
                        </a>
                    </li>
                    <li>
                        <a rel="nofollow" href="/ve-sinh-may-lanh" title="Dịch vụ vệ sinh máy lạnh, máy giặt, quạt">
                            DV vệ sinh máy lạnh, máy giặt, quạt
                        </a>
                    </li>
                </ul>
                <ul class="col col-after">
                    <li>
                        <strong>Tổng đài hỗ trợ (Gọi miễn phí)</strong>
                        <p>Mua hàng <a href="tel:18001061">1800.1061</a> (7:30 - 22:00)</p>
                        <p>Kỹ thuật <a href="tel:18001764">1800.1764</a> (7:30 - 22:00)</p>
                        <p>Bảo hành <a href="tel:18001065">1800.1065</a> (8:00 - 21:00)</p>
                        <p>Khiếu nại <a href="tel:18001063">1800.1063</a> (8:00 - 21:30)</p>
                        <a rel="nofollow" class="bct"
                           href="http://online.gov.vn/HomePage/CustomWebsiteDisplay.aspx?DocId=20790">
                            <i class="icon-bct"></i>
                        </a>
                        <a class="logo-chg" href="/dieu-khoan-su-dung#giai-quyet-khieu-nai">
                            <i class="icon-chg"></i>
                        </a>
                        <div id="DMCA-badge">
                            <a class="dmca-badge"
                               href="https://www.dmca.com/Protection/Status.aspx?ID=69bc7638-1181-4a0f-ab78-247bea1eab81&amp;refurl=https://www.dienmayxanh.com/"
                               title="DMCA.com Protection Status">
                                <img src="https://cdn.tgdd.vn/dmx2016/Content/images/dmca_protected_sml_120n.png"
                                     alt="DMCA.com Protection Status" style="display: inline; opacity: 1;">
                            </a>
                        </div>
                    </li>
                </ul>
                <ul class="col col-after">
                    <li>
                        <a class="linkfb" href="https://facebook.com/dienmayxanhcom">
                            <i class="icon-dmx icon-share1"></i>
                            1559.6k fan
                        </a>
                        <a class="linkyt" href="https://www.youtube.com/user/dienmaycom">
                            <i class="icon-dmx icon-share3"></i>
                            485k đăng ký
                        </a> <br>
                        <p style="display: inline-block">Website cùng tập đoàn:</p>
                        <a class="mwg-logo" href="https://www.maiamtgdd.vn/">
                            <i class="icon-dmx icon-logomaiam"></i>
                        </a>
                        <a class="mwg-logo" href="https://www.thegioididong.com">
                            <i class="icon-dmx icon-tgdd"></i>
                        </a>
                        <a href="https://www.bachhoaxanh.com/">
                            <i class="icon-dmx icon-bhx"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="rowfoot2">
            <p>
                © 2018. Công ty cổ phần Thế Giới Di Động. GPDKKD: 0303217354 do sở KH & ĐT TP.HCM cấp ngày 02/01/2007.
                GP số 57/GP-TTĐT do Sở TTTT TP HCM cấp ngày 30/07/2018 <br>
                Địa chỉ: 128 Trần Quang Khải, P. Tân Định, Quận 1, TP.Hồ Chí Minh. Điện thoại: (028)3812.59.60. Email:
                cskh@dienmayxanh.com.
                Chịu trách nhiệm nội dung: Trần Nhật Linh.
                <a href="/dieu-khoan-su-dung">Xem chính sách sử dụng web</a>
            </p>
        </div>
    </footer>

    <jsp:include page="../common/footer.jsp" />
    
    <script type="text/javascript" src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/js/base.js'/> "></script>
    <script type="text/javascript" src="<c:url value="/js/index.js"/> "></script>

</body>
</html>