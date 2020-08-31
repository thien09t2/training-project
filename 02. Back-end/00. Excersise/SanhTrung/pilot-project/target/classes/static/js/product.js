$(document).ready(function() {
	findAllProducts(1);
	/* Move pagination*/
	$('.pagination').on('click', '.page-link', function() {
		var pageNumber = $(this).attr("data-index");
		findAllProducts(pageNumber);
	});

	var $productInfoForm = $('#productInfoForm');
	var $productInfoModal = $('#productInfoModal');

	/*Show form add new product*/
	$("#addProductInfoModal").on('click', function() {
		resetFormModal($productInfoForm);
		showModalWithCustomizedTitle($productInfoModal, "Add new product");
		$('#logoImg img').attr('src', '/images/image-demo.png');
		$('#productId').closest(".form-group").addClass("d-none");
	});
	/*Submit add new product*/
	/*jQuery.validator.setDefaults({
		debug: true,
		success: "valid"
	});*/
	/*Show form update modal*/
	$("#productInfoTable").on('click', '.edit-btn', function() {
		$("#productImage .required-field").addClass("d-none");
		$.ajax({
			url: "/product/api/find?id=" + $(this).data("id"),
			type: 'GET',
			dateType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				if (responseData.responseCode == 100) {
					var productInfo = responseData.data;
					resetFormModal($productInfoForm);
					showModalWithCustomizedTitle($productInfoModal, "Edit product");

					$('#productId').val(productInfo.productId);
					$('#productName').val(productInfo.productName);
					$('#quantity').val(productInfo.quantity);
					$('#price').val(productInfo.price);
					$('#BrandName').val(productInfo.BrandName);
					$('#saleDate').val(productInfo.saleDate);
					$('#description').val(productInfo.description);

					var productImage = productInfo.image;
					if (productImage == null || productImage == "") {
						productImage = "/images/image-demo.png";
					}
					$("#logoImg img").attr("src", productImage);
					$("#image").val(productImage);
					$('#productId').closest(".form-group").removeClass("d-none");
				}
			}
		})
	});
	/*Submit add new product*/
	$("#saveProductBtn").on('click', function(event) {
		event.preventDefault();
		var formData = new FormData($productInfoForm[0]);
		var productId = formData.get("productId");
		var brandId = $('#brandId').val();
		var isAddAction = productId == undefined || productId == "";
		
		$productInfoForm.validate({
			ignore: [],
			rules: {
				productName: {
					required: true,
					minlength: 2,
					maxlength: 100
				},
				quantity: {
					required: true,
					number: true
				},
				price: {
					required: true,
					number: true,
				},
				brandName: {
					required: true
				},
				saleDate: {
					required: true
				},
				logoFiles: {
					required: isAddAction,
				}
			},
			messages: {
				productName: {
					required: "Product name is required",
					minlength: "Your product name must consist of at least 2 characters",
					maxlength: "Your product name must less than 100 characters"
				},
				quantity: {
					required: "Quantity is required",
					number: "Quantity is number"
				},
				price: {
					required: "Price is required",
					number: "Price is number"
				},
				brandName: {
					required: "Brand is required",
				},
				saleDate: {
					required: "Opening for date is required"
				},
				logoFiles: {
					required: "Image is required"
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		//nhìn  thì đúng mà lại k chạy :v :v mấy đoạn ni copy qua luôn à e cos go lai a ma e do ky lam , a thu cop bo qy
	if ($productInfoForm.valid()) {

			// POST data to server-side by AJAX
			$.ajax({
				url: "/product/api/" + (isAddAction ? "add" : "update")+"/"+brandId,
				type: 'POST',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				cache: false,
				timeout: 10000,
				data: formData,
				success: function(responseData) {

					//hiển thị thông báo lúc chỉnh sửa thành công hoặc báo lỗi
					if (responseData.responseCode == 100) {
						$productInfoModal.modal('hide');
						findProductList(1)			
						showNotification(true, responseData.responseMsg);
					} else {
						showMsgOnField($productInfoForm.find("#productName"), responseData.responseMsg);
					}
				}
			});
		}
	})
});
/*Show modal confirm delete product*/
	$("#productInfoTable").on('click', '.delete-btn', function() {
		$("#deletedproductName").text($(this).data("name"));
		$("#deleteSubmitBtn").attr("data-id", $(this).data("id"));
		$('#confirmDeleteModal').modal('show');
	});
	/*Submit form deleted product*/
	$("#deleteSubmitBtn").on('click', function() {
		$.ajax({
			url: "/product/api/delete/" + $(this).attr("data-id"),
			type: 'DELETE',
			dataType: 'json',
			contentType: 'application/json',
			success: function(responseData) {
				$('#confirmDeleteModal').modal('hide');
				showNotification(responseData.responseCode == 100, responseData.responseMsg);
				findAllProducts(1);
			}
		});
	});

/*
	List products with a page
	@param pageNumber
*/
function findAllProducts(pageNumber) {
	$.ajax({
		url: "/product/api/findAll/" + pageNumber,
		type: 'GET',
		dataType: 'json',
		contentType: 'application/json',
		success: function(responseData) {
			if (responseData.responseCode == 100) {
				renderProductsTable(responseData.data.productsList);
				renderPagination(responseData.data.paginationList);
			}
		}
	});
}
/* Render jsp for product table*/
function renderProductsTable(productsList) {

	var rowHtml = "";
	$("#productInfoTable tbody").empty();
	$.each(productsList, function(key, value) {
		rowHtml = "<tr class='text-center'>"
			+ "<td>" + value.productId + "</td>"
			+ "<td>" + value.productName + "</td>"
			+ "<td>" + value.quantity + "</td>"
			+ "<td>" + value.price + "</td>"
			+ "<td>" + value.brandEntity.brandName + "</td>"
			+ "<td>" + value.saleDate + "</td>"
			+ "<td>" + value.description + "</td>"
			+ "<td class='text-center'><a href='" + value.image + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='" + value.image + "'></td>"
			+ "<td class='action-btns'>"
			+ "<a class='edit-btn' data-id='" + value.productId + "'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" + value.productName + "' data-id='" + value.productId + "'><i class='fas fa-trash-alt'></i></a>"
			+ "</td>"
		"</tr>";
		$("#productInfoTable tbody").append(rowHtml);
	})
}
/*Pagination*/
/*Pagination*/
function renderPagination(paginationList) {

	var paginationInnerHtml = "";
	if (paginationList.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.firstPage + '" > Fisrt  </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.prevPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.prevPage + '" > Previous </a></li>'
		$.each(paginationList.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (value == paginationList.currentPage ? 'active' : '') + '" href="javascript:void(0)" data-index="' + value + '">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.nextPage + '" > Next </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationList.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="' + paginationList.lastPage + '" > Last </a></li>'
		$("ul.pagination").append(paginationInnerHtml);

	}
}

