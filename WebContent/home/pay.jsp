<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>结算页面</title>
<%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"
		  +request.getServerName()+":"
		  +request.getServerPort()+path;
		%>

<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />

<link href="<%=basePath %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath %>/css/cartstyle.css" rel="stylesheet" type="text/css" />

<link href="<%=basePath %>/css/jsstyle.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=basePath %>/js/address.js"></script>

</head>

<body>

<%@ include file="top.jsp" %>

	<div class="clear"></div>
	<div class="concent">
		<!--地址 -->
		<div class="paycont">


			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">

							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>

						</div>
					</div>
					<div class="clear"></div>
                  
					<tr class="item-list">
						<div class="bundle  bundle-last">

							<div class="bundle-main">
							<c:forEach var="item" items="${orderall.oAbouts }">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="#" class="J_MakePoint"> <img
													src="<%=basePath %>/${item.commodity.s_url }"
													class="itempic J_ItemImg"></a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="#" class="item-title J_MakePoint"
														data-point="tbcart.8.11">${item.commodity.s_name }</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props">
											</div>
										</li>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<em class="J_Price price-now">${item.commodity.s_price }</em>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													<em class="J_Price price-now">${item.sc_number }</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${item.sc_price }</em>
										</div>
									</li>
								</ul>
								</c:forEach>
								<div class="clear"></div>

							</div>
					</tr>
					<div class="clear"></div>
				</div>

			</div>
			<div class="clear"></div>
			<div class="pay-total">
				<div class="clear"></div>
			</div>
			<!--含运费小计 -->
			<div class="buy-point-discharge ">
				<p class="price g_price ">
					合计<span>¥</span><em class="pay-sum">${orderall.oTotal.t_price }</em>
				</p>
			</div>

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> <span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red " id="J_ActualFee">${orderall.oTotal.t_price }</em>
							</span>
						</div>

						<div id="holyshit268" class="pay-address">

							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span>
								${address.a_consigneeaddress }
								</span> </span>
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> <span
									class="buy-address-detail"> <span class="buy-user">${address.a_consigneename }
								</span> <span class="buy-phone">${address.a_phone }</span>
								</span>
							</p>
						</div>
					</div>
					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
							<a id="J_Go" href="javascript:tijiao()" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单">提&nbsp;交</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</div>
	<div class="footer">
		<div class="footer-hd">
			<p>
				<a href="#">卓鼎教育</a> <b>|</b> <a href="#">商城首页</a> <b>|</b> <a
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
	</div>
	<div class="theme-popover-mask"></div>
	<div class="theme-popover">


	</div>

	<div class="clear"></div>
</body>

<script type="text/javascript">
	function tijiao() {
		if ("${address }"=="") {
			alert("请先设置地址");
		}else {
			location.href = "CheckoutServlet?type=pay&&o_bh=${orderall.oTotal.o_bh }";
		}
	}
</script>

</html>