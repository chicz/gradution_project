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
			<h3 class="panel-title">购物车管理</h3>
		</div>
		<div class="panel-body">

			<div class="main bgf">
				<div class="reg-box-pan display-inline"></div>
				<div class="reg-box-pan display-inline" style="padding: 40px 40px 50px; width: 100%;">
					<div class="step">
						<ul>
							<li class="col-md-4 on">
								<span class="num">
									<em class="f-r5"></em>
									<i>1</i>
								</span>
								<span class="line_bg lbg-r"></span>
								<p class="lbg-txt">查看购物车物品</p>
							</li>
							<li class="col-md-4">
								<span class="num">
									<em class="f-r5"></em>
									<i>2</i>
								</span>
								<span class="line_bg lbg-l"></span>
								<span class="line_bg lbg-r"></span>
								<p class="lbg-txt">确认订单信息</p>
							</li>
							<li class="col-md-4">
								<span class="num">
									<em class="f-r5"></em>
									<i>3</i>
								</span>
								<span class="line_bg lbg-l"></span>
								<p class="lbg-txt">订单提交成功</p>
							</li>
						</ul>
					</div>

					<div class="reg-box" id="verifyCheck" style="margin-top: 20px;">
						<div class="part1">

							<div class="mt-20">
								<table id="book_list" class="table table-border table-bordered table-bg table-hover table-sort">
									<thead>
										<tr>
											<th>商品名称</th>
											<th>商品编号</th>
											<th>售卖者</th>
											<th>单价</th>
											<th>数量</th>
											<th>最大可购数量</th>
											<th>总价</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>

									</tbody>
								</table>
							</div>
							<!-- 显示分页信息 -->
							<!-- 考虑到一般购物车的东西不会太多，所以不做分页了 -->
							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo">
								    <button class="btn btn-blue f-r3" id="continue_buy">继续购物</button>
									<button class="btn btn-blue f-r3" id="btn_part1">下一步</button>
								</div>
							</div>
						</div>

						<div class="part2" style="display: none">
							

							<div class="panel panel-default">
								<div id="order_show" class="panel-body">
                                     
                                </div>
							</div>

							<div class="item col-xs-12">
								<span class="intelligent-label f-fl">&nbsp;</span>
								<div class="f-fl item-ifo"></div>
								<div class="f-fl item-ifo">
									<button class="btn btn-blue f-r3" id="btn_part21">放弃购买</button>
									<button class="btn btn-blue f-r3" id="btn_part22">下一步</button>
								</div>
							</div>
						</div>

						<div class="part3" style="display: none">
							恭喜您购买成功!欢迎再次光临二手书交易系统!
							<p class="c-666 f-mt30 f-mb50">
								页面将在
								<strong id="times" class="f-size18">10</strong>
								秒钟后，跳转到
								<a href="${APP_PATH }/" class="c-blue">首页</a>
							</p>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>



	<script type="text/javascript">
		$(function() {

			search_cart();

		});
		
		function math_totalprice(){
			
			//var price_one = $("#book_list tbody tr").find('td.totalprice');
			/* $.each(price_one,function(index,item){
				alert(item);
				console.log(item);
			}); */
			//alert(price_one);
			//console.log(price_one);
			var tab = document.getElementById("book_list");
			var price = 0;
			//alert(tab.rows[1].cells[6].innerHTML+"-:length:"+tab.rows.length);
			for (var i=1 ; i<tab.rows.length-1 ; i++){
				//alert(i+":"+tab.rows[i].cells[6].innerHTML);
				var zanshiprice = tab.rows[i].cells[6].innerHTML*1
				price = price + zanshiprice;
				//alert("price:"+price);
			}
			//alert(price);
			$("td[allprice-id='allprice']").text('总价：￥    ');
			$("td[allprice-id='allprice']").append(price.toFixed(2));
			
		}
		
		//设置购买数量，计算总价。。。
		function count_change(uuid){
			//alert("count change & uuid="+uuid);
			
			//alert($("input[count-id="+uuid+"]").val());//成功取到值
			var count = $("input[count-id="+uuid+"]").val();
			var regcount = /^[0-9]\d*$/;
			if(!regcount.test(count)){
				//alert("输入不符合规范");
				$("input[count-id="+uuid+"]").val('1');
			}
			var max_count = $("td[maxcount-id="+uuid+"]").text();
			
			//alert("count:"+count+"-maxcount:"+max_count);
			//alert("max_count:"+max_count);
			//注：text()取出的是字符串，这里*1的作用是变成数值比较
			if(count*1>max_count*1){	
				//如果输入的购买数量大于最大可购买量，则购买量为最大可购买量
				$("input[count-id="+uuid+"]").val(max_count);
			}
			//console.log(this.parent);
			//设置总价
			var totalprice = $("td[totalprice-id="+uuid+"]");
			//获取单价
			var sigleprice = $("td[price-id="+uuid+"]").text()*1;
			//toFixed(2);//将计算后的值变为两位小数，但会变为string
			var aftermath = ( $("input[count-id="+uuid+"]").val()*sigleprice ).toFixed(2);
			totalprice.text(aftermath);
			
			math_totalprice();
			
		}
		
		//第一页的确定按钮
		$("#btn_part1").click(function() {
			if (!verifyCheck._click())
				return;
			$(".part1").hide();
			$(".part2").show();
			$(".step li").eq(1).addClass("on");
			
			//发送请求生成订单
			var bookuuids = new Array();
			//bookuuids.push("cc0d34");
			//bookuuids.push("a4d59f");
			//bookuuids.push("6b64e6");
			var bookcounts = new Array();
			//bookcounts.push(2);
			//bookcounts.push(4);
			//bookcounts.push(1);
			var tab = document.getElementById("book_list");
			for (var i=1;i<tab.rows.length-1;i++){
				bookuuids.push(tab.rows[i].cells[1].innerHTML);
				bookcounts.push(tab.rows[i].cells[4].getElementsByTagName("INPUT")[0].value);
			}
			//alert("bookuuids:"+bookuuids);
			$.ajax({
				url : "${APP_PATH}/order/build_order",
				data : {
					"bookuuids" : bookuuids,
					"bookcounts" : bookcounts,
				},
				type : "POST",
				traditional: true,
				success : function(result){
				    //console.log(result);
				    //alert("请求生成订单成功");
				    
				    //第二页展示订单信息
			        build_order_show(result.extend.order_number);
				    
					//第二页的上一页确认按钮
					$("#btn_part21").click(function() {
						/* $(".part2").hide();
						$(".part1").show();
						$(".step li").eq(1).removeClass("on"); */
						//alert(result.extend.order_number);
						var order_numbers = new Array();
						var on = result.extend.order_number;
						$.each(on,function(index,item){
							order_numbers.push(item);
						});
						//alert(order_numbers);
						$.ajax({
							url : "${APP_PATH}/order/del_order",
							data : {
								"order_numbers" : order_numbers,
							},
							type : "POST",
							traditional: true,
							success : function(result){
								//console.log(result);
								//alert("放弃购买");
								window.location.href="${APP_PATH}/cart/cart";
							},
							error : function(result){
								console.log(result);
								alert("放弃购买请求失败");
							},
							
						});
						//
					});
				},
				error : function(result){
					console.log(result);
					alert("请求生成订单失败");
				}
				
			});
			
		});
		//第一页的继续购物按钮
		$("#continue_buy").click(function(){
			window.location.href = "${APP_PATH}/";
		});

		//第二页的下一页确定按钮
		$("#btn_part22").click(function() {
			if (!verifyCheck._click())
				return;
			$(".part2").hide();
			$(".part3").show();
			$(".step li").eq(2).addClass("on");
			countdown({
				maxTime : 10,
				ing : function(c) {
					$("#times").text(c);
				},
				after : function() {
					window.location.href = "${APP_PATH}/";
				}
			});
		});

		

		function showoutc() {
			$(".m-sPopBg,.m-sPopCon").show();
		}
		function closeClause() {
			$(".m-sPopBg,.m-sPopCon").hide();
		}
		
		function search_cart(){
			$.ajax({
				url : "${APP_PATH}/cart/search_cart",
				type : "GET",
				success : function(result){
					//console.log(result);
					build_cart_table(result);
				},
				error : function(result){
					alert("查询购物车表失败");
					console.log(result);
				},
			});
		}

		function build_cart_table(result) {
			$("#book_list tbody").empty();		
			var cart = result.extend.cart_book_list;

			if(cart.length == 0){
				//alert("0");
				//alert("购物车为空");//如果购物车为空，则不能点击下一步
				$("#btn_part1").attr("disabled","true");
			}
			if(cart.length != 0){
				//alert("1");
				$("#btn_part1").removeAttr("disabled");
			}
			
			//alert("length:"+length);
			var eachcount = 0;
			$.each(cart,function(index, item) {
				
				$.ajax({
					url : "${APP_PATH}/cart/cart_book",
					data : {
						"uuid" : item.book_uuid,
					},
					type : "POST",
					async : false,
					success : function (result){
						var book = result.extend.cart_book;
						//console.log(result);
						var name = $("<td style='text-align:center;vertical-align:middle;'></td>").append(book.name);
						var uuid = $("<td style='text-align:center;vertical-align:middle;'></td>").append(item.book_uuid);
						var seller = $("<td style='text-align:center;vertical-align:middle;'></td>").append(book.owner_name);
						var price = $("<td price-id='"+book.uuid+"' style='text-align:center;vertical-align:middle;'></td>").append(book.price);
						if(book.count=='0'){
							var jiajian = $("<input oninput='count_change("+'"'+book.uuid+'"'+")' count-id='"+book.uuid+"' type='text' value='0' class='form-control'/>");
						}else{
							var jiajian = $("<input oninput='count_change("+'"'+book.uuid+'"'+")' count-id='"+book.uuid+"' type='text' value='1' class='form-control'/>");
						}
						
						var count = $("<td class='col-md-1' style='text-align:center;vertical-align:middle;'></td>").append(jiajian);
						var max_count =  $("<td maxcount-id='"+book.uuid+"' style='text-align:center;vertical-align:middle;'></td>").append(book.count);
						if(book.count=='0'){
							var totalprice = $("<td class='totalprice' totalprice-id='"+book.uuid+"' style='text-align:center;vertical-align:middle;'></td>").append("0");
						}else{
							var totalprice = $("<td class='totalprice' totalprice-id='"+book.uuid+"' style='text-align:center;vertical-align:middle;'></td>").append(book.price);
						}
						
						var del = $("<a del-id='"+item.book_uuid+"' style='text-decoration:none' class='ml-5 glyphicon glyphicon-trash' title='删除'><i class='Hui-iconfont'></i></a>");
						del.attr("href", "javascript:del_a('"+ item.book_uuid + "');");
						var option = $("<td style='text-align:center;vertical-align:middle;'></td>").append(del);
						$("<tr></tr>").append(name).append(uuid).append(seller).append(price).append(count)
						  .append(max_count).append(totalprice).append(option).appendTo("#book_list tbody");
						
						
					},
					error : function (result) {
						console.log(result);
						alert("购物车商品查询失败");
						window.location.href = "${APP_PATH}/";
					}
					
				});//end ajax
				eachcount ++ ;
				//alert("eachcount:"+eachcount+"-cart.length:"+cart.length);
				if(eachcount >= cart.length){
					//alert("each end");//把ajax设为同步，这里就会在最后显示了
					var td = $("<td allprice-id='allprice' colspan='8' style='text-align:right;padding-right:55px;'></td>").append("总价：￥    ");
			        $("<tr></tr>").append(td).appendTo("#book_list tbody");
					//计算总价
			        math_totalprice();
				}
				
			});//end each
			/*  */
			
		}
		
		//删除购物车某一商品
		function del_a(uuid){
			//alert(uuid);
			$.ajax({
				url : "${APP_PATH}/cart/del_cart",
				data : {
					"uuid" : uuid,
				},
				type : "POST",
				success : function(result){
					//console.log(result);
					//alert("删除购物车商品成功");
					search_cart();
				},
				error : function(result){
					console.log(resule);
					alert("删除购物车商品失败");
				}
			});
		}
		
		//提交确认订单信息
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
						var datetime = $("<p>日期：</p>").append(sd.getFullYear()+"-"+(sd.getMonth()+1)+"-"+sd.getDate());
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