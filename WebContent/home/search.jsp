<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>搜索页面</title>
<%
      String path = request.getContextPath();
      String basePath = request.getScheme()+"://"
    		  +request.getServerName()+":"
    		  +request.getServerPort()+path+"/";
%>

		<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath %>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath %>/basic/css/demo.css" rel="stylesheet" type="text/css" />

		<link href="<%=basePath %>/css/seastyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=basePath %>/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>/js/script.js"></script>
		<script type="text/javascript">
		   if ("${arr }" == "") {
			 location.href = "<%=basePath %>/SeekServlet";
		}
		</script>
	</head>

	<body>

		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
						   <c:if test="${!empty users }">
							<a href="<%=basePath %>/home/login.jsp" target="_top" class="h">${users.u_nickname }</a>
							<a href="<%=basePath %>/LoginServlet?type=logout" target="_top">注销</a>
						   </c:if>
						   <c:if test="${empty users }">
							<a href="<%=basePath %>/home/login.jsp" target="_top" class="h">请登录</a>
							<a href="<%=basePath %>/register.jsp" target="_top">注册</a>
						   </c:if>
						</div>
					</div>
				</ul>
			<ul class="message-r">
					<div class="topMessage home">
						<div class="menu-hd"><a href="<%=basePath %>/home/home.jsp" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="<%=basePath %>/person/index.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="<%=basePath %>/ShopcartServlet?type=all" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
			</div>

			<!--悬浮搜索框-->

			<div class="nav white">
				<div class="logo"><img src="<%=basePath %>/images/logo.png" /></div>
				<div class="logoBig">
					<li><img src="<%=basePath %>/images/logobig.png" /></li>
				</div>

				<div class="search-bar pr">
					<a name="index_none_header_sysc" href="#"></a>
					<form method="post" action="<%=basePath %>/SeekServlet">
						<input id="searchInput" name="index_none_header_sysc" value="${input }" type="text" placeholder="搜索" autocomplete="off">
						<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
					</form>
				</div>
			</div>

			<div class="clear"></div>
			<b class="line"></b>
           <div class="search">
			<div class="search-list">
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			
				
					<div class="am-g am-g-fixed">
						<div class="am-u-sm-12 am-u-md-12">
	                  	<div class="theme-popover">														
							<ul class="select">
								<p class="title font-normal">
									<span class="total fl">搜索到<strong class="num">${sum }</strong>件相关商品</span>
								</p>
								<!--
								<div class="clear"></div>
								<li class="select-result">
									<dl>
										<dt>已选</dt>
										<dd class="select-no"></dd>
										<p class="eliminateCriteria">清除</p>
									</dl>
								</li>
								<div class="clear"></div>
								<li class="select-list">
									<dl id="select1">
										<dt class="am-badge am-round">品牌</dt>	
									
										 <div class="dd-conent">										
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">百草味</a></dd>
											<dd><a href="#">良品铺子</a></dd>
											<dd><a href="#">新农哥</a></dd>
											<dd><a href="#">楼兰蜜语</a></dd>
											<dd><a href="#">口水娃</a></dd>
											<dd><a href="#">考拉兄弟</a></dd>
										 </div>
						
									</dl>
								</li>
								<li class="select-list">
									<dl id="select2">
										<dt class="am-badge am-round">种类</dt>
										<div class="dd-conent">
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">东北松子</a></dd>
											<dd><a href="#">巴西松子</a></dd>
											<dd><a href="#">夏威夷果</a></dd>
											<dd><a href="#">松子</a></dd>
										</div>
									</dl>
								</li>
								<li class="select-list">
									<dl id="select3">
										<dt class="am-badge am-round">选购热点</dt>
										<div class="dd-conent">
											<dd class="select-all selected"><a href="#">全部</a></dd>
											<dd><a href="#">手剥松子</a></dd>
											<dd><a href="#">薄壳松子</a></dd>
											<dd><a href="#">进口零食</a></dd>
											<dd><a href="#">有机零食</a></dd>
										</div>
									</dl>
								</li>
							</ul>-->
							<div class="clear"></div>
                        </div>
							<div class="search-content">
								<div class="clear"></div>

								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								 <c:forEach var="item" items="${arr }">
									<li>
										<div class="i-pic limit" onclick="javascript:show(${item.s_id})">
											<img src="<%=basePath %>${item.s_url }" />											
											<p class="title fl">${item.s_name }</p>
											<p class="price fl">
												<b>¥</b>
												<strong>${item.s_price }</strong>
											</p>
											<p class="number fl">
												销量<span>${item.s_sales }</span>
											</p>
										</div>
									</li>
									</c:forEach>
								</ul>
							</div>
							<script type="text/javascript">
							   function show(s_id) {
								location.href = "ShowServlet?s_id="+s_id;
							   }
							</script>
							<div class="clear"></div>
							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled"><a href="#">&laquo;</a></li>
								<li class="am-active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>

						</div>
					</div>
					<div class="footer">
						<div class="footer-hd">
							<p>
								<a href="#">卓鼎教育</a>
								<b>|</b>
								<a href="#">商城首页</a>
								<b>|</b>
								<a href="#">支付宝</a>
								<b>|</b>
								<a href="#">物流</a>
							</p>
						</div>
						<div class="footer-bd">
							<p style="text-align:center;">
								<a href="#">合作伙伴</a>
								<a href="#">联系我们</a>
								<a href="#">网站地图</a>
								<em style="text-align:center;">© 2015-2025 zking 版权所有</em>
							</p>
						</div>
					</div>
				</div>

			</div>

		<!--引导 -->
		<div class="navCir">
			<li><a href="home2.jsp"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.jsp"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="<%=basePath %>/person/index.jsp"><i class="am-icon-user"></i>我的</a></li>					
		</div>

		<!--菜单 -->
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery-1.9.min.js"><\/script>');
		</script>
		<script type="text/javascript" src="<%=basePath %>/basic/js/quick_links.js"></script>

<div class="theme-popover-mask"></div>

	</body>

</html>