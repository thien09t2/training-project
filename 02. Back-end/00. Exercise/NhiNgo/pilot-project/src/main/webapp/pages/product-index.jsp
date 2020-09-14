<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<title>Product Management</title>
    <jsp:include page="../common/head.jsp"/>

    <link rel="stylesheet" href="<c:url value='/css/product.css'/> ">
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

    <div class="container-fluid">
		<div class="container wrapper">
			<div class="sub-header">
				<div class="float-left sub-title">Product Management</div>
				<div class="float-right">
					<a class="btn add-btn" id="addProdLink"> Add Product </a>
				</div>
			</div>
			<div class="search-bar product-search">
				<form class="form-inline align-items-center prodSearchForm">
					<div class="form-group">
						<span class="clearable">
							<input type="text" class="form-control" id="keyword" name="keyword" placeholder="Product Name, Brand Name" /> 
							<i class="clearable__clear">&times;</i>
						</span>
					</div>	
					<div class="form-group">
						<label for="prcFromKeyWd">Price from: </label>
						<select class="form-control" id="priceFrom" name="priceFrom">
							<option value="" class="form-select">Choose a value ...</option>
							<option value="3000000" class="form-select">3,000,000 VND</option>
							<option value="5000000" class="form-select">5,000,000 VND</option> 
							<option value="8000000" class="form-select">8,000,000 VND</option>
							<option value="10000000" class="form-select">10,000,000 VND</option>
							<option value="15000000" class="form-select">15,000,000 VND</option>
						</select>
						<!-- <input type="number" id="otherFrom" class="form-control" placeholder="Type a value ..."/> -->
					</div>
					<div class="form-group">
						<label for="prcToKeyWd">Price to: </label>
						<select class="form-control" id="priceTo" name="priceTo">
							<option value="" class="form-select">Choose a value ...</option>
							<option value="8000000" class="form-select">8,000,000 VND</option>
							<option value="10000000" class="form-select">10,000,000 VND</option>
							<option value="15000000" class="form-select">15,000,000 VND</option>
							<option value="20000000" class="form-select">20,000,000 VND</option>
							<option value="30000000" class="form-select">30,000,000 VND</option> 
							<!-- <option value="other" class="form-select">Other</option>  -->
							<!-- <option value="otherTo" class="form-select" hidden>Type a value ...</option>  -->
						</select>
					</div> 
					<button type="button" id="prodSearchBtn" class="btn btn-primary">Search</button>
					<button type="reset" id="resetSearchProd" class="btn btn-secondary">Reset</button>
				</form>
			</div>

			<table class="table table-bordered" id="productDetailTable">
				<thead>
					<tr class="text-center">
						<th scope="col" width="5%">ID</th>
						<th scope="col">Name</th>
						<th scope="col" width="8%">Quantity</th>
						<th scope="col" width="9%">Price</th>
						<th scope="col">Brand Name</th>
						<th scope="col" width="10%">Sale Date</th>
						<th scope="col" width="12%">Image</th>
						<th scope="col">Description</th>
						<th scope="col" width="6.5%"></th>
					</tr>
				</thead>
				<tbody>
					<!-- rendered by JS -->
				</tbody>
			</table>

			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<!-- JS code -->
				</ul>
			</div>
		</div>
	</div>
	
	<!-- Modal to Add/Edit Product -->
	<div class="modal fade" id="productModifyModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form id="productInputForm" role="form" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h6 class="modal-title">
                            Product Form
                        </h6>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-inline d-none">
                            <label>Product ID</label>
                            <input type="text" class="form-control col-8" id="productId" name="productId" placeholder="Enter Product ID" readonly>
                        </div>
                        <div class="form-group form-inline">
                            <label for="productName">Product Name <span class="required-mask">(*)</span></label>
                            <input type="text" class="form-control col-8" id="productName" name="productName" placeholder="Enter Product Name" required>
                        </div>
                         <div class="form-group form-inline">
                            <label for="quantity">Quantity <span class="required-mask">(*)</span></label>
                            <input type="number" class="form-control col-8" id="quantity" name="quantity" placeholder="Enter Quantity" step="1" required>
                        </div>
                         <div class="form-group form-inline">
                            <label for="price">Price <span class="required-mask">(*)</span></label>
                            <input type="number" class="form-control price-cell col-8" id="price" name="price" placeholder="Price" step="1000" required>
                        </div>
                         <div class="form-group form-inline">
                            <label for="brandList">Brand Name <span class="required-mask">(*)</span></label>
                        	<select class="form-control col-8" id="brandId"  name="brandEntity.brandId" required>
                        		<option value="" selected disabled class="form-select">Choose a brand ... </option>
                        		<c:forEach items="${brandList}" var="brand">
                        			<option value="${brand.brandId}" class="form-select">${brand.brandName}</option>
                        		</c:forEach>
                            </select>
                        </div>
                         <div class="form-group form-inline">
                            <label for="saleDate">Sale Date <span class="required-mask">(*)</span></label>
                            <input type="date" class="form-control col-8" id="saleDate" name="saleDate" 
                            value="2020-01-01" min="2018-01-01" required>
                        </div>
                        <div class="form-group form-inline">
                            <label for="prodImg">Image <span class="required-mask">(*)</span></label>
                            <div class="preview-img-upload" id="prodImgThumb">
								<img src="<c:url value="/images/image-demo.png"/>" alt="product-image">
							</div>
							<input type="file" class="form-control upload-img col-8" name="prodImgFiles" accept="image/*">
							<input type="hidden" class="old-img" id="prodImg" name="prodImg">
                        </div>
                        <div class="form-group form-inline">
                            <label for="prodDesct">Description</label>
							<textarea class="form-control col-8" id="prodDesct" name="prodDesct" cols="30" rows="2" placeholder="Enter product description"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="productSaveBtn">Submit</button>
					</div>
                </form>
            </div>
        </div>
    </div> 	
    
    <!-- Modal to Confirm Deleting Product -->
    <div class="modal fade" id="confirmDeleteModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header bg-danger">
                    <h5 class="modal-title">Are You Sure ?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Do you really want to delete product <b id="productToBeDeleted"></b>? <br>
                    This process can not be undone.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-warning" id="delSubmmitBtn">Confirm</button>
                </div>
            </div>    
        </div>
    </div>

	<jsp:include page="../common/footer.jsp"/>
    
    <script type="text/javascript" src="<c:url value='/js/product.js'/> "></script>

</body>
</html>