<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<title>购物车页面</title>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>/basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/cartstyle.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>/css/optstyle.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript" src="<%=basePath%>/js/jquery.js"></script>
 <script type="text/javascript">
    if("${arr }"==""){
	      location.href = "<%=basePath%>/ShopcartServlet?type=all";
    }
 </script>
</head>
 

<body>

	<%@ include file="top.jsp" %>

	<div class="clear"></div>

	<!--购物车 -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th">
				<div class="wp">
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
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
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
          <form action="<%=basePath%>/CheckoutServlet?type=outarr" id="out" method="post">
			<tr class="item-list">
				<div class="bundle  bundle-last ">
					<div class="clear"></div>
					<div class="bundle-main">
					  <c:forEach var="item" items="${arr }">
						<ul class="item-content clearfix">
					       <input type="hidden" name="sc_id" value="${item.id }">
							<li class="td td-chk">
								<div class="cart-checkbox ">
									<input class="check" id="J_CheckBox_170037950254" name="items[]" 
									type="checkbox" value="${item.id }">
								    <label for="J_CheckBox_170037950254"></label>
								</div>
							</li>
							<li class="td td-item">
								<div class="item-pic">
									<a href="#" target="_blank"
										data-title=""
										class="J_MakePoint" data-point="tbcart.8.12"> <img
										src="<%=basePath%>/${item.commodity.s_url }"
										class="itempic J_ItemImg"></a>
								</div>
								<div class="item-info">
									<div class="item-basic-info">
										<a href="#" target="_blank" title=""
											class="item-title J_MakePoint" data-point="tbcart.8.11">${item.commodity.s_name }</a>
									</div>
								</div>
							</li>
							<li class="td td-info">
								<div class="item-props item-props-can">
								</div>
							</li>
							<li class="td td-price">
								<div class="item-price price-promo-promo">
									<div class="price-content">
										<div class="price-line">
											<em class="J_Price price-now" name="s_price" tabindex="0">${item.commodity.s_price }</em>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-amount">
								<div class="amount-wrapper ">
									<div class="item-amount ">
										<div class="sl">
											<input class="min am-btn" name="" type="button" value="-" />
											<input class="text_box" name="sc_number" type="text" value="${item.sc_number }" style="width: 30px;" /> 
											<input class="add am-btn" name="" type="button" value="+" />
										</div>
									</div>
								</div>
							</li>
							<li class="td td-sum">
								<div class="td-inner">
									<em tabindex="0" name="sc_price" class="J_ItemSum number">${item.sc_price }</em>
								</div>
							</li>
							<li class="td td-op">
								<div class="td-inner">
									<a title="移入收藏夹" class="btn-fav" href="#"> 移入收藏夹</a> 
									<a data-point-url="#" class="delete"> 删除</a>
								</div>
							</li>
						</ul>
                       </c:forEach>
					</div>
				</div>
			</tr>
			</form>
			<div class="clear"></div>

		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all check" id="J_SelectAllCbx2"
						name="select-all" value="true" type="checkbox"> <label
						for="J_SelectAllCbx2"></label>
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a> <a href="#"
					hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="J_SelectedItemsCount">0</em><span
						class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="price">¥<em
						id="J_Total">0</em></strong>
				</div>
				<div class="btn-area">
					<a id="J_Go" class="submit-btn submit-btn-disabled"
						aria-label="请注意如果没有选择宝贝，将无法结算"> <span>结&nbsp;算</span></a>
				</div>
			</div>

		</div>
		<script type="text/javascript">
			</script>

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
	<script type="text/javascript">
		//记录第一次数量框值;
	var number_first;
	$("[name='number']").focus(function() {
		number_first = this.value;
	});

	$('[value="+"]').click(function () {
		//找到数量文本框，并将数量文本框数量+1
		var number = $(this).prev().val();
		//获取改变之前的价格
		var pre_price = count($(this),number);
		//设置新值（数量+1）
		$(this).prev().val(++number);
		var next_price = count($(this),number);
		//修改总价格
		change_total(this,pre_price,next_price);
		//异步提交修改值
		var c_id = $(this).parents("ul").find("[name='sc_id']").val();
		$.post("ShopcartServlet",{"type":"upd","sc_id":c_id,"sc_number":number,"sc_price":next_price},function(data){
			alert(data);
		});
	});
	$('[value="-"]').click(function () {
		//找到数量文本框，并将数量文本框数量+1
		var number = $(this).next().val();
		if(Number(number) <= 1) return;
		//获取改变之前的价格
		var pre_price = count($(this),number);
		//设置新值（数量+1）
		$(this).next().val(--number);
		var next_price = count($(this),number);
		change_total(this,pre_price,next_price);
		//异步提交司改结果
		var c_id = $(this).parents("ul").find("[name='sc_id']").val();
		$.post("ShopcartServlet",{"type":"upd","sc_id":c_id,"sc_number":number,"sc_price":next_price},function(data){
			alert(data);
		});
	});
	
	//当文本框发生改变时，执行计算总价
	$("[name='sc_number']").blur(function () {
		var reg = /^[1-9][0-9]*$/;
		var number = this.value;
		//匹配正则
		if(!reg.test(number)){
			this.value = number_first;
		}
		if(number == ""){
			number = 1;
			this.value = number;
		}
		var pre_price = $(this).parents("ul").find("[name='sc_price']").text();
		var next_price = count($(this),number);
		change_total(this,pre_price,next_price);
		//异步提交司改结果
		var c_id = $(this).parents("ul").find("[name='sc_id']").val();
		$.post("ShopcartServlet",{"type":"upd","sc_id":c_id,"sc_number":number,"sc_price":next_price},function(data){
			alert(data);
		});
	});
	//当文本数量发生改变时，改变总价格
	function change_total(element,pre_price,next_price) {
		//判断是否被选中
		if($(element).parents('ul').find('[name="items[]"]')[0].checked){
			total_price -= Number(pre_price);
			total_price += Number(next_price);
			$("#J_Total").text(total_price);
		}
	}
	//计算单个总价(当前元素--element,val---数量) 总价=数量*单价
	function count(element,number) {
		//获取单价---总价格=单价*数量
		//通过父元素找子元素	
		var price = $(element.parents("ul").find("[name='s_price']")).text();
		$(element.parents("ul").find("[name='sc_price']")).text(price*number);
		//当前总价格返回
		return $(element.parents("ul").find("[name='sc_price']")).text();
	}
	
	
	//计算结算总价
	var total_price = 0;
	var number = 0;
	$("[name='items[]']").change(function() {
		var price = Number($(this).parents("ul").find("[name='sc_price']").text());		
		if(this.checked){
			number++;
			total_price += price;
		}else{
			number--;
			total_price -= price;
		}
		$("#J_Total").text(total_price);
		$("#J_SelectedItemsCount").text(number);
		$("#J_SelectAllCbx2").attr("checked",true);
		$("[name='items[]']").each(function () {
			if(!this.checked) $("#J_SelectAllCbx2").attr("checked",false);
		});
	});
	//全选
	$("#J_SelectAllCbx2").change(function() {
		if(this.checked){
			$("[name='items[]']").each(function() {
				//判断复选框没有被选中
				if(!this.checked){
					//改变复选框状态
					this.checked = true;
					$(this).change();
				}
			});
		}else{
			$("[name='items[]']").each(function () {
				if(this.checked) {
					this.checked = false;
					$(this).change();
				}
			});
		}
	});
	
	$("#J_Go").click(function() {
		var total = Number($("#J_Total").text());
		if (total>0) {
			if(confirm("请问是否购买")){
				$("#out").submit();
			}
		}else {
			alert("请先选择商品");
		}
		s
	});
	var del;
	$(".delete").click(function() {
		del = $(this).parents("ul");
		var sc_id = del.find("[name='sc_id']").val();
		alert(sc_id);
		if(confirm("是否确认删除")){
			$.post("ShopcartServlet",{"type":"del","sc_id":sc_id},function(data){
				alert(data);
				del.remove();
			});
		}
	});
	
	//删多条
	$(".deleteAll").click(function() {
		var total = Number($("#J_Total").text());
		if (total>0) {
			if(confirm("请问是否删除")){
				$("#outarr").submit();
			}
		}else {
			alert("请先选择商品");
		}
	});
	</script>

</body>

</html>