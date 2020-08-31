<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/product.css'/>">
</head>
<body>
	<div class="container">
		<div class="sub-header">
			<div class="float-left sub-title">Add new product</div>
		</div>
		<div class="w-50 mx-auto">
			<c:if test="${not empty errorMessage }">
				<div class="message-area">
					<div class="error-message-invalid">${errorMessage}</div>
				</div>
			</c:if>
			<form action="/product/add" id="productInfoForm" role="form" enctype="multipart/form-data" method="POST">
				<div></div>
			</form>
		</div>
	</div>
</body>
</html>