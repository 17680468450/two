<%@page import="jdk.internal.util.xml.impl.Input"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>首页</title>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme()+"://"
    		  +request.getServerName()+":"
    		  +request.getServerPort()+path+"/";
%>

		<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath %>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath %>/css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath %>/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=basePath %>/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
		<script type="text/javascript">
		  if ("${arr }" == "") {
			  location.href = "<%=basePath %>/HomeServlet";
		}
		</script>
	</head>
	<body>
		<div class="hmtop">
			<%@ include file="top.jsp" %>

				<div class="clear"></div>
			</div>
			
			
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a href="<%=basePath %>/ShowServlet?s_id=40"><img src="<%=basePath %>/images/sort/bg/bg/bg_1.2.jpg" /></a></li>
								<li class="banner2"><a href="<%=basePath %>/ShowServlet?s_id=19"><img src="<%=basePath %>/images/sort/dx/dx/dx_1.2.jpg" /></a></li>
								<li class="banner3"><a href="<%=basePath %>/ShowServlet?s_id=112"><img src="<%=basePath %>/images/sort/hw/hw/hw_1.2.jpg" /></a></li>
								<li class="banner4"><a href="<%=basePath %>/ShowServlet?s_id=120"><img src="<%=basePath %>/images/sort/tea/gc/gc_1.2.jpg" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>						
			
			<div class="shopNav">
				<div class="slideall">
			        
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="<%=basePath %>/HomeServlet">首页</a></li>
							</ul>
							<!--  
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						    -->
						</div>
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
										  <c:forEach var="item" items="${arr }">
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%=basePath %>/${item.sTopOne.s_one_img }"></i><a class="ml-22" title="点心">${item.sTopOne.s_one_name }</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																  <c:forEach var="i" items="${item.sTopTwos }">
																	<dl class="dl-sort">
																		<dt><span title="蛋糕">${i.sTopTwo.s_two_name }</span></dt>
																	  <c:forEach var="a" items="${i.sTopThrees }">
																		<dd><a title="蒸蛋糕" href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=${a.s_three_id }"><span>${a.s_three_name }</span></a></dd>
																	  </c:forEach>
																	</dl>
																  </c:forEach>

																</div>
																
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>
											</c:forEach>
											<li class="appliance js_toggle relative">
												<div class="category-info">
													<h3 class="category-name b-category-name"><i><img src="<%=basePath %>/images/package.png"></i><a class="ml-22" title="品牌">品牌</a></h3>
													<em>&gt;</em></div>
												<div class="menu-item menu-in top">
													<div class="area-in">
														<div class="area-bg">
															<div class="menu-srot">
																<div class="sort-side">
																	  <c:forEach var="a" items="${arr_brand }">
																		<dd><a title="${a }" href="<%=basePath %>/SeekServlet?type=brand&&s_brand=${a }"><span>${a }</span></a></dd>
																	  </c:forEach>
																</div>
															</div>
														</div>
													</div>
												</div>
											<b class="arrow"></b>	
											</li>
										</ul>
									</div>
								</div>

							</div>
						</div>
						<!--轮播 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>


					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.jsp"><img src="<%=basePath %>/images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="<%=basePath %>/images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="<%=basePath %>/person/index.jsp"><img src="<%=basePath %>/images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="<%=basePath %>/images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>

					<!--走马灯 -->

					<div class="marqueen">
						<span class="marqueen-title">商城头条</span>
						<div class="demo">

							<ul>
								<li class="title-first"><a target="_blank" href="#">
									<img src="<%=basePath %>/images/TJ2.jpg"></img>
									<span>[特惠]</span>商城爆品1分秒								
								</a></li>
								<li class="title-first"><a target="_blank" href="#">
									<span>[公告]</span>商城与广州市签署战略合作协议
								     <img src="<%=basePath %>/images/TJ.jpg"></img>
								     <p>XXXXXXXXXXXXXXXXXX</p>
							    </a></li>
							    
						<div class="mod-vip">
						  <c:if test="${empty users }">
							<div class="m-baseinfo">
								<a href="<%=basePath %>/person/index.jsp">
									<img src="<%=basePath %>/images/getAvatar.do.jpg">
								</a>
								<em>
									Hi,<span class="s-name">***</span>
								</em>
							</div>
							<div class="member-logout">
								<a class="am-btn-warning btn" href="home/login.jsp">登录</a>
								<a class="am-btn-warning btn" href="home/register.jsp">注册</a>
							</div>
							</c:if>
							<c:if test="${!empty users }">
							<div class="m-baseinfo">
								<a href="<%=basePath %>/person/index.jsp">
								  <c:if test="${empty users.u_url }">
									<img src="<%=basePath %>/images/getAvatar.do.jpg">
								  </c:if>
								  <c:if test="${!empty users.u_url }">
									<img src="<%=basePath %>/${users.u_url }">
								  </c:if>
								</a>
								<em>
									Hi,<span class="s-name">${users.u_nickname }</span>
								</em>
							</div>
							</c:if>
							<div class="clear"></div>	
						</div>																	    
							    
								<li><a target="_blank" href="#"><span>[特惠]</span>洋河年末大促，低至两件五折</a></li>
								<li><a target="_blank" href="#"><span>[公告]</span>华北、华中部分地区配送延迟</a></li>
								<li><a target="_blank" href="#"><span>[特惠]</span>家电狂欢千亿礼券 买1送1！</a></li>
								
							</ul>
                        <div class="advTip"><img src="<%=basePath %>/images/advTip.jpg"/></div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">

					<!--今日推荐 -->
                    <!--  
					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="<%=basePath %>/images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath %>/images/tj.png "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath %>/images/tj1.png "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath %>/images/tj2.png "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
                    -->
					<!--甜点-->
					
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>甜品</h4>
							<h3>每一道甜品都有一个故事</h3>
							<div class="today-brands ">
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=1">铜锣烧</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=2">生日蛋糕</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=3">提拉米苏 </a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=4">面包</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=5">蒸蛋糕</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=6">绿豆糕</a>
							</div>
							<span class="more ">
                    <a class="more-link " href="<%=basePath %>/SeekServlet">更多美味</a>
                        </span>
						</div>
					</div>
					
					<div class="am-g am-g-fixed flood method3 ">
					<ul class="am-thumbnails ">
					<c:forEach var="item" items="${arr_cake }">
		              <c:forEach var="i" items="${item.commodities }">
							<li>
								<div class="list ">
									<a href="ShowServlet?s_id=${i.s_id }">
										<img src="<%=basePath %>/${i.s_url }" />
										<div class="pro-title ">${i.s_name }</div>
										<span class="e-price ">￥${i.s_price }</span>
									</a>
								</div>
							</li>
                          </c:forEach>
                    </c:forEach>
                    </ul>
					</div>
                    <div class="clear "></div>
					<!--坚果-->
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>饼干</h4>
							<h3>酥酥脆脆，回味无穷</h3>
							<div class="today-brands ">
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=7">夹心饼干</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=8">酥性饼干</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=9">曲奇饼干</a>
							</div>
							<span class="more ">
                    <a class="more-link " href="<%=basePath %>/SeekServlet">更多美味</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 ">
						<ul class="am-thumbnails ">
					      <c:forEach var="item" items="${arr_cuit }">
		                   <c:forEach var="i" items="${item.commodities }">
							<li>
								<div class="list ">
									<a href="ShowServlet?s_id=${i.s_id }">
										<img src="<%=basePath %>/${i.s_url }" />
										<div class="pro-title ">${i.s_name }</div>
										<span class="e-price ">￥${i.s_price }</span>
									</a>
								</div>
							</li>
                          </c:forEach>
                    </c:forEach>
                    </ul>
					</div>

					<div class="clear "></div>


                 
					<div class="am-container ">
						<div class="shopTitle ">
							<h4>膨化</h4>
							<h3>你是我的优乐美么？不，我是你小锅巴</h3>
							<div class="today-brands ">
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=10">薯片</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=11">虾条</a>
								<a href="<%=basePath %>/SeekServlet?type=sort&&s_three_id=12">锅巴</a>
							</div>
							<span class="more ">
                          <a class="more-link " href="<%=basePath %>/SeekServlet">更多美味</a>
                        </span>
						</div>
					</div>
					<div class="am-g am-g-fixed flood method3 ">
						<ul class="am-thumbnails ">
						 <c:forEach var="item" items="${arr_chip }">
						  <c:forEach var="i" items="${item.commodities }">
							<li>
								<div class="list ">
									<a href="ShowServlet?s_id=${i.s_id }">
										<img src="<%=basePath %>/${i.s_url }" />
										<div class="pro-title ">${i.s_name }</div>
										<span class="e-price ">￥${i.s_price }</span>
									</a>
								</div>
							</li>
						  </c:forEach>
                         </c:forEach>
						</ul>

					</div>

					<div class="footer ">
						<div class="footer-hd ">
							<p>
								
								<b>|</b>
								<a href="<%=basePath %>/HomeServlet">商城首页</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p style="text-align:center;">
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em style="text-align:center;">© 2015-2025 zking 版权所有</em>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<!--引导 -->

		<div class="navCir">
			<li class="active"><a href="<%=basePath %>/HomeServlet"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.jsp"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="<%=basePath %>/ShopcartServlet"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="<%=basePath %>/person/index.jsp"><i class="am-icon-user"></i>我的</a></li>					
		</div>
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>
		<script type="text/javascript " src="<%=basePath %>/basic/js/quick_links.js "></script>
	</body>
</html>