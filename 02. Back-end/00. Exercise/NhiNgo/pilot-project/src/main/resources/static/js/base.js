$(document).ready(function () {

    //"Active" class for link in header
    var pathName = window.location.pathname;
    $("header .nav-link").each(function () {
        $this = $(this);
        if (pathName.includes($this.attr("href"))) {
            $this.parent().addClass("active");
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
