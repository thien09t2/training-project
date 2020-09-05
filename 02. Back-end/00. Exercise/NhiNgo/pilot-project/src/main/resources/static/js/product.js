$(document).ready(function() {
	
	//Load prodList when page opening
	loadAllProducts(1);
	
	//Load brandList when clicking pagination btn
    $('.pagination').on('click', '.page-link', function() {
    	var pgNum = $(this).attr("data-index");
    	loadAllProducts(pgNum);
    });
    
    var $productModifyModal = $('#productModifyModal');
    var $productInputForm = $('#productInputForm');
    
    //Load add-product modal by clicking the button
    $('#addProdLink').click( function() {
    	resetFormModal($productInputForm);
    	showModalWithCustomizedTitle($productModifyModal, "Add New Product");
    	$('#prodImgThumb img').attr('src', '/images/image-demo.png');
    	$('#productId').closest(".form-group").addClass('d-none');
    	$('#productImg .required-mask').removeClass('d-none');
    });
    
    //Show Update-product Modal
    $('#productDetailTable').on('click', '.edit-btn', function() {
    	
    	$('#productImg .required-mask').addClass("d-none");
    	
    	//Load product details by prodID
    	$.ajax({
    		url  : "/product/api/find?id=" + $(this).data("id"),
    		type : 'GET',
    	    dataType : 'json',
    	    contentType : 'application/json',
    	    success : function(responseData) {

    	    	//Hide modal then show success message after saving successfully
    	    	//Else show error message in modal
    	    	if (responseData.responseCode == 100) {
    	    		var prodDetails = responseData.data;
    	    		resetFormModal($productInputForm);
    	    		showModalWithCustomizedTitle($productModifyModal, "Edit Product #" + prodDetails.productId);

    	    		$('#productId').val(prodDetails.productId);
    	    		$('#productName').val(prodDetails.productName);
    	    		$('#quantity').val(prodDetails.quantity);
    	    		$('#price').val(prodDetails.price);
    	    		$('#brandId').val(prodDetails.brandEntity.brandId);
    	    		$('#saleDate').val(prodDetails.saleDate);
    	    		$('#prodDesct').val(prodDetails.prodDesct);

    	    		var productImg = prodDetails.prodImg;
    	    		if (productImg == null || productImg == "") {
    	    			productImg = "/images/image-demo.png";
    	    		}

    	    		$('#prodImgThumb img').attr("src", productImg);
    	    		$('#prodImg').val(productImg);
    	    		$('#productId').closest(".form-group").removeClass("d-none");
    	    	}
    	    }
    	});
    });
    
    //Submit Input Data form Modal
    $('#productSaveBtn').click( function(event) {
    	
    	event.preventDefault();
    	var formData = new FormData($productInputForm[0]);
    	var productId = formData.get("productId");
    	var brandId = formData.get("brandEntity.brandId");
    	var isAddAction = productId == undefined || productId == "";
    	
    	$productInputForm.validate({
    		ignore : [],
    		rules : {
    			productName : {
    				required : true,
    				maxlength : 50
    			},
    			quantity : {
    				required : true,
    				max : 500
    			},
    			price : {
    				required : true
    			},
    			brandName : {
    				required : true
    			},
    			saleDate : {
    				required : true,
    				date : true
    			},
    			prodImgFiles : {
    				required : isAddAction
    			},
    			description : {
    				maxlength : 150
    			}
    		}, 
    		messages : {
    			productName : {
    				required : "Product Name is required.",
    				maxlength : "Product name must not be longer than 50 characters!"
    			},
    			quantity : {
    				required : "Quantity of product is required.",
    				max : "Quantity must not be larger than 500!"
    			},
    			price : {
    				required : "Price of product is required."
    			},
    			brandName : {
    				required : "Brand Name is required."
    			},
    			saleDate : {
    				required : "Sale Date is required.",
    				date : "Please enter valid date!"
    			},
    			prodImgFiles : {
    				required : "Product Imgae is required for new Product."
    			},
    			description : {
    				maxlength : "Description must not be longer than 150 characters!"
    			}
    		},
    		errorElement : "div",
			errorClass : "err-message-invalid"
    	});
    	
    	//Save data if valid
    	if ($productInputForm.valid()) {
    		
    		//Post data to server-side by AJAX
    		$.ajax({
    			url  : "/product/api/" + (isAddAction ? "add" : "update"),
    			type : 'POST',
    	        enctype : 'multipart/form-data',
    	        processData : false,
    	        contentType : false,
    	        cache : false,
    	        timeout : 10000,
    	        data : formData,
    	        success : function(responseData) {
    	        	
    	        	//Hide modal then show success message after saving successfully
    	        	//Else show error message in modal
    	            if (responseData.responseCode == 100) {
    	            	$productModifyModal.modal('hide');
    	            	loadAllProducts(1);
    	            	showNotif(true, responseData.responseMessg);
    	            } else {
    	            	showMessgOnForm($productInputForm.find("#productName"), responseData.responseMessg);
    	            }
    	        }
    		});
    	}
    });
    
    //Show Confirm-To-Delete-Product Modal
    $('#productDetailTable').on('click', '.delete-btn', function() {
    	$('#productToBeDeleted').text($(this).data('name'));
    	$('#delSubmmitBtn').attr('data-id', $(this).data('id'));
    	$('#confirmDeleteModal').modal('show');
    });
    
    //Submit delete action
    $('#delSubmmitBtn').on('click', function() {
		$.ajax({
			url  : "/product/api/delete/" + $(this).attr("data-id"),
    		type : 'DELETE',
    	    dataType : 'json',
    	    contentType : 'application/json',
    	    success : function(responseData) {
    	    	$('#confirmDeleteModal').modal('hide');
    	    	showNotif(responseData.responseCode == 100, responseData.responseMessg);
    	    	loadAllProducts(1);
    	    }
		});
	});
    
});

