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
		<div class="add-product form-group">
			<a class="btn  add-btn float-right"
				id="addProductInfoModal"><i class="fas fa-plus-square"></i> Add Product</a>
		</div>
		<!-- Search Product -->
		<div class="search-product form-group">
			<div class="search-product__name">
				<input type="text" class="form-control search-product" placeholder="Search by product name, brand name..." id="keyword">
			</div>
			<div class="search-product__price">
				<label class="price-labe price-labe-from" for="priceFrom">Price From </label>
				<select class="price priceFrom form-control" name="priceForm"  id="priceFrom">
					<option value="0">0</option>
					<option value="1000000">1.000.000</option>
					<option value="2000000">2.000.000</option>
					<option value="3000000">3.000.000</option>
					<option value="4000000">4.000.000</option>
				</select>
				<label class="price-labe" for="toPrice">Price To </label>
				<select class="price toPrice form-control" name="priceTo" id="priceTo">
					<option value="0">-- Price Selection --</option>
					<option value="1000000">1.000.000</option>
					<option value="2000000">2.000.000</option>
					<option value="4000000">4.000.000</option>
					<option value="8000000">8.000.000</option>
					<option value="10000000">10.000.000</option>
					<option value="20000000">20.000.000</option>
					<option value="100000000000000">The highest price</option>
				</select>
				<button type="submit" id="searchByPrice" class="btn btn-success search-btn">Search</button>
				<a class="reset-page btn btn-secondary" id="restPage" href="/product" >Reset</a>
			</div>
		</div>		
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
			<ul class="pagination"></ul>
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
								name="productId" id="productId" placeholder="Product ID"
								readonly>
						</div>
						<div class="form-group">
							<label for="productName">Product <span
								class="required-mask">(*)</span></label> <input type="text"
								class="form-control" id="productName" name="productName"
								placeholder="Product Name">
						</div>
						<div class="form-group">
							<label for="quantity">Quantity<span class="required-mask">(*)</span></label>
							<textarea name="quantity" id="quantity" cols="30" rows="3"
								class="form-control" placeholder="Quantity"></textarea>
						</div>
						<div class="form-group">
							<label for="price">Price<span class="required-mask">(*)</span></label>
							<textarea name="price" id="price" cols="30" rows="3"
								class="form-control" placeholder="Price"></textarea>
						</div>
						<div class="form-group">
							<label for="brandName">Brand Name</label> <select
								class="form-control" id="brandId" name="brandEntity.brandId">
								<c:forEach items="${listbrand}" var="brand">
									<option value="${brand.brandId}">${brand.brandName}</option>
								</c:forEach>
							</select>
						</div>					
						<div class="form-group">
							<label for="saleDate">Open For Sale <span
								class="required-mask">(*)</span></label> <input type=date
								name="saleDate" id="saleDate" class="form-control"
								placeholder="Open for sale">
						</div>
						<div class="form-group" >
							<label for="image">Image <span class="required-mask">(*)</span></label>
							<div class="preview-image-upload" id="productImg">
								<img src="<c:url value='/images/image-demo.png'/>" alt="image">
							</div>
							<input type="file" class="form-control upload-image"
								name="imageFiles" accept="image/*" /> 
							<input type="hidden" class="old-img" id="image" name="image">
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
	<script src="<c:url value='/js/product.js'/>"></script>
</body>
</html>