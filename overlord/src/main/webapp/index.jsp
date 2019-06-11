<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="static/jsp/page_top.jsp"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OverLord</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${APP_PATH }/static/css/index.css" rel="stylesheet">

<style>
.home_page_top {
	background: #F8F8FF;
	width: 100%;
	height: 35px;
	padding: 8px 0;
	text-align: right;
}

.home_page_search, .home_page_shopcart {
	padding-top: 34px;
}

footer {
	background: #F5F5F5;
	padding: 10px 0;
	text-align: center;
	padding: 10px 0;
}

.glyphicon-star {
	color: coral;
}
</style>

</head>
<body>

	<!-- 顶部的三张滑动图片 -->
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" style="width: 100%; height: 175px;">
			<div class="item active" style="width: 100%; height: 100%;">
				<img src="/book_pic_path/default_3.jpg" onerror="this.src='/book_pic_path/default.jpg'" style="width: 100%; height: 100%;">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item" style="width: 100%; height: 100%;">
				<img src="/book_pic_path/default.jpg" onerror="this.src='/book_pic_path/default.jpg'" style="width: 100%; height: 100%;">
				<div class="carousel-caption">...</div>
			</div>
			<div class="item" style="width: 100%; height: 100%;">
				<img src="/book_pic_path/default_4.png" onerror="this.src='/book_pic_path/default.jpg'" style="width: 100%; height: 100%;">
				<div class="carousel-caption">...</div>
			</div>

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>

	<div class="row col-md-12">
		<div id="brand" class="col-md-3">
			<img alt="广告招租" src="/book_pic_path/flag.jpg" style="width: 324px; max-height: 120px; padding: 10px 0; float: right;">
		</div>
		<div class="col-md-6 home_page_search">
			<div class="col-md-8 col-md-offset-2">
				<div class="input-group">
					<input id="search_input" type="text" class="form-control" placeholder="Search for...">
					<span class="input-group-btn">
						<button id="search_btn" class="btn btn-info" type="button">
							<span class="glyphicon glyphicon-search"></span>
							搜索
						</button>
					</span>
				</div>
				<!-- /input-group -->
			</div>
			<div class="col-md-8 col-md-offset-2">
				<span style="float: left; font-size: 14px;">热搜：</span>

				<span class="hot_search" style="padding-left: 15px; font-size: 14px;">
					<a href="#">java</a>
				</span>


				<span class="hot_search" style="padding-left: 20px; font-size: 14px;">
					<a href="#">android</a>
				</span>


				<span class="hot_search" style="padding-left: 20px; font-size: 14px;">
					<a href="#">英语</a>
				</span>


				<span class="hot_search" style="padding-left: 20px; font-size: 14px;">
					<a href="#">数学</a>
				</span>

			</div>
			<!-- /.col-lg-6 -->
		</div>
		<div class="col-md-3 home_page_shopcart">
			<a href="./cart/cart">
				<div class="col-md-4" style="font-size: 14px; border: 1px #000000 solid; padding: 5px; text-align: center; border-right-style: none;">
					购物车&nbsp;
					<span class=""></span>
					&nbsp;
				</div>
			</a>
			<a href="./order/order" target="_blank">
				<div class="col-md-4" style="font-size: 14px; border: 1px #000000 solid; padding-top: 5px; padding-bottom: 5px;">我的订单</div>
			</a>
		</div>
	</div>
	<div class="col-md-12">
		<hr />
	</div>
	<div class="page_home_content col-md-12">
		<div id="sorts" class="page_home_content_left col-md-2" style="border: 1px #CCCCCC; border-right-style: solid; padding: 1px; min-height: 550px; overflow-y: auto; max-height: 550px;">
			<dl class="col-md-12" style="">
				<dt style="font-size: 20px;">分类</dt>
				<dd class="col-md-12" style="font-size: 15px;">
					<span class="">apple</span>
					<span class="">banala</span>
					<span class="">orange</span>

				</dd>
			</dl>
		</div>
		<div id="books" class="page_home_content_right col-md-10">
			<!-- 下列这一块代码会被js中的代码覆盖掉，这里只是当初布局测试时用到的，也是为js中的代码书写方便参考 -->
			<div class="col-md-3" id="book">未找到商品!~( ゜▽゜)つロ</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row col-md-10 col-md-offset-2">
			<div id="page_info_area" class="col-md-4">
				<!-- 下列这一块代码会被js中的代码覆盖掉，这里只是当初布局测试时用到的，也是为js中的代码书写方便参考 -->
				<big>当前xx页，总xx页，总xx条记录.</big>
			</div>
			<div id="page_nav_area" class="col-md-5">
				<!-- 下列这一块代码会被js中的代码覆盖掉，这里只是当初布局测试时用到的，也是为js中的代码书写方便参考 -->
				<nav aria-label="Page navigation" style="float: right;">
					<ul class="pagination">
						<li>
							<a href="#">
								<span>首页</span>
							</a>
						</li>
						<li>
							<a href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li>
							<a href="#">1</a>
						</li>
						<li>
							<a href="#">2</a>
						</li>
						<li>
							<a href="#">3</a>
						</li>
						<li>
							<a href="#">4</a>
						</li>
						<li>
							<a href="#">5</a>
						</li>
						<li>
							<a href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
						<li>
							<a href="#">
								<span>末页</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
			<div class="col-md-3" style="padding-top: 23px;">
				<span>跳转到&nbsp;</span>
				<input id="to_page" type="text" style="border: 1px solid #337ab7; padding: 0px 5px; width: 35px;" />
				<span>&nbsp;页&nbsp;</span>
				<button id="to_page_btn" class="btn btn-default btn-xs" style="background-color: #fff; color: #337ab7; border: 2px solid #e7e7e7;">确定</button>
			</div>
		</div>
	</div>

	<div class="col-md-12">
		<hr>
	</div>
	<footer>
		<div class="container">
			<div class="row">
				<h6>
					&nbsp;Copyright &copy;2014-2018&nbsp;
					<span>
						<a href="${APP_PATH }/">&nbsp;校园图书&nbsp; </a>
					</span>
					<span>
						<a href="${APP_PATH }/">&nbsp;OVERLORD.COM&nbsp;</a>
					</span>
					&nbsp;All Rights Reserved.&nbsp;本网站由
					<span class="glyphicon glyphicon-heart"></span>
					OVERLORD制作
				</h6>
			</div>
		</div>
	</footer>
	<!--页脚结束-->

	<script type="text/javascript">
		$("#brand").click(function() {
			//点击搜索框旁边的商标（图片）返回首页
			window.location.href = "${APP_PATH}/";
		});

		$("#search_btn").click(function() {
			//商标右边的搜索框
			var search_input = $("#search_input").val();
			//alert("你好:"+search_input);
			to_page(1, "search", search_input);
		});

		$(document).on("click", ".hot_search a", function() {
			//alert("hot_search:"+$(this).text());
			to_page(1, "search", $(this).text());
		});

		var totalRecord, currentPage;
		//页面加载完成以后，直接发送一个ajax请求，要到分页数据
		$(function() {
			to_page(1, "books");
			build_sort0_show();
			//$("#books").empty();
		});
		function to_page(pn, ele, par) {
			$.ajax({
				url : "${APP_PATH}/" + ele,
				data : "pn=" + pn + "&par=" + par,
				type : "GET",
				success : function(result) {
					//console.log(result);//F12
					//1、解析并显示所有book的数据
					build_books_show(result);
					//2、解析并显示分页信息
					build_page_info(result);
					//3、解析显示分页条数据
					build_page_nav(result);
				}
			});
		}

		function build_books_show(result) {
			$("#books").empty();
			var books = result.extend.pageInfo.list;

			$
					.each(
							books,
							function(index, item) {
								//$("#books").append('<div class="col-md-3" ><div class="thumbnail"><a href="#" class="thumbnail" style="width: 100%; height: 150px;"> <img id="${l }${h }" src="..." alt="..."></a><div class="caption"><h1><a href="#">Thumbnail label</a></h<p style="padding-top: 5px;">￥64.25</p><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span>					</div><div class="caption"><p><a href="#" class="btn btn-primary" role="button">查看详情</a><a href="#" class="btn btn-default" role="button">立即购买</a></p></div></div></div> ');
								//var div = $("<div class='col-md-3'style='border:1px solid;'>hello</div>");
								//$("#books").append(div);
								var div = $("<div class='col-md-3'></div>");
								var thumbnail = $("<div class='thumbnail'></div>");
								var pic = $(
										"<img style='width:100%;height:100%;' >")
										.addClass("img-responsive").attr("src",
												"/book_pic_path/" + item.pic_0);
								var pic_a = $(
										"<a class='thumbnail' style='width:100%;height:150px;' target='_blank'></a>")
										.append(pic).attr("href",
												"book?uuid=" + item.uuid);
								var caption = $("<div class='caption'></div>");
								var book_url = $(
										"<a style='font-size:16px;' target='_blank'></a>")
										.append(item.name).attr("href",
												"book?uuid=" + item.uuid);
								var book_name = $("<h1></h1>").append(book_url);
								var book_price = $(
										"<p style='padding-top:5px;padding-left:10px;font-size:14px;'>"
												+ " " + "价格：￥</p>").append(
										item.price);

								var book_star1 = $("<span class='glyphicon glyphicon-star-empty' style='padding-left:10px;padding-top:5px;font-size:16px;'></span>");
								var book_star2 = $("<span class='glyphicon glyphicon-star-empty' style='padding-top:5px;font-size:16px;'></span>");
								var book_star3 = $("<span class='glyphicon glyphicon-star-empty' style='padding-top:5px;font-size:16px;'></span>");
								var book_star4 = $("<span class='glyphicon glyphicon-star-empty' style='padding-top:5px;font-size:16px;'></span>");
								var book_star5 = $("<span class='glyphicon glyphicon-star-empty' style='padding-top:5px;font-size:16px;'></span>");
								switch (item.grade) {
								case 1:
									book_star1.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.append("破损(ಥ_ಥ)");
									break;
								case 2:
									book_star1.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star2.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.append("模糊ಠ_ಠ");
									break;
								case 3:
									book_star1.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star2.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star3.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.append("工整(ง'-̀'́)ง");
									break;
								case 4:
									book_star1.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star2.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star3.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star4.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.append("较新ପ(˘ᵕ˘)੭☆");
									break;
								default:
									book_star1.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star2.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star3.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star4.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.removeClass(
											"glyphicon-star-empty").addClass(
											"glyphicon-star");
									book_star5.append("全新(◦˙▽˙◦)");
									break;
								}

								var caption_btn = $("<div class='row' style='padding-top:5px;padding-left:7px;'></div>");

								var detail_btn = $(
										"<a class='btn btn-info btn-sm detail_btn' role='button' target='_blank'></a>")
										.append("查看详情");
								//为查看详情按钮添加一个自定义的属性，来表示当前商品的id
								detail_btn.attr("detail-id", item.uuid);
								var buy_btn = $(
										"<a href='javascript:buy_now(" +'"'
												+ item.uuid + '"' + ");' class='btn btn-info btn-sm buy_btn' role='button' target='_blank'></a>")
										.append("立即购买");
								if(item.count=='0'){
									buy_btn.attr("href","javascript:void(0);");
									buy_btn.click(function(){
										alert("库存为零，无法购买!");
									});
								}
								if(item.count!='0'){
									buy_btn.attr("href","javascript:buy_now("+'"'+item.uuid+'"'+");");
								}
								//为立即购买按钮添加一个自定义的属性，来表示当前商品的id
								buy_btn.attr("buy-id", item.uuid);

								caption.append(book_name).append(book_price)
										.append(book_star1).append(book_star2)
										.append(book_star3).append(book_star4)
										.append(book_star5);
								caption_btn.append(detail_btn).append(
										"&nbsp;&nbsp;").append(buy_btn);
								caption.append(caption_btn);
								thumbnail.append(pic_a).append(caption);
								div.append(thumbnail);
								$("#books").append(div);
							})
		}
		//解析显示分页信息
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append(
					"当前【 " + result.extend.pageInfo.pageNum + " 】页，总【 "
							+ result.extend.pageInfo.pages + " 】页，共【 "
							+ result.extend.pageInfo.total + " 】条记录。");
			totalRecord = result.extend.pageInfo.pages;
			currentPage = result.extend.pageInfo.pageNum;
		}
		//解析显示分页条，点击分页要能去下一页。。。。。。。。
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>").addClass("pagination");
			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function() {
					to_page(1, "books");
				});
				prePageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum - 1, "books");
				});
			}

			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				nextPageLi.click(function() {
					to_page(result.extend.pageInfo.pageNum + 1, "books");
				});
				lastPageLi.click(function() {
					to_page(result.extend.pageInfo.pages, "books");
				});
			}
			//添加首页和前一页的提示
			ul.append(firstPageLi).append(prePageLi);
			//页码1，2，3，遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item, "books");
				});
				ul.append(numLi);
			});
			//添加下一页和尾页的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");

			//输入具体数字跳转页面
			var text = document.getElementById("to_page");
			text.onkeyup = function() {
				this.value = this.value.replace(/\D/g, '');
				if (text.value > result.extend.pageInfo.pages) {
					text.value = result.extend.pageInfo.pages;
				}

			}
			$("#to_page_btn").click(function() {
				/* 
				注：var str1 = null;//str1引用为空
				   var str2 = "";//str2引用一个空字符串
				   也就是说null没有分配空间，""分配了空间，因此str1还不是一个实例化的对象，而str2已经实例化
				 */
				//if(text.value=="") alert("null1");
				//if(text.value="") to_page(1);
				//else to_page(text.value);
				if (text.value == "")
					return false;
				to_page(text.value, "books");

			});
		}

		//on() 方法在被选元素及子元素上添加一个或多个事件处理程序。
		$(document).on("click", ".detail_btn", function() {
			//测试点击【查看详情】按钮，是否能取到对应的uuid
			//alert("detail_btn:"+$(this).attr("detail-id"));
			//向后端发送uuid数据
			getBook($(this).attr("detail-id"));

		});

		function getBook(uuid) {
			$("a[detail-id=" + uuid + "]").attr("href", "book?uuid=" + uuid);
		}

		function build_sort0_show() {

			$.ajax({
				url : "${APP_PATH}/sort0",
				type : "GET",
				success : function(result) {
					//console.log(result);//F12	
					/* <div class="page_home_content_left col-md-2" style="border: 1px #CCCCCC; border-right-style: solid; padding: 1px; min-height: 550px;">
					<dl class="col-md-12" style="">
						<dt style="font-size: 20px;">大分类1</dt>
						<dd class="col-md-12" style="font-size: 15px;">
							<span class="">apple</span>
							<span class="">banala</span>
							<span class="">orange</span>

						</dd>
					</dl>
					</div> */
					$("#sorts").empty();
					var sort0 = result.extend.sort_0;
					$.each(sort0, function(index, item) {
						//alert(item.sort_0);	
						var dl = $("<dl class='col-md-12'></dl>");
						var dt = $("<dt style='font-size: 20px;'></dt>")
								.append(item.sort_0);
						dl.append(dt).attr("sort_0", item.sort_0);
						dt.attr("sort_dt", item.sort_0);
						$("#sorts").append(dl);
						build_sort1_show(item.sort_0);
					});
				}
			});
		}
		function build_sort1_show(sort_0) {
			//alert("begin:"+sort_0);
			$
					.ajax({
						url : "${APP_PATH}/sort1",
						data : "sort_0=" + sort_0,
						type : "POST",
						success : function(result) {
							//console.log(result);
							var dd = $("<dd class='col-md-12' style='font-size:15px;'></dd>");
							var sort1 = result.extend.sort_1;
							$
									.each(
											sort1,
											function(index, item) {
												//alert(item.sort_1+":"+index);
												var span = $(
														"<span style='padding-right:15px;color:#2222ff;'></span>")
														.append(item.sort_1);
												span.attr("sort_dd",
														item.sort_1);
												dd.append(span);

											});
							//alert("<><><>"+sort_0);
							$("dl[sort_0=" + sort_0 + "]").append(dd);

							//alert("><><><")
						}
					});
		}
		$(document).on("mouseenter", "span[sort_dd]", function() {
			$(this).css("color", "#ff00ff");
		});
		$(document).on("mouseleave", "span[sort_dd]", function() {
			$(this).css("color", "#2222ff");
		});
		$(document).on("click", "span[sort_dd]", function() {
			//alert(">>>"+$(this).attr("sort_dd"));
			to_page(1, "sort_1_book", $(this).attr("sort_dd"));
		});
		$(document).on("mouseenter", "dt[sort_dt]", function() {
			$(this).css("color", "red");
			$(this).css("border", "1px solid");
		});
		$(document).on("mouseleave", "dt[sort_dt]", function() {
			$(this).css("color", "black");
			$(this).css("border", "none");
		});
		$(document).on("click", "dt[sort_dt]", function() {
			//alert(">>>"+$(this).attr("sort_dd"));
			to_page(1, "sort_0_book", $(this).attr("sort_dt"));
		});

		//首页立即购买
		function buy_now(uuid) {
			//alert("buy now:" + uuid);
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
		}
	</script>

</body>
</html>
