<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

</head>
<body>

	<div class="panel panel-default" style="width: 60%; height: 80%; float: none; display: block; margin-left: auto; margin-right: auto; margin-top: 25px;">
		<div class="panel-heading">
			<h3 class="panel-title">注册</h3>
		</div>
		<div class="panel-body">

			<form id="register_form" class="form-horizontal" action="register">
				<div class="form-group">
					<label for="re_username" class="col-md-2 control-label">姓名</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_username" name="username" placeholder="姓名">
						<span class="help-block" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="re_loginname" class="col-md-2 control-label">登录名</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_loginname" name="loginname" placeholder="loginname">
						<span class="help-block" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="re_password" class="col-md-2 control-label">密码</label>
					<div class="col-md-6">
						<input type="password" class="form-control" id="re_password" name="password" placeholder="Password">
						<span class="help-block" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="re_phone" class="col-md-2 control-label">联系方式</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_phone" name="phone" placeholder="phone">
						<span class="help-block" style="color: red;"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="re_birthday" class="col-md-2 control-label">出生日期</label>
					<div class="col-md-6" style="position: relative;">
						<input type="date" class="form-control" id="re_birthday" name="birthday" placeholder="birthday">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-10">
						<label class="radio-inline">
							<input type="radio" name="sex" id="sex1" value="M" checked="checked">
							男
						</label>
						<label class="radio-inline">
							<input type="radio" name="sex" id="sex2" value="W">
							女
						</label>
					</div>
				</div>
				<div class="form-group">
					<label for="re_email" class="col-md-2 control-label">电子邮件</label>
					<div class="col-md-6">
						<input type="email" class="form-control" id="re_email" name="email" placeholder="Email">
					</div>
				</div>
				<div class="form-group">
					<label for="re_address" class="col-md-2 control-label">住址</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_address" name="address" placeholder="Address">
					</div>
				</div>
				<div class="form-group">
					<label for="re_question" class="col-md-2 control-label">密保问题</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_question" name="question" placeholder="Question">
					</div>
				</div>
				<div class="form-group">
					<label for="re_answer" class="col-md-2 control-label">密保答案</label>
					<div class="col-md-6">
						<input type="text" class="form-control" id="re_answer" name="answer" placeholder="Answer">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-2">
						<div class="checkbox">
							<label>
								<input id="agree" type="checkbox">
								I'm agree!
							</label>
						</div>
					</div>
					<div class="col-md-4">
						<!-- 注：如果form中的button不指定type 则type的默认值为submit -->
						<button id="register_btn" type="button" class="btn btn-default" disabled="disabled">Sign in</button>
					</div>
				</div>
				<div class="form-group"></div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	
	    function check(){
	    	//document.getElementById("agree").attr("checked",false);
	    	var username = $("#re_username").val();
	    	var regusername = /^(^[\u2E80-\u9FFF]{2,5})/;
	    	if(!regusername.test(username)){
	    		//alert("姓名由2到5位汉字组成");
	    		show_validate_msg("#re_username", "error","* 姓名由2到5位汉字组成");
	    		return false;
	    	}else{
	    		show_validate_msg("#re_username", "success","");
	    	}
			var loginname = $("#re_loginname").val();
			var regloginname = /^[a-zA-Z0-9_]{3,16}$/;
			if(!regloginname.test(loginname)){
				//alert("登录名应为3-16位英文或数字组成");
				show_validate_msg("#re_loginname", "error","* 登录名应为3-16位英文或数字组成");
				//alert($('#re_loginname').next('span').text());
				return false;
			}else{
	    		show_validate_msg("#re_loginname", "success","");
	    	}
			var password = $("#re_password").val();
			var regpassword = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{8,16}$/;
			if(!regpassword.test(password)){
				//alert("密码由大写字母+小写字母+数字，8-16位组成！");
				show_validate_msg("#re_password", "error","* 密码由大写字母+小写字母+数字，8-16位组成");
				return false;
			}else{
	    		show_validate_msg("#re_password", "success","");
	    	}
			var phone = $("#re_phone").val();
			var regphone = /^((0\d{2,3}-\d{7,8})|(1([358][0-9]|4[579]|66|7[0135678]|9[89])[0-9]{8}))$/;
			if(!regphone.test(phone)){
				//alert("手机号不正确");
				show_validate_msg("#re_phone", "error","* 手机号不正确");
				return false;
			}else{
	    		show_validate_msg("#re_phone", "success","");
	    	}
			var birthday = $("#re_birthday").val();
			if (document.getElementById("sex1").checked == true) {
				var sex = '男';
			} else {
				var sex = '女';
			}
			var email = $("#re_email").val();
			var address = $("#re_address").val();
			
			var question = $("#re_question").val();
			var answer = $("#re_answer").val();
			return true;
	    }
	    
	  //显示校验结果的提示信息
		function show_validate_msg(ele, status, msg) {
			//清除当前元素的校验状态
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if ("success" == status) {
				$(ele).parent().addClass("has-success");
				$(ele).next("span").text(msg);
			} else if ("error" == status) {
				$(ele).parent().addClass("has-error");
				$(ele).next("span").text(msg);
			}
		}
	    

		$("#re_username").change(function() {
			check();
		});
		$("#re_loginname").change(function() {
			check();
			//发送ajax请求校验用户是否可用
			var loginname = this.value;
			$.ajax({
				url : "${APP_PATH}/checkuser",
				data : "loginname=" + loginname,
				type : "POST",
				success : function(result) {
					console.log(result);//F12可以在浏览器查看具体取到的object
					//alert(result.username+":"+result.loginname+":"+result.email);
					//alert(result);
					//alert("into success"+result);
					if (result==null||result=="null"||result=="") {
						show_validate_msg("#re_loginname","success", "");
						check();
						//$("#emp_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#re_loginname","error", " * 该登录名已经存在");
						//$("#emp_save_btn").attr("ajax-va", "error");
					}
				},
				error:{}
			});
		});
		$("#re_password").change(function() {
			check();
		});
		$("#re_phone").change(function() {
			check();
			//发送ajax请求校验电话是否已被占用
			var phone = this.value;
			$.ajax({
				url : "${APP_PATH}/checkphone",
				data : "phone=" + phone,
				type : "POST",
				success : function(result) {
					//alert("result:"+result.phone.phone);
					/* alert("result.msg:"+result.msg);
					alert("result.code:"+result.code);
					alert("result.emp:"+result.emp);
					alert("result.extend.emp:"+result.extend.emp+"result.extend.emp.loginname:"+result.extend.emp.loginname); */
					//alert("into success"+result);
					if (result==null||result=="null"||result=="") {
						show_validate_msg("#re_phone","success", "");
						check();
						//$("#emp_save_btn").attr("ajax-va", "success");
					} else {
						show_validate_msg("#re_phone","error", " * 该手机已被注册");
						//$("#emp_save_btn").attr("ajax-va", "error");
					}
				}
			});
		});

		$("#agree").change(
				function() {
					var checkbox = document.getElementById("agree");//选中checkbox的id；
					if (checkbox.checked == true) {//按钮已选中
						document.getElementById("register_btn")
								.removeAttribute("disabled");//移除disabled
					} else {
						document.getElementById("register_btn").setAttribute(
								"disabled", "disabled");
					}
				});
		/* 提交注册表单 */
		$("#register_btn").click(
				function() {
					if (check()) {
						//alert("即将提交表单");
						document.getElementById("register_form").submit();
						alert("恭喜您注册成功");
					} else {
						document.getElementById('agree').checked = false;
						document.getElementById("register_btn").setAttribute(
								"disabled", "disabled");
					}
					/* var username = $("#re_username").val();
					var loginname = $("#re_loginname").val();
					var password = $("#re_password").val();
					var phone = $("#re_phone").val();
					var birthday = $("#re_birthday").val();
					if (document.getElementById("sex1").checked == true) {
						var sex = '男';
					} else {
						var sex = '女';
					}
					var email = $("#re_email").val();
					var address = $("#re_address").val();
					var question = $("#re_question").val();
					var answer = $("#re_answer").val();
					//alert(username+loginname+password+phone+birthday+sex+email+address+question+answer);
					$.ajax({
						url : "./register",
						type : 'POST',
						data : {
							"username" : username,
							"loginname" : loginname,
							"password" : password,
							"phone" : phone,
							"birthday" : birthday,
							"sex" : sex,
							"email" : email,
							"address" : address,
							"question" : question,
							"answer" : answer
						},

						success : function(data) {
							alert("into success");
							alert(data);
						},
						error : function(data) {
							alert("into error");
							alert(data);
						}

					}); */

				});
	</script>

</body>
</html>