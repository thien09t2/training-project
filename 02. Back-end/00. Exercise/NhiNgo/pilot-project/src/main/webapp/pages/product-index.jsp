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
			
		</div>
	</div>
	
	<!-- Modal to Add/Edit Product -->
	<div class="modal fade" id="productModifyModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form id="productInputForm" role="form" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            Product Form
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group d-none">
                            <label>Product ID</label>
                            <input type="text" class="form-control" id="productId" name="productId" placeholder="Enter Product ID" readonly>
                        </div>
                        <div class="form-group">
                            <label for="productName">Product Name <span class="required-mask">(*)</span></label>
                            <input type="text" class="form-control" id="productName" name="productName" placeholder="Enter Product Name" required>
                        </div>
                         <div class="form-group">
                            <label for="quantity">Quantity <span class="required-mask">(*)</span></label>
                            <input type="number" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity" step="1" required>
                        </div>
                         <div class="form-group">
                            <label for="price">Price <span class="required-mask">(*)</span></label>
                            <input type="number" class="form-control price-cell" id="price" name="price" placeholder="Price" step="1000" required>
                        </div>
                         <div class="form-group">
                            <label for="brandList">Brand Name <span class="required-mask">(*)</span></label>
                        	<select class="form-control" id="brandId"  name="brandEntity.brandId" required>
                        		<c:forEach items="${brandList}" var="brand">
                        			<option value="${brand.brandId}" class="form-select">${brand.brandName}</option>
                        		</c:forEach>
                            </select>
                        </div>
                         <div class="form-group">
                            <label for="saleDate">Sale Date <span class="required-mask">(*)</span></label>
                            <input type="date" class="form-control" id="saleDate" name="saleDate" 
                            value="2020-01-01" min="2018-01-01" required><span class="validity"></span>
                        </div>
                        <div class="form-group">
                            <label for="prodImg">Image <span class="required-mask">(*)</span></label>
                            <div class="preview-img-upload" id="prodImgThumb">
								<img src="<c:url value="/images/image-demo.png"/>" alt="product-image">
							</div>
							<input type="file" class="form-control upload-img" name="prodImgFiles" accept="image/*">
							<input type="hidden" class="old-img" id="prodImg" name="prodImg">
                        </div>
                        <div class="form-group">
                            <label for="prodDesct">Description</label>
							<textarea class="form-control" id="prodDesct" name="prodDesct" cols="30" rows="3" placeholder="Enter product description"></textarea>
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
    <footer class="container-fluid">
		<div class="container">
			<div class="row">
				<div class="float-left">
					<a class="btn add-btn" id="addProdLink"> Add Product </a>
				</div>
				<div class="float-right d-flex justify-content-center">
					<ul class="pagination">
						<!-- JS code -->
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<jsp:include page="../common/footer.jsp"/>
    
    <script type="text/javascript" src="<c:url value='/js/product.js'/> "></script>

</body>
</html>