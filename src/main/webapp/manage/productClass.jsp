<%@ page import="com.ztm.dao.EasybuyProductCategoryDao" %>
<%@ page import="com.ztm.entity.EasybuyProductCategory" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%
	EasybuyProductCategoryDao easybuyProductCategoryDao = new EasybuyProductCategoryDao();
	List<EasybuyProductCategory> listBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id is null");
	request.setAttribute("ebp_list",listBean);
	for (EasybuyProductCategory easybuyProductCategory : listBean) {
		List<EasybuyProductCategory> childBean = easybuyProductCategoryDao.getListBean("select * from easybuy_product_category where epc_parent_id ="+easybuyProductCategory.getEpc_id());
		easybuyProductCategory.setEpcList(childBean);
	}

%>


<%@ include file="common/header.jsp" %>
	<div class="main">
		<h2>分类管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>分类名称</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.ebp_list}" var="listBean" varStatus="abc">
					<tr>
						<td class="first w4 c">${listBean.epc_id}</td>
						<td class="">${listBean.epc_name}</td>
						<td class="w1 c">
							<a href="javascript:Delete(1);">删除</a>
						</td>
					</tr>
					<c:forEach items="${listBean.epcList}" var="childs">
						<tr>
							<td class="first w4 c">${childs.epc_id}</td>
							<td class="childClass">${childs.epc_name}</td>
							<td class="w1 c">
								<a href="javascript:Delete('/proCatDel',${childs.epc_id});">删除</a>
							</td>
						</tr>
					</c:forEach>
				</c:forEach>






			</table>
		</div>
	</div>
	<div class="clear"></div>
</div>
<div id="footer">
	Copyright &copy; 2016 易买网 All Rights Reserved. 苏ICP证1000001号
</div>
</body>
</html>
