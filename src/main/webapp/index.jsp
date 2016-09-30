<%@ page import="com.ztm.dao.EasybuyProductDao" %>
<%@ page import="com.ztm.entity.EasybuyProduct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>

	<%@ include file="common/header.jsp" %>

	<%@ include file="common/proCat.jsp" %>

	<%
		EasybuyProductDao epd = new EasybuyProductDao();
		List<EasybuyProduct> listProRM = epd.getListBean("select * from easybuy_product where epc_child_id=1000 limit 0,8");
		request.setAttribute("listProTJ",listProRM);

		listProRM = epd.getListBean("select * from easybuy_product where epc_child_id=1001 limit 0,8");
		request.setAttribute("listProRM",listProRM);
	%>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">易买网</a> &gt; 首页
	</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box" style="height: 500px">
			<h2>商品分类</h2>
			<dl>
				${epc_list}
			</dl>
		</div>
		<div class="spacer"></div>

	</div>
	<div class="main">
		<div class="price-off">
			<h2>今日特价</h2>
			<ul class="product clearfix">

					<c:forEach items="${requestScope.listProTJ}" var="listProRM" >
						<li>
						<dl>
							<dt><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank"><img src="${listProRM.ep_file_name}" width="100px" /></a></dt>
							<dd class="title"><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank">${listProRM.ep_name}</a></dd>
							<dd class="price">￥${listProRM.ep_price}.0</dd>
						</dl>
						</li>
					</c:forEach>



			</ul>
		</div>
		<div class="side">
			<div class="news-list" style="height: 200px">
				<h4>最新公告</h4>
				<ul>
					<li><a >较为重复且简单，未开发</a></li>
				</ul>
			</div>
			<div class="spacer"></div>
			<div class="news-list" style="height: 200px">
				<h4>新闻动态</h4>
				<ul>
					<li><a >较为重复且简单，未开发</a></li>
				</ul>
			</div>
		</div>
		<div class="spacer clear"></div>
		<div class="hot">
			<h2>热卖推荐</h2>
			<ul class="product clearfix">

				<c:forEach items="${requestScope.listProRM}" var="listProRM" >
					<li>
						<dl>
							<dt><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank"><img  src="${listProRM.ep_file_name}" width="100px" /></a></dt>
							<dd class="title"><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank">${listProRM.ep_name}</a></dd>
							<dd class="price">￥${listProRM.ep_price}.0</dd>
						</dl>
					</li>
				</c:forEach>


			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
