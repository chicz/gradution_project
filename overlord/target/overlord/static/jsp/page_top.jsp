<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>overlord!~( ゜▽゜)つロ</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.2.1.min.js"></script>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${APP_PATH }/static/css/index.css" rel="stylesheet">
<style>
.home_page_top, .home_page_top_login {
	position: fixed;
	background: #F8F8FF;
	border-bottom: 1px solid #000;
	opacity: 0.72;
	width: 100%;
	height: 35px;
	padding: 8px 0;
	text-align: right;
	z-index: 9999;
}

body {
	background-color: #ededed;
	font-family: "Quicksand", sans-serif;
	overflow: hidden;
}

.fa {
	color: #ea8289;
	position: absolute;
	overflow: hidden;
}

.scene {
	width: 100%;
	max-width: 100%;
	margin: 0 auto;
	filter: blur(1px);
}
</style>

</head>
<body>

	<!-- 点击登录弹出的模态框 -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div style="display: table; width: 100%; height: 100%;">
			<div style="vertical-align: middle; display: table-cell;">
				<div class="modal-dialog" role="document" style="width: 540px;">
					<div class="modal-content">
						<div class="col-left"></div>
						<div class="col-right">
							<div class="modal-header">
								<button type="button" id="login_close" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span>
									<span class="sr-only">Close</span>
								</button>
								<h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;">登录</h4>
							</div>
							<div class="modal-body">
								<section class="box-login v5-input-txt" id="box-login">
									<form id="login_form" action="login" method="post" autocomplete="off">
										<ul>
											<li class="form-group">
												<input class="form-control" id="loginname" maxlength="50" name="loginname" placeholder="请输入账号/手机号" type="text">
											</li>
											<li class="form-group">
												<input class="form-control" id="password" name="password" placeholder="请输入密码" type="password">
											</li>
										</ul>
									</form>
									<p class="good-tips marginB10">
										<a id="btnForgetpsw" class="fr" style="text-decoration:line-through">忘记密码？</a>
										还没有账号？
										<a href="./register.jsp" target="_blank" id="btnRegister">立即注册</a>
									</p>
									<div class="login-box marginB10">
										<button id="login_btn" type="button" class="btn btn-micv5 btn-block globalLogin">登录</button>
										<div id="login-form-tips" class="tips-error bg-danger" style="display: none;">错误提示</div>
									</div>
									<div class="threeLogin">
										<h4 style="font-size: 18px; padding-bottom: 15px;">欢迎使用，我们将竭诚为您服务！</h4>
									</div>
								</section>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="home_page_top">
		<p id="test" style="padding-right: 105px;">
			<a class="" data-toggle="modal" data-target="#loginModal">登录</a>
			|
			<a calss="" href="./register.jsp">注册</a>
		</p>
	</div>

	<div class="home_page_top_login" style="display: none; color: #00009;">
		<!-- <span class="trigger" style="float: left; padding-left: 15px; font-size: 14px; color: #ff00ff; cursor: default;">[ 当前特效：❄ ]</span> -->
		<p style="padding-right: 105px">
			欢迎&nbsp;[&nbsp;${sessionScope.user.username }&nbsp;] ${sessionScope.gender }
			<a calss="" href="exit">&nbsp;退出&nbsp;</a>
		</p>
	</div>

	<div class="scene" style=""></div>

	<script type="text/javascript">
	
	    /* 验证登录状态 */
	    var is_login = "<%=session.getAttribute("user")%>";	    
		window.onload = function() {
			//alert("hello");
			/* alert(is_login); */	
			if(is_login=="null"){
				/*
				在controller层session.removeAttribute("user")时，is_login="null"是字符串，而不是空字段
				*/
				/* alert("if"); */
				$(".home_page_top_login").hide();
				$(".home_page_top").show();
				
			}
			if(is_login!="null"){
				/* alert("else"); */			
				$(".home_page_top").hide();
				$(".home_page_top_login").show();
			}
		}
		
		 $("#login_close").click(function(){
			 $("#password").val('');
		 });
		 
		 $("#loginname").change(
			 function() {
				 //当输入框的内容改变时，会自动触发此函数
				//alert("loginname change");
			}	 
		 );
		 $("#password").change(
			 function(){
				 $("#password").parent().removeAttr("class","data-placement","data-content");
				 //隐藏并销毁弹出框
				 $("#password").popover('destroy');
			 });
		
		/* 提交登录表单 */
		$("#login_btn").click(function(){
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			$.ajax({
				url:"./login",
				type:'POST',
				data:{
					"loginname":loginname,
					"password":password
				},
				dataType:'json',
				success:function(){
					alert("恭喜您登录成功！");
					location.reload(true);
					
				},
				error:function(){
					//alert("用户名或密码错误，请重新登录！");
					$("#password").val('');	
					$("#password").parent().attr("class","has-error");
					$("#password").attr({"data-placement":"left","data-content":"用户名或密码错误，请重新登录！"});
					$("#password").popover('show');
					//$("#password").addClass('alert alert-danger');
					//attr()添加属性
					//$("#password").attr("placeholder","密码或用户名不正确，请重新输入");
				}
					  
			});
			//document.getElementById('login_form').submit();
		});
	    <%-- $("#login_btn").click(function() {
			var loginname = $("#loginname").val();
			var password = $("#password").val();
			$.ajax({
				url : "login2",
				type : "POST",
				data : {
					"loginname" : loginname,
					"password" : password
				},
				success : function(data) {
					var is_login2 = "<%=session.getAttribute("user")%>";
					alert("3:"+is_login2);
					if (data != null) {
						//关闭弹窗,并刷新页面,登录成功
						$("#loginModal").modal('hide');
						alert("登录成功");
					} else {
						//不关闭弹窗,提示错误,让用户修改后再试.
						alert("<%=session.getAttribute("user")%>");
						return false;
					}
				}
			})

		}) --%>
	</script>

	<script src="static/texiao/9b0e7f948f.js"></script>
	<script src="static/texiao/TweenMax.min.js"></script>
	<!-- <script>
	var fa = false;
  
  //more layers and css blur will cause performance drop
  //更多的图层和CSS模糊会导致性能下降
	var layer2 = new Layer(16, 6);
    //setInterval(code,millisec[,"lang"])
    //code:必需。要调用的函数或要执行的代码串。
    //millisec:必须。周期性执行或调用 code 之间的时间间隔，以毫秒计。
	setInterval(layer2.addIcon, 150);

	var layer1 = new Layer(32, 4);
	setInterval(layer1.addIcon, 300);

	function Layer(fontSize, speed){
		this.addIcon = function(){
			var random_icon = icons[Math.floor(Math.random()*icons.length)];
			$random_x = Math.floor((Math.random() * 900) + 1);
			
			if(fa){
				var $icon = $('<i style="font-size:' + fontSize + 'px;" class="fa ' + random_icon + '" aria-hidden="true"></i>').appendTo(".scene");
			}else{
				var $icon = $('<i style="font-size:' + fontSize + 'px;" class="fa fa-snowflake-o" aria-hidden="true"></i>').appendTo(".scene");
			}

			//initial position
			TweenLite.to($icon, 0, {x: $random_x, color: "#2222ff", y: -80});

			//main animation
			TweenLite.to($icon, speed, {color: "#ff00ff", y: 900, x: $random_x + (Math.random() * 400), opacity: 0, ease:Linear.easeNone, onComplete: deleteIcon, onCompleteParams: ["{self}"]});

			//rotate animation
			var rotation_speed = (Math.random() + 10);
			TweenMax.to($icon, rotation_speed, {rotation: 390, ease:Linear.easeNone, repeat: -1});
		};

		deleteIcon = function(obj){
			obj.target.remove();
			obj.remove;
		};

		var icons = ["fa-900px", "fa-address-book", "fa-address-book-o", "fa-address-card", "fa-address-card-o", "fa-adjust", "fa-adn", "fa-align-center", "fa-align-justify", "fa-align-left", "fa-align-right", "fa-amazon", "fa-ambulance", "fa-american-sign-language-interpreting", "fa-anchor", "fa-android", "fa-angellist", "fa-angle-double-down", "fa-angle-double-left", "fa-angle-double-right", "fa-angle-double-up", "fa-angle-down", "fa-angle-left", "fa-angle-right", "fa-angle-up", "fa-apple", "fa-archive", "fa-area-chart", "fa-arrow-circle-down", "fa-arrow-circle-left", "fa-arrow-circle-o-down", "fa-arrow-circle-o-left", "fa-arrow-circle-o-right", "fa-arrow-circle-o-up", "fa-arrow-circle-right", "fa-arrow-circle-up", "fa-arrow-down", "fa-arrow-left", "fa-arrow-right", "fa-arrow-up", "fa-arrows", "fa-arrows-alt", "fa-arrows-h", "fa-arrows-v", "fa-asl-interpreting", "fa-assistive-listening-systems", "fa-asterisk", "fa-at", "fa-audio-description", "fa-automobile", "fa-backward", "fa-balance-scale", "fa-ban", "fa-bandcamp", "fa-bank", "fa-bar-chart", "fa-bar-chart-o", "fa-barcode", "fa-bars", "fa-bath", "fa-bathtub", "fa-battery", "fa-battery-0", "fa-battery-1", "fa-battery-2", "fa-battery-3", "fa-battery-4", "fa-battery-empty", "fa-battery-full", "fa-battery-half", "fa-battery-quarter", "fa-battery-three-quarters", "fa-bed", "fa-beer", "fa-behance", "fa-behance-square", "fa-bell", "fa-bell-o", "fa-bell-slash", "fa-bell-slash-o", "fa-bicycle", "fa-binoculars", "fa-birthday-cake", "fa-bitbucket", "fa-bitbucket-square", "fa-bitcoin", "fa-black-tie", "fa-blind", "fa-bluetooth", "fa-bluetooth-b", "fa-bold", "fa-bolt", "fa-bomb", "fa-book", "fa-bookmark", "fa-bookmark-o", "fa-braille", "fa-briefcase", "fa-btc", "fa-bug", "fa-building", "fa-building-o", "fa-bullhorn", "fa-bullseye", "fa-bus", "fa-buysellads", "fa-cab", "fa-calculator", "fa-calendar", "fa-calendar-check-o", "fa-calendar-minus-o", "fa-calendar-o", "fa-calendar-plus-o", "fa-calendar-times-o", "fa-camera", "fa-camera-retro", "fa-car", "fa-caret-down", "fa-caret-left", "fa-caret-right", "fa-caret-square-o-down", "fa-caret-square-o-left", "fa-caret-square-o-right", "fa-caret-square-o-up", "fa-caret-up", "fa-cart-arrow-down", "fa-cart-plus", "fa-cc", "fa-cc-amex", "fa-cc-diners-club", "fa-cc-discover", "fa-cc-jcb", "fa-cc-mastercard", "fa-cc-paypal", "fa-cc-stripe", "fa-cc-visa", "fa-certificate", "fa-chain", "fa-chain-broken", "fa-check", "fa-check-circle", "fa-check-circle-o", "fa-check-square", "fa-check-square-o", "fa-chevron-circle-down", "fa-chevron-circle-left", "fa-chevron-circle-right", "fa-chevron-circle-up", "fa-chevron-down", "fa-chevron-left", "fa-chevron-right", "fa-chevron-up", "fa-child", "fa-chrome", "fa-circle", "fa-circle-o", "fa-circle-o-notch", "fa-circle-thin", "fa-clipboard", "fa-clock-o", "fa-clone", "fa-close", "fa-cloud", "fa-cloud-download", "fa-cloud-upload", "fa-cny", "fa-code", "fa-code-fork", "fa-codepen", "fa-codiepie", "fa-coffee", "fa-cog", "fa-cogs", "fa-columns", "fa-comment", "fa-comment-o", "fa-commenting", "fa-commenting-o", "fa-comments", "fa-comments-o", "fa-compass", "fa-compress", "fa-connectdevelop", "fa-contao", "fa-copy", "fa-copyright", "fa-creative-commons", "fa-credit-card", "fa-credit-card-alt", "fa-crop", "fa-crosshairs", "fa-css3", "fa-cube", "fa-cubes", "fa-cut", "fa-cutlery", "fa-dashboard", "fa-dashcube", "fa-database", "fa-deaf", "fa-deafness", "fa-dedent", "fa-delicious", "fa-desktop", "fa-deviantart", "fa-diamond", "fa-digg", "fa-dollar", "fa-dot-circle-o", "fa-download", "fa-dribbble", "fa-drivers-license", "fa-drivers-license-o", "fa-dropbox", "fa-drupal", "fa-edge", "fa-edit", "fa-eercast", "fa-eject", "fa-ellipsis-h", "fa-ellipsis-v", "fa-empire", "fa-envelope", "fa-envelope-o", "fa-envelope-open", "fa-envelope-open-o", "fa-envelope-square", "fa-envira", "fa-eraser", "fa-etsy", "fa-eur", "fa-euro", "fa-exchange", "fa-exclamation", "fa-exclamation-circle", "fa-exclamation-triangle", "fa-expand", "fa-expeditedssl", "fa-external-link", "fa-external-link-square", "fa-eye", "fa-eye-slash", "fa-eyedropper", "fa-fa", "fa-facebook", "fa-facebook-f", "fa-facebook-official", "fa-facebook-square", "fa-fast-backward", "fa-fast-forward", "fa-fax", "fa-feed", "fa-female", "fa-fighter-jet", "fa-file", "fa-file-archive-o", "fa-file-audio-o", "fa-file-code-o", "fa-file-excel-o", "fa-file-image-o", "fa-file-movie-o", "fa-file-o", "fa-file-pdf-o", "fa-file-photo-o", "fa-file-picture-o", "fa-file-powerpoint-o", "fa-file-sound-o", "fa-file-text", "fa-file-text-o", "fa-file-video-o", "fa-file-word-o", "fa-file-zip-o", "fa-files-o", "fa-film", "fa-filter", "fa-fire", "fa-fire-extinguisher", "fa-firefox", "fa-first-order", "fa-flag", "fa-flag-checkered", "fa-flag-o", "fa-flash", "fa-flask", "fa-flickr", "fa-floppy-o", "fa-folder", "fa-folder-o", "fa-folder-open", "fa-folder-open-o", "fa-font", "fa-font-awesome", "fa-fonticons", "fa-fort-awesome", "fa-forumbee", "fa-forward", "fa-foursquare", "fa-free-code-camp", "fa-frown-o", "fa-futbol-o", "fa-gamepad", "fa-gavel", "fa-gbp", "fa-ge", "fa-gear", "fa-gears", "fa-genderless", "fa-get-pocket", "fa-gg", "fa-gg-circle", "fa-gift", "fa-git", "fa-git-square", "fa-github", "fa-github-alt", "fa-github-square", "fa-gitlab", "fa-gittip", "fa-glass", "fa-glide", "fa-glide-g", "fa-globe", "fa-google", "fa-google-plus", "fa-google-plus-circle", "fa-google-plus-official", "fa-google-plus-square", "fa-google-wallet", "fa-graduation-cap", "fa-gratipay", "fa-grav", "fa-group", "fa-h-square", "fa-hacker-news", "fa-hand-grab-o", "fa-hand-lizard-o", "fa-hand-o-down", "fa-hand-o-left", "fa-hand-o-right", "fa-hand-o-up", "fa-hand-paper-o", "fa-hand-peace-o", "fa-hand-pointer-o", "fa-hand-rock-o", "fa-hand-scissors-o", "fa-hand-spock-o", "fa-hand-stop-o", "fa-handshake-o", "fa-hard-of-hearing", "fa-hashtag", "fa-hdd-o", "fa-header", "fa-headphones", "fa-heart", "fa-heart-o", "fa-heartbeat", "fa-history", "fa-home", "fa-hospital-o", "fa-hotel", "fa-hourglass", "fa-hourglass-1", "fa-hourglass-2", "fa-hourglass-3", "fa-hourglass-end", "fa-hourglass-half", "fa-hourglass-o", "fa-hourglass-start", "fa-houzz", "fa-html5", "fa-i-cursor", "fa-id-badge", "fa-id-card", "fa-id-card-o", "fa-ils", "fa-image", "fa-imdb", "fa-inbox", "fa-indent", "fa-industry", "fa-info", "fa-info-circle", "fa-inr", "fa-instagram", "fa-institution", "fa-internet-explorer", "fa-intersex", "fa-ioxhost", "fa-italic", "fa-joomla", "fa-jpy", "fa-jsfiddle", "fa-key", "fa-keyboard-o", "fa-krw", "fa-language", "fa-laptop", "fa-lastfm", "fa-lastfm-square", "fa-leaf", "fa-leanpub", "fa-legal", "fa-lemon-o", "fa-level-down", "fa-level-up", "fa-life-bouy", "fa-life-buoy", "fa-life-ring", "fa-life-saver", "fa-lightbulb-o", "fa-line-chart", "fa-link", "fa-linkedin", "fa-linkedin-square", "fa-linode", "fa-linux", "fa-list", "fa-list-alt", "fa-list-ol", "fa-list-ul", "fa-location-arrow", "fa-lock", "fa-long-arrow-down", "fa-long-arrow-left", "fa-long-arrow-right", "fa-long-arrow-up", "fa-low-vision", "fa-magic", "fa-magnet", "fa-mail-forward", "fa-mail-reply", "fa-mail-reply-all", "fa-male", "fa-map", "fa-map-marker", "fa-map-o", "fa-map-pin", "fa-map-signs", "fa-mars", "fa-mars-double", "fa-mars-stroke", "fa-mars-stroke-h", "fa-mars-stroke-v", "fa-maxcdn", "fa-meanpath", "fa-medium", "fa-medkit", "fa-meetup", "fa-meh-o", "fa-mercury", "fa-microchip", "fa-microphone", "fa-microphone-slash", "fa-minus", "fa-minus-circle", "fa-minus-square", "fa-minus-square-o", "fa-mixcloud", "fa-mobile", "fa-mobile-phone", "fa-modx", "fa-money", "fa-moon-o", "fa-mortar-board", "fa-motorcycle", "fa-mouse-pointer", "fa-music", "fa-navicon", "fa-neuter", "fa-newspaper-o", "fa-object-group", "fa-object-ungroup", "fa-odnoklassniki", "fa-odnoklassniki-square", "fa-opencart", "fa-openid", "fa-opera", "fa-optin-monster", "fa-outdent", "fa-pagelines", "fa-paint-brush", "fa-paper-plane", "fa-paper-plane-o", "fa-paperclip", "fa-paragraph", "fa-paste", "fa-pause", "fa-pause-circle", "fa-pause-circle-o", "fa-paw", "fa-paypal", "fa-pencil", "fa-pencil-square", "fa-pencil-square-o", "fa-percent", "fa-phone", "fa-phone-square", "fa-photo", "fa-picture-o", "fa-pie-chart", "fa-pied-piper", "fa-pied-piper-alt", "fa-pied-piper-pp", "fa-pinterest", "fa-pinterest-p", "fa-pinterest-square", "fa-plane", "fa-play", "fa-play-circle", "fa-play-circle-o", "fa-plug", "fa-plus", "fa-plus-circle", "fa-plus-square", "fa-plus-square-o", "fa-podcast", "fa-power-off", "fa-print", "fa-product-hunt", "fa-puzzle-piece", "fa-qq", "fa-qrcode", "fa-question", "fa-question-circle", "fa-question-circle-o", "fa-quora", "fa-quote-left", "fa-quote-right", "fa-ra", "fa-random", "fa-ravelry", "fa-rebel", "fa-recycle", "fa-reddit", "fa-reddit-alien", "fa-reddit-square", "fa-refresh", "fa-registered", "fa-remove", "fa-renren", "fa-reorder", "fa-repeat", "fa-reply", "fa-reply-all", "fa-resistance", "fa-retweet", "fa-rmb", "fa-road", "fa-rocket", "fa-rotate-left", "fa-rotate-right", "fa-rouble", "fa-rss", "fa-rss-square", "fa-rub", "fa-ruble", "fa-rupee", "fa-s15", "fa-safari", "fa-save", "fa-scissors", "fa-scribd", "fa-search", "fa-search-minus", "fa-search-plus", "fa-sellsy", "fa-send", "fa-send-o", "fa-server", "fa-share", "fa-share-alt", "fa-share-alt-square", "fa-share-square", "fa-share-square-o", "fa-shekel", "fa-sheqel", "fa-shield", "fa-ship", "fa-shirtsinbulk", "fa-shopping-bag", "fa-shopping-basket", "fa-shopping-cart", "fa-shower", "fa-sign-in", "fa-sign-language", "fa-sign-out", "fa-signal", "fa-signing", "fa-simplybuilt", "fa-sitemap", "fa-skyatlas", "fa-skype", "fa-slack", "fa-sliders", "fa-slideshare", "fa-smile-o", "fa-snapchat", "fa-snapchat-ghost", "fa-snapchat-square", "fa-snowflake-o", "fa-soccer-ball-o", "fa-sort", "fa-sort-alpha-asc", "fa-sort-alpha-desc", "fa-sort-amount-asc", "fa-sort-amount-desc", "fa-sort-asc", "fa-sort-desc", "fa-sort-down", "fa-sort-numeric-asc", "fa-sort-numeric-desc", "fa-sort-up", "fa-soundcloud", "fa-space-shuttle", "fa-spinner", "fa-spoon", "fa-spotify", "fa-square", "fa-square-o", "fa-stack-exchange", "fa-stack-overflow", "fa-star", "fa-star-half", "fa-star-half-empty", "fa-star-half-full", "fa-star-half-o", "fa-star-o", "fa-steam", "fa-steam-square", "fa-step-backward", "fa-step-forward", "fa-stethoscope", "fa-sticky-note", "fa-sticky-note-o", "fa-stop", "fa-stop-circle", "fa-stop-circle-o", "fa-street-view", "fa-strikethrough", "fa-stumbleupon", "fa-stumbleupon-circle", "fa-subscript", "fa-subway", "fa-suitcase", "fa-sun-o", "fa-superpowers", "fa-superscript", "fa-support", "fa-table", "fa-tablet", "fa-tachometer", "fa-tag", "fa-tags", "fa-tasks", "fa-taxi", "fa-telegram", "fa-television", "fa-tencent-weibo", "fa-terminal", "fa-text-height", "fa-text-width", "fa-th", "fa-th-large", "fa-th-list", "fa-themeisle", "fa-thermometer", "fa-thermometer-0", "fa-thermometer-1", "fa-thermometer-2", "fa-thermometer-3", "fa-thermometer-4", "fa-thermometer-empty", "fa-thermometer-full", "fa-thermometer-half", "fa-thermometer-quarter", "fa-thermometer-three-quarters", "fa-thumb-tack", "fa-thumbs-down", "fa-thumbs-o-down", "fa-thumbs-o-up", "fa-thumbs-up", "fa-ticket", "fa-times", "fa-times-circle", "fa-times-circle-o", "fa-times-rectangle", "fa-times-rectangle-o", "fa-tint", "fa-toggle-down", "fa-toggle-left", "fa-toggle-off", "fa-toggle-on", "fa-toggle-right", "fa-toggle-up", "fa-trademark", "fa-train", "fa-transgender", "fa-transgender-alt", "fa-trash", "fa-trash-o", "fa-tree", "fa-trello", "fa-tripadvisor", "fa-trophy", "fa-truck", "fa-try", "fa-tty", "fa-tumblr", "fa-tumblr-square", "fa-turkish-lira", "fa-tv", "fa-twitch", "fa-twitter", "fa-twitter-square", "fa-umbrella", "fa-underline", "fa-undo", "fa-universal-access", "fa-university", "fa-unlink", "fa-unlock", "fa-unlock-alt", "fa-unsorted", "fa-upload", "fa-usb", "fa-usd", "fa-user", "fa-user-circle", "fa-user-circle-o", "fa-user-md", "fa-user-o", "fa-user-plus", "fa-user-secret", "fa-user-times", "fa-users", "fa-vcard", "fa-vcard-o", "fa-venus", "fa-venus-double", "fa-venus-mars", "fa-viacoin", "fa-viadeo", "fa-viadeo-square", "fa-video-camera", "fa-vimeo", "fa-vimeo-square", "fa-vine", "fa-vk", "fa-volume-control-phone", "fa-volume-down", "fa-volume-off", "fa-volume-up", "fa-warning", "fa-wechat", "fa-weibo", "fa-weixin", "fa-whatsapp", "fa-wheelchair", "fa-wheelchair-alt", "fa-wifi", "fa-wikipedia-w", "fa-window-close", "fa-window-close-o", "fa-window-maximize", "fa-window-minimize", "fa-window-restore", "fa-windows", "fa-won", "fa-wordpress", "fa-wpbeginner", "fa-wpexplorer", "fa-wpforms", "fa-wrench", "fa-xing", "fa-xing-square", "fa-y-combinator", "fa-y-combinator-square", "fa-yahoo", "fa-yc", "fa-yc-square", "fa-yelp", "fa-yen", "fa-yoast", "fa-youtube", "fa-youtube-play", "fa-youtube-square"];
	}
	$(".trigger").click(function() {
		fa = !fa;
		if(fa){
			$(".trigger").text("[ 当前特效：🎬 ]");
		}else{
			$(".trigger").text("[ 当前特效：❄ ]");
		}
	});

	</script> -->

</body>
</html>