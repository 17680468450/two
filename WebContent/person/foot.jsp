<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<title>我的足迹</title>

<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="<%=basePath %>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=basePath %>/css/footstyle.css" rel="stylesheet" type="text/css">

</head>

<body>
	<!--头 -->
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<%@ include file="top.jsp" %>
		<div class="clear"></div>
	</div>
	</div>
	</article> </header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index"><a href="#">首页</a></li>
				<li class="qc"><a href="#">闪购</a></li>
				<li class="qc"><a href="#">限时抢</a></li>
				<li class="qc"><a href="#">团购</a></li>
				<li class="qc last"><a href="#">大包装</a></li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-foot">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">我的足迹</strong> / <small>Browser&nbsp;History</small>
						</div>
					</div>
					<hr />

					<!--足迹列表 -->
                  <c:forEach var="item" items="${arr }">
					<div class="goods">
					<!--  
						<div class="goods-date" data-date="2015-12-21">
							<s class="line"></s>
						</div>
                    -->
						<div class="goods-box">
							<div class="goods-pic">
								<div class="goods-pic-box">
									<a class="goods-pic-link" target="_blank" href="InformationServlet?s_id=${item.commodity.s_id }"
										title="${item.commodity.s_name }"> <img
										src="<%=basePath %>/${item.commodity.s_url }" class="goods-img"></a>
								</div>
								<a class="goods-delete" href="javascript:void(0);"><i
									class="am-icon-trash"></i></a>
							</div>

							<div class="goods-attr">
								<div class="good-title">
									<a class="title" href="InformationServlet?s_id=${item.commodity.s_id }" target="_blank">${item.commodity.s_name }</a>
								</div>
								<div class="goods-price">
									<span class="g_price"> <span>¥</span><strong>${item.commodity.s_price }</strong>
									</span>
								</div>
								<div class="clear"></div>
								<div class="goods-num">
									<div class="match-recom">
										<a href="SeekServlet?type=sort&&s_three_id=${item.commodity.s_three_id }" class="match-recom-item">找相似</a> <i><em></em><span></span></i>
									</div>
								</div>
							</div>
						</div>
					</div>
                  </c:forEach>


				</div>
			</div>

			<!--底部-->
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

		<aside class="menu">
		<ul>
			<li class="person active"><a href="index.jsp"><i
					class="am-icon-user"></i>个人中心</a></li>
			<li class="person">
				<p>
					<i class="am-icon-newspaper-o"></i>个人资料
				</p>
				<ul>
					<li><a href="information.jsp">个人信息</a></li>
					<li><a href="safety.jsp">安全设置</a></li>
					<li><a href="address.jsp">地址管理</a></li>
					<li><a href="cardlist.jsp">快捷支付</a></li>
				</ul>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-balance-scale"></i>我的交易
				</p>
				<ul>
					<li><a href="order.jsp">订单管理</a></li>
					<li><a href="change.jsp">退款售后</a></li>
					<li><a href="comment.jsp">评价商品</a></li>
				</ul>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-dollar"></i>我的资产
				</p>
				<ul>
					<li><a href="points.jsp">我的积分</a></li>
					<li><a href="coupon.jsp">优惠券 </a></li>
					<li><a href="bonus.jsp">红包</a></li>
					<li><a href="walletlist.jsp">账户余额</a></li>
					<li><a href="bill.jsp">账单明细</a></li>
				</ul>
			</li>

			<li class="person">
				<p>
					<i class="am-icon-tags"></i>我的收藏
				</p>
				<ul>
					<li><a href="collection.jsp">收藏</a></li>
					<li><a href="foot.jsp">足迹</a></li>
				</ul>
			</li>

			<li class="person">
				<p>
					<i class="am-icon-qq"></i>在线客服
				</p>
				<ul>
					<li><a href="consultation.jsp">商品咨询</a></li>
					<li><a href="suggest.jsp">意见反馈</a></li>

					<li><a href="news.jsp">我的消息</a></li>
				</ul>
			</li>
		</ul>

		</aside>
	</div>

</body>

</html>