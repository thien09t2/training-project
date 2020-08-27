<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
	
<title>Brand Management</title>
    <jsp:include page="../common/head.jsp"/>

    <link rel="stylesheet" href="<c:url value='/css/brand.css'/> ">
</head>
<body>
 	<jsp:include page="../common/header.jsp"/>
 
 	<div class="container-fluid">
 		<div class="container wrapper">
			<div class="sub-header">
				<div class="float-left sub-title">Brand Management</div>
				<div class="float-right">
					<a class="btn btn-success add-btn" id="addBrandLink">
						<i class="fas fa-plus-square"></i> Add Brand
					</a>
				</div>
			</div>
			<table class="table table-bordered" id="brandDetailsTable">
				<thead>
					<tr class="text-center">
						<th scope="col"  width="6%">ID</th>
						<th scope="col"  width="20%">Name</th>
						<th scope="col">Logo</th>
						<th scope="col" width="40%">Description</th>
						<th scope="col" width="10%"></th>
					</tr>
				</thead>
				<tbody>
					<!-- JS code -->
				</tbody>
			</table>

			<div class="d-flex justify-content-center">
				<ul class="pagination">
					<!-- JS code -->
				</ul>
			</div>
		</div>
 	</div>
 	
 	<!-- Modal to Add/Edit Brand -->
    <div class="modal fade" id="brandModifyModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form id="brandInfoForm" role="form" enctype="multipart/form-data">
                    <div class="modal-header">
                        <h5 class="modal-title">
                            Add Brand Form
                        </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group d-none">
                            <label>Brand ID</label>
                            <input type="text" class="form-control" id="brandID" name="brandID" placeholder="Enter Brand ID" readonly>
                        </div>
                        <div class="form-group">
                            <label for="brandName">Brand Name <span class="required-mask">(*)</span></label>
                            <input type="text" class="form-control" id="brandName" name="brandName" placeholder="Enter Brand Name" required>
                        </div>
                        <div class="form-group">
                            <label for="logo">Logo <span class="required-mask">(*)</span></label>
                            <div class="preview-img-upload" id="logoImg">
								<img src="<c:url value="/images/image-demo.png"/>" alt="logo-image">
							</div>
							<input type="file" class="form-control upload-img" name="logoFiles" accept="image/*">
							<input type="hidden" class="old-img" id="logo" name="logo">
                        </div>
                        <div class="form-group">
                            <label for="description">Description</label>
							<textarea class="form-control" id="description" name="description" cols="30" rows="3" placeholder="Enter description"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary" id="brandSaveBtn">Submit</button>
					</div>
                </form>
            </div>
        </div>
    </div> 	
 	
 	<!-- Modal to Confirm Deleting Brand -->
    <div class="modal fade" id="confirmDeleteModal">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Are you sure ?</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Do you really want to delete brand <b id="brandToBeDeleted"></b>? <br>
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
	
	<script src="<c:url value='/js/brand.js'/>"></script>
    
</body>
</html>