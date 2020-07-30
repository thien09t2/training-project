<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Hello World</title>
<jsp:include page="../common/head.jsp" />
<link rel="stylesheet" href="<c:url value='/css/brand.css'/>">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<div class="container">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Name</th>
					<th scope="col">Logo</th>
					<th scope="col">Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="brand" items="${brandsList}">
					<tr>
						<td>${brand.brandId}</td>
						<td>${brand.brandName}</td>
						<td><img src="${brand.logo}"></td>
						<td>${brand.description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>