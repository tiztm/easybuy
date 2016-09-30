<%@ page import="com.ztm.dao.EasybuyProductDao" %>
<%@ page import="com.ztm.entity.EasybuyProduct" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<%@ include file="common/import.jsp" %>
</head>
<body>
<%
	EasybuyProductDao ebProDao = new EasybuyProductDao();
	String pageNumberStr = request.getParameter("pageNumber");
	int pageNumber = 1;     //当前页
	int pageSize = 10;  //每页显示条数
	if(pageNumberStr != null && !"".equals(pageNumberStr)) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	int totalUsers = ebProDao.getAllCount(); // 总用户数
	int totalPages = totalUsers/pageSize + ((totalUsers%pageSize) > 0 ? 1 : 0); //总页数
	int firstItemID = (pageNumber-1)*pageSize;

	request.setAttribute("pageNumber",pageNumber);
	request.setAttribute("pageSize",pageSize);
	request.setAttribute("totalUsers",totalUsers);
	request.setAttribute("totalPages",totalPages);

	List<EasybuyProduct> usersList = ebProDao.getPagedList(firstItemID, pageSize);
	request.setAttribute("users_list",usersList);
	request.setAttribute("nextAction","product.jsp");



%>


<%@ include file="common/header.jsp" %>
	<div class="main">
		<h2>商品管理</h2>
		<div class="manage">
			<table class="list">
				<tr>
					<th>ID</th>
					<th>商品名称</th>
					<th>操作</th>
				</tr>

				<c:forEach items="${requestScope.users_list}" var="user" varStatus="abc">
					<tr>
						<td class="first w4 c">${user.ep_id}</td>
						<td class="thumb"><img src="${user.ep_file_name}" width="50px" />
							<a href="../product-view.jsp?id=${user.ep_id}" target="_blank">
									${user.ep_name}
							</a>
						</td>
						<td class="w1 c"><a href="product-modify.jsp?id=${user.ep_id}">修改</a> <a href="javascript:Delete('/proDel','${user.ep_id}');">删除</a></td>
					</tr>
				</c:forEach>

				<%@ include file="common/page.jsp" %>

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
