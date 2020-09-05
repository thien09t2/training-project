$(document).ready(function () {

    //"Active" class for link in header
    var pathName = window.location.pathname;
    $("header .nav-link").each(function () {
        $this = $(this);
        if (pathName.includes($this.attr("href"))) {
            $this.addClass("active");
        }
    });

    //Upload image preview
    $('input.upload-img').on('change', function () {
        var url = window.URL || window.webkitURL;
        var file = this.files[0];
        var fileURL;
        var $parent = $(this).parent();
        if (file) {
        	fileURL = url.createObjectURL(file);
        	$parent.find('.err-message-invalid').removeClass("err-message-invalid");
        } else {
            var oldImagePath = $parent.find(".old-img").val();
            if (oldImagePath) {
            	fileURL = oldImagePath;
            } else {
            	fileURL = "/images/image-demo.png";
            }
        }
        $parent.find(".preview-img-upload img").attr('src', fileURL);
    });
    
    //See full size image by clicking
    $(document).on('click', '[data-toggle="lightbox"]', function (event) {
    	event.preventDefault();
    	$(this).ekkoLightbox({
    		alwaysShowClose: true
    	});
    });
});

/**
 * Validate Form
 *
 * @param $formElement
 * @param validationInfo
 * @returns true if form is valid
 */

function formValidate($formElement, validationInfo) {
	
    $formElement.validate( {
        rules: validationInfo.rules,
        messages: validationInfo.errorMessages,
        errorElement: "div",
        errorClass: "err-message-invalid",
        ignore: 'input[type=hidden], .select2-input, .select2-focusser'
    });
    return $formElement.valid();
}

/**
 * Add customized title for Modal
 *
 * @param $selectedModal
 * @param cuzTitle
 */
function showModalWithCustomizedTitle($selectedModal, cuzTitle) {
	$selectedModal.find(".modal-title").text(cuzTitle);
	$selectedModal.modal('show');
}

/**
 * Reset form for Modal before showing
 *
 * @param $formElement
 */
function resetFormModal($formElement) {
	
	$formElement[0].reset();
	$formElement.find("input[type*='file']").val("");
	$formElement.validate().destroy();
	$formElement.find(".err-message-invalid").remove();
	$formElement.find("img").attr('src', '');
}

/**
 * Show Notification
 *
 * @param isSuccess to show notif. if process succeeded
 * @param message to display on notif.
 */
function showNotif(isSuccess, message) {
	
	if (isSuccess) {
		$.notify({
			icon : 'glyphicon glyphicon-ok',
			message	: message	
		}, {
			type : 'info',
			delay : 5000
		});
	} else {
		$.notify({
			icon : 'glyphicon glyphicon-warning-sign',
			message	: message	
		}, {
			type : 'danger',
			delay : 8000
		});
	}
}

/**
 * Show Message on the Form
 *
 * @param $element
 * 				element to show err-messg
 * @param isSuccessMessg
 * 				true if messg is an inform(alert-info)
 * 				false if messg is an error message
 * @param messg
 */
function showMessgOnForm($element, messg, isSuccessMessg) {
	
	var className = isSuccessMessg ? "alert-info" : "err-message-invalid";
	$element.find(".form-messg").remove();
	$element.prepend("<div class='"	+	className	+	" form-messg'>"	+	messg	+	"</div>");
}

/**
 * Back to Top Button
 *
 */
//Get the Button:
var mybutton = document.getElementById("myTopBtn");

// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        mybutton.style.display = "block";
    } else {
        mybutton.style.display = "none";
    }
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
    document.body.scrollTop = 0; //for Safari
    document.documentElement.scrollTop = 0; //Chrome, IE, ...
}
