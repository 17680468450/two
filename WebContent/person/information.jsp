<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>
		<%
		  String path = request.getContextPath();
		  String basePath = request.getScheme()+"://"
		  +request.getServerName()+":"
		  +request.getServerPort()+path;
		%>
         
		<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=basePath%>/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>

		<link rel="stylesheet" href="<%=basePath%>/css/laydate.css" />
		<script src="<%=basePath%>/js/jquery.min.js"></script>
		<script src="<%=basePath%>/js/laydate.js"></script>
		<style type="text/css">
			.select-date {
				font-family: "sta cartman"
			}
		</style>
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
         <%@ include file="top.jsp" %>
						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
		<!-- 分类 -->
		<div class="nav-table">
			<div class="long-title">
				<span class="all-goods">全部分类</span>
			</div>
			<div class="nav-cont">
				<ul>
					<li class="index">
						<a href="#">首页</a>
					</li>
					<li class="qc">
						<a href="#">闪购</a>
					</li>
					<li class="qc">
						<a href="#">限时抢</a>
					</li>
					<li class="qc">
						<a href="#">团购</a>
					</li>
					<li class="qc last">
						<a href="#">大包装</a>
					</li>
				</ul>
				<div class="nav-extra">
					<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i class="am-icon-angle-right" style="padding-left: 10px;"></i>
				</div>
			</div>
		</div>
		<b class="line"></b>
		<!-- 主体 -->
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf">
								<strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small>
							</div>
						</div>
						<hr />
                            <form class="am-form am-form-horizontal" action="<%=basePath%>/InformationServlet?type=user" method="post" enctype="multipart/form-data" >
						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<input type="file" name="wenjian" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp"  accept="image/*" value="123">
								<c:if test="${empty users.u_url }">
									<img src="<%=basePath %>/images/getAvatar.do.jpg">
								  </c:if>
								  <c:if test="${!empty users.u_url }">
									<img src="<%=basePath %>/${users.u_url }">
								  </c:if>
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div>
									<b>用户名：<i>${users.u_nickname}</i></b>
								</div>
								<div class="vip">
									<span></span>
									<a href="#">会员专享</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							
                                 <!-- 昵称 -->
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="nickname" name = "u_nickname" value="${users.u_nickname}">
										<small>昵称长度不能超过40个汉字</small>
									</div>
								</div>
                                  <!-- 姓名 -->
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="u_name" value="${users.u_name}">
									</div>
								</div>
								  <!-- 性别 -->
								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
										  <input type="radio"
										     name="radio10" id="male" value="male" data-am-ucheck> 男
									</label> 
									<label class="am-radio-inline">
									     <input type="radio"
										     name="radio10" value="female" data-am-ucheck id="female"> 女
									</label> 
									<label class="am-radio-inline"> 
									     <input type="radio"
										     name="radio10" value="secret" data-am-ucheck  id="secret"> 保密
									</label>
									</div>
								</div>
								<!-- 判断性别 -->
								<script type="text/javascript">
								   if ("${users.u_sex}" == "男") {
									$("#male").attr("checked","checked");
								}else if ("${users.u_sex}" == "女") {
									$("#female").attr("checked","checked");
								}else {
									$("#secret").attr("checked","checked");
								}
								</script>
                                  <!-- 生日 -->
								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="laydate-box" style="position: absolute; top: 380px; left: -20px;">
										<input type="text" id="laydateInput" placeholder="xxxx年xx月xx日" name="u_birth"value="${users.u_birth }"/>
										<img src="images/calendar.png" alt="" class="icon data-icon" />
										<div class="select-date">
											<div class="select-date-header">
												<ul class="heade-ul">
													<li class="header-item header-item-one">
														<select name="" id="yearList"></select>
													</li>
													<li class="header-item header-item-two" onselectstart="return false">
														<select name="" id="monthList"></select>
													</li>
													<li class="header-item header-item-three" onselectstart="return false">
														<span class="reback">回到今天</span>
													</li>
												</ul>
											</div>
											<div class="select-date-body">
												<ul class="week-list">
													<li>日</li>
													<li>一</li>
													<li>二</li>
													<li>三</li>
													<li>四</li>
													<li>五</li>
													<li>六</li>
												</ul>
												<ul class="day-tabel"></ul>
											</div>
										</div>
									</div>
									<!--<div class="am-form-content birth">
									<div class="birth-select">
										<select data-am-selected>
											<option value="a">2015</option>
											<option value="b">1987</option>
										</select> <em>年</em>
									</div>
									<div class="birth-select2">
										<select data-am-selected>
											<option value="a">12</option>
											<option value="b">8</option>
										</select> <em>月</em>
									</div>
									<div class="birth-select2">
										<select data-am-selected>
											<option value="a">21</option>
											<option value="b">23</option>
										</select> <em>日</em>
									</div>
								</div>-->

								</div>
								<!-- 电话 -->
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" placeholder="telephonenumber"  type="tel" name="u_phone" value="${users.u_phone }">
									</div>
								</div>
								<!-- 电子邮件 -->
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" placeholder="Email" type="email" name="u_email"value="${users.u_email }">
									</div>
								</div>
							    <!-- 保存信息 -->
								<div class="info-btn">
									<input type="submit" value="保存修改" class="am-btn am-btn-danger" id="bc">
								</div>

							</form>
						</div>

					</div>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">卓鼎教育</a> <b>|</b>
							<a href="#">商城首页</a> <b>|</b>
							<a href="#">支付宝</a> <b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p style="text-align: center;">
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a> <em style="text-align: center;">© 2015-2025 zking 版权所有</em>
						</p>
					</div>
				</div>
			</div>
               <!-- 边框 -->
			<aside class="menu">
				<ul>
					<li class="person active">
						<a href="index.jsp"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p>
							<i class="am-icon-newspaper-o"></i>个人资料
						</p>
						<ul>
							<li>
								<a href="information.jsp">个人信息</a>
							</li>
							<li>
								<a href="safety.jsp">安全设置</a>
							</li>
							<li>
								<a href="address.jsp">地址管理</a>
							</li>
							<li>
								<a href="cardlist.jsp">快捷支付</a>
							</li>
						</ul>
					</li>
					<li class="person">
						<p>
							<i class="am-icon-balance-scale"></i>我的交易
						</p>
						<ul>
							<li>
								<a href="order.jsp">订单管理</a>
							</li>
							<li>
								<a href="change.jsp">退款售后</a>
							</li>
							<li>
								<a href="comment.jsp">评价商品</a>
							</li>
						</ul>
					</li>
					<li class="person">
						<p>
							<i class="am-icon-dollar"></i>我的资产
						</p>
						<ul>
							<li>
								<a href="points.jsp">我的积分</a>
							</li>
							<li>
								<a href="coupon.jsp">优惠券 </a>
							</li>
							<li>
								<a href="bonus.jsp">红包</a>
							</li>
							<li>
								<a href="walletlist.jsp">账户余额</a>
							</li>
							<li>
								<a href="bill.jsp">账单明细</a>
							</li>
						</ul>
					</li>

					<li class="person">
						<p>
							<i class="am-icon-tags"></i>我的收藏
						</p>
						<ul>
							<li>
								<a href="collection.jsp">收藏</a>
							</li>
							<li>
								<a href="foot.jsp">足迹</a>
							</li>
						</ul>
					</li>

					<li class="person">
						<p>
							<i class="am-icon-qq"></i>在线客服
						</p>
						<ul>
							<li>
								<a href="consultation.jsp">商品咨询</a>
							</li>
							<li>
								<a href="suggest.jsp">意见反馈</a>
							</li>

							<li>
								<a href="news.jsp">我的消息</a>
							</li>
						</ul>
					</li>
				</ul>

			</aside>
		</div>
	</body>
<script type="text/javascript">
	    <!--表单验证 -->
	    $(function() {
			//遍历input元素
			var msg; //定义一个提示信息
			$.each($("input"),function(i, dom) {
				$(dom).blur(function (){
					$("#bc").removeAttr("disabled");
				 if($(dom).attr('name') == "u_email"){//邮箱
						//先清除
						$(".msgemail").remove();
						var email = $("#user-email").val();
						var regEmail = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/; //有效邮箱
						if(email == "" || email.trim() == "") {
							msg = "<span class='msgemail' style='color:red;'>邮箱不能为空</span>";
							$("#bc").attr("disabled","");
						} else if(!regEmail.test(email)) {
							msg = "<span class='msgemail' style='color:red;'>邮箱格式错误</span>";
							$("#bc").attr("disabled","disabled");
						} else {
							msg = "<span class='msgemail' style='color:green;'>ok</span>";
						}
						$(dom).parent().append(msg);
					}else if($(dom).attr('name') =="u_phone"){//电话
						//先清除
						$(".msgphone").remove();
						var phone= $("#user-phone").val();
						var regphone=/0?(13|14|15|18|17)[0-9]{9}/;
						if(phone == "" || phone.trim() == "") {
							msg = "<span class='msgphone' style='color:red;'>电话号码不能为空</span>";
							$("#bc").attr("disabled","disabled");
						} else if(!regphone.test(phone)) {
							msg = "<span class='msgphone' style='color:red;'>电话号码格式错误</span>";
							$("#bc").attr("disabled","disabled");
						} else {
							msg = "<span class='msgphone' style='color:green;'>ok</span>";
						}
						$(dom).parent().append(msg);
					}else if($(dom).attr('name') =="u_nickname"){//用户名
						//先清除
						$(".msgName").remove();
						var nickname= $("#user-name2").val();
						var regnickname=/[A-Za-z0-9_\-\u4e00-\u9fa5]+/;
						if(phone == "" || phone.trim() == "") {
							msg = "<span class='msgName' style='color:red;'>昵称不能为空</span>";
							$("#bc").attr("disabled","disabled");
						} else if(!regnickname.test(nickname)) {
							msg = "<span class='msgName' style='color:red;'>昵称格式错误</span>";
							$("#bc").attr("disabled","disabled");
						} else {
							msg = "<span class='msgName' style='color:green;'>ok</span>";
						}
						$(dom).parent().append(msg);
					}
				});
			});
		});

	    
	    //头像
	    $('[name=wenjian]').change(function () {
			//获取选中第一文件
	    	var file = this.files[0];
			//创建文件输入流
			var reader = new FileReader();
			//文件选中后自动触发文件流加载文件
			reader.onload = function () {
				//获取文件对象data数据
				var url = reader.result;
				$('#tupian').attr("src",url);
			}
			//将data数据转换成url路径
			var a = reader.readAsDataURL(file);				
		});
</script>

</html>