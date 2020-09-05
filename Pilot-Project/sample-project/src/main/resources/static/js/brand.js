$(document).ready(function() {

	//truyền vào trang page số 1 lúc mở trang
	findBrands(1);
	
	
	
//	$('#btnSearch').on('click', function() {
//		var searchConditions = {
//				keyword: $("#keyword").val()
//		}
//	})
	
	$('#btnSearch').on('click', function() {
		var searchConditions = {
				keyword: $("#keyword").val()
		}
		searchBrand(1,searchConditions);
		
	})
	
		//hiển thị brand khi click vào thanh chỉ mục
	$('.pagination').on('click', '.page-link', function() {
		var pagerNumber = $(this).attr("data-index");
		findBrands(pagerNumber);
	})

	var $brandInfoForm = $('#brandInfoForm');
	var $brandInfoModal = $('#brandInfoModal');

	// show form add brand with js
	$('#addBrandInfoModal').on('click', function() {
//		$brandInfoModal.modal("show");
		resetFormModal($brandInfoForm);
		showModalWithCustomizedTitle($brandInfoModal, "Add Brand");
		$('#logoImg img').attr('src', '/images/image-demo.png');
		$('#brandId').closest(".form-group").addClass("d-none");
	});

	// show form update brand with js
	$("#brandInfoTable").on('click', '.edit-btn', function() {

		// tìm brand by id
		$.ajax({
			url : "/brand/api/find?id=" + $(this).data("id"),
			type : 'GET',
			dataType : 'json',
			contentType : 'application/json',
			success : function(responseData) {
				if (responseData.responseCode == 100) {
					var brandInfo = responseData.data;
					resetFormModal($brandInfoForm);
					showModalWithCustomizedTitle($brandInfoModal, "Edit Brand");

					$('#brandId').val(brandInfo.brandId);
					$('#brandName').val(brandInfo.brandName);
					$('#description').val(brandInfo.description);
					
					//nếu logo = null hoặc rỗng thì tự set thành logo mặc định
					var brandLogo = brandInfo.logo;
					if (brandLogo == null || brandLogo == "") {
						brandLogo = "/images/image-demo.png";
					}
					$("#logoImg img").attr("src", brandLogo);
					$("#logo").val(brandLogo);
					$('#brandId').closest(".form-group").removeClass("d-none");
				}
			}
		});
	});

	// hiển thị popup delete
	$("#brandInfoTable").on('click', '.delete-btn', function() {
		$("#deletedBrandName").text($(this).data("name"));
		$("#deleteSubmitBtn").attr("data-id", $(this).data("id"));
		$('#confirmDeleteModal').modal('show');
	});

	// Submit delete brand
	//sau khi hiển thị popup delete - nó sẽ truyền xuống 1 id và thông qua ajax để gọi hàm xử lý 
	$("#deleteSubmitBtn").on('click' , function() {
		$.ajax({
			url : "/brand/api/delete/" + $(this).attr("data-id"),
			type : 'DELETE',
			dataType : 'json',
			contentType : 'application/json',
			success : function(responseData) {
				$('#confirmDeleteModal').modal('hide');
				showNotification(responseData.responseCode == 100, responseData.responseMsg);
				findBrands(1);
			}
		});
	});

	// Submit and and update brand
	//những thứ không validate thì bỏ vào ignore
	//rule và mess đi cùng nhau 
	//1
	$('#saveBrandBtn').on('click', function (event) {

		event.preventDefault();
		var formData = new FormData($brandInfoForm[0]);
		var brandId = formData.get("brandId");
		var isAddAction = brandId == undefined || brandId == "";
	
		$brandInfoForm.validate({
			ignore: [],
			rules: {
				brandName: {
					required: true,
					maxlength: 100
				},
				logoFiles: {
					required: isAddAction,
				}
			},
			messages: {
				brandName: {
					required: "Please input Brand Name",
					maxlength: "The Brand Name must be less than 100 characters",
				},
				logoFiles: {
					required: "Please upload Brand Logo",
				}
			},
			errorElement: "div",
			errorClass: "error-message-invalid"
		});
		
		//khi tất cả các đk hợp lệ nó sẽ tiến hành post data vào sever bằng ajax
		//2
		if ($brandInfoForm.valid()) {

			// POST data to server-side by AJAX
			$.ajax({
				url: "/brand/api/" + (isAddAction ? "add" : "update"),
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
						$brandInfoModal.modal('hide');
						findBrands(1);
						showNotification(true, responseData.responseMsg);
					} else {
						showMsgOnField($brandInfoForm.find("#brandName"), responseData.responseMsg);
					}
				}
			});
		}
	});
});

