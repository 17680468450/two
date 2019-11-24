<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						</form>
					</div>
				</div>