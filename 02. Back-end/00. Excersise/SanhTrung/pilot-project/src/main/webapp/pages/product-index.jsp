<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="<c:url value='/plugins/bootstrap/css/bootstrap.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.css'/>">
<link rel="stylesheet" href="<c:url value='/plugins/font-awesome/css/all.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/base.css'/>">
<link rel="stylesheet" href="<c:url value='/css/product.css'/>">
</head>
<body>
	<div class="container">
		<div class="sub-header">
			<div class="float-left sub-title">Product Management</div>
			<div class="float-right"><a class="btn btn-success add-btn" id="addProductInfoModal"><i class="fas fa-plus-square">Add new product</i></a></div>
		</div>
		<table class="table table-bordered" id="productInfoTable">
			<thead>
				<tr class="text-center">
					<th scope="col">STT</th>
					<th scope="col">Product</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Brand</th>
					<th scope="col">Opening for sale</th>
					<th scope="col">Description</th>
					<th scope="col">Image</th>
					<th scope="col">Actions</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
		<div class="d-flex justify-content-center">
			<ul class="pagination"></ul>
		</div>
	</div>
	<!-- Modal form add new product and Edit product -->
	<div class="modal fade" id="productInfoModal">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<form id="productInfoForm" role="form" enctype="multipart/form-data">
					<div class="modal-header">
						<h5 class="modal-titel">Add new product</h5>
						<button type="button" class="close" data-dismiss="modal" aria-lable>
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group d-none">
							<label for="productId">Product ID</label>
							<input type="text" class="form-control" name="productId" id="productId" placeholder="Product ID" readonly="readonly">
						</div>
						<div class="form-group">
							<label for="productName">Product name <span class="required-field">(*)</span></label>
							<input type="text" class="form-control" name="productName" id="productName" placeholder="Product name">
						</div>
						<div class="form-group">
							<label for="quantity">Quantity <span class="required-field">(*)</span></label>
							<input type="text" class="form-control" name="quantity" id="quantity" placeholder="Quantity">
						</div>
						<div class="form-group">
							<label for="price">Price <span class="required-field">(*)</span></label>
							<input type="text" class="form-control" name="price" id="price" placeholder="Price">
						</div>
						<!-- Brand name -->
						<div class="form-group">
							<label for="brandId">Brand Name</label>
							<select  class="form-control" id="brandId" name ="brandId">
								<c:forEach items="${listBrand}" var="brand">
									<option value="${brand.brandId}">${brand.brandName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="saleDate">Opening for sale <span class="required-field">(*)</span></label>
							<input type="date" class="form-control" name="saleDate" id="saleDate" placeholder="Opening for sale">
						</div>
						<div class="form-group" id="productImage">
							<label for="image">Image <span class="required-field">(*)</span></label>
							<div class="preview-image-upload" id="logoImg">
								<img src="<c:url value='/images/image-demo.png'/>" alt="image">
							</div>
							<input type="file" class="form-control upload-image" name="logoFiles" accept="image/*" />
							<input type="hidden" class="old-img" id="image" name="image">
						</div>
						<div class="form-group">
							<label for="description">Description </label>
							<input type="text" class="form-control" name="description" id="description" placeholder="Description">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="saveProductBtn">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal confirm deleting product -->
	<div class="modal fade" id="confirmDeleteModal" >
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Delete product</h5>
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


<script src="<c:url value='/plugins/jquery/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/plugins/jquery/jquery.validate.min.js'/>"></script>
<%-- <script src="<c:url value='https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js'/>"></script>
 --%>
 <script src="<c:url value='/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/plugins/bootstrap/js/bootstrap-notify.min.js'/>"></script>
<script src="<c:url value='/plugins/ekko-lightbox/ekko-lightbox.min.js'/>"></script>
<script src="<c:url value='/js/base.js'/>"></script>
<script src="<c:url value='/js/product.js'/>"></script>
</body>
</html>