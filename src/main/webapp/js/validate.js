
$.validator.setDefaults({
	submitHandler: function() {
		form.submit();
	}
});
$(document).ready(function() {
	$('#form').validate({
		rules: {
			inputName: "required",
			inputStuno: "required",
			inputTel: {
				required: true,
			},
			inputEmail: {
				required: true,
				email: true,
			},
			inputAddress: "required",
			inputPassword: {
				required: true,
				minlength: 8,
			},
			confirmPassword: {
				required: true,
				minlength: 8,
				equalTo: "#inputPassword",
			}
		},
		messages: {
			inputName: "用户名不能为空",
			inputStuno: "学号不能为空",
			inputTel: "联系电话不能为空",
			inputEmail: {
				required: "邮箱输入不能为空",
				email: "请输入一个正确的邮箱",
			},
			inputAddress: "地址不能为空",
			inputPassword: {
				required: "密码输入不能为空",
				minlength: "密码长度不能小于8位",
			},
			confirmPassword: {
				required: "输入不能为空",
				minlength: "密码长度不能小于8位",
				equalTo: "两次密码输入不一致",
			}
		}
	});
});