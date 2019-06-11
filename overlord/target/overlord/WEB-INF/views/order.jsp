<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${APP_PATH }/static/css/gloab.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script src="${APP_PATH }/static/js/cart.js"></script>

</head>
<body>

	<div class="panel panel-default" style="width: 60%; height: 80%; float: none; display: block; margin-left: auto; margin-right: auto; margin-top: 25px;">
		<div class="panel-heading">
			<h3 class="panel-title">订单管理</h3>
		</div>
		<div class="panel-body">

			<div class="main bgf">
				<div class="reg-box-pan display-inline"></div>
				<div class="reg-box-pan display-inline" style="padding: 40px 40px 50px; width: 100%;">

					<div id="order_show" class="mt-20">
						<!-- <table id="order_list" class="table table-border table-bordered table-bg table-hover table-sort">

							<thead id="order_head1">
								<tr style='height: 40px;'>
									<td colspan='' style="text-align: center; vertical-align: middle; border-style: none">YYYY-MM-DD</td>
									<td colspan='' style="text-align: center; vertical-align: middle; border-style: none">订单号：EH0123456789</td>
									<td colspan='' style="text-align: center; vertical-align: middle; border-style: none">chicz</td>
									<td colspan='' style="text-align: center; vertical-align: middle; border-style: none">18396213073</td>
									<td colspan='' style="text-align: center; vertical-align: middle; border-style: none">
										<a style="text-decoration: none;" class="ml-5 glyphicon glyphicon-trash" title='删除'>
											<i class='Hui-iconfont'></i>
										</a>
									</td>
								</tr>
							</thead>
							<thead id="order_head2">
								<tr>
									<th>商品名称</th>
									<th>商品编号</th>
									<th>单价</th>
									<th>数量</th>
									<th>金额</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>java从入门到精通</td>
									<td>cc0d34</td>
									<td>52.23</td>
									<td>2</td>
									<td style="text-align: center; vertical-align: middle; border-style: none" rowspan="2">5</td>
								</tr>
								<tr>
									<td>java从入门到精通</td>
									<td>cc0d34</td>
									<td>52.23</td>
									<td>2</td>
								</tr>


							</tbody>
						</table> -->
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(function(){
			$.ajax({
				url : "${APP_PATH}/order/select_allorder",
				type : "GET",
				success : function(result){
					//console.log(result);
					//alert("查询所有订单");
					build_order_show(result.extend.order_numbers);
				},
				error : function(result){
					console.log(result);
					alert("查询所有订单");
				}
			});
		});
		
		//传入订单号数组
		function build_order_show(ele){
			//alert("build_order_show:"+ele);
			$.each(ele,function(index,item){
				//alert(item);
				$.ajax({
					url : "${APP_PATH}/order/show_order",
					type : "POST",
					data : {
						"order_number" : item,
					},
					traditional: true,
					success : function(result){
						//console.log(result);
						//alert("确认订单信息 ");
						var order = result.extend.orders[0];
						//alert(order.order_number);
						var order_number = $("<p>订单号：</p>").append(order.order_number);
						var sd = new Date(order.maketime);
						var datetime = $("<p>日期：</p>").append(sd.getFullYear()+"-"+sd.getMonth()+"-"+sd.getDate());
						var mathprice = 0;
						var so = result.extend.orders;
						for(var i=0;i<so.length;i++){
							//alert(i+":"+so[i].book_totalprice);
							mathprice = mathprice + so[i].book_totalprice*1;
						}
						var totalprice = $("<p>金额：</p>").append(mathprice.toFixed(2));
						var buyer_name = $("<p>买方：</p>").append(order.buyer_loginname);
						var buyer_phone = $("<p>买方联系方式：</p>").append(order.buyer_phone);
						var seller_name = $("<p>卖方：</p>").append(order.seller_name);
						var seller_phone = $("<p>卖方联系方式：</p>").append(order.seller_phone);
						$("#order_show").append(order_number).append(datetime).append(totalprice)
						.append(buyer_name).append(buyer_phone).append(seller_name).append(seller_phone).append("</br>");
					},
					error : function(result){
						console.log(result);
						alert("确认订单信息失败");
					}
				});
			});
			
		}
	</script>

</body>
</html>