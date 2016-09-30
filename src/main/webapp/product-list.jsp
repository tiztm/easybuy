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


	EasybuyProductCategory categoryByID = easybuyProductCategoryDao.getCategoryByID(epc_id);

	request.setAttribute("epc",categoryByID);

	EasybuyProductCategory categoryFather = easybuyProductCategoryDao.getCategoryByID(categoryByID.getEpc_parent_id());

	request.setAttribute("epcFather",categoryFather);

	EasybuyProductDao epd = new EasybuyProductDao();
	List<EasybuyProduct> listPro = epd.getListBean("select * from easybuy_product where epc_child_id=" +epc_id+
			" limit 0,8");
	request.setAttribute("listPro", listPro);

%>


<div id="position" class="wrap">
	您现在的位置：<a href="index.jsp">易买网</a> &gt; ${epcFather.epc_name} &gt; ${epc.epc_name}
</div>
<div id="main" class="wrap">
	<div class="lefter">
		<div class="box">
			<h2>商品分类</h2>
			<dl>
				${epc_list}
			</dl>
		</div>
		<div class="spacer"></div>

	</div>
	<div class="main">
		<div class="product-list">
			<h2>全部商品</h2>
			<!--
			<div class="pager">
				<ul class="clearfix">
					<li><a href="#">上一页</a></li>
					<li class="current">1</li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">下一页</a></li>
				</ul>
			</div>
			-->
			<div class="clear"></div>
			<ul class="product clearfix">

<c:forEach items="${requestScope.listPro}" var="listProRM" >
				<li>
					<dl>
						<dt><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank"><img src="${listProRM.ep_file_name}" width="100px"/></a></dt>
						<dd class="title"><a href="product-view.jsp?id=${listProRM.ep_id}" target="_blank">${listProRM.ep_name}</a></dd>
						<dd class="price">￥${listProRM.ep_price}.0</dd>
					</dl>
				</li>
</c:forEach>
			</ul>
			<!--
			<div class="clear"></div>
			<div class="pager">
				<ul class="clearfix">
					<li><a href="#">上一页</a></li>
					<li class="current">1</li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">下一页</a></li>
				</ul>
			</div>
			-->
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
