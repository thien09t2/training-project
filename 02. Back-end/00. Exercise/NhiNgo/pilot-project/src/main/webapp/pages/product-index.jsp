<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<title>Product Management</title>
    <jsp:include page="../common/head.jsp"/>

    <link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/base.css'/> ">
    <link rel="stylesheet" href="<c:url value='/css/product.css'/> ">
</head>
<body>

    <div class="container">
        <div class="sub-header">
            <div class="float-left sub-title">Product Management</div>
            <div class="float-right">
                <a class="btn btn-success add-btn" href="/product/add">
                    <i class="fas fa-plus-square"></i> Add Product
                </a>
            </div>
        </div>

        <table class="table table-bordered" id="productInfoTable">
            <thead>
                <tr>
                    <th scope="col">Product ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Price</th>
                    <th scope="col">Brand ID</th>
                    <th scope="col">Sale Date</th>
                    <th scope="col">Image</th>
                    <th scope="col">Description</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${prodList}">
                    <tr>
                        <td>${product.prodID}</td>
                        <td>${product.prodName}</td>
                        <td>${product.prodQuantity}</td>
                        <td>${product.price}</td>
                        <td>${product.brandID}</td>
                        <td>${product.saleDate}</td>
                        <td class="text-center"><img src="${product.prodImg}"></td>
                        <td>${product.prodDesc}</td>
                        <td class="action-btns" data-id="${product.prodID}">
                            <a class="edit-btn" href="/product/product?prodID=${product.prodID}"><i class="fas fa-edit"></i></a> |
                            <a class="delete-btn" href="/product/product?prodID=${product.prodID}"><i class="fas fa-trash-alt"></i></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

	<jsp:include page="../common/footer.jsp"/>
    
    <script type="text/javascript" src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/js/base.js'/> "></script>
    <script type="text/javascript" src="<c:url value='/js/product.js'/> "></script>

</body>
</html>