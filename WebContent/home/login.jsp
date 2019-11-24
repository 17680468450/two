<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
</head>
<%
	String r_user = "";
	String r_password = "";
			
	Cookie[] cookies = request.getCookies();
	//遍历
	for(Cookie cookie:cookies){
		if("user".equals(cookie.getName())){
			r_user = cookie.getValue();
			
		}
		if("password".equals(cookie.getName())){ 
			r_password = cookie.getValue();
		}
	}
	if(r_password.equals("")){
		request.setAttribute("temp", "0");
	}
	request.setAttribute("r_user", r_user);
	
	request.setAttribute("r_password", r_password);
%>

<script type="text/javascript">
	$(function () {
		$("[name=u_account]").val("${r_user}");
		$("[name=u_pwd]").val("${r_password}");
		
		if("${temp}"!="0"){
		$("[name=comfig]").attr("checked",true)
		}
	});

</script>

<body>

	<div class="login-boxtitle">
		<a href="../HomeServlet"><img alt="logo" src="../images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="../images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form action="../LoginServlet" method="post">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> 
							<input type="text" name="u_account" id="user" placeholder="邮箱/手机/用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> 
							<input type="password" name="u_pwd" id="password" placeholder="请输入密码">
						</div>
					
				</div>

				<div class="login-links">
					<label for="remember-me">
					<input id="remember-me" type="checkbox" name="comfig" >记住密码</label>
						<a href="#" class="am-fr">忘记密码</a> 
						<a href="register.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
					
				</div>
				<div class="am-cf">
					<input type="submit" name="log" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
				</div>
				</form>
				<div class="partner">
					<h3>合作账号</h3>
					<div class="am-btn-group">
						<li><a href="#"><i class="am-icon-qq am-icon-sm"></i><span>QQ登录</span></a></li>
						<li><a href="#"><i class="am-icon-weibo am-icon-sm"></i><span>微博登录</span>
						</a></li>
						<li><a href="#"><i class="am-icon-weixin am-icon-sm"></i><span>微信登录</span>
						</a></li>
					</div>
				</div>

			</div>
		</div>
	</div>


	<div class="footer ">
		<div class="footer-hd ">
			<p>

				<b>|</b> <a href="../HomeServlet">商城首页</a> <b>|</b> <a href="# ">支付宝</a> <b>|</b>
				<a href="# ">物流</a>
			</p>
		</div>
		<div class="footer-bd ">
			<p style="text-align: center;">
				<a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a href="# ">网站地图</a> <em>©
					2015-2025 zking 版权所有</em>
			</p>
		</div>
	</div>
			<c:if test="${!empty login}">
			<!-- 出错显示的信息框 -->
		  	<div class="alert alert-warning alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" >
			  	<span>&times;</span>
			  </button>
			   <strong>${login}</strong>
			</div>
		</c:if>
  	</div>
</body>
 <script type="text/javascript">
    </script>
</html>