<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<title>Product Management</title>
<jsp:include page="../common/head.jsp" />
<link rel="stylesheet" href="<c:url value='/css/product.css'/>">
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="container">
		<h3 class="text-center">Product Management</h3>
		<hr>
		<div class="container text-left">
			<a class="btn btn-success add-btn" id="addProductInfoModal"><i
					class="fas fa-plus-square"></i> Add Product</a>
		</div>
		<br>
		<table class="table table-bordered" id="productInfoTable">
			<thead>
				<tr class="text-center">
					<th scope="col">ID</th>
					<th scope="col">Product</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Brand Name</th>
					<th scope="col">Opening For Sale</th>
					<th scope="col">Image</th>
					<th scope="col">Actions</th>
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
	<!-- Modal Add and Edit Product -->
	<div class="modal fade" id="productInfoModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="productInfoForm" role="form" enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-title">Add Product</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group d-none">
							<label>Product ID</label> <input type="text" class="form-control"
								name="productId" id="productId" placeholder="Product ID" readonly>
						</div>
						<div class="form-group">
							<label for="productName">Product <span
								class="required-mask">(*)</span></label> <input type="text"
								class="form-control" id="productName" name="productName"
								placeholder="Product Name">
						</div>
						<div class="form-group">
							<label for="quantity">Quantity<span
								class="required-mask">(*)</span></label>
							<textarea name="quantity" id="quantity" cols="30" rows="3"
								class="form-control" placeholder="Quantity"></textarea>
						</div>
						<div class="form-group">
							<label for="price">Price<span
								class="required-mask">(*)</span></label>
							<textarea name="price" id="price" cols="30" rows="3"
								class="form-control" placeholder="Price"></textarea>
						</div>
						<div class="form-group">
							<label for="brandName">Brand Name<span
								class="required-mask">(*)</span></label>
							<textarea name="brandName" id="brandName" cols="30" rows="3"
								class="form-control" placeholder="Brand Name"></textarea>
						</div>
						<div class="form-group">
							<label for="saleDate">Opening For Sale<span
								class="required-mask">(*)</span></label>
							<input type="text" id="datepicker"/>
						</div>
						<div class="form-group" id="image">
							<label for="image">Image <span class="required-mask">(*)</span></label>
							<div class="preview-image-upload" id="productImg">
								<img src="<c:url value='/images/image-demo.png'/>" alt="image">
							</div>
							<input type="file" class="form-control upload-image"
								name="imageFiles" accept="image/*" /> <input type="hidden"
								class="old-img" id="logo" name="image">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary" id="saveProductBtn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal Confirm Deleting Product -->
	<div class="modal fade" id="confirmDeleteModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete Product</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						Do you want to delete <b id="deletedProductName"></b>?
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary" id="deleteSubmitBtn">Save</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
	<script src="<c:url value='/plugins/jquery/jquery-ui.min.js'/>"></script>
	<script src="<c:url value='/js/product.js'/>"></script>
</body>
</html>