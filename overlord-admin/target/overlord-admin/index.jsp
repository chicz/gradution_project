<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校园二手书交易系统</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="static/login/css/main.css" rel="stylesheet" type="text/css" />

</head>
<body>


	<div class="login">
		<div class="box png">
			<div class="logo png"></div>
			<div class="input">

				<div class="log">
					<div class="name">
						<label>用户名</label>
						<input type="text" class="text" id="admin_loginname" placeholder="用户名" name="admin_loginname" tabindex="1">
					</div>
					<div class="pwd">
						<label>密 码</label>
						<input type="password" class="text" id="admin_password" placeholder="密码" name="admin_password" tabindex="2" />
						<input type="button" class="submit" id="adminlogin_btn" tabindex="3" value="登录" />
						<div class="check"></div>
					</div>
					<div class="tip"></div>
				</div>


			</div>
		</div>
		<div class="air-balloon ab-1 png"></div>
		<div class="air-balloon ab-2 png"></div>
		<div class="footer"></div>
	</div>

	<!-- 这里不需要引入jquery了，因为public.jsp中已经引入了，重复引入前端console会报错的 -->
	<script type="text/javascript" src="static/login/js/jQuery.js"></script>
	<script type="text/javascript" src="static/login/js/fun.base.js"></script>
	<script type="text/javascript" src="static/login/js/script.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>

	<!--[if IE 6]>
    <script src="js/DD_belatedPNG.js" type="text/javascript"></script>
    <script>DD_belatedPNG.fix('.png')</script>
    <![endif]-->
	<div style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">
		<p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
		<h6>
			&nbsp;Copyright &copy;2014-2018&nbsp;
			<span>
				<a href="http://localhost:8080/overlord/index.jsp" style="text-decoration: none">&nbsp;校园图书&nbsp; </a>
			</span>
			<span>
				<a href="http://localhost:8080/overlord/index.jsp" style="text-decoration: none">&nbsp;OVERLORD.COM&nbsp;</a>
			</span>
			&nbsp;All Rights Reserved.&nbsp;本网站由
			<span class="glyphicon glyphicon-heart"></span>
			OVERLORD制作
		</h6>
	</div>

	

	<script type="text/javascript">
		$("#adminlogin_btn").click(function() {
			/* alert("dianji"); */
			if (checkForm() == false) {
				return;
			}

			var loginname = $("#admin_loginname").val();
			var password = $("#admin_password").val();
			/* $.post("${APP_PATH}/test", {
			   "loginname" : "chicz",
			   "password" : "chicz123"
			   }); */
			//window.location.href = "./test";
			$.ajax({
				url : "${APP_PATH}/login",
				type : "post",
				dataType : "json",
				data : {
					"loginname" : loginname,
					"password" : password,
				},
				success : function(result) {
					//console.log(result);
					//alert("success:" + result);
					if(result.code == '100'){
						window.location = "main";
					}else{
						if(result.extend.code == "001"){
							layer.tips(result.extend.message,'#admin_loginname');
						}
						if(result.extend.code == "002"){
							layer.tips(result.extend.message,'#admin_password');
						}
						
					}
					//
				},
				error : function(result) {
					console.log(result);
					alert("error:" + result);
				}
			});
		});
		function checkForm() {
			var loginname = $("#admin_loginname").val();
			var password = $("#admin_password").val();
			if (loginname == "") {
				layer.tips("用户名不能为空", "#admin_loginname");
				return false;
			}
			if (password == "") {
				layer.tips("密码不能为空", "#admin_password");
				return false;
			}
		}
	</script>
</body>
</html>