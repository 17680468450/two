<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>
<%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"
		  +request.getServerName()+":"
		  +request.getServerPort()+path;
		%>
<link rel="stylesheet" type="text/css"
	href="<%=basePath %>/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath %>/basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="<%=basePath %>/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>/basic/js/jquery-1.7.min.js"></script>

</head>

<body>


	<%@ include file="top.jsp" %>

	<div class="clear"></div>



	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>${ordertotal.t_price }</em></li>
					<div class="user-info">
						<p>收货人：${ordertotal.a_consigneename }</p>
						<p>联系电话：${ordertotal.a_phone }</p>
						<p>收货地址：${ordertotal.a_consigneeaddress }</p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
			</div>
		</div>
	</div>


	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">卓鼎教育</a> <b>|</b> <a href="<%=basePath %>/HomeServlet">商城首页</a> <b>|</b> <a
					href="#">支付宝</a> <b>|</b> <a href="#">物流</a>
			</p>
		</div>
		<div class="footer-bd">
			<p style="text-align: center;">
				<a href="#">合作伙伴</a> <a href="#">联系我们</a> <a href="#">网站地图</a> <em
					style="text-align: center;">© 2015-2025 zking 版权所有</em>
			</p>
		</div>
	</div>


</body>
</html>
