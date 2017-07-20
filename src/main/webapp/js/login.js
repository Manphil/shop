
$.validator.setDefaults({
	submitHandler: function() {
		form.submit();
	}
});
$(document).ready(function() {
	$('#form2').validate({
		rules: {
			UserID: "required",
			
			Userpassword: {
				required: true,
			},
			confirmlogo: "required",
		},
		messages: {
			UserID: "用户名输入不能为空",
			
			Userpassword: {
				required: "密码输入不能为空",
			},
			confirmlogo: "验证码输入不能为空",
		}
	});
});