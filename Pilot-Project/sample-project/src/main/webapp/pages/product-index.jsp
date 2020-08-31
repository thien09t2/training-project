<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Brand Management</title>
<jsp:include page="../common/head.jsp" />
<link rel="stylesheet" href="<c:url value='/css/brand.css'/>">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container">
		<div class="sub-header">
			<div class="float-left sub-title">Product Management</div>
			<div class="float-right"><a class="btn btn-success add-btn" id="addProductInfoModal"><i class="fas fa-plus-square"></i> Add Product</a></div>
		</div>
		<table class="table table-bordered" id="productInfoTable">
			<thead>
				<tr class="text-center">
					<th scope="col">Product ID</th>
					<th scope="col">Product Name</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Brand Name</th>
					<th scope="col">Open for sale</th>
					<th scope="col">Image</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div class="d-flex justify-content-center">
			<ul class="pagination">
			</ul>
		</div>
	</div>
	<!-- Modal Add and Edit Brand -->
	<div class="modal fade" id="productInfoModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="productInfoForm" role="form" enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-title">Add Brand</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
						<div class="form-group d-none">
							<label>Product ID</label>
							<input type="text" class="form-control" name="productId" id="productId" placeholder="Product ID" readonly>
						</div>
						<div class="form-group">
							<label for="productName">Product Name</label>
							<input type="text" class="form-control" id="productName" name="productName" placeholder="Product Name">
						</div>
						<div class="form-group">
							<label for="price">Price</label>
							<input name="price" id="price" class="form-control" placeholder="Price">
						</div>
						<div class="form-group">
							<label for="quantity">Quantity</label>
							<input name="quantity" id="quantity" class="form-control" placeholder="Quantity">
						</div>
						<div class="form-group">
							<label for="brandId">Brand Name</label>
							<select  class="form-control" id="brandId" name ="brandId">
								<c:forEach items="${listBrand}" var="brand">
									<option value="${brand.brandId}">${brand.brandName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="openForSale">Open for sale</label>
							<input type=date name="saleDate" id="saleDate" class="form-control" placeholder="Open for sale">
						</div>
						<div class="form-group">
							<label for="description">Description</label>
							<textarea name="description" id="description" cols="30" rows="3" class="form-control" placeholder="Description"></textarea>
						</div>
						 <div class="form-group">
							<label for="img">Images</label>
							<div class="preview-image-upload" id="logoImg">
								<img src="<c:url value='/images/image-demo.png'/>" alt="image">
							</div>
							<input type="file" class="form-control upload-image" name="productImage" accept="image/*" />
							<!-- <input type="hidden" class="old-img" id="logo" name="logo"> -->
						</div>
						
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary" id="saveProductBtn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal Confirm Deleting Brand -->
	<div class="modal fade" id="confirmDeleteModal" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Brand</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Do you want to delete <b id="deletedProductName"></b>?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="deleteSubmitBtn">Save</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script src="<c:url value='/js/product.js'/>"></script>
</body>
</html>