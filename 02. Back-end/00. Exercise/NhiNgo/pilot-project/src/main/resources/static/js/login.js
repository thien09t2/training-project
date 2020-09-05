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
					digits: "Please enter a valid mobile number",
					minlength: "Mobile number must be a string of 10 digits",
					maxlength: "Mobile number must be a string of 10 digits"
				},
				password: "Please enter your password",
				rePassword: {
					required: "Please retype your password",
					equalTo: "Password is not the same as above"
				}
			},
			errorElement : "div",
			errorClass : "err-message-invalid"
		});
	});
	
});