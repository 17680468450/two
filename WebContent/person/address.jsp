<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>
		<%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"
		  +request.getServerName()+":"
		  +request.getServerPort()+path;
		%>

<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="<%=basePath%>/css/personal.css" rel="stylesheet" type="text/css">
<link href="<%=basePath%>/css/addstyle.css" rel="stylesheet" type="text/css">
<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>

<body>
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

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<c:forEach var="item" items="${arr }">
							<c:if test="${item.a_status == 1 }">
							<li class="user-addresslist defaultAddr">
								<span class="new-option-r">
								 <input type="hidden" name="a_id" value="${item.a_id }">
								 <input type="hidden" name="def" value="${item.a_id }">
									<i class="am-icon-check-circle"></i>默认地址
								</span>
										<p class="new-tit new-p-re">
											<span class="new-txt">${item.a_consigneename }</span>
											<span class="new-txt-rd2">${item.a_phone }</span>
										</p>
											<div class="new-mu_l2a new-p-re">
												<p class="new-mu_l2cw">
													<span class="title">地址：</span> ${item.a_consigneeaddress }
												</p>
											</div>
								<div class="new-addr-btn">
									 <a href="javascript:void(0);" onclick="delClick(this,${item.a_id });"><i class="am-icon-trash"></i>删除
									 </a>
								</div>
							</li>
							</c:if>
							<c:if test="${item.a_status == 0 }">
							<li class="user-addresslist">
								<span class="new-option-r">
								<input type="hidden" name="a_id" value="${item.a_id }">
								<input type="hidden" name="normal" value="${item.a_id }">
									<i class="am-icon-check-circle"></i>设为默认
						        </span>
							      		<p class="new-tit new-p-re">
											<span class="new-txt">${item.a_consigneename }</span>
											 <span class="new-txt-rd2">${item.a_phone }</span>
										</p>
											<div class="new-mu_l2a new-p-re">
												<p class="new-mu_l2cw">
													<span class="title">地址：</span> ${item.a_consigneeaddress }
												</p>
											</div>
								<div class="new-addr-btn">
									<a href="javascript:void(0);" onclick="delClick(this,${item.a_id });"> <i class="am-icon-trash"></i>删除
									</a>
								</div>
							</li>
								</c:if>
						</c:forEach>
					</ul>
					<script type="text/javascript">
					  function delClick(element,a_id) {
						location.href="SetAddressServlet?type=del&&a_id="+a_id;
					}
					</script>
					<script type="text/javascript">
				          $(".new-option-r").click(function() {
				        	  var a_id = $(this).children("[name='normal']").val();
						      var a_id2 = $("[name='def']").val();
						      location.href = "SetAddressServlet?type=setdef&&a_id="+a_id;
						});
				    </script>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--新增地址 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal" action="<%=basePath%>/AddressServlet" method="post">
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" placeholder="收货人" name="a_consigneename" value="${users.u_name }">
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" placeholder="手机号必填" type="tel" name="a_phone" value="${users.u_phone }">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
										    <select name="province" id="province">
												<option value="请选择">请选择</option>
											</select>
											<select name="city" id="city">
												<option value="请选择">请选择</option>
											</select>
											<select name="town" id="town">
												<option value="请选择">请选择</option>
											</select>
										</div>
									</div>
									
								
									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"
												placeholder="输入详细地址" name="a_consigneeaddress"></textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<input type="submit" class="am-btn am-btn-danger" value="保存"> <a
												href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>
				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>
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
	<script type="text/javascript" src="<%=basePath%>/js/area.js"></script>
    <script type="text/javascript"src="<%=basePath%>/js/select.js"></script>

</body>

</html>