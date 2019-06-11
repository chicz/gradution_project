<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${book.name }!~(゜▽゜)つロ</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${APP_PATH }/static/dist/zoomify.min.css">
<style type="text/css">
.glyphicon-remove-circle {
	font-size: 25px;
}
</style>
</head>
<body>

	<div class="panel panel-default" style="width: 60%; height: 80%; float: none; display: block; margin-left: auto; margin-right: auto; margin-top: 25px;">
		<div class="panel-heading">

			<h3 class="panel-title" style="font-size: 20px;">商品详情</h3>
		</div>
		<div class="panel-body">

			<div class="col-md-4">

				<div style="width: 100%; height: 283px;" class="example thumbnail">
					<img id="show" onerror="this.src='/book_pic_path/default_0.jpg'" src="/book_pic_path/${book.pic_0}" style="width: 100%; height: 100%;" class="img-rounded">
				</div>
				<div style="width: 100%; height: 70px;" class="thumbnail">
					<img id="pic0" onerror="this.src='/book_pic_path/default_0.jpg'" src="/book_pic_path/${book.pic_0}" style="height: 100%" class="col-md-4 thumbnail">
					<img id="pic1" onerror="this.src='/book_pic_path/default_1.jpg'" src="/book_pic_path/${book.pic_1}" style="height: 100%" class="col-md-4 thumbnail">
					<img id="pic2" onerror="this.src='/book_pic_path/default_2.jpg'" src="/book_pic_path/${book.pic_2}" style="height: 100%" class="col-md-4 thumbnail">
				</div>

			</div>

			<div class="col-md-8">
				<form class="form-horizontal">
					<div class="form-group">
						<label class="col-md-3 control-label">售卖方 :</label>
						<div class="col-md-9 rows">
							<p class="form-control-static">${book.owner_name }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品名称 :</label>
						<div class="col-md-9 rows">
							<p class="form-control-static">${book.name }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品类别 :</label>
						<div class="col-md-9 rows">
							<p class="form-control-static">${book.sort.sort_0 }&nbsp;/&nbsp;${book.sort.sort_1 }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品作者 :</label>
						<div class="col-md-9">
							<p class="form-control-static">${book.author }</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品价格 :</label>
						<div class="col-md-9">
							<p class="form-control-static">
								<span style="font-weight: bold;">￥：</span>
								${book.price }
								<span style="padding-left: 35px; font-weight: bold;">库存：</span>
								${book.count }
								<span style="padding-left: 5px; font-weight: bold;">单位：/本</span>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品版次 :</label>
						<div class="col-md-9">
							<p class="form-control-static">
								<span>出版社： ${book.press }</span>
								<span style="padding-left: 25px;">${book.version }</span>
							</p>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">商品描述 :</label>
						<div class="col-md-9">
							<p class="form-control-static" style="min-height: 10px; overflow-y: auto; max-height: 150px;">${book.remark }</p>
						</div>
					</div>
				</form>

				<div class="col-md-10 col-md-offset-1 row">
				    <button id="back_home" class="btn btn-default">返回首页</button>
					<button id="buy_now" class="btn btn-default">立即购买</button>
				</div>


			</div>
		</div>
	</div>

	<!-- 这一部分是商品详情页，点击图片放大查看的效果 -->
	<script src="${APP_PATH }/static/dist/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="${APP_PATH }/static/dist/zoomify.min.js"></script>
	<script type="text/javascript">
		$('.example img').zoomify();
	</script>
	<script type="text/javascript">
		$(function() {
			//测试后端/book?uuid=返回的数据
			//alert('${book}');
			console.log("${book}");
			//alert("${book.name}");
			$("#pic0").click(function() {
				$("#show").attr("src", "/book_pic_path/${book.pic_0}");
			});
			$("#pic1").click(function() {
				$("#show").attr("src", $("#pic1").attr("src"));
			});
			$("#pic2").click(function() {
				$("#show").attr("src", $("#pic2").attr("src"));
			});
			$("#buy_now").attr("buy-id", "${book.uuid}");
			if(${book.count}=='0'){
				$("#buy_now").attr("disabled", "true");
			}
		});
		
		$("#back_home").click(function(){
			window.location.href = "${APP_PATH}/";
		});
		
		$("#buy_now").click(function(){
			var uuid = "${book.uuid}";
			//alert("buy now in detatil:"+uuid);
			$.ajax({
				url : "${APP_PATH}/buy/home_buy",
				data : {
					"uuid" : uuid,
				},
				type : "POST",
				success : function(result){
					//console.log(result);
					//alert("首页立即购买添加购物车成功");
					if(result.code=='100'){
						window.location.href = "cart/cart";
					}else if(result.code=='200'){
						alert(result.extend.msg);
					}else{
						alert("请先登录！");
						//window.location.href = "${APP_PATH}/";
					}
				},
				error : function(result){
					console.log(result);
					alert("购买失败in the home");
				}
			});
		});
	</script>

</body>
</html>