/**
 * Render Html for product table
 * 
 * @param prodList
 */ 
function renderProductTable(prodList) {
	
	var rowHtml = "";
	$('#productDetailTable tbody').empty();
	$.each(prodList, function(key, value) {
        rowHtml = "<tr>"
                +       "<td>"  + value.productId  +   "</td>"
                +       "<td>"  + value.productName  +   "</td>"
                +       "<td class='text-center'>"  + value.quantity  +   "</td>"
                +       "<td class='text-right'>" +	formatCurrency(value.price) + "</td>"
                +       "<td>" +	value.brandEntity.brandName	+	"</td>"
                +       "<td class='text-right'>"  + value.saleDate  +   "</td>"
                +       "<td class='text-center logo-cell'><a href='"  +   value.prodImg    + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='"  +   value.prodImg    + "'></td>"
                +       "<td>"  + value.prodDesct  +   "</td>"
                +       "<td class='action-btns'>"
                +	         "<a class='edit-btn' data-id='" +   value.productId   +   
                				"'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" +   value.productName   +	
                				"' data-id='" +   value.productId   + "'><i class='fas fa-trash-alt'></i></a>"
                +		"</td>"
                +   "</tr>"; 
        $('#productDetailTable tbody').append(rowHtml);
    });
}

/**
 * Render Html for pagination bar in Product page
 * 
 * @param paginationInfo
 */ 
function renderPagination(paginationInfo) {
	
	var paginationInnerHtml = "";
    if (paginationInfo.pgNumList.length > 0) {
        $("ul.pagination").empty();
        paginationInnerHtml += '<li class="page-item"><a class="page-link ' +    (paginationInfo.firstPage == 0 ? 'disabled' : '')  +   '" href="javascript:void(0)" data-index= "'    +   paginationInfo.firstPage    +     '">First</a></li>'
        paginationInnerHtml += '<li class="page-item"><a class="page-link ' +    (paginationInfo.prvsPage == 0 ? 'disabled' : '')  +   '" href="javascript:void(0)" data-index= "'    +   paginationInfo.prvsPage    +     '">Previous</a></li>'
        $.each(paginationInfo.pgNumList, function(key, value) {
            paginationInnerHtml += '<li class="page-item"><a class="page-link ' +    (value == paginationInfo.currtPage ? 'active' : '')  +   '" href="javascript:void(0)" data-index= "'    +   value    +     '">'   +  value   + '</a></li>';
        });
        paginationInnerHtml += '<li class="page-item"><a class="page-link ' +    (paginationInfo.nextPage == 0 ? 'disabled' : '')  +   '" href="javascript:void(0)" data-index= "'    +   paginationInfo.nextPage    +     '">Next</a></li>'
        paginationInnerHtml += '<li class="page-item"><a class="page-link ' +    (paginationInfo.lastPage == 0 ? 'disabled' : '')  +   '" href="javascript:void(0)" data-index= "'    +   paginationInfo.lastPage    +     '">Last</a></li>'
        $("ul.pagination").append(paginationInnerHtml);
    }
	
}

/**
 * Load products with pager API
 * 
 * @param pgNum
 */ 
function loadAllProducts(pgNum) {
    $.ajax({
        url : "/product/api/findAll/" + pgNum,
        type : 'GET',
        dataType : 'json',
        contentType : 'application/json',
        success : function(responseData) {
            if (responseData.responseCode == 100) {
            	renderProductTable(responseData.data.prodList);
                renderPagination(responseData.data.paginationInfo);
            }
        }
    });
}
/**
 * Format number as currency
 * 
 * @param number
 */ 
function formatCurrency(number) {
	return number.toFixed(0).replace(/./g, function(c, i, a) {
		return i > 0 && c !== "." && (a.length - i) % 3 === 0 ? "," + c : c;
	});
}
//Set Max value for sale date is the current date
document.getElementById('saleDate').max = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().split("T")[0];

