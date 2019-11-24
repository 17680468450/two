<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head lang="en">
<meta charset="UTF-8">
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"
			+request.getServerName()+":"
			+request.getServerPort()+path+"/";

%>

<link rel="stylesheet"
	href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
<link href="<%=basePath%>/css/dlstyle.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>

<body>

	<div class="login-boxtitle">
		<a href="../HomeServlet"><img alt="" src="<%=basePath%>/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img src="<%=basePath%>/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a></li>
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form method="post">

								<div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i></label> <input
										type="email" name="" id="email" placeholder="请输入邮箱账号">
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="" id="password" placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="" id="passwordRepeat"
										placeholder="确认密码">
								</div>
							</form>

							<div class="login-links">
								<label for="reader-me"> <input id="reader-me"
									type="checkbox"> 点击表示您同意商城《服务协议》
								</label>
							</div>
							<div class="am-cf">
								<input type="submit" name="login" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl" disabled="disabled">
							</div>
							<!-- 邮箱验证 -->
							<script type="text/javascript">
									$("#email").blur(function () {
										var reg = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}$/;
										var email = $(this).val();
										if(!reg.test(email)){
											$(this).css("border","1px solid red");
											$(this).val("");
											$(this).attr("placeholder", "请输入正确的邮箱");
										}else{
											$(this).css("border","1px solid #fff");
										}
									});
									//设置密码
									$("#password").blur(function () {
										var password = $("#password").val();
										var passwordRepeat = $("#passwordRepeat").val();
										if(passwordRepeat != password){
											$("#passwordRepeat").val("");
											$("#passwordRepeat").css("border","1px solid red");
											$("#passwordRepeat").attr("placeholder", "两次输入密码不相同");
										}else{
											$(this).css("border","1px solid #fff");
										}
									});
									//确认密码框
									$("#passwordRepeat").blur(function () {
										var password = $("#password").val();
										var passwordRepeat = $("#passwordRepeat").val();
										if(passwordRepeat != password){
											$("#passwordRepeat").val("");
											$("#passwordRepeat").css("border","1px solid red");
											$("#passwordRepeat").attr("placeholder", "两次输入密码不相同");
										}else{
											$(this).css("border","1px solid #fff");
										}
									});
									//协议按钮
									$("#reader-me").change(function () {
										var email = $("#email").val();
										var pwd = $("#passwordRepeat").val();
											if((email != "" && pwd != "") && this.checked){
												$("[name='login']").removeAttr("disabled");
												$("[name='login']").click(function () {
													var email = $("#email").val();
													var pwd = $("#passwordRepeat").val();
													$.post("<%=basePath%>/SubmitServlet",
															{"type":"email","email":email,"pwd":pwd},function(date){
																if (date == "") {
																	alert("注册成功！");
																	location.href = "login.jsp";
																}else {
																	alert(date);
																}
															});
												});
											}else {
												$("[name='login']").attr("disabled","");
											}
									});
								</script>
						</div>

						<div class="am-tab-panel">
							<form method="post">
								<div class="user-phone">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i></label> <input type="tel"
										name="" id="phone" placeholder="请输入手机号">
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i></label> <input
										type="tel" name="" id="code" placeholder="请输入验证码"> <a
										class="btn" href="javascript:void(0);"
										onclick="sendMobileCode();" id="sendMobileCode"> <span
										id="dyMobileButton">获取</span></a>
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="passwordphone" id="password" placeholder="设置密码">
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="passwordRepeatphone" id="passwordRepeat"
										placeholder="确认密码">
								</div>
							</form>
							<div class="login-links">
								<label for="reader-me"> <input id="reader-mr"
									type="checkbox"> 点击表示您同意商城《服务协议》
								</label>
							</div>
							<div class="am-cf">
								<input type="submit" name="phonelog" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl" disabled="disabled">
							</div>
							<!-- 手机注册 -->
							<script type="text/javascript">
								//手机号码文本框
								$("#phone").blur(function () {
									var reg = /0?(13|14|15|18|17)[0-9]{9}$/;
									var phone = $("#phone").val();
									if(!reg.test(phone)){
										$("#phone").val("");
										$("#phone").css("border","1px solid red");
										$("#phone").attr("placeholder","请输入正确的手机号码");
									}else {
										$(this).css("border","1px solid #fff");
									}
								});
								
								//设置密码
								$("[name = 'passwordphone']").blur(function () {
									var password = $("[name = 'passwordphone']").val();
									var passwordRepeat = $("[name = 'passwordRepeatphone']").val();
									if(passwordRepeat != password){
										$("[name = 'passwordRepeatphone']").val("");
										$("[name = 'passwordRepeatphone']").css("border","1px solid red");
										$("[name = 'passwordRepeatphone']").attr("placeholder", "两次输入密码不相同");
									}else{
										$(this).css("border","1px solid #fff");
									}
								});
								//确认密码框
								$("[name = 'passwordRepeatphone']").blur(function () {
									var password = $("[name = 'passwordphone']").val();
									var passwordRepeat = $("[name = 'passwordRepeatphone']").val();
									if(passwordRepeat != password){
										$("[name = 'passwordRepeatphone']").val("");
										$("[name = 'passwordRepeatphone']").css("border","1px solid red");
										$("[name = 'passwordRepeatphone']").attr("placeholder", "两次输入密码不相同");
									}else{
										$(this).css("border","1px solid #fff");
									}
								});
								
								 var sms = "";
								 $("#dyMobileButton").click(function () {
									 var phone = $("#phone").val();
									$.post("<%=basePath%>/SendSmsServlet",{"phone":phone},function(date){
										//将验证码赋值给sms	
										sms = date;
									});
								});
								 $("#reader-mr").change(function () {
									 var phone1 = $("#phone").val();
									 var code1 = $("#code").val();
									 var pwd1 = $("[name='passwordRepeatphone']").val();
									 if((phone1 != "" && code1 != "" && pwd1 != "") && this.checked){
										 $("[name = 'phonelog']").removeAttr("disabled");
										 $("[name = 'phonelog']").click(function () {
												//获取验证码框
												var code = $("#code").val();
												if(code == ""){
													$("#code").css("border","1px solid red");
													$("#code").attr("placeholder","请输入验证码");
												}else {
													if (sms == code) {
														var phone = $("#phone").val();
														var pwd = $("[name='passwordRepeatphone']").val();
														$.post("<%=basePath%>/SubmitServlet",
																{"type":"phone","phone":phone,"pwd":pwd},function(date){
																	if (date == "") {
																		alert("注册成功！");
																		location.href = "login.jsp";
																	}else {
																		alert(date);
																	}
																});
													}else {
													$("#code").css("border","1px solid red");
														$("#code").attr("placeholder","验证码有误");
													};
												};
											});
									 }else {
										 $("[name = 'phonelog']").attr("disabled","");
									}
								});
							</script>
							<hr>
						</div>

						<script>
							$(function() {
								$('#doc-my-tabs').tabs();
							})
						</script>

					</div>
				</div>

			</div>
		</div>

		<div class="footer ">
			<div class="footer-hd ">
				<p style="text-align: center;">
					<b>|</b> <a href="../HomeServlet">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b>
					<a href="# ">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p>

					<a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em
						style="text-align: center;">© 2015-2025 zking 版权所有</em>
				</p>
			</div>
		</div>
</body>

</html>