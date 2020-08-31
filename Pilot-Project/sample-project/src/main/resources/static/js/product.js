$(document).ready(function() {
	findProductList(1)
	
	//form add product
	var $productInfoForm = $('#productInfoForm');
	var $productInfoModal = $('#productInfoModal');


	// show form add brand with js
	$('#addProductInfoModal').on('click', function() {
//		$brandInfoModal.modal("show");
		resetFormModal($productInfoForm);
		showModalWithCustomizedTitle($productInfoModal, "Add Product");
		$('#logoImg img').attr('src', '/images/image-demo.png');
		$('#productId').closest(".form-group").addClass("d-none");
	});
	
	//xu ly form add
	$("#productInfoTable").on('click', '.edit-btn', function() {

		// tìm brand by id
		$.ajax({
			url : "/product/api/find?id=" + $(this).data("id"),
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(responseData) {
				if (responseData.responseCode == 100) {
					var productInfo = responseData.data;
					resetFormModal($productInfoForm);
					showModalWithCustomizedTitle($productInfoModal , "Edit Product");
					
					$('#productId').val(productInfo.productId);
					$('#productName').val(productInfo.productName);
					$('#price').val(productInfo.price);
					$('#quantity').val(productInfo.quantity);
					$('#brandName').val(productInfo.brandEntity.brandName);
					$('#openForSale').val(productInfo.saleDate);
					$('#description').val(productInfo.description);
					
					//nếu logo = null hoặc rỗng thì tự set thành logo mặc định
					var productLogo = productInfo.image;
					if (productLogo == null || productLogo == "") {
						productLogo = "/images/image-demo.png";
					}
					$("#logoImg img").attr("src", productLogo);
					$("#logo").val(productLogo);
					$('#productdId').closest(".form-group").removeClass("d-none");
				}
			}
		});
	});
	
	// hiển thị popup delete
	$("#productInfoTable").on('click', '.delete-btn', function() {
		$("#deletedProductName").text($(this).data("name"));
		$("#deleteSubmitBtn").attr("data-id", $(this).data("id"));
		$('#confirmDeleteModal').modal('show');
	});
	
	// Submit delete brand
	//sau khi hiển thị popup delete - nó sẽ truyền xuống 1 id và thông qua ajax để gọi hàm xử lý 
	$("#deleteSubmitBtn").on('click' , function() {
		$.ajax({
			url : "/product/api/delete/" + $(this).attr("data-id"),
			type : 'DELETE',
			dataType : 'json',
			contentType : 'application/json',
			success : function(responseData) {
				$('#confirmDeleteModal').modal('hide');
				showNotification(responseData.responseCode == 100, responseData.responseMsg);
				findProductList(1)
			}
		});
	});
	
	//validate FE + xử lý thông tin add || update
	$('#saveProductBtn').on('click', function (event) {

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
					maxlength: 100
				},
				logoFiles: {
					required: isAddAction,
				},
				price: {
					number: true
				}
			},
			messages: {
				brandName: {
					required: "Please input Product Name",
					maxlength: "The Product Name must be less than 100 characters",
				},
				logoFiles: {
					required: "Please upload Product Image",
				},
				price: {
					number:"Enter the number for the price"
				}
			},
			//nếu lỗi xảy ra nó sẽ thêm vào class errorClass vào và hiển thị lên
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		
		//khi tất cả các đk hợp lệ nó sẽ tiến hành post data vào sever bằng ajax
		//2
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
	});

});

function findProductList(pageNumber) {
	$.ajax({
		url : "/product/api/findAll/"  + pageNumber,
		type : 'GET',
		dataType : 'json',
		contentType : 'application/json',
		success : function(responseData) {
			if (responseData.responseCode == 100) {
				renderProductTable(responseData.data.productList);
				renderPagination(responseData.data.paginationInfo);
			}
		}
	});
}

function renderProductTable(productList) {

	var rowHtml = "";
	$("#productInfoTable tbody").empty();
	$.each(productList, function(key, value) {
		rowHtml = "<tr>"
			+		"<td>" + value.productId + "</td>"
			+		"<td>" + value.productName + "</td>"
			+		"<td>" + value.quantity + "</td>"
			+		"<td>" + value.price + "</td>"
			+		"<td>" + value.brandEntity.brandName+ "</td>"
			+		"<td>" + value.saleDate + "</td>"
			+		"<td class='text-center'><a href='" + value.image + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='" + value.logo + "'></td>"
			+		"<td class='action-btns'>"
			+			"<a class='edit-btn' data-id='" + value.productId + "'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" + value.productName + "' data-id='" + value.productId + "'><i class='fas fa-trash-alt'></i></a>"
			+		"</td>"
			+	"</tr>";
		$("#productInfoTable tbody").append(rowHtml);
	});
}
function renderPagination(paginationInfo) {

	var paginationInnerHtml = "";
	if (paginationInfo.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.firstPage + '">Trang Đầu</a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.previousPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.previousPage + '"> < </a></li>'
		$.each(paginationInfo.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link '+ (value == paginationInfo.currentPage ? 'active' : '') +'" href="javascript:void(0)" data-index="' + value +'">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.nextPage + '"> > </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.lastPage + '">Trang Cuối</a></li>'
		$("ul.pagination").append(paginationInnerHtml);
	}
}