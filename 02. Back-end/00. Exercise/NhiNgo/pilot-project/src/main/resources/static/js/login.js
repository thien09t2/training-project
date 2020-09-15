$(document).ready(function() {
	
	var $userInfoForm = $('#userInfoForm');
	
	//Validate Form
	$('#regisBtn').click( function() {
		
		$userInfoForm.validate({
			ignore : [],
			rules: {
				userName:  {
					required: true,
					minlength: 6,
					maxlength: 20
				},
				fullName: {
					required: true,
					maxlength: 50
				},
				email: "required",
				tel: {
					digits: true,
					minlength: 10,
					maxlength: 10
				},
				password: "required",
				rePassword: {
					required: true,
					equalTo: "#password"
				}
			},
			meassages: {
				userName:  {
					required: "Please enter your username",
					minlength: "Username must consist of at least 6 charaters",
					maxlength: "Username must be not longer than 20 characters"
				},
				fullName: {
					required: "What's your fullname?",
					maxlength: "Fullname must be not longer than 50 characters"
				},
				email: "Please enter your email",
				tel: {
					digits: "This entry can only contain numbers",
					minlength: "Please enter a 10-digit phone number",
					maxlength: "Please enter a 10-digit phone number"
				},
				password: "Please enter your password",
				rePassword: {
					required: "Please retype your password",
					equalTo: "Password should be the same as above"
				}
			},
			errorElement : "div",
			errorClass : "err-message-invalid"
		});
	});
	
});