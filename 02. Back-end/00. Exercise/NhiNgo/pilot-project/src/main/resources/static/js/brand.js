$(document).ready(function() {

    //Load brandList when page opening
    loadAllBrands(1);
    
    //Load brandList when clicking pagination btn
    $('.pagination').on('click', '.page-link', function() {
    	var pgNum = $(this).attr("data-index");
    	loadAllBrands(pgNum);
    });
    
    var $brandModifyModal = $('#brandModifyModal');
    var $brandInfoForm = $('#brandInfoForm');
    
    //Show Add-Brand Modal
    $('#addBrandLink').click(function() {
    	resetFormModal($brandInfoForm);
    	showModalWithCustomizedTitle($brandModifyModal, "Add New Brand");
    	$('#logoImg img').attr('src', '/images/image-demo.png');
    	$('#brandID').closest(".form-group").addClass("d-none");
    	$('#brandLogo .required-mask').removeClass("d-none");
//    	$brandModifyModal.modal("show");
    });
    
    //Show Update-brand Modal
    $("#brandDetailsTable").on('click', '.edit-btn', function() {
		
    	$('#brandLogo .required-mask').addClass("d-none");
    	
    	//Load brand details by brandID
    	$.ajax({
    		url  : "/brand/api/find?id=" + $(this).data("id"),
    		type : 'GET',
    	    dataType : 'json',
    	    contentType : 'application/json',
    	    success : function(responseData) {

    	    	//Hide modal then show success message after saving successfully
    	    	//Else show error message in modal
    	    	if (responseData.responseCode == 100) {
    	    		var brandDetails = responseData.data;
    	    		resetFormModal($brandInfoForm);
    	    		showModalWithCustomizedTitle($brandModifyModal, "Edit Brand #" + brandDetails.brandID);

    	    		$('#brandID').val(brandDetails.brandID);
    	    		$('#brandName').val(brandDetails.brandName);
    	    		$('#description').val(brandDetails.description);

    	    		var brandLogo = brandDetails.logo;
    	    		if (brandLogo == null || brandLogo == "") {
    	    			brandLogo = "/images/image-demo.png";
    	    		}

    	    		$('#logoImg img').attr("src", brandLogo);
    	    		$('#logo').val(brandLogo);
    	    		$('#brandID').closest(".form-group").removeClass("d-none");
    	    	}
    	    }
    	});
	});
    
    //Submit Input Data from Modal
    $('#brandSaveBtn').click( function(event) {
		
    	event.preventDefault();
    	var formData = new FormData($brandInfoForm[0]);
    	var brandID = formData.get("brandID");
    	var isAddAction = brandID == undefined || brandID == "";
    	
    	$brandInfoForm.validate({
    		ignore : [],
    		rules : {
    			brandName : {
    				required : true,
    				maxlength : 20
    			},
    			logoFiles : {
    				required : isAddAction,
    			},
    			description : {
    				maxlength : 50
    			}
    		},
    		messages: {
    			brandName : {
    				required : "Brand Name is required.",
    				maxlength : "Brand name must not be longer than 20 characters!"
    			},
    			logoFiles : {
    				required : "Brand Logo is required for new Brand.",
    			},
    			description : {
    				maxlength : "Description must not be longer than 50 characters!"
    			}
			},
			errorElement : "div",
			errorClass : "err-message-invalid"
    	});
    	
    	//Save data if form is validated
    	if ($brandInfoForm.valid()) {
    		
    		//Post data to server-side by AJAX
    		$.ajax({
    			url  : "/brand/api/" + (isAddAction ? "add" : "update"),
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
    	            	$brandModifyModal.modal('hide');
    	            	loadAllBrands(1);
    	            	showNotif(true, responseData.responseMessg);
    	            } else {
    	            	showMessgOnForm($brandInfoForm.find("#brandName"), responseData.responseMessg);
    	            }
    	        }
    		});
    	}
	});
    
    //Show Delete-brand Confirmation Modal
    $("#brandDetailsTable").on('click', '.delete-btn', function() {
    	$("#brandToBeDeleted").text($(this).data("name"));
    	$("#delSubmmitBtn").attr("data-id", $(this).data("id"));
    	$("#confirmDeleteModal").modal('show');
    });
    
    //Submit delete action
    $("#delSubmmitBtn").on('click', function() {
    	$.ajax({
    		url  : "/brand/api/delete/" + $(this).attr("data-id"),
    		type : 'DELETE',
    	    dataType : 'json',
    	    contentType : 'application/json',
    	    success : function(responseData) {
    	    	$('#confirmDeleteModal').modal('hide');
    	    	showNotif(responseData.responseCode == 100, responseData.responseMessg);
    	    	loadAllBrands(1);
    	    }
    	});
    });
    

});

/**
 * Load brands with pager API
 * 
 * @param pgNum
 */ 
function loadAllBrands(pgNum) {
    $.ajax({
        url : "/brand/api/findAll/" + pgNum,
        type : 'GET',
        dataType : 'json',
        contentType : 'application/json',
        success : function(responseData) {
            if (responseData.responseCode == 100) {
                renderBrandTable(responseData.data.brandList);
                renderPagination(responseData.data.paginationInfo);
            	/*console.log(responseData.data);*/
            }
        }
    });
}

/**
 * Render Html for brand table
 * 
 * @param brandList
 */ 
function renderBrandTable(brandList) {

    var rowHtml = "";
    $("#brandDetailsTable tbody").empty();
    $.each(brandList, function(key, value) {
        rowHtml = "<tr>"
                +       "<td>"  + value.brandID  +   "</td>"
                +       "<td>"  + value.brandName  +   "</td>"
                +       "<td class='text-center logo-cell'><a href='"  +   value.logo    + "' data-toggle='lightbox' data-max-width='1000'><img class='img-fluid' src='"  +   value.logo    + "'></td>"
                +       "<td>"  + value.description  +   "</td>"
                +       "<td class='action-btns'>"
                +	         "<a class='edit-btn' data-id='" +   value.brandID   +   
                				"'><i class='fas fa-edit'></i></a> | <a class='delete-btn' data-name='" +   value.brandName   +	
                				"' data-id='" +   value.brandID   + "'><i class='fas fa-trash-alt'></i></a>"
                +		"</td>"
                +   "</tr>"; 
        $("#brandDetailsTable tbody").append(rowHtml);
    });
}

/**
 * Render Html for pagination bar
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