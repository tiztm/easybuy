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
	String epcid = request.getParameter("id");

	int epc_id = -1;
	try {
		epc_id = Integer.parseInt(epcid);
	} catch (NumberFormatException e) {
		e.printStackTrace();
	}
	EasybuyProduct epdByID = null;
	if(epc_id<1)
	{
		 epdByID = new EasybuyProduct();
	}
else
	{
	EasybuyProductDao epd = new EasybuyProductDao();
	 epdByID = epd.getByID(epc_id);
	}
	request.setAttribute("epdByID",epdByID);
%>


<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; 产品详情
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>商品分类</h2>
			<dl>
				${epc_list}
			</dl>
		</div>
	</div>
	<div id="product" class="main">
		<h1>${epdByID.ep_name}</h1>
		<div class="infos">
			<div class="thumb"><img src="${epdByID.ep_file_name}" width="200px"/></div>
			<div class="buy">
				<p>商城价：<span class="price">￥${epdByID.ep_price}.00</span></p>
				<p>库　存：${epdByID.ep_stock}</p>
				<div class="button"><input type="button" name="button" value="" onclick="goBuy('/orderPro',${epdByID.ep_id})" /></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2><strong>商品详情</strong></h2>
			<div class="text">
				${epdByID.ep_description}
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