//hiển thị brand with pagernumber
function findBrands(pageNumber) {
	$.ajax({
		url : "/brand/api/findAll/"  + pageNumber,
		type : 'GET',
		dataType : 'json',
		contentType : 'application/json',
		success : function(responseData) {
			if (responseData.responseCode == 100) {
				renderBrandsTable(responseData.data.brandsList);
				renderPagination(responseData.data.paginationInfo);
			}
		}
	});
}
function searchBrand(pageNumber,searchConditions) {
	$.ajax({
		url : "/brand/api/search/" + pageNumber,
		type : 'POST',
		dataType : 'json',
		contentType : 'application/json',
		data: JSON.stringify(searchConditions),
		success : function(responseData) {
			if (responseData.responseCode == 100) {
				renderBrandsTable(responseData.data.brandsList);
				console.log(responseData.data.brandsList)
				renderPagination(responseData.data.paginationInfo);
				if(pageNumber==1){
					showNotification(true, responseData.responseMsg);
				}
			}
		}
	});
}

//truyền vào 1 data đã được gởi từ api lên -> render table brand
//vì data truyền vào thuộc dạng json object nên muốn lấy giữ liệu bằng ajax ta phải sử dụng loop each gồm cặp key,value 
//sau khi tạo ra các hàng thì nó sẽ tiến hành append tất cả vào chuỗi rowHtml -> gán vào thẻ tbody bằng đường dẫn đến class hoặc id của table chứa thẻ tbody

function renderBrandsTable(brandsList) {

	var rowHtml = "";
	$("#brandInfoTable tbody").empty();
	$.each(brandsList, function(key, value) {
		rowHtml = "<tr>"
				+		"<td>" + value.brandId + "</td>"
				+		"<td>" + value.brandName + "</td>"
				+		"<td class='text-center'><a href='" + value.logo + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='" + value.logo + "'></td>"
				+		"<td>" + value.description + "</td>"
				+		"<td class='action-btns'>"
				+			"<a class='edit-btn' data-id='" + value.brandId + "'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" + value.brandName + "' data-id='" + value.brandId + "'><i class='fas fa-trash-alt'></i></a>"
				+		"</td>"
				+	"</tr>";
		$("#brandInfoTable tbody").append(rowHtml);
	});
}

//truyền vào dữ liệu phân trang -> render thanh phân trang
function renderPagination(paginationInfo) {

	var paginationInnerHtml = "";
	if (paginationInfo.pageNumberList.length > 0) {
		$("ul.pagination").empty();
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.firstPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.firstPage + '">Firts Page</a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.previousPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.previousPage + '"> < </a></li>'
		$.each(paginationInfo.pageNumberList, function(key, value) {
			paginationInnerHtml += '<li class="page-item"><a class="page-link '+ (value == paginationInfo.currentPage ? 'active' : '') +'" href="javascript:void(0)" data-index="' + value +'">' + value + '</a></li>';
		});
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.nextPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.nextPage + '"> > </a></li>'
		paginationInnerHtml += '<li class="page-item"><a class="page-link ' + (paginationInfo.lastPage == 0 ? 'disabled' : '') + '" href="javascript:void(0)" data-index="'+ paginationInfo.lastPage + '">Last Page</a></li>'
		$("ul.pagination").append(paginationInnerHtml);
	}
}